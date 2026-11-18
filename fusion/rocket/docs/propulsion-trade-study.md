# Propulsion trade study | No performance estimates without a mass model

| Concept | Energy and thrust path | Relative advantage | Main technical objection | V0.1 status |
|---|---|---|---|---|
| **A. Fusion-electric** | Reactor heat -> converter -> bus -> electric thrusters -> separate propellant exhaust | Keeps thermal reactor concept separate from exhaust | Power conversion, waste-heat radiator, reactor/shield mass | **Selected baseline hypothesis** |
| B. Fusion-thermal | Reactor heat -> propellant heating -> nozzle | Can in principle give more thrust than electric | Transfer heat to propellant without violating material limits; nozzle, reactor integration | Not designed |
| C. Direct-fusion / magnetic nozzle | Charged particles / heated plasma -> nozzle / thrust | Avoids some conversion losses *if feasible* | D-T neutron fraction; plasma confinement vs exhaust extraction; nozzle efficiency and momentum budget | Speculative research branch |
| D. Hybrid | Reactor provides electricity + some managed thermal or direct path | Potential duty-cycle flexibility | Adds nearly every subsystem mass and interface | Deferred |

## Selection rationale

NASA's established electric-propulsion definition separates **energy source** from **propellant acceleration**. That is the least speculative *propulsion coupling* for a brand-new, unvalidated reactor model, although the reactor itself remains deeply speculative. An electric thruster powered by a fusion reactor is still called **fusion-electric**; the reactor is not the thrust nozzle.

## What will decide if option A makes sense?

1. A mission demand: payload, destination, available transfer time, allowable acceleration and delta-v.
2. Net usable bus electric power after conversion, cryogenics, pumping and all other auxiliaries.
3. **Complete dry mass** including reactor, neutron shield, cryogenic equipment, tanks, radiators, conversion, structure and thrusters. **Power-to-mass** matters more than headline reactor Q.
4. Electric thruster efficiency, exhaust velocity, allowable bus current/voltage, thermal constraints and wear.
5. Propellant budget for a solved mission profile.

## Basic algebra (not a prediction)

For an idealized electric thruster, if usable thruster power is `P_e`, jet efficiency is `eta_j`, and exhaust velocity is `v_e`, then

`T = 2 * eta_j * P_e / v_e`  [newtons], under the assumptions of this simple kinetic-energy model.

Illustrative, **not a Stardrive forecast**: `P_e = 1 MW`, `eta_j = 0.60` and `v_e = 30,000 m/s` would yield **40 N thrust** and `I_sp ~ 3,059 s`. These are arbitrary inputs; an electric thruster, reactor and full vehicle capable of sustaining them are **not provided** by this package. More electric power also entails greater conversion/radiator mass and potentially more propellant.

## External context

- NASA: [Space Nuclear Propulsion](https://www.nasa.gov/space-technology-mission-directorate/tdm/space-nuclear-propulsion/).
- NASA: [In-Space Propulsion overview](https://www.nasa.gov/smallsat-institute/sst-soa/in-space_propulsion/).
- NASA: [Nuclear Electric Propulsion Technology Maturation](https://techport.nasa.gov/projects/158369).
