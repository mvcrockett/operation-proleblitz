# Concept brief | Crockett Stardrive v0.1

## Purpose and non-claims

This is a **fusion-electric, deep-space spacecraft concept** based on Mary-Victoria Crockett's public theoretical fusion-reactor proposal. It is neither a propulsion system design qualification nor proof of fusion energy gain. The reactor's three proposals remain **hypotheses to be tested**, not demonstrated performance characteristics.

**Mission class:** unassigned deep-space cargo/science vehicle, assembled and commissioned **in space** (conceptual design preference, not a demonstrated launch plan). A crewed module appears in *illustrative art* but is **not** part of the v0.1 reference case; crew shielding would add a major unclosed mass and safety problem. No launch vehicle, trip time, delta-v, trajectory, thrust, acceleration, payload, or specific impulse is claimed.

## Baseline physical story

1. A proposed levitated HTS dipole confines D-T plasma within a vacuum vessel. Central ablative fuel pellet injection is hypothesized in the source, but passage through the blanket and magnet is not resolved. Active levitation control is mandatory, not a passive stability result.
2. A distant FLiBe liquid blanket is proposed to intercept the high-energy fusion neutrons, convert deposited energy into thermal energy, and support tritium breeding. Magnet neutron damage, breeding ratio and fluid/material behavior remain unvalidated.
3. A **space-adapted** power conversion stage would convert part of recoverable heat to bus electricity. No converter type or cycle efficiency is selected or verified for flight; the terrestrial proposal discusses a supercritical CO2 Brayton cycle as an early design reference.
4. Electrical power goes to electric thrusters, spacecraft systems, sensors, thermal management, and auxiliaries. The thrusters receive **separate reaction mass**, carried in dedicated tanks.
5. Large radiators reject heat to deep space. Radiator geometry is intentionally prominent in the concept art because waste heat may dominate vehicle mass/area.
6. A long boom and shadow shield isolate the forward payload zone from the reactor's neutron/gamma field. Exact radiation dose, shield thickness/materials, separation, and crew eligibility are unknown.

## Reference module order (front to aft)

**Payload / avionics -> structural standoff boom -> shadow shielding -> Crockett Reactor module -> conversion & thermal management -> propellant tanks and electric-power distribution -> electric thruster cluster.** Radiators extend laterally from the high-heat zone. The ordering is conceptual and not to scale.

## Interfaces at a glance

| Interface | Nominal input | Nominal output | Status |
|---|---|---|---|
| Reactor to blanket | Neutron energy | Heat + proposed tritium breeding | Physical processes real; geometry and yield unverified |
| Reactor to power conversion | Recoverable thermal energy | Electricity + reject heat | No flight power cycle sized |
| Power to thrusters | Electric bus + independently stored propellant | Directed exhaust + thrust | Electric propulsion principle demonstrated in other systems; this integration untested |
| Reactor to payload | Neutron/gamma hazard | Attenuated field after shielding | Shielding not designed |
| Heat sources to radiators | Thermal losses and parasitic heat | Radiated infrared energy | Required area/mass not sized |
| Fuel handling to plasma | Proposed D-T pellets | Fuel delivered toward magnetic axis | Entire path and survivability unverified |

## Design-development order

**Phase A - Geometry and physics:** Close a single dimensioned cross-section, prove adequate fuel-pellet paths, model neutron damage and tritium breeding, derive active levitation controls, close the alpha-energy and heat flow.

**Phase B - Spacecraft feasibility:** Define one modest *useful-electric-power target* and mission, compare system mass-to-electric-power, select and model a power cycle, size radiators, model shield dose and tritium storage, then estimate thrust at stated electric-thruster efficiency and exhaust velocity.

**Phase C - Independent review:** Publish datasets, input decks, uncertainty bounds, and failure criteria. Invite neutral plasma, neutronics, space-power and electric-propulsion reviewers.

This package intentionally carries the reactor source's outstanding issues forward rather than assuming answers. See `open-questions-and-test-plan.md`.
