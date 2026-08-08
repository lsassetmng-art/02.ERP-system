# ============================================================
# LOGISTICS TRANSPORT / DELIVERY BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 14.logistics
related_modules:
- 12.inventory
- 13.warehouse
- 05.billing
- 04.order-management
- 60.business-intelligence

purpose:
Define logistics transportation and delivery truth, including intake from
warehouse and event feedback to order, billing, inventory, warehouse, and BI.

canonical_role:
- transportation / delivery / route / carrier execution truth

# ============================================================
# 1. CORE LOGISTICS OBJECTS
# ============================================================

core_objects:
- logistics_shipment
- logistics_transport_plan
- logistics_route_plan
- logistics_carrier_assignment
- logistics_dispatch
- logistics_tracking_event
- logistics_delivery_event
- logistics_proof_of_delivery
- logistics_delivery_exception
- logistics_transport_cost_basis
- logistics_return_transport_event
- logistics_warehouse_intake

# ============================================================
# 2. LOGISTICS INTAKE FROM WAREHOUSE
# ============================================================

intake_object_name:
- warehouse_shipping_to_logistics_handoff

acceptance_requires:
- source_module = 13.warehouse
- target_module = 14.logistics
- outbound_operation_id present
- shipping_operation_id present
- shipment_unit_set present
- package_set resolvable
- handling requirements declared
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- MISSING_SHIPMENT_UNITS
- PACKAGE_UNRESOLVABLE
- HANDLING_REQUIREMENT_UNCLEAR
- WAREHOUSE_HANDOFF_NOT_READY
- SOURCE_NOT_WAREHOUSE
- MISSING_LINEAGE
- DUPLICATE_HANDOFF
- CARRIER_REQUIREMENT_UNSUPPORTED

rules:
- accepted warehouse handoff creates logistics shipment candidate
- logistics acceptance does not change stock ledger
- rejected logistics intake returns issue to warehouse workflow
- customer delivery completion remains 14 truth

# ============================================================
# 3. LOGISTICS SHIPMENT
# ============================================================

object_name:
- logistics_shipment

meaning:
- canonical logistics shipment / delivery execution object

required_fields:
- logistics_shipment_id
- company_id
- warehouse_handoff_id
- source_outbound_operation_id
- shipment_status
- origin_location_id
- destination_location_id
- shipment_unit_set
- carrier_assignment_id_or_null
- route_plan_id_or_null
- dispatch_reference_or_null
- proof_of_delivery_reference_or_null
- delivery_exception_reference_set
- created_at
- created_by
- lineage_reference

allowed_shipment_status:
- candidate
- planning
- carrier_assigned
- dispatched
- in_transit
- delivered
- partially_delivered
- delivery_failed
- returned
- cancelled
- superseded

rules:
- shipment status is logistics truth
- delivered does not retroactively complete warehouse picking
- delivered may notify order / billing / inventory return workflows where applicable
- stock issue should already be handled by inventory / warehouse workflow unless custody model says otherwise

# ============================================================
# 4. TRANSPORT PLAN / ROUTE PLAN
# ============================================================

object_name:
- logistics_transport_plan

required_fields:
- transport_plan_id
- company_id
- logistics_shipment_id_set
- transport_mode
- carrier_requirement
- temperature_requirement_or_null
- hazardous_material_flag
- planned_pickup_window
- planned_delivery_window
- plan_status
- created_at
- created_by

transport_mode_examples:
- parcel
- truckload
- less_than_truckload
- courier
- internal_delivery
- rail
- ocean
- air

allowed_plan_status:
- draft
- planned
- carrier_requested
- carrier_confirmed
- dispatched
- cancelled
- superseded

object_name:
- logistics_route_plan

required_fields:
- route_plan_id
- company_id
- transport_plan_id
- route_sequence
- stop_set
- estimated_distance
- estimated_duration
- route_status
- created_at
- created_by

rules:
- route plan is logistics planning truth
- warehouse does not own route plan
- BI may visualize route performance only

# ============================================================
# 5. CARRIER ASSIGNMENT / DISPATCH
# ============================================================

object_name:
- logistics_carrier_assignment

required_fields:
- carrier_assignment_id
- company_id
- logistics_shipment_id
- carrier_id
- service_level
- carrier_reference_number_or_null
- assignment_status
- assigned_at
- assigned_by
- cost_estimate_reference_or_null
- lineage_reference

allowed_assignment_status:
- requested
- assigned
- accepted_by_carrier
- rejected_by_carrier
- cancelled
- superseded

object_name:
- logistics_dispatch

required_fields:
- dispatch_id
- company_id
- logistics_shipment_id
- carrier_assignment_id_or_null
- dispatched_at
- dispatched_by
- origin_location_id
- vehicle_reference_or_null
- driver_reference_or_null
- dispatch_status
- lineage_reference

allowed_dispatch_status:
- ready
- dispatched
- pickup_confirmed
- dispatch_cancelled
- superseded

rules:
- carrier assignment and dispatch are logistics truth
- dispatch does not equal customer delivery
- dispatch may notify warehouse / order modules

# ============================================================
# 6. TRACKING EVENT / PROOF OF DELIVERY
# ============================================================

object_name:
- logistics_tracking_event

required_fields:
- tracking_event_id
- company_id
- logistics_shipment_id
- event_type
- event_status
- event_location_id_or_text_or_null
- event_occurred_at
- event_recorded_at
- source_actor_or_system
- carrier_event_reference_or_null
- note_or_null
- lineage_reference

event_type_examples:
- pickup_confirmed
- in_transit
- arrived_at_hub
- out_for_delivery
- delivery_attempted
- delivered
- exception
- return_initiated
- returned

object_name:
- logistics_proof_of_delivery

required_fields:
- proof_of_delivery_id
- company_id
- logistics_shipment_id
- delivered_at
- delivered_to_reference_or_text
- delivery_location_reference_or_text
- proof_type
- proof_document_reference_or_null
- signature_reference_or_null
- delivery_condition_note_or_null
- created_at
- lineage_reference

proof_type_examples:
- signature
- photo
- electronic_confirmation
- carrier_confirmation
- manual_confirmation

rules:
- proof of delivery is logistics delivery truth
- proof of delivery may trigger billing/order status where policy permits
- proof of delivery does not directly rewrite inventory ledger
- proof of delivery does not complete warehouse pick/pack task

# ============================================================
# 7. DELIVERY EXCEPTION
# ============================================================

object_name:
- logistics_delivery_exception

required_fields:
- delivery_exception_id
- company_id
- logistics_shipment_id
- exception_type
- severity
- exception_summary
- occurred_at
- detected_by
- impact_scope
- resolution_status
- linked_return_event_id_or_null
- linked_order_reference_or_null
- lineage_reference

exception_type_examples:
- failed_delivery
- damaged_in_transit
- lost_in_transit
- delayed
- wrong_address
- customer_refused
- partial_delivery
- carrier_issue
- temperature_excursion

allowed_resolution_status:
- open
- investigating
- resolved
- escalated
- closed
- cancelled

rules:
- logistics owns delivery exception lifecycle
- inventory correction from lost/damaged event must go through 12 workflow
- quality claim may involve 17.quality where product condition decision is required
- billing/order impact must go through relevant source modules

# ============================================================
# 8. TRANSPORT COST BASIS
# ============================================================

object_name:
- logistics_transport_cost_basis

required_fields:
- transport_cost_basis_id
- company_id
- logistics_shipment_id
- carrier_id_or_null
- cost_type
- estimated_cost_or_null
- actual_cost_or_null
- currency_code
- cost_status
- source_document_reference_or_null
- created_at
- lineage_reference

cost_type_examples:
- freight
- fuel_surcharge
- accessorial
- handling
- return_freight
- carrier_penalty

rules:
- logistics owns logistics-side transport cost basis
- accounting posting belongs to 30.accounting
- management analysis belongs to 31.management-accounting
- BI projection belongs to 60.business-intelligence

# ============================================================
# 9. FEEDBACK TO OTHER MODULES
# ============================================================

allowed_feedback:
- to 13.warehouse: logistics intake rejected / pickup confirmed / shipment exception context
- to 12.inventory: return transport event / lost-damaged investigation signal / custody exception signal
- to 04.order-management: delivered / failed delivery / partial delivery signal
- to 05.billing: delivery completion signal where billing policy requires
- to 60.business-intelligence: shipment performance / delivery KPI snapshot

forbidden_feedback:
- direct stock ledger mutation by logistics
- direct warehouse task completion by logistics
- direct billing invoice correction by logistics
- direct accounting journal posting by logistics
- BI dashboard mutation by logistics

# ============================================================
# 10. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- shipment status snapshot
- route performance snapshot
- delivery performance snapshot
- carrier performance snapshot
- delivery exception snapshot
- proof of delivery snapshot
- transport cost basis snapshot

rules:
- 60 consumes snapshots
- 60 may not dispatch shipment
- 60 may not confirm delivery
- 60 may not correct transport cost truth

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- logistics POD decrementing inventory directly
- carrier tracking completing warehouse shipping task
- delivery status posting accounting journal directly
- logistics exception directly changing stock balance
- BI dashboard treated as delivery proof
- route plan treated as warehouse pick plan
- dispatch treated as customer delivery

# ============================================================
# 12. DECISION TEST
# ============================================================

decision_test:
- If it is route, carrier, dispatch, tracking, or delivery proof, 14 owns it.
- If it is stock quantity, 12 owns it.
- If it is warehouse physical task, 13 owns it.
- If it is accounting posting, 30 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- logistics transport / delivery truth fixed
- warehouse intake exact acceptance fixed
- delivery exception and POD ownership fixed
- feedback boundaries to inventory / warehouse / order / billing / BI fixed

# ============================================================
