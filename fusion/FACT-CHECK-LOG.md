# Fact Check Log

## Schematics PDF triage

Source file: `ARPA_Nuclear_Fusion_Schematics_.pdf.pdf` in `~/workspace/user/files/`
Triage date: November 17, 2026
Scope: triage only. This log does not rebuild any diagram and does not finish any deep fact check. Checkable claims are listed page by page so the fact check sweeps can pick them up.
Extracted text: `sources/local/schematics-pdf-extracted.txt`

### File facts

- Page count: 24 pages
- File size: 1,531,014 bytes, about 1.5 MB
- Page size: US Letter, 612 by 792 points
- PDF version: 1.4, not encrypted, tagged
- Producer: Skia/PDF m150 Google Docs Renderer. In plain terms this file was exported from Google Docs. It is not a CAD export and it is not a scanned paper document.
- Title inside the PDF metadata: "ARPA Nuclear Fusion Schematics:"
- Pages 1 to 5 hold the only real drawn diagrams. Each of those pages is one large embedded raster image at about 222 dpi plus a short caption line in live text. The words inside the diagrams are part of the image. They do not extract as text.
- Pages 6 to 24 are native digital text with tables. The text extracts cleanly with pdftotext. Nothing on pages 6 to 24 is a scanned image.
- The diagrams inside pages 6 to 24 are not drawings. They are text boxes that hold ASCII style flow lists, labelled Schematic 1 to Schematic 4. They extract as text but the box borders break the layout up.
- There are no page numbers, no figure numbers tied to a parts list, no scale bars, no tolerances, and no dimensioned engineering drawings anywhere in the file. The word schematics in the title overstates what the file holds. It holds five illustrated plates and a design narrative.
- Tables split across page breaks in five places. The performance table splits across pages 6 and 7. Schematic 1 splits across pages 8 and 9. The FLiBe section and Schematic 3 split across pages 15, 16, and 17. Schematic 4 splits across pages 18 and 19. The cost section and the contact block split across pages 20, 21, 23, and 24. Any markdown conversion has to rejoin those pieces by hand.
- Privacy flag for the open source release: page 6 and page 23 print a personal email address and a personal phone number. The release copy should not ship those until Victoria says so in plain words.

### How the verdicts work

- USABLE means the page is sound, relevant to the Crockett Reactor, and correctly drawn or described as it stands.
- USABLE WITH CORRECTIONS means the core content is relevant and worth keeping, but the page carries a named error, an unverified claim stated as fact, or a layout fault that has to be fixed before release.
- NOT USABLE means the page as it stands is wrong, garbled, illegible, a bare fragment, or a duplicate that cannot ship. Naming a page not usable does not always mean the underlying idea is lost. Where the content can be recovered from another page, the entry says so.

### Page by page triage

#### Page 1. Diagram plate, Part 1 Full System Overview

- What is on it: a caption line plus a nested box diagram. The boxes run outer vacuum chamber, FLiBe blanket, levitated magnetic bottle, and plasma core, with side labels for pellet injectors, external HTS magnets, T2 extraction, and heat out.
- Verdict: NOT USABLE.
- Reason: the drawing is garbled in the file itself. The FLiBe blanket label is partly hidden behind the pellet injectors label. The external HTS magnet labels are clipped at both sides and run over the vacuum gap label. The neutrons label at lower left is cut off and unreadable. Several labels are pale text on a pale ground and cannot be read at normal zoom. The legend promises three arrow styles for neutron paths, pellet injection, and levitation force, but the drawing does not show them in a way a reader can trace. The geometry also conflicts with the text on page 8, because the plate nests the FLiBe blanket directly against the magnetic bottle with no vacuum gap layer drawn between them. This plate has to be redrawn, not patched.
- Claims on this page for the sweeps: plasma core labelled Q greater than 10 target. Ultra high vacuum described as the reason neutrons travel freely.

#### Page 2. Diagram plate, Part 2 Core Ignition System

- What is on it: a caption plus two panels. The left panel is a pellet cross section with labels for the timing delay shell, a catalyst B/Li trace, an ablative coating of 50 to 100 micrometers, and a 1 to 3 mm diameter injected at 1 to 5 km/s. The right panel is a four step ablation sequence that ends in inside out ignition, with the ablation timing equation at the bottom.
- Verdict: NOT USABLE.
- Reason: most of the panel headings and step text are white or near white on white or on pale fills and are illegible in the rendered page. A reader can make out the pellet rings but cannot read the headings for pellet anatomy, the ablation sequence title, or the equation box title. The pellet cross section also does not label the two most important parts, the D-T fuel payload and the timing shell boundary, with leader lines a reader can follow. The same content is covered in readable text on pages 10 and 11, so nothing is lost by pulling this plate and redrawing it.
- Claims on this page for the sweeps: pellet diameter 1 to 3 mm. Ablative coating 50 to 100 micrometers ceramic or polymer. Injection speed 1 to 5 km/s. Ablation timing equation t_vaporize equals (delta_coat times rho_coat times L_vap) divided by q_plasma.

#### Page 3. Diagram plate, Part 3 Levitation Mechanism

- What is on it: a caption plus a chamber drawing with external HTS magnets at top, bottom, and sides, an inner magnetic bottle, a plasma core, a pellet trajectory dashed line from the top, and two side boxes that cover levitation force, the stability condition, and a 2026 validation note about OpenStar Technologies.
- Verdict: NOT USABLE.
- Reason: the same washout fault as pages 1 and 2. The levitation force heading, the stability heading, the key advantage heading, and parts of the inner bottle text are white on white or blue on blue and cannot be read. The external HTS magnet label at the top overlaps the pellet trajectory label. The vacuum gap label on the left is overwritten by other text and reads as two lines colliding. The plasma core is drawn as a small oval at the bottom of the inner bottle instead of at the center, which contradicts the central core claim the whole design rests on. The side magnets are drawn with no labels at all. Redraw only.
- Claims on this page for the sweeps: levitation force formula F_lev equals (mu_0 times m_1 times m_2) divided by (4 pi times r cubed) times (3 cos squared theta minus 1). Stability condition k_stability equals dF_lev/dr greater than 0. Vacuum gap 0.5 to 1 m. OpenStar Technologies, February 2026, 0.5 tonne HTS magnet levitated inside a 5 m vacuum chamber, plasma held at millions of degrees, no solid supports.

#### Page 4. Diagram plate, Part 4 FLiBe Blanket

- What is on it: a caption plus a chamber drawing on the left that shows the outer vacuum chamber, the FLiBe blanket at 20 to 40 cm thick and 500 to 700 degrees C, a vacuum gap, and an inner bottle with plasma core and 14.1 MeV fusion neutrons. Three boxes on the right cover tritium breeding reactions, the heat extraction loop, and corrosion protection.
- Verdict: NOT USABLE.
- Reason: the tritium breeding reactions heading, the heat extraction loop heading, and the corrosion protection heading are all white on white. The beryllium multiplier label on the left edge is clipped and garbled. The drawing puts the vacuum gap inside the FLiBe ring and shows the FLiBe blanket filling most of the chamber, which conflicts with page 8, where the blanket is a thin shell just inside the chamber wall with the gap between the blanket and the bottle. A reader cannot tell from this plate where the gap sits. The readable version of this content is on pages 15 to 17. Pull and redraw.
- Claims on this page for the sweeps: FLiBe blanket 20 to 40 cm thick at 500 to 700 degrees C. Fusion neutrons 14.1 MeV each. Lithium 6 reaction gives plus 4.8 MeV. Lithium 7 reaction gives minus 2.5 MeV. Beryllium multiplier written as 9Be plus n goes to 2 helium plus 2n. Breeding ratio BR about 2.01, modelled. Thermal efficiency 47 percent. LCOE 28 to 34 dollars per MWh. Net output about 186 MWe. Graphene copper sandwich coating holds corrosion under 0.5 micrometers per year.

#### Page 5. Diagram plate, Part 5 Full Integrated System

- What is on it: a caption plus a top to bottom flow chart of the closed loop cycle in five steps, plasma initialization, pellet injection, inside out ignition, sustained fusion, then a split into FLiBe blanket and heat extraction, with an AGI control box on the right and a performance summary strip at the bottom.
- Verdict: NOT USABLE.
- Reason: the Part IV heading, the AGI control heading, and the performance summary heading are white on white. Step text sits in low contrast fills and parts of steps 1, 3, 5A, and 5B are hard to read. The dashed return loop on the left is labelled continuous operation loop but does not connect to a clear start point, so the closed loop claim is not actually drawn. This is a duplicate in picture form of Schematic 4 on pages 18 and 19, and the text version is the readable one. Pull and redraw.
- Claims on this page for the sweeps: timed ablative pellets fired at 1 to 5 km/s. Q greater than 10. BR about 2.01. About 186 MWe net. 47 percent efficiency. LCOE 28 to 34 dollars per MWh. AGI control with microsecond response, magnetic sensors, pH and color diagnostics, and pellet timing.

#### Page 6. Title page and Section 1 Executive Summary

- What is on it: the document title, author block for Mary-Victoria Crockett in North Little Rock, Arkansas, dated April 2026, then the executive summary with the three problem labels (soggy firewood, leaky bottle, crumbling cage), the three matching fixes, a 2026 validation paragraph about OpenStar, and the top part of the preliminary performance projections table.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this is core framing content and the text is clean, but it states projections as settled results and it carries the release privacy flag. Indefinite runtime, zero embrittlement, and no replacement cycles are asserted with no qualification, and none of that is proven by anything in the file. The OpenStar sentence calls the February 2026 result the worlds first levitated dipole plasma confinement, which the sweeps have to check against earlier levitated dipole work such as LDX and RT-1. The performance table is cut in half by the page break, so the page cannot ship alone.
- Claims on this page for the sweeps: commercial fusion blocked for 70 years. OpenStar Technologies demonstrated the worlds first levitated dipole plasma confinement in February 2026, floating a 0.5 tonne HTS magnet inside a 5 meter vacuum chamber with no solid supports. Projected Q value greater than 10. Tritium breeding ratio about 2.01. Pilot plant thermal output 500 MWth. Net electrical output about 186 MWe. Thermal to electric efficiency about 47 percent on an sCO2 Brayton cycle. Estimated LCOE 28 to 34 dollars per MWh. CAPEX about 3,700 dollars per kW.

#### Page 7. Performance table tail only

- What is on it: the last four rows of the performance table from page 6 and nothing else. Traditional tokamak CAPEX per kW, cost advantage, plant lifetime, and runtime. The rest of the page is blank.
- Verdict: NOT USABLE.
- Reason: it is a page break fragment, not a page of content. Standing alone it has no heading, no context, and no meaning. The rows themselves belong with page 6 and should be merged back into one table in any conversion. Do not release it as a page.
- Claims on this page for the sweeps: traditional tokamak CAPEX 8,000 to 15,000 dollars per kW as a benchmark. Cost advantage 54 to 75 percent cheaper than traditional designs. Plant lifetime 60 years with no first wall replacement. Runtime indefinite with zero embrittlement.

#### Page 8. Section 2 Full System Architecture Overview

- What is on it: the four layer architecture in prose. Layer 1 outer vacuum chamber, Layer 2 FLiBe liquid blanket, Layer 3 levitated magnetic bottle, Layer 4 plasma core, then the header and first rows of Schematic 1, the nested architecture in text form.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this is one of the core design pages and the clearest statement of the architecture in the file, but the numbers do not close up and the central wall less claim is overstated. A chamber 3 to 5 meters across cannot also hold a blanket placed 1 to 2 meters outside the core plus a 0.5 to 1 meter vacuum gap plus the core and bottle without a tighter dimension stack, and no stack is given. The blanket is called a thin spherical shell in a chamber that is described one paragraph earlier as a cylinder. The claim that the inner bottle cannot be damaged by neutron bombardment because it never contacts a solid wall is wrong as stated. The levitated magnet itself sits in the neutron path and takes the flux first. A vacuum gap does not shield the magnet that makes the field.
- Claims on this page for the sweeps: outer chamber stainless steel or low activation alloy cylinder about 3 to 5 meters in diameter, scalable from the OpenStar Junior prototype. Chamber vacuum 10 to the minus 6 Pa or better. Vacuum gap 0.5 to 1 meter. FLiBe blanket positioned 1 to 2 meters outside the levitated core. About 80 percent of fusion energy deposited as heat in the FLiBe. FLiBe circulates at 500 to 700 degrees C. Breeding ratio about 2.01 from lithium 6 plus a beryllium neutron multiplier. Plasma core burns at tens of millions of degrees. Schematic 1 gives the FLiBe blanket as spherical and 20 to 40 cm thick.

#### Page 9. Schematic 1 tail only

- What is on it: the bottom half of the Schematic 1 text box from page 8, listing the vacuum gap, the levitated inner magnetic bottle, the plasma core, pellet injector ports, the external HTS magnet array, the heat exchanger loop, and the tritium extraction loop. The rest of the page is blank.
- Verdict: NOT USABLE.
- Reason: it is the second half of a text box split by a page break. On its own it is a stack of disconnected list rows with no heading in view and no diagram. The information is all on page 8 in prose, so this page adds nothing. Merge it back into page 8 in any conversion and do not release it as a page.
- Claims on this page for the sweeps: vacuum gap 0.5 to 1 m with neutrons flying freely through it. Pellet trajectory outer wall to gap to bottle to core. Heat loop FLiBe to IHX to sCO2 turbine to grid. Tritium loop T2 to pellet fuel cycle.

#### Page 10. Section 3 Part I Core Ignition System and pellet design

- What is on it: the soggy firewood framing, section 3.1 with the four layer pellet table (outer ablative coating, timing delay shell, dense fuel payload, optional catalyst layer), and section 3.2 with the ablation timing equation and its design constraint.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this is core reactor content and the pellet table is the most concrete spec in the file, but two items need the sweeps before release. The optional catalyst layer claims trace boron or lithium improves reactivity and Q value, and no basis is given for boron helping a D-T burn. The ablation equation is dimensionally consistent on its face, but the text says the coating must survive the plasma edge and then vaporize exactly at the magnetic axis, and nothing on the page deals with the pellet crossing the FLiBe blanket and the levitated magnet structure that sit in the stated flight path from the outer wall.
- Claims on this page for the sweeps: pellet diameter 1 to 3 mm. Outer ablative coating heat resistant polymer or low Z ceramic, 50 to 100 micrometers thick. Timing delay shell thickness tuned so vaporization happens at the magnetic axis. Fuel payload is deuterium tritium ice or an advanced fuel mix. Optional catalyst layer of trace boron or lithium. Ablation timing equation t_vaporize equals (delta_coat times rho_coat times L_vap) divided by q_plasma. Local heat flux at the plasma edge given as about GW per square meter in the core.

#### Page 11. Injection velocity, Schematic 2 ablation sequence, and injector ports

- What is on it: section 3.3 on injection velocity and Q value impact, Schematic 2 as a four step text sequence from pellet entry to inside out ignition, and section 3.4 on the 4 to 8 injector ports with graphene copper heat sink coatings on the rails and electronics.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: core content, with one plain arithmetic slip and one gap. At 1 to 5 km/s a pellet crosses 0.5 to 1 meter in 0.1 to 1.0 milliseconds, not the 0.1 to 0.5 milliseconds stated, so the stated range only covers part of the stated speed and distance ranges. The page also says the pellet reaches the core before significant ablation while the timing shell needs flight time to work, and it does not reconcile the two. The graphene copper heat sink claim for injector rails is a separate Crockett invention asserted here with no data.
- Claims on this page for the sweeps: pellets injected at 1 to 5 km/s on magnetic accelerator rails. A 2 mm pellet crosses the 0.5 to 1 m vacuum gap in about 0.1 to 0.5 milliseconds. Peak temperature zone about 100 million degrees. Four to eight pellet injector ports on the outer chamber wall aligned with the magnetic axis. Graphene copper heat sink sandwich layers protect rails and electronics from stray heat loads.

#### Page 12. Section 4 Part II Magnetic Levitation Mechanism

- What is on it: the leaky bottle and crumbling cage framing, section 4.1 levitation physics with the dipole force equation, a stability condition, and a paragraph on AGI level feedback that adjusts outer field currents in microseconds.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this is the most important mechanism page in the file and it has the most serious physics faults in the text section. The force between two dipoles falls as 1 over r to the fourth power, not the 1 over r cubed shown, which is the falloff of a dipole field, not of the force on a dipole. The stability condition is stated as k_stability equals dF_lev/dr greater than 0 and is described as passive stability, but a restoring force needs the force to push back against a displacement, and the sign as written does not establish that. The page also claims passive stability and microsecond active feedback in the same breath without saying which one is doing the work. Static magnetic levitation with no feedback is not passively stable in all directions, so the sweeps need to settle how much of this page survives.
- Claims on this page for the sweeps: levitation force equation F_lev equals (mu_0 times m_1 times m_2) divided by (4 pi times r cubed) times (3 cos squared theta minus 1). mu_0 equals 4 pi times 10 to the minus 7 H per m. Stability condition k_stability equals dF_lev/dr greater than 0. Magnetic sensors monitor bottle position continuously and outer field currents are adjusted in microseconds.

#### Page 13. Stability under pellet injection and neutron transport

- What is on it: section 4.2 on stability under pellet injection with the tearing mode condition Delta prime less than 0, and section 4.3 on neutron transport through the vacuum gap with the flux equation and the claim of zero embrittlement.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: relevant core content, but the zero embrittlement conclusion does not follow from its own equation. Setting the attenuation coefficient Sigma to about 0 in the vacuum gap only says neutrons are not absorbed inside the empty gap. It says nothing about the flux that lands on the levitated magnet, on diagnostics and injector structures that cross the gap, or on the blanket vessel, and the 1 over r squared falloff across a 0.5 to 1 meter gap is a small reduction, not an elimination. The Delta prime claim is also stated as a guaranteed result of central fueling with no calculation behind it. Both points are flagged here as internally unsupported, and the deep check belongs to the sweeps.
- Claims on this page for the sweeps: central refueling keeps the pressure profile peaked at the core and drives the tearing mode stability index Delta prime negative. Neutron flux Phi_n(r) proportional to (1 over r squared) times e to the minus Sigma times r. With vacuum in the gap Sigma is about 0, so flux falls as 1 over r squared only. Traditional solid wall designs suffer progressive embrittlement over 5 to 10 year cycles with replacement costs over 100 million dollars per cycle.

#### Page 14. Section 4.4 2026 Real World Validation

- What is on it: a one line carry over that the Crockett Reactor with Sigma equals 0 in the gap gives indefinite runtime, then section 4.4 on OpenStar Technologies in New Zealand and its February 2026 levitated dipole result, closing with the claim that the Crockett design only needs to scale that result and add the FLiBe blanket geometry.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this page carries the single most load bearing external claim in the whole file, and it is stated with no source, no paper, no press release, and no link. If the OpenStar date, mass, chamber size, or first ever wording is wrong, the validation argument on pages 6 and 14 and plate 3 falls with it. The page also calls levitation Part III of the architecture, while the document structure calls it Part II, which is a small internal inconsistency the conversion should fix.
- Claims on this page for the sweeps: OpenStar Technologies, New Zealand, announced in February 2026 the worlds first successful levitated dipole plasma confinement. A 0.5 tonne HTS magnet floated inside a 5 meter vacuum chamber with no physical supports. Plasma was confined at millions of degrees. No solid supports touched the confinement field.

#### Page 15. Section 5 Part III FLiBe Liquid Blanket System

- What is on it: the FLiBe introduction with the 2LiF-BeF2 eutectic formula, section 5.1 tritium breeding chemistry with the lithium 6, lithium 7, and beryllium multiplier reactions and the breeding ratio equation, and the start of section 5.2 on tritium extraction with helium sparging.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: core content and the reaction energies as written match the standard D-T breeding reactions on their face, so the fault here is the modelled result, not the reaction list. A breeding ratio of about 2.01 from a 20 to 40 cm blanket at 20 percent lithium 6 enrichment is an extraordinary number that no calculation in the file supports, and it is repeated as fact on pages 4, 5, 6, 8, 18, and 20. The beryllium multiplier is also described as doubling the neutron population with an average factor of about 1.8 per interaction, which the sweeps need to check against the real (n,2n) threshold and cross section. Note the enrichment conflict with page 23, which gives 20 to 50 percent.
- Claims on this page for the sweeps: FLiBe is 2LiF-BeF2. Fusion neutrons are released at 14.1 MeV. Lithium 6 plus n gives helium 4 plus T plus 4.8 MeV. Lithium 7 plus n gives helium 4 plus T plus n minus 2.5 MeV. Beryllium 9 plus n gives 2 helium 4 plus 2n, with an average multiplication factor of about 1.8 neutrons per interaction. Breeding ratio equation BR equals T atoms bred divided by T atoms burned. Modelled BR about 2.01 with a 20 to 40 cm blanket, 20 percent lithium 6 enrichment, and a beryllium multiplier. Tritium forms TF or dissolves as T2 in the salt and is stripped by helium sparging.

#### Page 16. Tritium extraction tail, corrosion mitigation, and heat extraction

- What is on it: the end of section 5.2 on getter beds and palladium membranes, section 5.3 with a three row corrosion table covering the graphene copper barrier coating, a beryllium metal redox buffer, and continuous salt purification, then section 5.4 and the top half of Schematic 3, the heat extraction loop.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: relevant and detailed, but the corrosion numbers are the kind of claim that cannot ship on assertion alone. A greater than 99 percent corrosion cut from a monolayer graphene coating in 500 to 700 degree C FLiBe, plus a long term rate under 0.5 micrometers per year, plus CVD described as scalable and proven in 2026 molten salt reactor research, all need a source. Graphene stability and adhesion in hot fluoride salt is exactly the point a reviewer will press. The stated untreated corrosion rate of 10 to 50 micrometers per year also needs a source.
- Claims on this page for the sweeps: palladium membranes or zirconium and titanium getter beds permeate T2 at over 95 percent efficiency per pass. FLiBe at 500 to 700 degrees C corrodes conventional steel alloys at 10 to 50 micrometers per year. Graphene copper barrier coating cuts corrosion rates by over 99 percent. Beryllium metal redox buffer holds Hastelloy-N corrosion under 1 micrometer per year. A 1 percent purification side stream holds the long term corrosion rate under 0.5 micrometers per year. About 80 percent of fusion energy is deposited as heat in the FLiBe. Heat deposited about 400 MW thermal. FLiBe primary loop inlet about 500 degrees C, outlet about 700 degrees C, flow rate 5 to 10 m/s, electromagnetic pumps with no moving parts in the salt.

#### Page 17. Schematic 3 tail and auxiliary power table

- What is on it: the bottom of Schematic 3 with the sCO2 Brayton turbine block and grid power output, then the auxiliary power table for the 500 MWth pilot that totals P_aux at about 49 MW, with gross electrical output about 235 MW and net output about 186 MWe.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: the page is a split fragment like pages 7 and 9, but unlike those two it holds a unique table that appears nowhere else, so the content is worth keeping and merging into page 16. The arithmetic inside the table does add up, because 500 MWth at 47 percent gives 235 MWe gross and 235 minus 49 gives the stated 186 MWe net. What needs the sweeps is the inputs, in particular plasma heating at only about 24 MW on the strength of Q greater than 10, and HTS magnets plus cryocoolers at only about 12 MW for a levitated system of this size.
- Claims on this page for the sweeps: sCO2 turbine inlet about 650 to 700 degrees C at 20 to 30 MPa with thermal efficiency about 47 percent. Plasma heating about 24 MW. HTS magnets and cryocoolers about 12 MW. FLiBe pumps and sCO2 flow about 8 MW. Tritium extraction and purification about 3 MW. Diagnostics and AGI control systems about 2 MW. Total auxiliary load about 49 MW. Gross electrical output about 235 MW. Net electrical output about 186 MWe.

#### Page 18. Section 6 Integrated Closed Loop Operation

- What is on it: the three pillars restated as one integrated system, then Schematic 4, the complete operational cycle in steps 1 to 5A, covering plasma initialization, continuous pellet injection, inside out ignition, sustained fusion, and neutron capture with breeding.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this is the clearest single statement of how the reactor is meant to run, so it is core content, but it repeats the file wide claims without adding evidence, and step 1 repeats the contested stability condition from page 12. It also states that the reactor needs no external fuel input beyond the initial tritium loading, which depends entirely on the unverified breeding ratio on page 15. Keep the page, correct the dependency, and let the sweeps settle the repeated numbers.
- Claims on this page for the sweeps: levitation stability confirmed as k_stability greater than 0. Pellets fired at 1 to 5 km/s from 4 to 8 injector ports. Q greater than 10 with minimal external heating. Tearing mode stability index Delta prime less than 0. 14.1 MeV neutrons per D-T fusion event travel through the vacuum gap with Sigma equals 0 and no attenuation. Beryllium (n,2n) multiplier turns 1 neutron into about 1.8 neutrons. Breeding ratio about 2.01. T2 extracted by helium sparging and palladium membranes and returned to the pellet fuel cycle.

#### Page 19. Schematic 4 tail and AGI real time control

- What is on it: step 5B on heat extraction and power generation with the LCOE line, then a block on AGI real time control that runs through all steps, covering magnetic sensors, pH and color changing plasma edge diagnostics, microsecond field adjustments, pellet timing, FLiBe redox monitoring, and real time adjustment of blanket flow and lithium 6 enrichment.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: the heat extraction half is a clean repeat of pages 16 and 17, but the control block contains two claims that do not work as written. Lithium 6 enrichment is a property of the salt inventory and cannot be adjusted in real time to hold the breeding ratio above 1.1, so that sentence needs to be cut or rewritten as a design time choice. The pH and color changing plasma edge diagnostic is named with no explanation of what it measures in a plasma, and pH is a liquid chemistry measure. It also appears in the patent claims on page 23, so the fault propagates.
- Claims on this page for the sweeps: FLiBe captures about 80 percent of fusion energy as heat. FLiBe primary loop 500 to 700 degrees C through an IHX to sCO2. sCO2 Brayton turbine about 47 percent thermal efficiency. Net output about 186 MWe at 500 MWth pilot scale. LCOE 28 to 34 dollars per MWh, described as competitive with solar plus storage. Magnetic sensors give microsecond response. Outer field currents are adjusted in microseconds to hold k_stability greater than 0. Blanket flow rate and lithium 6 enrichment are adjusted in real time to hold BR above 1.1.

#### Page 20. Section 7 Capital Cost and Economic Model

- What is on it: the 500 MWth pilot plant cost table for Arkansas with eight line items that total 1.855 billion dollars, the CAPEX per kW line, section 7.1 on LCOE with benchmark rows, and section 7.2 with the revenue projection, annual generation, annual revenue, payback period, and 60 year lifetime revenue.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this page holds the clearest plain error in the file. Annual revenue is given as about 45 million dollars and total CAPEX as 1.855 billion dollars, so payback from revenue alone is about 41 years, not the approximately 4 years stated, and that is before any operating cost. There is a second fault in the headline comparison. The 3,700 dollars per kW figure is CAPEX divided by 500 MW of thermal power. Divided by the 186 MWe the plant actually sells, the figure is about 9,970 dollars per kW, which sits inside the traditional tokamak benchmark range the page claims to beat by 54 to 75 percent. The annual generation arithmetic itself is right, because 186 MWe times 8,760 hours times 0.92 gives about 1,499,000 MWh per year, and 60 years at 45 million dollars gives the stated 2.7 billion dollars.
- Claims on this page for the sweeps: HTS magnets and levitation system 480 million dollars. Vacuum chamber and structure 220 million dollars. FLiBe inventory and blanket shell 160 million dollars. Pellet injection and timing system 140 million dollars. sCO2 power cycle and turbine 280 million dollars. Graphene copper coating on all surfaces 95 million dollars. Diagnostics, tritium extraction, and safety systems 180 million dollars. Site preparation, licensing, and contingencies 300 million dollars. Total CAPEX 1.855 billion dollars. CAPEX per kW about 3,700 dollars. Financing at 7 percent WACC on a 30 year loan. Plant lifetime 60 years. Capacity factor 92 percent. Calculated LCOE 28 to 34 dollars per MWh. Benchmarks given as combined cycle gas about 45 to 60 dollars per MWh, fission about 80 to 120, traditional tokamak fusion projected 60 to 120, and solar plus storage about 30 to 60. Annual generation about 1,499,000 MWh per year. Annual revenue about 45 million dollars per year. Payback period approximately 4 years. Sixty year lifetime revenue about 2.7 billion dollars.

#### Page 21. One sentence carry over on scaling and licensing

- What is on it: a single sentence about scaling to commercial 1 GWth modular plants and IP licensing creating revenue of hundreds of millions per year for the patent holder, plus a foundational equity stake line. The rest of the page is blank.
- Verdict: NOT USABLE.
- Reason: it is an orphan sentence left over from page 20 by a page break, and the claim inside it conflicts with page 20, which puts a single pilot plant at about 45 million dollars a year in revenue. Hundreds of millions per year would need a fleet and a licensing model that the file never sets out. Merge the sentence into page 20 if it is kept at all, and do not release the page.
- Claims on this page for the sweeps: scaling to 1 GWth modular plants plus IP licensing creates revenue of hundreds of millions per year.

#### Page 22. Section 8 Safety Profile and Regulatory Pathway

- What is on it: section 8.1 with a safety table covering no meltdown risk, minimal tritium inventory, no long lived radioactive waste, passive decay heat removal, and fail safe levitation, then section 8.2 on the regulatory fast track path under 10 CFR Part 30 and 70.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: the general direction that fusion has no fission style meltdown is fair, but several specifics are stated too strongly for a release document. An on site tritium inventory of 1 to 2 kg is described as minimal, and 1 to 2 kg of tritium is a large and heavily regulated inventory, not a small one. The claim that the levitated bottle simply drops safely to the chamber floor needs an impact and magnet quench analysis that the file does not contain. The claim that waste decays to background in decades needs the activation inventory behind it. The licensing timeline and the digital twin claim in section 8.2 are the highest risk lines on the page because they read as regulatory advice.
- Claims on this page for the sweeps: decay heat is 1 to 2 percent of operating power against 6 to 7 percent for fission. Total on site tritium held to 1 to 2 kg by continuous extraction. pH and color sensors give real time leak detection. Activation products are short lived and waste decays to background in decades, not millennia. Passive radiative cooling through the chamber walls is enough for decay heat with no pumps. Fusion in the United States is regulated under 10 CFR Part 30 and 70 rather than Part 50 and 52. Target of 12 to 18 months from first testbed data to full pilot approval against 5 to 10 plus years for fission. A DOE Fusion Pilot Plant funding pathway is already open. Digital twin simulation data already developed provides 90 percent of the safety analysis required for a combined construction and operating license filing.

#### Page 23. Section 9 Patent Claim Language and Section 10 contact block

- What is on it: the patent title, an abstract, Claim 1 with five elements, Claim 2 on graphene copper heat sink structures, Claim 3 on pellet timing from pH and color changing plasma edge sensors, a dependent claims list, and the start of section 10 with the inventor contact block.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: the claim set is relevant and it is the only place the architecture is stated in claim form, so it should stay, but it imports the faults from earlier pages and adds one of its own. The dependent claim gives lithium 6 enrichment as 20 to 50 percent, while page 15 models the breeding ratio at 20 percent, so the two pages do not agree. Claim 3 depends on the unexplained pH and color changing plasma edge sensor from page 19. The dependent claim for the sCO2 cycle gives efficiency over 45 percent while the rest of the file says about 47 percent, which is consistent but looser. The contact block repeats the personal email and phone number flagged on page 6.
- Claims on this page for the sweeps: ablative coating thickness engineered so t_vaporize equals (delta_coat times rho_coat times L_vap) divided by q_plasma matches the exact flight time to the magnetic axis. Levitation stability held with k_stability equals dF_lev/dr greater than 0 under continuous central refueling. FLiBe composition 2LiF-BeF2 eutectic with enriched lithium 6 at 20 to 50 percent and an embedded beryllium neutron multiplier reaching a breeding ratio over 1.1. Supercritical CO2 Brayton cycle reaching thermal efficiency over 45 percent. Graphene copper layered heat sink structures on all diagnostic probes, injector rails, and power electronics.

#### Page 24. Portfolio note and submission note

- What is on it: a portfolio line that credits 200 plus documented inventions across fusion, biomedical devices, protein folding theory under the name Gray-Crockett Collapse Field Theory, hemorrhagic shock detection under the name Crockett Dissonance Index, and advanced materials, then a note that the document was prepared for submission to named ARPA-E officials in April 2026 in response to a stated ARPA-E funding commitment, and a closing line that all concepts are the original intellectual property of Mary-Victoria Crockett with patent protection pending.
- Verdict: USABLE WITH CORRECTIONS.
- Reason: this is closing matter rather than reactor design content, and it is the page most likely to cause trouble in an open source release if it ships unchecked. The named officials, their titles, the summit name, and the 135 million dollar figure are all checkable and all need the sweeps before anyone republishes them under Victorias name. The patent protection pending line also needs care, because the rest of the file does not show a filing number or a filing date.
- Claims on this page for the sweeps: portfolio of 200 plus documented inventions. Document prepared for submission to ARPA-E Program Director Dr. Ahmed Diallo, Fusion Portfolio, and ARPA-E Director Conner Prochaska in April 2026. Prepared in response to an ARPA-E 135 million dollar fusion energy commitment announced at the 2026 ARPA-E Energy Innovation Summit. Patent protection pending.

### Summary count

- Pages total: 24
- USABLE: 0
- USABLE WITH CORRECTIONS: 16 (pages 6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24)
- NOT USABLE: 8 (pages 1, 2, 3, 4, 5, 7, 9, 21)

No page earns a clean USABLE. Every text page carries at least one projection stated as a settled result, and all five drawn plates are illegible as rendered. That is a fixable position. The design narrative on pages 8, 10 to 13, 15, 16, and 18 is coherent enough to correct and keep, and the five plates can be rebuilt from the text schematics.

### Cross page problems the sweeps should treat as one item each

- Breeding ratio about 2.01 appears on pages 4, 5, 6, 8, 15, 18, and 20 and in the LCOE logic. It is the single most repeated unverified number in the file. If it falls, the fuel self sufficiency claim, the near zero fuel cost line, and part of the LCOE case fall with it.
- Zero embrittlement and indefinite runtime appear on pages 1, 3, 6, 7, 13, and 14. The argument rests on Sigma equals 0 inside an empty gap and never accounts for the levitated magnet and the structures that cross the gap.
- The OpenStar February 2026 validation claim appears on pages 3, 6, and 14 in three slightly different forms. One check settles all three.
- Lithium 6 enrichment is 20 percent on page 15 and 20 to 50 percent on page 23.
- Pellet flight time is stated as 0.1 to 0.5 milliseconds on page 11 for a 0.5 to 1 meter gap at 1 to 5 km/s. The full range from those same inputs is 0.1 to 1.0 milliseconds.
- Payback is stated as about 4 years on page 20 against 1.855 billion dollars of CAPEX and about 45 million dollars a year of revenue on the same page, which gives about 41 years before operating costs.
- CAPEX per kW on pages 6 and 20 is worked out on thermal kilowatts. On electrical kilowatts, the basis buyers and benchmarks use, the same plant is about 9,970 dollars per kW.
- The pH and color changing plasma edge sensor appears on pages 19, 22, and 23 with no working explanation anywhere in the file.
- Levitation is called Part II in the section numbering on page 12 and Part III in the validation text on pages 6 and 14. The pellet system is Part I in the body and Part 2 on the plates. The part numbering needs one pass before conversion.

### Extraction notes for the conversion work

- Clean text is saved at `sources/local/schematics-pdf-extracted.txt`. It was produced with pdftotext in layout mode and holds all 24 pages in order with form feeds between pages.
- Pages 6 to 24 convert well. Body text, headings, and tables come out in reading order.
- Pages 1 to 5 contribute only their caption lines to that text file. Everything inside the five diagrams is image content and is missing from the extraction. Anyone converting from the text file alone would lose the plates without noticing, so the plates are listed here as image only.
- Table rows that split across pages 6 and 7, 15 to 17, and 20 and 21 need rejoining by hand.
- The ASCII schematics on pages 8 and 9, 11, 16 and 17, and 18 and 19 extract as text inside table cells, one line per cell. They will need rebuilding as code blocks or as real diagrams in markdown.
- Bullet glyphs extract with a trailing zero width character in places. A light cleanup pass will strip those.

---

## Sweep 1: background fact check

Sweep date: November 17, 2026
Scope: every checkable background claim in the converted corpus (docs/reactor-explainer.md, docs/full-design-document.md, docs/arpa-e-pitch.md, docs/doe-proposal-reactor-section.md, docs/why-im-giving-it-away.md, docs/funding-paths.md), plus the schematics claims carried over from the triage section above.
Method: web checks against primary and trade sources (OpenStar's published paper, arXiv 2508.17691, NEI Magazine, Interesting Engineering, ARPA-E's April 8, 2026 announcement coverage, the NRC rulemaking record in the Federal Register, Lazard LCOE+ 2025 figures as reported by pv magazine and Utility Dive), standard nuclear data, and arithmetic rechecks of every number that could be recomputed from the documents' own inputs.
House rule for this sweep: plain errors are corrected in place and logged here with before and after. Interpretive overclaims are annotated in place with bracketed sweep notes rather than silently rewritten. Anything that cannot be checked is flagged, not shipped as fact.

### Verified as correct

1. D-T fusion energy split. A D-T reaction releases 17.6 MeV in total. The neutron carries 14.1 MeV and the alpha particle 3.5 MeV, so about 80 percent of the energy rides on the neutron and lands in the blanket. The design document's 14.1 MeV and about 80 percent figures are correct.
2. Lithium 6 breeding reaction. 6-Li + n gives 4-He + T + 4.8 MeV. Correct as written.
3. Lithium 7 breeding reaction. 7-Li + n gives 4-He + T + n at minus 2.5 MeV. Correct as written. It is an endothermic threshold reaction.
4. FLiBe identity and working range. FLiBe is the 2LiF-BeF2 eutectic, melting point about 459 degrees C, and 500 to 700 degrees C is its normal working range. Correct as written.
5. Fission decay heat. About 6 to 7 percent of operating power at shutdown is the standard figure. Correct as written.
6. OpenStar Junior exists as described. A roughly 560 kg (0.5-tonne class) REBCO HTS dipole magnet, 5.6 tesla class, inside a 5.2-meter vacuum vessel. First plasma in late 2024 was in a supported configuration. Sources: the company's arXiv paper and NEI Magazine.
7. OpenStar fully levitated plasma, February 2026. Confirmed by trade press coverage. The magnet floated with no solid supports while plasma formed around it, at temperatures over a million degrees Celsius.
8. ARPA-E's 135 million dollar fusion commitment. Confirmed. Announced by Director Conner Prochaska on April 8, 2026 at the 2026 ARPA-E Energy Innovation Summit in San Diego, the largest concentrated fusion investment in the agency's history, with focus areas matching the pitch document's list.
9. The CHADWICK program is real. ARPA-E's fusion materials program, launched 2024, more than 25 million dollars across 13 projects, aimed at materials for plants that operate for decades. The pitch's framing is accurate.
10. NRC fusion regulation. The Commission chose the byproduct material framework at 10 CFR Part 30 in April 2023, over the Part 50 and 52 reactor frameworks. The fusion machine rulemaking under Part 30 was proposed in February 2026 and reported final in May 2026. The design document's basic regulatory framing is right.
11. Annual generation arithmetic. 186 MWe times 8,760 hours times 0.92 capacity factor gives about 1,499,000 MWh per year. Correct.
12. Auxiliary power table arithmetic. 500 MWth at 47 percent gives 235 MWe gross, and 235 minus the 49 MW auxiliary total gives the stated 186 MWe net. The table adds up. The inputs are projections, the arithmetic is sound.
13. The deck's soft validation line. "Levitated-dipole confinement has already been demonstrated in laboratory experiments" is true. LDX, RT-1, and Junior all demonstrated it.
14. Ablation timing equation. t_vaporize = (delta_coat times rho_coat times L_vap) divided by q_plasma is dimensionally consistent. It gives seconds from the stated inputs.
15. sCO2 Brayton efficiency. About 47 percent at a 650 to 700 degree C turbine inlet is within the range the published literature projects for supercritical CO2 cycles. It stands as a plausible projection, not a demonstrated figure for this design.
16. Tritium half-life. 12.3 years, used in the waste note in Section 8.1 of the design document.

### Corrected in place

1. **OpenStar "world's first" framing.** Before (design document Sections 1 and 4.4, and the ARPA-E pitch): "OpenStar Technologies demonstrated the world's first levitated dipole plasma confinement in February 2026." After: levitated dipole confinement was demonstrated earlier by LDX at MIT and RT-1 at the University of Tokyo, and OpenStar's own paper credits both. Junior's accurate firsts are the first fully levitated plasma in a commercial levitated dipole and the first levitated dipole whose magnet holds its current from an onboard power supply. The February 2026 date, the 0.5-tonne class magnet, and the 5-meter class chamber all checked out.
2. **Part numbering.** The levitated core was called Part III in the design document's Sections 1 and 4.4 and in the pitch, while the document's own structure numbers levitation as Part II. Corrected to Part II in all three places.
3. **Levitation force falloff.** Before: F_lev proportional to 1 over r cubed. After: 1 over r to the fourth. The r cubed falloff belongs to a dipole field. The force between dipoles depends on the field gradient and falls one power faster. A note in Section 4.1 adds that the exact force law for this geometry still needs a proper derivation and the sizing needs redoing.
4. **Passive stability framing.** Before: the stability condition "returns the bottle to center, passive stability," with microsecond feedback described as an enhancement. After: a note in Section 4.1 states that a static magnetic arrangement cannot be stable in every direction at once (Earnshaw's theorem), that every working levitated dipole uses active feedback, and that the feedback loop is the mechanism that makes levitation possible at all.
5. **Zero embrittlement conclusion.** Before (design document Sections 1, 2, and 4.3): Sigma near 0 in the vacuum gap means "ZERO embrittlement on the inner bottle or any structural component" and "indefinite runtime." After: notes in Sections 1, 2, and 4.3 state that the gap argument covers only the gap. The levitated bottle sits between the plasma and the gap and takes the full 14.1 MeV flux first. Neutron damage to the magnet is an open problem, listed in OPEN-QUESTIONS.md.
6. **Pellet gap crossing time.** Before: a pellet crosses the 0.5 to 1 m gap in "approximately 0.1-0.5 milliseconds." After: 0.1 to 1.0 milliseconds, which is what the document's own speed and distance ranges give, with a note that the full port-to-axis path is longer than the gap.
7. **Lithium reaction labels swapped.** Before: lithium 6 labeled "(fast neutrons, exothermic)" and lithium 7 labeled "(thermal neutrons, endothermic)." After: lithium 6 labeled as working at all energies with its cross section largest for slow neutrons, and lithium 7 labeled as needing fast neutrons above about 2.5 MeV. The energies were right, the labels were backwards.
8. **Beryllium multiplier framing.** Before: the Be(n,2n) reaction "doubles the neutron population" at "an average multiplication factor of about 1.8x neutrons per interaction," repeated in the closed-loop schematic as "1 neutron --> ~1.8 neutrons." After: one neutron in, two out, a gain of one extra neutron per reaction, only above the reaction threshold of about 1.9 MeV, with the net multiplication depending on how many neutrons react before slowing, leaking, or being captured. No multiplication factor is calculated in the document, and the text now says so.
9. **Payback period.** Before: "approximately 4 years from revenue alone." After: approximately 41 years from revenue alone, before operating costs. The page's own figures, 1.855 billion dollars of CAPEX against about 45 million dollars a year of revenue, give 41 years. The correction is stated in place in Section 7.2.
10. **CAPEX per kW basis.** Before: "about $3,700/kW" presented against an $8,000 to $15,000/kW tokamak benchmark as "54-75% cheaper." After: the figure is labeled as a thermal basis wherever it appears (design document Sections 1 and 7, and a note in the pitch), with the electric basis stated alongside: about $9,970/kW on the 186 MWe output, which sits inside the benchmark range. A cost advantage has to be shown per kW electric.
11. **Regulatory instruments.** Before: fusion regulated "under 10 CFR Part 30/70," and a licensing basis built on a "combined construction/operating license (COL) filing." After: Part 70 removed (it covers fission fuel cycle material), and a note in Section 8.2 states that a COL is a Part 52 fission instrument and that Part 30 materials licenses have no COL. The 90 percent digital twin figure and the 12 to 18 month target are labeled as the author's projections.
12. **Patent status.** Before: the deck says "Patent pending" twice, and the design document closes with "Patent protection pending" and a section titled "Patent Claim Language (Filing-Ready)." After: status notes in the deck conversion, in Section 9, and at the closing line state that no patent application is documented in the corpus and that the author's DOE proposal of September 30, 2026 states that no applications had yet been filed. The claim language itself is kept, labeled as the author's draft.
13. **Real-time enrichment.** Before: "Blanket flow rate and 6-Li enrichment adjusted in real time to maintain BR > 1.1." After: a note in Section 6 states that enrichment is a property of the salt inventory and cannot be adjusted in real time the way flow rate can.

### Flagged as unverified

These claims ship only with the flags and notes now attached to them in the documents, and each one is listed in OPEN-QUESTIONS.md. None is presented as established anywhere in the release.

1. **Breeding ratio about 2.01.** No calculation supports it anywhere in the corpus. The breeding integral in Section 5.1 is stated and never evaluated. Published blanket studies typically target about 1.05 to 1.15, because each fusion event produces exactly one neutron and leakage and structural capture eat into it. This is the single most load-bearing unverified number in the corpus. Fuel self-sufficiency and the near zero fuel cost line depend on it.
2. **Corrosion numbers.** Untreated FLiBe corrosion of 10 to 50 microns per year, a reduction of over 99 percent from the graphene-copper coating, under 1 micron per year with the beryllium redox buffer, and a long-term rate under 0.5 microns per year. No published source was found for graphene coated copper in FLiBe at 500 to 700 degrees C. The underlying problem is real and the redox technique is real. The specific rates are the author's figures.
3. **Tritium extraction efficiency.** Getter beds or palladium membranes permeating T2 at over 95 percent efficiency per pass. The techniques are real. The specific figure is unsourced.
4. **Tritium inventory framing.** One to two kilograms described as minimal. A kilogram scale inventory is large and heavily regulated, as ITER's licensing shows. Continuous extraction is a genuine strength of the design. The framing is corrected by note in Section 8.1.
5. **Fusion decay heat of 1 to 2 percent.** An author's estimate. Fusion decay heat comes from activated materials and depends on material choices and operating history. No such plant has run.
6. **Waste decays to background in decades.** Material dependent. Tritium decays with a 12.3 year half-life, and well chosen low activation materials can reach clearance levels in roughly a century. Decades is optimistic as a general claim.
7. **The bottle drops safely.** No drop, impact, or quench analysis exists in the corpus. A levitated superconducting magnet carries large stored magnetic energy.
8. **The pH and color-changing plasma-edge sensor.** Named in the closed-loop schematic, the safety table, and patent Claim 3, with no explanation anywhere of what it measures or how. pH is a liquid chemistry measure. Unexplained and unresolved.
9. **Comparison LCOE ranges.** The corpus gives new gas at about $45 to 60 per MWh and new fission at about $80 to $120 per MWh. Lazard's LCOE+ 2025 ranges are about $48 to $109 for combined cycle gas and about $141 to $220 for new nuclear. The corpus ranges sit below the published new build ranges. Notes added in the deck conversion and in Section 7.1 of the design document. The Crockett Reactor's own $28 to $34 per MWh stays labeled as the author's projection.
10. **Tokamak CAPEX benchmark of $8,000 to $15,000 per kW.** Plausible against published studies, but no single source was pinned during this sweep. Flagged rather than endorsed.
11. **The named ARPA-E program director in the original submission note.** The note naming individual officials was already omitted from the release copy during conversion. The $135 million figure and Director Prochaska's role verified. The fusion portfolio director name was not verified and does not ship.
12. **Pellet injection at 1 to 5 km/s.** Operating pellet injectors on fusion machines fire at hundreds of meters per second. Kilometer per second injection is experimental railgun territory. The corpus figure stands as the author's design specification and a hypothesis, labeled in OPEN-QUESTIONS.md.
13. **The boron or lithium catalyst layer.** The pellet spec claims trace boron or lithium improves reactivity and Q. No basis is given in the corpus, and no published basis was found for boron improving a D-T burn. Flagged.
14. **The DOE Fusion Pilot Plant pathway sentence.** DOE milestone-based fusion programs exist and the direction of the claim is consistent with them, but the specific pathway wording was not pinned to a current program notice during this sweep. Flagged.
15. **Funding memo facts.** docs/funding-paths.md is an AI-generated research memo dated April 2026. Its program descriptions were spot checked (CHADWICK verified, see above), but several application deadlines in it are now in the past. The file ships labeled as a time-sensitive supporting memo, not as current guidance.

### Documents annotated but not rewritten

- docs/doe-proposal-reactor-section.md is a faithful excerpt of a submitted proposal and carries the proposal's own status statement at the top, the most careful status wording in the corpus. An editor's note at the end points readers to the corrections for the figures it shares with the design document. The excerpt text itself is unchanged.
- docs/why-im-giving-it-away.md is the founding essay of October 2025 and ships as written, with one editor's note at the end covering the embrittlement framing.
- docs/funding-paths.md ships as a labeled supporting memo, see flag 15 above.

---

## Sweep 2: re-verification and internal consistency audit

Sweep date: November 17, 2026
Scope: every Sweep 1 correction re-checked in place in the converted files, then the framework's own claims audited across all six converted documents for internal consistency and honest labeling.
Method: targeted text searches for each corrected string and its original form, arithmetic rechecks, and a cross-document comparison of every repeated figure.

### Re-verification of Sweep 1 corrections

All 13 Sweep 1 corrections were found in place, and the original erroneous forms survive only inside the bracketed correction notes that quote them, which is where they belong in an open log.

1. "World's first levitated dipole" now appears only inside correction notes. The corrected text credits LDX and RT-1 and states Junior's actual firsts.
2. No remaining text calls the levitated core Part III. The only Part III in the design document is the FLiBe section heading, which is correct in the document's own numbering.
3. The levitation force equation now carries r to the fourth power. The r cubed form is gone.
4. "Passive stability" remains only in the author's equation block, immediately followed by the Earnshaw correction note.
5. The gap crossing time reads 0.1 to 1.0 milliseconds, with the old range quoted only in the correction note.
6. The "1.8x" multiplier survives only inside the Section 5.1 correction note. The closed-loop schematic now reads "one extra neutron each."
7. Payback reads approximately 41 years, with the original 4 year figure quoted only in the correction note.
8. "Patent pending" no longer appears in the deck conversion. The design document's closing line carries its status note.
9. The Part 70 citation is gone. The COL correction note is in place in Section 8.2.

### Internal consistency: what agrees

1. The headline figures agree across all six documents. Q greater than 10, breeding ratio about 2 (2.01 in the design document and DOE section, about 2.0 in the pitch, "about twice" in the deck), 500 MWth pilot, about 186 MWe net, about 47 percent efficiency, LCOE $28 to $34 per MWh, 60 year life, 92 percent capacity factor. They are the same projections everywhere. Their status as projections is now labeled everywhere too.
2. The CAPEX line items sum to the stated total. 480 + 220 + 160 + 140 + 280 + 95 + 180 + 300 = 1,855 million dollars.
3. The heating figure is internally consistent with the Q claim. At 500 MW of fusion power and about 24 MW of plasma heating in the auxiliary table, the implied Q is about 20, which satisfies the greater than 10 claim on the document's own terms. The claim itself remains an unproven projection.
4. Pellet specifications agree everywhere. One to three millimeters, 50 to 100 micrometer coating, 1 to 5 km/s, 4 to 8 injector ports.
5. The 80 percent neutron energy fraction and the roughly 400 MW deposited in the blanket agree with each other (80 percent of 500 MWth).

### Internal consistency: what does not agree, or is not closed

Each item here is also listed in OPEN-QUESTIONS.md. None was silently fixed, because each one needs the author or a collaborator with a calculation, not an editor.

1. **The dimension stack does not close.** The chamber is 3 to 5 meters in diameter. The blanket sits 1 to 2 meters from the core and is 20 to 40 cm thick, with a 0.5 to 1 meter vacuum gap between the blanket and the bottle. At the small end, a 3 meter chamber has a 1.5 meter radius and cannot hold a blanket placed 2 meters from the core. No dimension stack in the corpus reconciles chamber size, blanket position, gap width, and bottle size.
2. **Spherical blanket, cylindrical chamber.** Section 2 describes the chamber as a cylinder and the blanket as a spherical shell inside it. A sphere inside a cylinder leaves the blanket at varying distances from the wall and the core. The geometry is never resolved.
3. **Enrichment figures disagree.** Section 5.1 models the breeding ratio at 20 percent lithium 6 enrichment. The patent claim section specifies 20 to 50 percent. Noted in place in Section 5.1.
4. **The heat balance uses 500 MWth, the heat loop diagram deposits 400.** Schematic 3 shows about 400 MW thermal deposited in the FLiBe, which matches the 80 percent neutron fraction. The power balance then applies the 47 percent efficiency to the full 500 MWth to get 235 MWe gross. The path by which the remaining roughly 100 MW of alpha energy reaches the power cycle is never described. If only the 400 MW in the salt loop converts, gross output falls by about a fifth.
5. **The pellet flight path crosses the blanket and the magnet.** Injectors sit on the chamber wall. The stated trajectory runs wall, gap, bottle, core. The FLiBe blanket shell and the levitated magnet structure both sit on that path, and no document explains how a pellet crosses either one, or what the crossing does to the blanket, the field, or the pellet.
6. **FLiBe flow rate of 5 to 10 m/s.** Molten salt loops in practice run slower, because hot fluoride salt at high velocity aggravates the erosion and corrosion problem this same document is trying to solve. The figure is the author's specification and is flagged here as aggressive and unjustified in the text.
7. **The scaling revenue sentence.** Section 7.2 closes with hundreds of millions per year from scaling and licensing, against about 45 million a year for the pilot on the same page. A note was added in place in this sweep marking the sentence as speculative.
8. **"AGI" terminology.** The corpus uses "AGI-level feedback" and "AGI control systems" for what the documents themselves describe as position sensors, current adjustment, timing, and flow control, which is conventional control engineering. The author's word stays in her text. The README and the diagrams say "control system," and no release text endorses the AGI label as a technical description.

### Honest labeling audit

1. Every converted document now opens with a status line or carries the proposal's own status statement. No document in the release presents the design as built, tested, or validated.
2. Two point-of-claim notes were added in this sweep, in the deck's Solution 3 slide and in the pitch's third pillar, so the embrittlement claim carries its correction where it is made and not only in the design document.
3. The novel claims that remain stated in the author's own words (Q greater than 10, indefinite runtime, inside-out ignition raising Q, tearing-mode suppression from central fueling) are framed by the document status lines, the sweep notes, and OPEN-QUESTIONS.md, which lists each one as a hypothesis with the test that would settle it.
4. Nothing in the release claims an endorsement, a partnership, a filing, a submission result, or a validation that the corpus does not document. The ARPA-E pitch is presented as a pitch document. The DOE section is presented as a proposal excerpt. Neither is described as accepted, funded, or answered.

### Sweep totals

- Schematics triage: 24 pages, 0 usable as-is, 16 usable with corrections, 8 not usable. The 5 drawn plates were redrawn as the diagrams in the diagrams folder.
- Sweep 1: 16 background claims verified as correct, 13 corrections applied in place, 15 claims or claim groups flagged as unverified.
- Sweep 2: 9 of 9 Sweep 1 correction groups re-verified in place, 5 cross-document agreements confirmed, 8 internal inconsistencies or unclosed items documented and carried into OPEN-QUESTIONS.md, 2 point-of-claim labeling notes added, 1 speculative sentence annotated.
- Every figure drawn from the schematics PDF was checked in both sweeps, per the author's instruction for that file.
