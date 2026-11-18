# System architecture and design conventions

## A. Source-preserving reactor block

The original Crockett Reactor is a *proposed* four-layer architecture (outer vacuum chamber, FLiBe blanket, vacuum gap + levitated confinement system, and central plasma). **Reactor concepts and figure projections belong to the original November 17, 2026 packet.** Any adaptation in this directory is new and should not be represented as Victoria's original reactor drawing or a validated modification.

The source's phrase **"wall-less"** is used only in its narrower sense: removing a conventional solid first wall as the enclosing plasma-facing structure. It **does not** imply a radiation-proof levitated dipole. Full shielding, confinement, pellet transit and thermal integration are open.

## B. Selected propulsion layout: fusion-electric

The reactor is a hypothetical heat source. A separate conversion chain provides electricity to a power-processing unit (PPU) and an electric thruster array. A dedicated propellant tank supplies reaction mass: the reaction that accelerates the craft is the **backward expulsion of propellant**, not emission of free neutrons, and not an assumed plasma plume escaping the reactor confinement region. Choice among Hall, ion, MPD, and more advanced electric thrusters is deferred until a mission and power class are chosen.

## C. Spacecraft components

| Segment | V0.1 concept | Caveat |
|---|---|---|
| Reactor vessel | Proposed dipole + FLiBe geometry | Dimension stack does not close in original |
| Magnetic levitation | External HTS field plus active position feedback | Control sizing and perturbation rejection absent |
| Blanket and fuel cycle | FLiBe loops and tentative D-T return | TBR 2.01 **unverified**, extraction performance unresolved |
| Power conversion | Candidate closed-cycle high-temperature heat engine | Neither a flight design nor 47% validated |
| Thermal rejection | Large deployable radiator panels near reactor/power module | Radiation area and mass unverified |
| Radiation protection | Long boom + candidate shadow shield | Shadowing is only a geometry concept; no dose calc |
| Electric propulsion | Multi-unit thruster rack, separate propellant feed | Thruster technology and operating envelope TBD |
| Flight platform | Payload/communications/navigation bus | No mission assigned; art may depict crew but v0.1 is uncrewed |

## D. Boundaries

The project **does not** assert a flight-operating 500 MW thermal reactor, 186 MW electric bus, 60-year reactor, negligible tritium inventory, self-breeding, a new specific impulse, or faster transit than chemical/nuclear thermal systems. It also does not assert that known levitated dipole demonstrations validate the central pellet, blanket, breeder and power balance *as one integrated system*.

## E. If we later study direct fusion propulsion

A separately versioned research branch must address whether appreciable charged energy can be collected and collimated, how its exhaust emerges without undermining confinement, whether extra propellant is heated and accelerated, the fraction of energy in neutral neutrons, and a full momentum/energy/nozzle balance. Until then the rocket is **fusion-electric**.
