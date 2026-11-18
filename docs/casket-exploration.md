# 3D Printed Caskets From Alternative Materials: An Exploration

Operation ProleBlitz and Project Free Bin, research draft, November 17, 2026. Draft only, nothing published. All prices checked November 2026 unless noted. Estimates are labeled as estimates.

## 1. The market wound

Death is the last purchase a family makes under grief, time pressure, and total information darkness, and the pricing shows it.

The headline numbers, from the National Funeral Directors Association 2023 General Price List Study, the industry's own survey of funeral home price lists:

| Item | Median price |
|---|---|
| Funeral with viewing and burial | $8,300 |
| Same funeral, with burial vault added | $9,995 |
| Funeral with viewing and cremation | $6,280 |
| Metal burial casket alone | $2,500 |
| Burial vault alone | $1,695 |

Those figures leave out the cemetery plot, grave opening and closing, and a headstone, which add thousands more. The casket is the single most flexible line on the bill, and it is where the squeeze lives.

The markup is the wound. Titan Casket's CEO, a 25 year veteran of casket manufacturing, puts the manufacturer and funeral home markup at 200 to 400 percent over wholesale, and multiple consumer sources repeat the same range. His comparison example: an 18 gauge gasketed steel casket with a crepe interior priced at $3,786 at a New Jersey funeral home sells for $1,798 from Titan with the same specs. Titan's metal caskets start at $999 with free shipping, and its average sale is about $1,400 against a funeral home average over $3,000. Costco, Walmart, and Amazon sell caskets too. The product is not rare. The showroom is what costs money.

Social Security's lump sum death benefit, for scale, is $255. It has barely moved since the 1950s.

### The rights families already have and mostly do not know about

The FTC Funeral Rule (16 CFR Part 453, in force since 1984) gives every family these rights:

- An itemized General Price List before any discussion of arrangements, with prices you can take home and compare.
- Buy only the goods and services you want. No forced packages. The one charge you generally cannot decline is the basic services fee.
- Buy a casket anywhere, online, from a discount seller, from a local maker, or build one yourself, and the funeral home must accept it.
- No handling fee. A funeral home cannot charge any fee, under any name, for using a casket bought elsewhere, and cannot require you to be present at delivery. Violations carry penalties over $50,000 per occurrence.
- No state or local law requires a casket for cremation. A funeral home offering cremation must tell you alternative containers exist and make them available. Those containers run $50 to $300, with an NFDA median of $160.
- No state law requires a casket for burial in most states either, and embalming is almost never legally required. A funeral home that claims otherwise is breaking the rule.
- The burial vault is the classic upsell dressed as law. Vault requirements come from cemetery rules, not statutes. The Funeral Rule does not cover cemeteries at all, so the vault fight happens at the cemetery gate, not the funeral home desk.

In plain terms, federal law already lets a family show up with a homemade casket. The barrier is not permission. The barrier is that almost nobody can make or buy a dignified one cheaply, fast, at the worst moment of their lives.

Sources: NFDA 2023 figures at https://policyreviewcenter.com/funeral-resources/funeral-cost/ and Funeral Rule rights at https://funeralcostanalyzer.com/ftc-funeral-rule-guide.html and https://legalclarity.org/can-i-buy-my-own-casket-for-funeral-arrangements/

## 2. Existing alternatives, and what they actually cost

| Option | Typical price | Notes |
|---|---|---|
| Cardboard cremation container | $50 to $150 | The legal floor. Rigid, combustible, required to be offered for cremation. |
| Cardboard or fiberboard casket, finished | $100 to $500 | Decoratable, works for cremation and green burial. Reads as plain, which is the dignity problem, not a strength problem. |
| Cloth covered fiberboard at a funeral home | $500 to $1,500 | The same class of product as the row above, at funeral home markup. This gap is the whole story in miniature. |
| Bamboo casket | $400 to $2,500 | Biodegradable, burns clean, looks intentional. |
| Wicker or willow casket | $500 to $2,700 | Handwoven, the standard at natural burial grounds, genuinely beautiful. Labor is the cost. |
| Rental casket for viewing before cremation | $500 to $1,500 | A real wood or metal shell with a removable interior insert. The insert is what gets cremated. Price must appear on the General Price List. |
| Loop Living Cocoon, mycelium, via US sellers | $3,995 | Grown in about 7 days from mycelium and hemp fiber, biodegrades in about 45 days in soil, weighs about 66 lb, rated to 440 lb. In Europe it sells closer to $1,000 to $1,500 equivalent. The US price is a distribution price, not a materials price. |
| Setas Eternal Living mycelium coffin, US grown | $2,495 | Plus freight. Proof a domestic grower exists. |
| Simple pine box, direct seller | about $995 and up | The honest traditional floor for a real burial casket bought direct. |

Read of the table: the cheap end exists, but it splits into two failures. Cardboard is affordable and looks like a compromise at the graveside. The beautiful alternatives, willow and mycelium, cost as much as the funeral home's mid range steel. Nobody is selling durable, dignified, and cheap in the same box. That empty square is the opening.

Sources: https://www.localcremationguide.com/blog/cremation-caskets-guide and https://getcostprice.com/family-life/funeral-end-of-life/casket-cost/ and https://funeral.com/blogs/the-journal/mushroom-coffins-explained-the-loop-living-cocoon-and-other-mycelium-casket-options-in-the-u-s

## 3. The 3D printing path

### The size problem, stated honestly

A standard casket is about 84 inches long, 28 to 30 inches wide, and 23 inches tall on the outside. That is 2,134 mm of length, and it decides everything about the machine.

| Printer | Build volume | Price | Fits a casket how |
|---|---|---|---|
| Peopoly Giga 800, pellet | 800 x 800 x 800 mm | $15,000 | In sections only, tub in 3 pieces, lid in 3 |
| Dowell DP-A12 class, pellet | about 1,200 mm cube | about $12,000 | In sections, tub in 2, lid in 2 |
| Kings FGF1800, pellet | 1,800 x 1,200 x 1,100 mm | $122,500 | Still too short for one piece |
| Modix MAMA-1700, pellet | 1,700 x 1,000 x 1,000 mm | $50,000 to $56,000 | Still too short for one piece |
| Modix MAMA XL-3000, pellet | 3,000 x 1,000 x 1,000 mm | quote only, well above the MAMA-1700 | One piece, tub and lid as separate prints |

So the realistic path is sectioned printing on a $12,000 to $15,000 class machine, with the sections joined by plastic welding, solvent bonding, or mechanical joints, which is standard practice in large format printing. The lid is a separate print either way, and a two piece tub with a welded center seam is normal in this industry, not a hack. One piece printing is a $70,000 plus machine and buys nothing structural.

### The print itself, estimates

A printed shell is not a solid block. The working design is a ribbed thin wall tub and lid, printed with a large nozzle at thick layers, the same approach used for printed furniture and boat hulls.

- Material weight, estimate: 40 to 55 kg of polymer per casket, depending on wall design. Furniture scale prints of similar surface area land in this range.
- Print time, estimate: pellet machines in this class average 1.15 to 1.4 kg per hour in logged real prints, with peaks near 3 kg per hour. Call it 30 to 45 machine hours per casket, roughly 1.5 to 2 days of printing per machine.
- Energy, estimate: 60 to 150 kWh per print depending on machine and heated chamber, about $10 to $25 at Arkansas residential rates.
- Feedstock prices: virgin and recycled pellets run $2 to $8 per kg, against $20 to $80 per kg for the same plastic as filament. Bulk unfilled PETG pellets go as low as $1.50 to $2.50 per kg in quantity. Pellet printing is the only version of this idea where the material math works at all.

### Materials, ranked for this job

- Recycled PET or PETG regrind. Cheap, strong, waterproof, prints well on pellet machines, and recycled PETG grades are already sold for exactly this class of printer. The durability pick.
- Recycled HDPE. The toughest and cheapest stream, and the hardest to print because it warps and bonds poorly between layers. Doable with the right machine settings and a heated chamber, risky as a first material.
- Wood filled composite pellets. PETG or PLA carrying wood fiber. Sands, stains, and finishes like wood, which solves the dignity problem better than any other option. The graveside pick.
- Hemp filled composites. Available as specialty pellets, good story, higher price, less field history at this scale. A later experiment, not the launch material.
- PLA blends. Easiest to print, plant based, and the only printed option that belongs anywhere near a cremation or green burial conversation. Weaker and more brittle at casket scale, and it softens in a hot truck. Burial in a vault, fine. A first prototype material, not the durable product.

### Where Project Free Bin changes the math

A pellet extruder eats regrind directly. The Kings machines list accepted pellet size at 1 to 5 mm, which is shredded flake size. That means the home recycler does not need its filament step at all for this product. Shredded bottles and collected scrap go through the shredder, get washed and dried, and feed the big printer as flake, ideally blended with a share of virgin or bought recycled pellets for consistent strength.

Effective feedstock cost on that route is collection, washing, drying energy, and shredder wear, roughly $0.50 to $1.50 per kg in honest accounting, against $2 to $8 per kg bought. On a 45 kg casket, that is the difference between about $45 of material and about $225. It does not make the casket free. It makes the material line small enough that finish and lining become the deciding costs, and those are the lines that buy dignity.

### Durability and dignity, the two tests that matter

Durability: a ribbed PETG or HDPE shell is waterproof, rot proof, and stronger in impact than the 20 gauge steel and pressed wood boxes it competes with. It will outlast the burial vault conversation entirely. Honest tradeoff: it does not biodegrade, so it has no place in a green burial ground, and the honest pitch is recycled content and price, not earth friendliness. For cremation, plastic shells are the wrong product, since crematories need a rigid combustible container and many will not accept plastic. The cremation product is the cardboard and wood composite end of the line, not this one.

Load: the benchmark already exists in public. The Loop Cocoon, a grown foam, is rated to carry 440 lb. A ribbed printed shell should clear standard body weights with margin, but should is not a rating. The prototype has to be load tested with sandbags to failure before anyone is carried in one, and the rating gets printed on the box.

Dignity: raw large format prints show layer lines and look like a prototype, and a family at a graveside will read that in one second. The finish is therefore not cosmetic, it is the product. Three finish routes, cheapest first: fabric wrap over the shell, filler primer and paint in funeral home colors, or wood filled material sanded and stained to read as a wooden casket. Handles can be printed, rope, or bought swing bar hardware. The interior is a bought or sewn lining kit, pillow, and blanket, the same components the industry uses.

## 4. Legal and practical gates

### Who may sell a casket

Nationally, the trend favors the maker. In Craigmiles v. Giles (6th Circuit, 2002), a federal appeals court struck down Tennessee's law requiring a funeral director license to sell caskets, holding that protecting funeral homes from competition is not a legitimate state interest. The Fifth Circuit reached the same result for Louisiana's law in the monks of St. Joseph Abbey case in 2013. The Tenth Circuit went the other way in Powers v. Harris, so the law is split by region.

Arkansas sits in the Eighth Circuit, which has not ruled on a casket sales law. What Arkansas has on its own books needs care:

- Board rule 17 CAR 30-104 requires a license for anyone holding out as being in the business of the care and disposition of the human dead, and it says an establishment offering online sales of funeral or final disposition services in Arkansas must be licensed and have a physical location in the state. Selling a casket as merchandise, with no services and no handling of the dead, is arguably outside that language, and Titan and Costco already ship caskets into Arkansas as merchandise retailers. But the rule is broad enough that an Arkansas based maker selling online should expect a fight or at least a letter, and should get a written opinion from the Board or an attorney before selling, not after.
- Prepaid sales are a separate trap. Ark. Code 23-40-109 requires a permit from the Insurance Commissioner to sell prepaid funeral merchandise, including caskets, for future delivery. Selling a casket for immediate delivery is ordinary retail. Selling one today for a funeral years away is a regulated prepaid contract. The launch model is at need and pre need for immediate delivery only, no prepaid contracts, until a permit is sorted.
- One gift in the Arkansas rules: the Board's own definition of a casket covers a rigid container made of wood, metal, or manufactured materials such as plastic, fiberglass, chipboard, pressed paper, paperboard, or corrugated paper. A printed plastic casket fits the state's own definition word for word.

### Cemetery acceptance, the real gate

The Funeral Rule does not bind cemeteries. A cemetery can require a vault, and most conventional cemeteries do, and it can set standards for the containers it accepts. In practice, conventional cemeteries accept standard caskets from any source because the vault does the structural work, so a printed casket that matches standard outside dimensions and passes a basic soundness look should pass. Green and natural burial grounds are the reverse: they require biodegradable containers, so the recycled plastic casket is out and the wood composite or cardboard line is in. Cemetery acceptance, confirmed cemetery by cemetery in writing, is a sales prerequisite, not a detail.

### Cremation container rules

Arkansas cremations happen only at a licensed crematory. The container must be rigid and combustible, and the family cannot be required to buy a casket for cremation. A printed PET or HDPE casket is not a cremation product in practice, whatever its legal status, because retort operators control what goes in their machines. The printed line is a burial product. Full stop.

### Home burial in Arkansas, basics

Arkansas is comparatively open. Families may direct their own funerals without hiring a funeral director, private land burial is not banned by state law, and the reported basics are a filed death certificate, a burial transit permit, and attention to county rules, which vary and can include setbacks from water and recording the grave location. One reported state rule puts the top of the burial container at no less than 18 inches below the surface. Sources disagree on whether a licensed funeral director must sign the death certificate paperwork, so that specific point needs confirmation from the Arkansas Department of Health before any guide is published. A printed casket plus family land is the lowest total cost burial path in the state, which is exactly why the paperwork has to be right.

Sources: Arkansas rule at https://codeofarrules.arkansas.gov/Rules/Rule?levelType=section&titleID=17&chapterID=92&subChapterID=117&partID=1043&subPartID=5679&sectionID=36858 and prepaid statute at https://codes.findlaw.com/ar/title-23-public-utilities-and-regulated-industries/ar-code-sect-23-40-109/ and Craigmiles summary at https://www.mackinac.org/21516 and Arkansas home funeral basics at https://www.homefuneralpath.com/articles/equipment/home-funeral-board-arkansas

## 5. Price audit, per casket

Deciding cost named first: on the printed casket, the deciding cost is not the plastic. It is the finish and lining package, the lines that decide whether the box reads as dignified at a graveside, followed by material weight. On the funeral home side, the deciding cost is the showroom markup itself, 200 to 400 percent over wholesale.

The comparison product is a standard metal burial casket: $2,500 at the NFDA median funeral home, $1,798 for the same spec casket from Titan, $999 at Titan's floor.

### Scenario A, Cheap: sectioned print, home recycled feedstock, fabric finish

Assumes a Dowell or Peopoly class pellet printer at $12,000 to $15,000 already in the shop (capital listed separately below, not buried in the per casket price), Free Bin regrind feedstock, volunteer or own labor.

| Line | Cost, estimate |
|---|---|
| Feedstock, 45 kg home regrind blended with bought pellets, effective $1 per kg | $45 |
| Electricity, about 100 kWh | $15 |
| Machine wear and amortization share | $15 |
| Joining, sanding, fabric wrap finish | $35 |
| Lining kit, pillow and blanket, bought basic | $50 |
| Handles, rope or printed | $12 |
| Total per casket | about $172 |

Honest range, $150 to $250 depending on failed prints and finish choices. Hands on labor, 6 to 10 hours, plus 30 to 45 hours of machine time.

### Scenario B, Realistic: bought recycled pellets, painted or wood finish, small co-op labor

Assumes bought recycled PETG or wood filled pellets, a proper painted or stained finish, and part time paid labor at $15 per hour for the finishing work.

| Line | Cost, estimate |
|---|---|
| Feedstock, 45 kg at $5 per kg | $225 |
| Electricity | $20 |
| Machine amortization and maintenance share | $40 |
| Filler primer, paint or stain, sanding supplies | $75 |
| Lining, quality interior kit | $120 |
| Handles and hardware, metal swing bar set | $45 |
| Finishing labor, 8 hours at $15 | $120 |
| Total per casket | about $645 |

Honest range, $550 to $700. A fair retail price on this cost base, with margin for delivery and a warranty against defects, lands near $899 to $999, which is Titan's floor, at a third of the funeral home median, with the money staying in the county.

### Capital, stated plainly

The printer is the real purchase: $12,000 to $15,000 for the sectioned route, plus a shredder and drying setup the Free Bin project already contemplates. At the Realistic scenario's margin, the machine pays for itself in roughly 40 to 60 caskets. At the Cheap scenario run as a mutual aid or church basement operation, the payback question matters less than the per family savings, about $2,300 against the median funeral home casket, every single time.

### The one measurement that firms all of this up

Print one full size tub section set and weigh the finished shell, then load test it to failure. Every number in this audit hangs on the true printed weight in kilograms and the true load rating, and both are knowable from a single prototype run. The second unknown, cheaper to settle, is a one page letter: written cemetery acceptance criteria from the three cemeteries nearest the shop, and a written read from the Arkansas Board on whether merchandise only casket sales by an Arkansas maker need a license. Paper first, then plastic.

## ADDENDUM: SAWDUST AND CONCRETE (Nov 17, 2026)

Victoria's idea, tested against the literature: skip the printer, cast the casket out of sawdust and cement. The material is real, it has a research history going back decades, and it changes the audit in section 5 in one big way. It deletes the printer.

### What sawdust concrete actually is

Sawdust concrete, also called sawdustcrete or woodcrete, is Portland cement using sawdust as some or all of the aggregate, sometimes with sand, sometimes without. Its close commercial cousin is arbolite, the wood chip cement block sold across Russia and Europe since the 1960s under a national standard, GOST 19222-84. Hempcrete is the famous relative, hemp fiber in lime, and it sets the expectation honestly: these plant aggregate concretes are light, insulating, and weak compared to real concrete, and every one of them is sold as non-load-bearing or lightly loaded.

The measured properties, from the studies cited at the end of this addendum:

| Mix, cement to sawdust by volume | Density | Water absorption | Compressive strength |
|---|---|---|---|
| 1:1 | 1,450 kg/m3, about 90 lb per cubic foot | 13% | Mid teens MPa at 28 days |
| 1:2 | 1,280 kg/m3, about 80 lb per cubic foot | 15% | Roughly 8 to 14 MPa, rising with cure |
| 1:3 | 1,065 kg/m3, about 66 lb per cubic foot | 19% | Under 10 MPa |
| Lime woodcrete, sawdust and waste paper | 592 to 711 kg/m3, about 37 to 44 lb per cubic foot | High | 0.3 to 0.9 MPa, block grade only |
| Arbolite, wood chip, structural grade | 500 to 850 kg/m3, about 31 to 53 lb per cubic foot | High, up to 60% in some grades | About 2.5 to 5 MPa |
| Hempcrete, for comparison | 300 to 600 kg/m3 | Very high | Under 1 MPa, non-load-bearing |
| Normal concrete, for comparison | 2,400 kg/m3, 150 lb per cubic foot | 2 to 5% | 20 to 40 MPa |

Three honest reads off that table. First, even the heaviest sawdust mix weighs about 40 percent less than normal concrete, and the light mixes weigh about a third as much, which is the entire appeal. Second, strength falls off a cliff as the sawdust share rises, and the high sawdust mixes are block and panel materials, not beam materials. Third, water absorption is the material's original sin, 13 to 19 percent by weight in the cement mixes against 2 to 5 percent for normal concrete, because sawdust is a sponge that happens to be shaped like aggregate.

For a casket, compressive strength is not the binding constraint anyway. A casket fails in bending, in the bottom panel spanning between the bearers, and at the handle attachments. Sawdust concrete is brittle and weak in bending, so the bottom needs help: welded wire mesh or light rebar cast into the panel, or the shell cast around a simple wood frame. One genuine gift: the material can be sawn, nailed, and screwed like wood, so handles, hinges, and lining attach with ordinary hardware, no inserts or bonding tricks.

### The treatment step, which is not optional

Raw sawdust fights cement. Wood sugars and tannins retard setting, and in bad cases the mix never hardens properly. The fixes are old and cheap:

- Boil or soak the sawdust in lime water. The standard lab recipe boils it for an hour in water carrying hydrated lime, which strips the soluble sugars and tannins. In the Saeed 2013 study this pretreatment raised compressive strength up to 50 percent at moderate sawdust ratios, and a follow up waterproofing coat, cutback asphalt or plain varnish in that study, cut water absorption sharply.
- Mineralize it, the arbolite industry method. Calcium chloride, sodium silicate (liquid glass), or aluminum sulfate with lime, dosed at roughly 8 to 25 kg per cubic meter of mix, coats the particles and locks the sugars down so the cement can set.
- Newer lab work adds alkali and silane treatments with the same goal and good results.

Budget the treatment as a batch step, a stock tank, a bag of lime, and an afternoon, not as a per casket cost problem. Skipping it is how this material gets its bad reputation.

### Casting beats printing for this material, and it is not close

A pellet printer cannot print wet concrete, so the comparison is really cast sawdust concrete against printed plastic, two different shops. Casting wins on process in every way that matters here. The mold is a plywood box, outer form and inner core, built once for a few hundred dollars and reused for years. Flat panel casting is even simpler: cast the bottom, sides, ends, and lid as separate mesh reinforced panels on a flat table, then assemble with screws and corner angles, which sidesteps the deep mold entirely and lets one small shop store flat panels instead of finished caskets. Demold in 24 to 72 hours, handle carefully at 7 days, full strength at 28 days. That cure clock is the real production cost: caskets are a stocked good, so a casting shop holds finished inventory, and it cannot promise a made to order box in 48 hours the way a printer running two days straight roughly can.

### The weight problem, stated plainly

This is where the idea pays its tax. A casket shell has about 70 square feet of surface. Cast at 1 inch thick, that is about 5.8 cubic feet of material. Cast at 1.5 inches, about 8.7 cubic feet. Multiply by the densities above:

| Shell design | Estimated shell weight |
|---|---|
| 1:2 cement sawdust at 1 inch | About 465 lb |
| 1:3 cement sawdust at 1 inch | About 385 lb |
| Light arbolite style mix at 1 inch | About 235 lb |
| Light mix, ribbed panels at 0.75 inch | About 175 lb, optimistic |
| Printed plastic shell, from section 3 | About 100 lb (45 kg) |
| Typical wood or steel casket | About 150 to 200 lb |

Add a body and the realistic sawdust concrete builds put 400 to 600 lb in the bearers' hands. Six pallbearers can carry that on paper, at 70 to 100 lb each, and funeral directors will still balk, because their staff, their church trucks, and their lowering devices are all sized around a 200 lb box. Two people cannot carry any version of it. A family hand carrying Grandpa to a home burial plot, one of the prettiest use cases in section 4, is out. The honest summary: this material builds a casket that moves by machine, and any shop selling it should say so on the first page.

### Durability in the ground

Inside a burial vault, which most conventional cemeteries require anyway, a treated and sealed sawdust concrete shell stays mostly dry and should last as long as anyone asks it to. Arbolite buildings have stood in Russian winters since the 1960s, and that is a real durability record. Direct earth burial with no vault is the weak case: a material that drinks 13 to 19 percent of its weight in water, buried in wet Arkansas clay, will cycle moisture for years, and the untreated sawdust inside it can eventually rot even though the cement around it cannot. The lime treatment and a waterproof coat are the mitigation, and the honest position is that burial service is plausible but unproven. The test is cheap: cast panels, soak them, freeze and thaw them, bury one test box in wet ground for a season and dig it up. Until that test runs, sell it as a vault burial product.

The finish question answers better than expected. Cast against a smooth mold, the surface comes out stone like, and a white cement face coat makes it read as cast stone, which is a dignified register a plastic print has to work to reach. A mold also gives detail for free: a cross, a border, a recessed name plate, cast in on every unit at zero marginal cost, where the printed shell needs its fabric wrap or paint to get to the same graveside read. The weight even helps the read. It feels permanent, because it nearly is.

### Cost per casket, compared clean against section 5

Deciding cost named first: cement. It is the only ingredient bought in real quantity, about two 94 lb bags per casket at roughly $15 to $19 a bag at retail in late 2026 checks, call it $34 to $38. Sawdust is free for the hauling from any mill or cabinet shop, and most shops are glad to see it leave. After cement, the deciding lines are the same ones as the printed audit, finish and lining, because dignity is still bought in those two lines.

Scenario C, Cheap: cast panels, free sawdust, lime treated, fabric or paint finish, own labor.

| Line | Cost, estimate |
|---|---|
| Cement, 2 bags at about $17 | $34 |
| Hydrated lime, sand, treatment supplies | $13 |
| Welded wire mesh reinforcement | $18 |
| Paint or fabric finish, mold release, sealer | $30 |
| Lining kit, pillow and blanket, bought basic | $50 |
| Handles, rope or basic hardware | $12 |
| Mold amortization share | $4 |
| Total per casket | About $161 |

Honest range, $130 to $200. Against Scenario A printed cheap at about $172, a wash on unit cost, with one difference that is not a wash at all: capital of a few hundred dollars in molds and a used mixer against $12,000 to $15,000 for the printer.

Scenario D, Realistic: cast, painted or stone finish, quality lining, part time paid labor at $15 per hour.

| Line | Cost, estimate |
|---|---|
| Cement, lime, sand, mesh, consumables | $66 |
| Paint, stone finish coat, sanding supplies | $60 |
| Lining, quality interior kit | $120 |
| Handles and hardware, metal swing bar set | $45 |
| Finishing and assembly labor, 6 hours at $15 | $90 |
| Mold and mixer amortization share | $10 |
| Total per casket | About $391 |

Honest range, $340 to $450, against Scenario B printed realistic at about $645. The cast casket is roughly $250 cheaper per unit at realistic assumptions, and it supports the same fair retail near $899 to $999 with a fatter margin, or a lower price near $699 that undercuts Titan's floor while still paying its makers.

### Honest limits

- Moisture is the standing weakness: high absorption, real movement with wetting and drying, and unproven decades in direct earth contact.
- Strength is panel strength, not structure: it needs mesh or a frame in the bottom, and it will crack where plastic bends.
- Weight caps the market: machine handling only, no family carry, and some cemeteries and funeral homes will refuse it on handling grounds alone.
- Cemetery acceptance is the same gate as section 4, unchanged, and a 400 lb box gives a skeptical cemetery manager a second reason to say no.
- Cremation is out, completely. Concrete does not burn, and no crematory will run it. This is a burial only product, same as the printed plastic shell, for a harder reason.
- The 28 day cure means inventory, space, and patience, and a casting shop that runs out of cured stock has no rush option.

### Verdict

Sawdust concrete wins where the printer is the barrier: it needs a mold, a mixer, and free sawdust instead of a $12,000 machine, its per casket cost ties the printed cheap scenario and beats the printed realistic one by about $250, its feedstock never runs through a shredder or a supply chain, and its cast stone finish may be the most dignified read in this whole file. Printed recycled plastic wins where weight and water rule: at about 100 lb the shell it is the only alternative material here a family can actually carry, it is waterproof in direct earth burial where sawdust concrete is merely hopeful, and it produces on a two day clock instead of a 28 day cure. The part by part hybrid mostly fails, because the tub is the heavy half: a printed lid on a cast tub trims maybe a quarter of the shell weight and still leaves a box north of 250 lb, and a cast lid on a printed tub puts the weight up high and saves almost nothing. The split that works is by setting, not by part: cast sawdust concrete for vault burials sold by shops with no capital, printed plastic where carry weight and direct burial matter. One more door the casting route opens on its own: the burial vault itself, a $1,695 median line item from section 1, is a plain concrete box that is placed by cemetery equipment and never carried with a body in it, which makes it the one product in this file where sawdust concrete's weight costs nothing and its cheapness is pure profit. If the casket stalls at the cemetery gate, cast the vault.

Sources: sawdust concrete densities, absorption, and strength at https://geomatejournal.com/geomate/article/download/2053/1942 and treatment review at https://pmc.ncbi.nlm.nih.gov/articles/PMC11644647/ and lime pretreatment results at https://www.academia.edu/82319066/Pretreatment_of_Sawdust_for_Producing_Sawdust_Concrete and lime woodcrete blocks at https://ijodst.com/uploads/papers/2021/06/woodcreate.pdf and arbolite grades, recipes, and mineralizers at https://beni-cs.ru/en/pro-beton/ves-arbolita.html and https://beni-cs.ru/en/pro-beton/sostav-arbolita.html and hempcrete properties at https://dgmr.nl/wp-content/uploads/2023/02/Whitepaper-Hempcrete_feb2023_DGMR.pdf and retail cement pricing at http://www.homedepot.com/p/reviews/Basalite-47-lb-Portland-Cement-100003005/100321924/2
