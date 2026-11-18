# Energy accounting and thermal-rejection gate

## Preserve the source's contradiction

**Ground-pilot projections from the source only:** fusion thermal power **500 MWth**; approximately **80% of D-T fusion energy** carried by 14.1 MeV neutrons; about **400 MW** projected as heat deposited in FLiBe; **47%** projected thermal-to-electric efficiency; **49 MW** proposed auxiliary loads; claimed **235 MWe gross / 186 MWe net**.

The source's corrected open question **21** notes that the 47% conversion is applied to **500 MW**, even though the FLiBe loop diagram shows only **400 MW** entering that conversion chain. It does not show how the remaining **~100 MW** alpha-particle energy gets into that same cycle.

| Accounting case | Thermal power admitted to converter | Gross at *assumed* 47% | If original 49 MW auxiliaries are applied | Unaccounted issue |
|---|---:|---:|---:|---|
| Original author projection (requires additional heat recovery) | 500 MW | 235 MW electric | 186 MW electric | How alpha energy reaches cycle is unspecified |
| Blanket-only sensitivity (simple arithmetic) | 400 MW | 188 MW electric | 139 MW electric | What happens to ~100 MW alpha energy? |

Both rows use *unsupported ground-pilot cycle/auxiliary numbers*. **Neither represents a measured result, a validated reactor, or spacecraft net electricity**. A spacecraft's actual thermal cycle, gross input, waste heat and parasitic loads would be different and must be rederived.

## Radiator physics - an illustration of the scaling problem

In deep space, net radiator heat transfer is approximately:

`P_reject = epsilon * sigma * A_rad * (T_rad^4 - T_background^4)`

where `A_rad` is effective **emitting surface area**, `epsilon` emissivity and `sigma` the Stefan-Boltzmann constant. Effective area is not necessarily the same as front-view panel footprint (two-sided emission, view factors, deployment and shadowing matter). No steady-state radiator design is supplied.

**Deliberately hypothetical sample:** if waste heat to be rejected were **265 MW**, with `epsilon = 0.9`, negligible radiative background and uniform radiator temperature:

- At `600 K`, effective radiating area would be approximately **40,100 m²**.
- At `900 K`, approximately **7,910 m²**.

These numbers are **Stefan-Boltzmann algebra only**, not radiator mass, manufacturability, coolant limits, specific mass or achievable operational temperature. Actual waste heat may be significantly different because the source's power path is still open. Even the 265 MW illustration requires the disputed 500-to-235 MW thermal-cycle accounting. Panel area cannot be transferred directly to an actual vehicle without heat-pipe/coolant, materials and shadowing studies.

NASA has emphasized that space nuclear power radiators can be very large and massive: see [Advanced Lightweight Heat Rejection Radiators](https://techport.nasa.gov/projects/118274) and [High Temperature Radiators (NASA NTRS)](https://ntrs.nasa.gov/citations/20250007547).

## Spacecraft feasibility gate (future work)

Calculate, for a **selected spacecraft power class**, all of these on a common energy boundary:

- Fusion alpha heating and neutron deposition, including magnet and shield energy deposition.
- Gross and net conversion with cycle efficiencies that match actual temperature boundaries.
- Levitation, magnets, cryocooling, heaters, pumps, radiation shield cooling, tritium processing, avionics, PPU and thruster internal loads.
- Waste heat rejection at each temperature level and the corresponding radiator material/area/mass.
- The complete vehicle dry mass, propellant budget, and mission trajectory.

**Do not scale the original 500 MWth ground pilot into orbit as a single drop-in flight reactor.**
