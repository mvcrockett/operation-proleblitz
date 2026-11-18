# Rent-to-Own Price Comparison Tool: Design Spec

Project Mass Disruption, Lane 2 companion tool. Working name: **The True Price Tag**.
Status: design only. Local prototype next, nothing published or hosted without Victoria's word.
House rule that governs everything below: the tool is free for shoppers, forever. No ads, no lead sales, no store sponsorships, no accounts.

## The problem it attacks

Rent-to-own stores quote a small weekly price and a number of weeks. Almost nobody multiplies the two. A $700 TV at $24.99 a week for 104 weeks costs $2,598.96, and the shopper hears "$25 a week." The store's whole margin lives in the gap between the weekly number and the true total. This tool closes that gap in public, on paper, in the store, and then makes stores bid against each other for the shopper standing in front of them.

## Inputs

Kept short on purpose. A tired person in a store parking lot should finish in under three minutes.

- **The item.** Name or description (example: 55 inch TV, washer and dryer set), plus an optional photo of the model tag.
- **Retail price.** What the same item costs to buy outright at a normal store. Optional field with a helper line: "Check the price at Walmart, Best Buy, or Amazon and type it here." If left blank, the one-pager prints a [RETAIL PRICE] placeholder and still works.
- **Store offers, repeatable, up to 4.** For each offer:
  - Store name
  - Weekly price (with a toggle for biweekly or monthly quotes, converted to weekly for comparison)
  - Number of weeks or payments until ownership
  - Any upfront fees (delivery, setup, processing), entered as one "extra fees" number
  - Optional: the "same as cash" price and deadline if the store offers one, and the cash price the store lists on the tag
- **Credit union loan estimate inputs.** Loan amount (defaults to the retail price), a term in months (default 12), and an APR. The APR field is prefilled with a plain note: credit union payday alternative loans are capped near 28 percent APR, and many credit union personal loans run lower. The shopper can type the rate their own credit union quoted them.

## The math (all computed in the browser, nothing uploaded)

For each offer:

- **True total cost** = (weekly price × number of weeks) + extra fees
- **Markup over retail** = true total cost − retail price, shown as dollars and as a plain multiple ("you would pay 3.1 times the store price")
- **Effective cost of credit** = true total cost − the store's own cash price, when a cash price was entered, labeled in plain words: "this is what renting costs you beyond the price on the tag"
- **Weekly cost of the loan comparison** = credit union loan total (principal plus interest over the chosen term) divided into a per week figure, so the shopper compares weekly to weekly, the store's own language turned against it

Worked example, printed in the spec so any builder can test against it:

- Retail price $700. Offer: $24.99 per week, 104 weeks, $49 delivery fee.
- True total: $24.99 × 104 + $49 = **$2,647.96**. Markup over retail: **$1,947.96**, about 3.8 times retail.
- Credit union loan: $700 at 18 percent APR for 12 months costs about $770 total, about $14.80 a week. The one-pager line writes itself: "The loan costs $770 all in. Your offer costs $2,647.96. Meet me closer to the loan, or I walk."

## Outputs

1. **Comparison table on screen.** One row per offer plus two extra rows: buy at retail, and the credit union loan. Sorted cheapest first. The cheapest rent-to-own offer is never allowed to look like the winner without the retail and loan rows sitting right under it.
2. **The one-pager: "Match this or I walk."** A printable sheet, big type, designed to be shown to a salesperson or left on the counter. It contains:
   - The item and today's date
   - Each store's offer with its true total cost, named by store, so Store B sees Store A's real number
   - The retail price and the credit union loan total, labeled "what this item costs without rent-to-own"
   - A blank line: "Your best total price, in writing: ______" and "Manager name: ______"
   - A footer in plain words: "These totals were figured with a free tool from Project Mass Disruption. The math is weekly price times weeks, plus fees. Any store can check it."
   - A checkbox list the shopper can tick in the store: total price in writing, no added insurance or club fees I did not ask for, same as cash terms in writing, damage waiver explained before I sign
3. **A plain language warning box** that appears whenever the best offer still costs more than twice the retail price: "Even the best offer here costs more than double the shelf price. If you can wait, a credit union loan, layaway, or a used one from a marketplace will almost always beat every offer on this page."

## How it forces competition

- Named totals. The one-pager shows each store the other stores' true totals, by name. Stores compete on the real number, not the weekly teaser.
- The walk-away anchor. The loan and retail rows give the shopper a credible outside option, which is the only leverage a single shopper has.
- In-writing blanks. The sheet asks for the best price in writing with a manager's name. Verbal deals evaporate, paper does not.
- Repeat visits. The design assumes the shopper visits two or three stores with the same sheet, filling in one line per store. Each store knows the sheet has been somewhere else already.

## Data and monetization notes

- **Free means free.** No ads, no affiliate links, no selling leads to stores, no premium tier, no account, no email capture. The moment a store can pay to rank higher, the tool is dead.
- **No data collection by default.** The comparison runs on the device. There is no server in the design, same as the overdraft tool.
- **Optional anonymous price reports, later and only with a plain yes.** A shopper may choose to share "store name, item, weekly price, weeks, city" into a public price board so the next shopper in that town starts with real numbers. No names, no accounts, no location finer than city. This is a v2 question for Victoria, not a launch feature.
- **Costs are near zero by design.** One static HTML file, copied the same way as the overdraft tool (Internet Archive, mirrors, USB bundles, print). If a public price board ever exists, it is the only piece that would need hosting money, and it waits until the project has a funding answer that is not ads.
- **Funding that does not corrupt it:** grants, donations, and the project's own print and store income, disclosed on the page. Stores are never a funding source.

## Build notes and limits

- Single self-contained HTML file, phone first, large type, high contrast, same shell and house style as the overdraft complaint tool (no em dashes, no semicolons, contractions, plain warm copy).
- Print stylesheet matters more here than in any other tool in the set, because the one-pager is the weapon. Test it on paper, not just on screen.
- The tool cannot verify that a store's quote is honest, and it cannot stop a store from adding fees at the contract table. The one-pager's checklist is the mitigation, and the copy must say so plainly: "This sheet helps you compare. Read the contract anyway. The contract is what you owe."
- State law varies. Some states cap rent-to-own total cost or require total cost disclosure on the tag. A v2 addition worth making: a one line state note, chosen by the shopper, that says whether their state requires the total cost on the price tag. Researched and attorney reviewed before it ships, like everything in Lane 4.
