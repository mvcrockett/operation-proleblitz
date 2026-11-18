# Operation 20k Tiny House

## The KumikoCast Build, Open Source

Designed by Victoria Crockett. Released under Operation ProleBlitz.

A tiny house on wheels built from small interlocking 3D printed blocks, assembled like a kit, and skinned with concrete cloth that hardens into a weather shell. The frame is 100 percent Kumiko blocks. No cutting, no measuring marathons, no special tools for the frame itself. If you can click blocks together and follow a pattern, you can raise this frame. Then you drape it, add water, and let it harden.

This release is the 16 ft towable version, built on a converted used utility trailer. The realistic build cost for the house is about $20,000 to $22,000, which is where the name comes from. The cheap path lands around $14,000 to $16,000.

---

## 1. Honest status, read this first

**This is a design concept and a research plan. It is not a code-approved building system.**

- Structural engineering review, material testing, and your local regulations are required before building one of these for real. The poster's own warning says the same thing, and it stays at the top here on purpose.
- The Kumiko frame has **not been load tested yet**. Nobody has stood on a finished arch and published numbers. Treat every strength statement in this document as a design goal, not a measurement.
- The concrete cloth skin is a real, commercially proven material class. The block lattice under it is the experimental part.
- **The one measurement that firms up the whole design: print one complete arch rib of blocks, weigh it, and multiply by the rib count.** That single scale reading settles the filament estimate (currently plus or minus 50 percent), gives the first real shell weight number, and tells you whether the trailer has margin or is already in trouble. It costs one spool and an afternoon. It is the first contribution anyone can make. See section 9.
- Prices in this document were checked November 17, 2026 for the full price audit of the larger 32 ft version. The 16 ft numbers are scaled from that audit and marked EST where they are estimates. Prices move. Check before you buy.

If you build one anyway, you are a tester, not a customer. Build lean, weigh everything, and publish your numbers so the next builder stands on data.

---

## 2. The design

### Dimensions

| | |
|---|---|
| Length | 16 ft |
| Width | 8 ft (road limit is 8 ft 6 in, leave the margin) |
| Height | 8.5 ft at the top of the arch |
| Floor area | 128 sq ft |
| Shape | Full arch cross section, like a covered wagon |

The design scales. Add more blocks and ribs for a longer house, fewer for a shorter one. The 16 ft is the sweet spot for the trailer conversion in section 4. A 32 ft version exists on paper and needs a purpose-built triple axle tiny house trailer, not a converted utility trailer.

### The block system

Seven parts. Every piece is small, repeatable, and printed on a standard 3D printer.

| Block | What it does |
|---|---|
| **Kumiko Cube** (8-way node) | The hub. Beams and panels connect to it from up to eight directions. Every joint in the house is a cube. |
| **Straight Beam** | The repeatable spar. Straight runs of frame, wall framing, floor and roof structure between cubes. |
| **Arc Beam** | The curved, repeatable rib segment. Arc beams chained through cubes make the arch profile. |
| **Lattice Panel** | The flat infill. Floors, walls, and roof fields snap in between beams to close the frame and brace it. |
| **Angle Block** | The 90 degree multi-angle connector. Corners, end wall junctions, and anywhere the arch meets the flat base. |
| **Foot / Cap** | The base and leveler. Feet anchor the frame to the wooden platform and let you level each rib. Caps close open ends. |
| **Lock Clip** | Optional extra hold. Clips lock joints that you want doubly secured, like the ribs that carry the door frame and the AC cutout. |

How they interlock: cubes are the nodes, beams and arc segments are the runs between nodes, lattice panels fill the fields, and the whole lattice works like a space frame. Load spreads through many small members instead of a few big ones, and a damaged member is one printed part you can swap.

Assembly pattern for one wall panel, from the poster: click blocks together, build the pattern, get a complete panel. The full frame is that move repeated.

### The shell layer stack

From outside in, per the poster cross section:

1. **Hardened concrete shell**, about 5 to 15 mm, weatherproof. This is the concrete cloth after curing.
2. **Tarp / cement layer with reinforcement mesh.** The cloth itself: powdered cement fabric with a reinforcement mesh inside it and a waterproof backing. The backing keeps moisture in during the cure, which is what controls how strong the shell sets.
3. **Insulation layer.** Foam, mineral wool, or recycled insulation, fitted inside the shell. See section 3 for the two costed options.
4. **Interior lining.** Plywood, FRP, or paneling over the insulation.
5. **Kumiko block frame.** The interlocking lattice that carries it all.

### Weight estimates

All estimates until the arch rib weigh-in happens.

| Item | Estimate |
|---|---|
| Cured concrete shell (16 ft, depends on cloth thickness) | 900 to 1,800 lb |
| Finished house, loaded, on the trailer | about 6,000 to 7,000 lb |
| Weight per foot of length, finished tiny house on wheels generally | about 450 to 550 lb per ft |

The loaded estimate matters because the converted trailer's legal ceiling is 7,000 lb. See the VIN honesty note in section 4. Build lean.

---

## 3. Materials and tools

Prices are from the November 17, 2026 audit. Quantities are scaled to the 16 ft house and marked EST. Links are the audit's listings.

### The trailer and conversion

| Item | Spec | Price |
|---|---|---|
| Used 16 ft tandem utility trailer | 7,000 lb GVWR, two 3,500 lb axles, about 5,400 lb stock payload. Arkansas listings checked Nov 17, 2026 | $1,995 (Jonesboro) to $3,300 (Fayetteville), new about $3,695 |
| Third axle kit | Complete 5,200 lb brake axle kit with wheels, tires, and hangers (Southwest Wheel class) | about $1,250 in parts, plus welding labor |
| Retractable RV steps | Bolt-on under the door | about $100 to $300 EST |

### Filament for the blocks

The 16 ft lattice needs roughly 60 kg of finished printed plastic, about 75 kg purchased once failed prints and test blocks are counted (EST, plus or minus 50 percent until the rib weigh-in).

| Item | Spec | Price |
|---|---|---|
| ASA, budget | SUNLU ASA 1.75 mm, 1 kg spool | $15.99/kg, about $1,200 for 75 kg |
| ASA, budget alt | Elegoo ASA 1.75 mm, 1 kg | $16.99/kg |
| ASA, premium | Polymaker ASA 1.75 mm, 1 kg | $26.99/kg, about $2,025 for 75 kg |
| ASA, premium alt | Prusament ASA 1.75 mm | $36/kg |

Smart swaps from the audit:

- **Hybrid filament plan.** Premium Polymaker for the main structural ribs and outer blocks, budget SUNLU for inner infill blocks. The audit priced this middle line as the smart buy on the big build, and it scales down the same way.
- **Recycled filament (Project Free Bin).** A DIY shredder and extruder turns your own failed prints and looted scrap plastic back into filament for about $170 to $220 in parts, against $9,999 for the one commercial all-in-one. The recycled route prices the whole 60 kg lattice at roughly $300 to $350 all in (recycler build, electricity, and virgin pellets for blending). Rules: virgin ASA for the main structural ribs, recycled blends for everything else, and blend recycled chips with 30 to 50 percent virgin material for strength on anything structural. Full build sheet lives in the Project Free Bin release.

### Concrete cloth, about 225 sq ft with overlap (EST)

| Item | Spec | Price |
|---|---|---|
| Generic GCCM (cheap pick) | Cement blanket / concrete fabric roll, 8 to 10 mm, import suppliers | Lands about $400 to $450 EST at this size |
| Genuine Concrete Canvas (realistic pick) | CC8 (CCT2), 8 mm GCCM, ASTM D8364 tested, sole-source US channel | $6.10/sq ft, about $1,375, plus freight |

The honest trade: genuine Concrete Canvas publishes strength data. Generic blankets publish almost none, and this cloth is the weather skin of the house. Cheap takes the gamble knowingly. Realistic does not.

### Insulation, about 325 sq ft of shell and floor surface (EST)

| Item | Spec | Price |
|---|---|---|
| Foam board (cheap pick) | Rigid foam board, 2 in, faced, cut and cobble install | about $450 EST |
| Spray foam kit (realistic pick) | Vega Bond V600 closed-cell, 600 board ft per kit, R-7 per inch. One kit covers this shell at roughly 1.85 in | $879.99 per kit |

On an arch, fit is the argument. Spray foam glues itself to the lattice and seals every seam. Board leaves gaps you chase with cans of foam, and it fits worst exactly where the curve is tightest.

### Door and windows

The original poster design has no windows, just the frosted glass double door. The towable version adds small windows. Your call, priced both ways.

| Item | Spec | Price |
|---|---|---|
| Frosted double door (cheap pick) | ARK DESIGN 60 in x 80 in, 1-lite frosted glass, unfinished pine, assembly required, Home Depot | $638 |
| Frosted double door (realistic pick) | ARK DESIGN 60 in x 96 in, 3-lite frosted tempered glass, prehung, Home Depot | $937.99 |
| Windows (cheap pick) | TAFCO 24 in x 29 in vinyl shed picture window | $99 each |
| Windows (realistic pick) | ARK DESIGN 24 in x 36 in vinyl single-hung, Low-E double glazed | $234.31 each |

Honest flag from the audit: most frosted French doors at this price are sold as interior doors. Confirm exterior rating, threshold, and weatherstripping before buying, or budget a storm door or awning over the entry.

### Solar skin, about 150 sq ft usable on the 16 ft arch (EST), roughly 2 kW

| Item | Spec | Price |
|---|---|---|
| Flexible panel (cheap pick) | Renogy 100W flexible monocrystalline, adhesive mount, 6.84 sq ft each. 20 panels = 2.0 kW | $112.52 each, about $2,250 |
| Peel-and-stick CIGS (realistic pick) | BougeRV Yuma 200W CIGS thin film, tape version, 14.8 sq ft each. 10 panels = 2.0 kW | $409.99 each, about $4,100 |

Per-watt honesty from the audit: Renogy flexible runs about $1.13 per watt at the discount seller, CIGS tape about $2.05 per watt. What the extra money buys: true peel-and-stick mounting, CIGS shade tolerance (on a curved arch some cells are always off angle), and no glass to crack at road speed. The Renogy panels are adhesive mount, not factory peel-and-stick, so budget the adhesive in the misc line.

### Batteries, inverter, electrical

| Item | Spec | Price |
|---|---|---|
| Battery (cheap pick) | ECO-WORTHY Cubix100, 48V 100Ah, 5.12 kWh, server rack LiFePO4 | $890 each |
| Battery (realistic pick) | EG4 LifePower4 V2, 48V 100Ah, 5.12 kWh, 10-year warranty | $1,470.99 each |
| Inverter (cheap pick) | Growatt SPF 5000ES, 5 kW 48V hybrid, MPPT built in | $500 |
| Inverter (realistic pick) | EG4 6000XP, 6 kW split phase all-in-one, MPPT and charger built in, closed-loop comms with EG4 batteries | $1,499.99 |
| Electrical balance of system | PV wire, combiners, breakers, cables, busbar, load panel, grounding | $550 cheap / $900 realistic EST |

Start with one battery (5.12 kWh) and add the second when the budget or the loads say so. Both inverters carry the charge controller inside, so there is no separate controller line.

### Water

| Item | Spec | Price |
|---|---|---|
| Tank (cheap pick) | Used food-grade IBC tote, 275 gal, potable-water-only history | $160 |
| Tank (realistic pick) | Norwesco 300 gal vertical tank, UV rated | $868 |
| First-flush diverter | DIY PVC cheap, commercial kit realistic | $50 / $150 EST |
| Pump | 12V demand pump cheap, 115V jet plus pressure tank realistic | $130 / $350 EST |
| Filtration | 5-micron sediment plus carbon block, whole-house housings | $150 / $200 EST |
| UV purification | iSpring UV cheap, Viqua VH200 realistic | $338.99 / $490.38 |

Honest note from the audit: 250 to 300 gallons is a nomad-sized buffer, about two weeks at a careful 15 to 25 gallons a day. A second used IBC tote at $160 is the cheapest capacity upgrade that exists.

### Toilet

| Item | Spec | Price |
|---|---|---|
| Nature's Head composting toilet | Self-contained, urine diverting, 12V fan | $965 |

No cheap swap exists here, on purpose. Arkansas law (Act 402 of 1977) allows certified manufactured composting units only and prohibits DIY composting systems. The $965 is the floor in both scenarios. Other states differ. Check yours.

### Air conditioning

Rooftop RV units fit a standard 14 in x 14 in cutout, framed into the lattice before skinning (section 4).

| Item | Price |
|---|---|
| GE 13,500 BTU heat pump rooftop unit | $842.50 |
| Dometic FreshJet 3 | $999.99 |
| Fogatti rooftop unit | $1,021.49 |

### Interior

| Item | Price |
|---|---|
| IKEA LYCKSELE chair bed, new | about $400 |
| IKEA LYCKSELE chair bed, used | $100 to $175 |
| Bucket of paint | grocery money |
| Desk | $0, bring a folding table you already own |
| Kitchenette (counter, sink, induction burner, compact fridge) | $800 cheap / $1,200 realistic EST |
| Misc consumables (skim coat material, plywood subfloor, interior paneling, framing lumber, fasteners, sealants, PEX and fittings) | $1,100 cheap / $1,400 realistic EST |

The LYCKSELE is the furniture plan: a chair by day that folds out to a bed at night, one footprint doing both jobs. Honest caveat: its bed is about 31.5 in wide, narrower than a true twin. A custom steel sleeper chair is the later upgrade path, priced at $1,200 to $2,200 in earlier research, with a steel frame, a fold-out mechanism with real support legs at both ends, through-bolts and lock nuts (road vibration works screws loose), and an adult weight rating with margin.

### Tools

The frame itself needs no special tools, that is the point of the design. The build as a whole needs:

- A 3D printer with an enclosure (ASA warps in open air and needs the heat kept in), plus basic printer tools
- A welder, or a welder you hire, for the axle work. This is the one job in the build that is not DIY-optional
- Drill, driver, sockets, and wrenches for the trailer and interior work
- A jigsaw or snips for cutting thick scrap plastic down to shredder size, if you run the Free Bin recycler
- Ladders or a scaffold plank for draping cloth over the arch
- A bathroom or platform scale. For the rib weigh-in. Non-negotiable
- Safety basics: gloves, eye protection, a respirator for cement dust and spray foam day, and ventilation for printing ASA (styrene fumes)

---

## 4. The build, step by step

Build order matters. Printing is the long pole, so it starts first and runs in the background of everything else.

### Step 0. Print the blocks

Print continuously from day one. Roughly 75 kg of filament on one printer is weeks of near-continuous print time (the audit clocks 150 kg at 6 to 10 weeks on the big build, so plan on about half that here, EST). Every other step waits on piles of blocks, so keep the printer fed.

Guidance, at the level the testing so far supports:

- **Material split.** Virgin ASA for the main arch ribs and outer structural blocks. Recycled blend for lattice panels, interior blocks, and non-structural parts. When recycled material goes anywhere structural, blend it with 30 to 50 percent virgin pellets or filament. Each re-melt weakens plastic, and sorting matters: PLA with PLA, PETG with PETG, ASA with ASA.
- **Dry filament is not optional.** Wet filament prints weak and bubbly, and wet recycled chips are worse. Dry your spools and your chips.
- **Ventilate.** ASA and ABS give off styrene fumes. Print in a ventilated space, and run the recycler extruder ventilated too.
- **Tolerance honesty.** DIY recycled filament runs about plus or minus 0.07 to 0.1 mm in diameter. That is fine for Kumiko blocks and brackets. It is not fine for precision gears, and this build has none.
- **Stockpile ahead.** Blocks store flat and stack. You can print and store the whole lattice before you own a trailer or a truck. Print one full arch rib first, weigh it, and write the number down. That is the measurement from section 1, and it calibrates every quantity in this document.
- **Rainbow is fine.** Mixed-color recycled output is a feature of this build, not a defect. The skeleton lives under the concrete skin once the house is skinned, so UV exposure on recycled blocks is limited. Color sort only if you want to.

### Step 1. Convert the trailer

1. **Inspect before money moves.** Frame rust, bent rails, tire age, bearing play, brake condition. A used trailer's fatigue history hides under a finished house and is nearly unfixable later, so this inspection is the cheapest insurance in the whole build. Replace tires, bearings, and brakes before anything sits on the deck if there is any doubt.
2. **Add the third axle.** The complete 5,200 lb brake axle kit runs about $1,250 in parts. A welder does this job. The axle group must be repositioned as a group so the loaded house keeps **10 to 15 percent of its weight on the tongue**. Wheels cannot simply be bolted on at the front.
3. **The VIN honesty note.** Adding an axle does not change the VIN plate. The trailer's legal GVWR stays **7,000 lb** no matter how many axles it has. The third axle buys physical margin and road manners, but the true limits are the light utility frame, the tongue, and the coupler. That is why this conversion works for the lean 16 ft house and does not work for the 32 ft. Stay under the plate number.
4. **Fit the retractable steps** under where the door will land, about $100 to $300.

### Step 2. Build the wooden base

Per poster step 1: assemble a simple wooden platform on the trailer deck. Pre-cut lumber or a kit, framed joists, plywood subfloor on top. The platform spreads the house load across the trailer frame, gives the block feet something to anchor to, and becomes the floor structure. Feet and caps from the block set anchor and level the frame on it.

### Step 3. Build the arches

Per poster step 2: assemble arch ribs on the ground from arc beams, straight beams, and cubes, then raise them onto the base and set them on their feet. Level each rib with the foot levelers. Space ribs evenly down the 16 ft. Clip the joints on ribs that will carry extra load, the door end and the AC rib.

### Step 4. Fill the frame

Per poster step 3: snap lattice panels in everywhere, walls, roof fields, and ends, until the frame is a closed lattice tube. This is where the space frame gets its stiffness, so skip no fields. Leave two openings framed, not filled:

- **The door opening**, in one end wall, sized for the frosted double door frame.
- **The AC cutout**, a standard 14 in x 14 in opening framed into the lattice at the roof, before any cloth goes on. Retrofitting this hole after the shell cures means cutting cured concrete. Frame it now.

Frame window openings the same way if you are adding windows.

### Step 5. Drape and add water

Per poster step 4: drape the concrete cloth over the whole lattice, overlapping seams per the cloth maker's instructions, and wet it evenly. The waterproof backing keeps the moisture in and controls the cure.

### Step 6. Let it harden

Per poster step 5: the shell reaches high strength in **24 to 48 hours** of curing. Then give it the patience the audit's build order uses anyway: a full week of cure before you load it, stick panels on it, or stand on it. Then fit the door, windows, and finishing touches. Keep the shell damp during early cure if the cloth maker calls for it, and keep rain from hammering a fresh drape.

### Step 7. Skin the solar arch

1. **Skim-coat the cured arch smooth first.** Flexible panels stick to a smooth surface. On raw textured concrete they peel. This step is the difference between a solar skin and a solar kite.
2. Stick the flexible panels over the arch, about 150 sq ft usable on the 16 ft, roughly 2 kW. Half the arch always faces away from the sun, so total nameplate watts overstate what you harvest. Wire panels per the inverter maker's layout.
3. **Park long side south.** Orientation is free energy. Every parking decision for the life of the house starts with which way the arch faces.

### Step 8. Insulate and line the interior

Spray foam or foam board inside the shell (section 3), then interior lining over it. Run wiring and PEX while the walls are open. Fit the kitchenette, the toilet, and the battery and inverter corner. Leave the power gear accessible, because the person servicing it at 2 AM is you.

### Step 9. Epoxy the floor

The floor call is settled: **epoxy straight over the plywood subfloor.** Cheap, light, waterproof, and tolerant of trailer flex, which is why it beats microcement overlays that crack when the trailer twists. Stencils and color are welcome. This is the one surface every visitor sees, so have fun with it.

### Step 10. Fit out and weigh

LYCKSELE in, folding table in, gear stowed. Then the step nobody wants and everybody needs: **take the finished house to a scale and weigh it.** Tongue weight too. Write both numbers in the build log. If you are over the 7,000 lb plate, the fix is removing weight, not hoping.

---

## 5. Systems

### Power

The audit's stack, scaled to the 16 ft:

- About **2 kW** of flexible solar on the arch (section 3)
- **5.12 kWh** of LiFePO4 to start (one rack battery), 10.24 kWh with the second
- A **5 to 6 kW hybrid inverter** with the MPPT charge controller built in
- Off-grid capable, with battery storage sized for the house plus, in Victoria's build, a small server rack in the corner, because the house doubles as a writing cabin and an off-grid backup server home

Power is the deciding cost of this whole design family. In the audit of the big build it was 31 percent of the total. Every dollar decision in section 3 matters less than the panel and battery choices.

### Water

Rainwater harvesting off the arch is legal in Arkansas. Potable use is the regulated step, so the treatment train matters: first-flush diverter, sediment and carbon filtration, and UV purification before drinking water duty. Tankage is 275 to 300 gallons, about two weeks of careful use. Refill from any clean source when the rotation allows. Check your own state's rules, they vary.

### Toilet

Nature's Head composting toilet, $965, urine diverting, 12V fan. Arkansas allows certified manufactured composting units only (Act 402 of 1977) and prohibits DIY composting systems. A manufactured unit is also what keeps a tiny house legal-adjacent in most other jurisdictions. Do not improvise this system.

### Heating and cooling, honestly

- **Cooling is the big electrical draw.** The rooftop AC will run happily on shore power or a generator. On battery, plan on **evening cooling to take the edge off, not all-night August air conditioning**. The arch's insulation and the small volume help, but physics collects its bill. Size your expectations before you size your battery bank.
- The GE unit in section 3 is a heat pump, so it heats as well as cools when power is plentiful.
- **Open item:** a dedicated off-grid winter heat source is not settled in the design documents yet. Insulation plus the heat pump covers the mild-weather nomad rotation. Deep winter off-grid heat is an open question in section 9, not a solved feature. Do not let anyone sell you this design as four-season off-grid ready until that is answered with testing.

---

## 6. Towing and law notes

Arkansas figures, checked November 17, 2026. **Check your own state**, these numbers are Arkansas's.

| Rule | Arkansas |
|---|---|
| Max trailer length | 43 ft 6 in |
| Max combination length (truck plus trailer) | 65 ft |
| Max width | 8 ft 6 in |
| Max height | 13 ft 6 in (design target, stay under it) |
| Trailer brakes required | 3,000 lb and up |
| House trailer speed cap | 45 mph |

At 16 ft and roughly 6,000 to 7,000 lb loaded, a **half-ton truck (F-150 class) with a tow package and a brake controller** is enough truck. No 3/4-ton needed at this size. Keep tongue weight at 10 to 15 percent, weigh the rig loaded, and remember the 45 mph cap when you plan travel days. The house is a slow traveler by law, and the build plans around that instead of pretending otherwise.

Where you may park and live in it is a separate legal layer (zoning, land use, stay limits) that changes by county and by land manager. The nomad rotation plan runs on free stays with 14-day clocks on public land. None of that is legal advice. It is a pointer at the homework.

---

## 7. Maintenance, repair, and expansion

The modular promise is the maintenance plan:

- **Repair a section, not the house.** A damaged lattice field unbuilds block by block. Replace the broken blocks, snap the panel back in, patch the cloth skin over the repair. Compare that with stick-built rot or a cracked fiberglass shell.
- **The shell patches like concrete**, because it is concrete. Small cracks and chips take standard concrete patch. A larger skin repair is a new piece of cloth draped and cured over the damaged area.
- **Expand by adding length.** More ribs, more panels, more cloth. The block system does not care where the original end was. The trailer underneath is the real limit on this promise, so expansion past the deck means a bigger trailer, planned honestly.
- **Print spares.** A shelf of spare cubes, beams, and clips costs a spool and shelf space. Print them while the printer is warm during the main build.
- **Panels age.** Flexible solar panels have a shorter real-world service life than rigid glass panels, and the audit flags the budget flexible line for exactly that. Budget eventual panel replacement as maintenance, and keep the skim coat smooth so the next set sticks.
- **Running gear is ordinary trailer maintenance.** Bearings, brakes, tires, coupler. The third axle means one more set of each. Grease and inspect on a schedule, because the house cannot be separated from its trailer for a cheap fix later.

---

## 8. What it costs

### The house ledger, 16 ft conversion build

Line items are the audit's November 17, 2026 prices at 16 ft quantities. Items marked EST are scaled estimates, not fresh quotes. Full menu with sellers and links is in section 3.

| Line | Cheap | Realistic |
|---|---|---|
| Used 16 ft utility trailer | $1,995 | $3,300 |
| Third axle kit plus welding labor | $1,550 EST | $1,850 EST |
| Filament, about 75 kg | $1,200 (budget ASA) | $1,600 EST (hybrid premium and budget) |
| Concrete cloth, about 225 sq ft | $450 EST (generic) | $1,575 EST (genuine CC8 plus freight) |
| Insulation | $450 EST (foam board) | $880 (spray foam kit) |
| Door | $638 | $938 |
| Windows | $198 (two, cheap) | $468 (two, realistic) |
| Solar skin, about 2 kW | $2,250 (Renogy) | $3,280 EST (CIGS, 1.6 kW) |
| Battery | $890 (one ECO-WORTHY) | $1,471 (one EG4) |
| Inverter | $500 (Growatt) | $1,500 (EG4 6000XP) |
| Electrical balance of system | $550 | $900 |
| Water system | $700 EST | $1,200 EST |
| Nature's Head toilet | $965 | $965 |
| Rooftop AC | $843 (GE) | $1,000 (Dometic) |
| Retractable steps | $150 EST | $250 EST |
| Kitchenette | $800 EST | $1,200 EST |
| Misc consumables | $1,100 EST | $1,400 EST |
| IKEA LYCKSELE chair bed | $150 (used) | $400 (new) |
| **House total** | **about $15,400** | **about $21,800** |

Those totals land inside the audit's scaled estimate bands for this build: **$14,000 to $16,000 cheap, $20,000 to $22,000 realistic.** The recycled filament route (section 3) cuts the filament line to roughly $300 to $350 all in, which is most of how the cheap build reaches the bottom of its band.

### The whole project

Victoria's final budget, her numbers:

- **House plus truck: $36,000** (a used half-ton at $10,000 to $20,000 does the towing at this size)
- IKEA LYCKSELE: about $400, already in the ledger above
- A bucket of paint
- **Call the project $40,000**
- **Full estimate $40,000 to $50,000**, with the top $10,000 as deliberate cushion for unexpected costs. The cushion is held on purpose. It is not planned spending.

### Where deal-watching cuts land

A daily deal watch already runs on this project (trailers, chairs, materials, shredders, moving sales). The floor estimate with patient watching, labeled an estimate: **$28,000 to $32,000 for the whole project, about $25,000 if lucky.** The cuts, in order of size:

- **Truck first.** A watched $15,000 mid-market truck lands at $11,000 to $12,000.
- **Power stack second.** The $6,000 stack lands at $4,500 to $5,000 on sales.
- **Trailer.** $2,500 asking lands at $1,200 to $1,800, cheapest in the November to February off season.
- **Chair.** $400 new lands at $100 to $150 used.
- **Materials.** Another $500 to $1,000 across the small lines.
- **Free Bin filament.** The recycler knocks roughly $1,000 to $1,400 off the lattice against virgin filament, and the savings grow if the lattice weighs in heavier than estimated.

Babysitting buys timing, not magic. Some deals cost more in gas and hassle than they save. The watch reports, Victoria decides, nobody buys on autopilot.

---

## 9. License, invitation, and open questions

### License

- **Designs and code: GPL-3.0-or-later.**
- **Writings and documentation, including this file: CC BY-SA 4.0.**
- Same copyleft as the rest of Operation ProleBlitz. Build it, improve it, share your version under the same terms.

### An invitation

This design is published so that other people can make it real, make it better, or prove it wrong in public. All three help.

**The first contribution anyone can make: print one complete arch rib and weigh it.** Post the number, the filament you used, and your print settings. That single measurement firms up the filament estimate, the shell weight, and the trailer margin all at once. It is worth more than a hundred comments.

Also wanted:

- **Builders** who raise a frame and publish a build log with weights at every stage
- **Engineers** willing to load test a rib, a panel, and a full arch, and publish the failures as proudly as the passes
- **Testers** who cure shell samples from generic cloth next to genuine Concrete Canvas and measure both
- **Printers** who tune the block tolerances for recycled filament and share the profiles

### Open questions, stated plainly

These are not hidden. They are the work:

1. What does one arch rib actually weigh? (The measurement, still unmade.)
2. How much load does a cured arch carry, and where does it fail first? No load test exists yet.
3. How does generic concrete cloth compare with genuine CC8 in cured strength on this lattice? Unmeasured.
4. What is the settled off-grid winter heat answer? Open. See section 5.
5. How do recycled-blend blocks age outdoors under the skin over five and ten years? Unknown until someone builds and waits.
6. Exact block counts per rib and per house follow from question 1. Until then, quantities in this document are estimates with wide error bars, labeled as such.

---

*Operation 20k Tiny House is part of Operation ProleBlitz: free, open source tools and designs for the people who pay the poverty premium. The poor pay more for housing than anyone. This is one attempt at a house they can print, assemble, repair, and own outright. Take it, test it, and tell us what the scale says.*
