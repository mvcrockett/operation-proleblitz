# Requirements, open questions and falsifiable test plan

The original [`fusion/OPEN-QUESTIONS.md`](../../OPEN-QUESTIONS.md) enumerates **31 questions**. This document crosswalks selected original issues to **new spacecraft-specific** gates. The original list remains authoritative; no questions have been "solved" by the illustrations.

| Priority | Source item | Required result before engineering sizing | Success / failure test |
|---|---|---|---|
| P0 | #19-20 | Single dimensioned chamber / blanket / dipole geometry, compatible with assembly constraints | No overlapping envelopes; all radius and clearance bounds stated |
| P0 | #10-12 | Pellet injector access geometry, cryogenic pellet survival and path-dependent ablation | Model real material paths and perturbations; report any impassable route |
| P0 | #6 | HTS magnet neutron fluence, degradation and shield/replacement trade | Calculated radiation damage remains within defined component lifetime, or redesign |
| P0 | #21 | Full neutron, alpha, power-conversion, parasitic and waste-heat balance | Every watt assigned within uncertainty; physically credible recovery path |
| P0 | #7-8 | Feedback levitation controller with realistic forces and pellet disturbances | Stable under modeled disturbances without actuator saturation |
| P0 | #1-3 | Tritium breeder neutronics and fuel-cycle surplus | TBR and tritium inventory supported by independently reproducible model |
| P0 | #13-14 | Fusion performance and MHD stability | Peer-reviewable transport and power balance; no Q claim without result |
| P1 | #16-18, #22-24 | Coatings, activation, salt flow, magnet drop/quench, measurement claims | Documented materials, damage and thermal evidence |
| P1 | New | Radiation shield and shadow geometry for avionics or crew | Dose over defined mission within chosen requirements |
| P1 | New | Radiator heat balance at realistic temperature limits | Emitting area, dry mass and launch/assembly envelope viable |
| P1 | New | Cryogenic field, fuel handling, and electrical control power | Full auxiliary electrical balance, not generic "AI" controller labels |
| P1 | New | Vehicle specific mass and thruster subsystem | Usable power per total dry kilogram sufficient for mission requirements |
| P2 | New | Direct-fusion exhaust branch | Momentum and nozzle energy conservation with achievable efficiency |
| P2 | #25-31 | Updated licensing, costs and provenance | Specific jurisdictions, approvals, figures and supporting documents |

## Minimum data products to request

- `reactor-geometry-v0.csv`: radii, lengths, wall/shield thickness, thermal interfaces, magnet size and clearances.
- `reactor-power-terms-v0.csv`: neutron/alpha energies, thermal deposition, parasitics, conversion and rejected heat.
- `levitation-control-model/`: equations of motion, sensors, delays, disturbances, actuator limits and validation plots.
- `neutronics-model/`: input geometry and validated code configuration, magnet fluence and tritium breeding estimates with sensitivity.
- `radiator-trade-v0.csv`: temp, emissivity, area, mass assumptions and orientation.
- `mission-trade-v0.csv`: payload, delta-v, allowable thrust duration, spacecraft total dry mass, propellant, bus power, thrust and trajectory assumptions.

**Release rule:** future test results must name the exact input deck, version, uncertainties and investigator. If the reactor hypothesis fails, record the failure transparently. No source projections are automatically promoted to verified results.
