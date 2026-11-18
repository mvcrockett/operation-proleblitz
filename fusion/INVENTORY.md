# Inventory: Everything in the Fusion Corpus

Compiled November 17, 2026, for the open source release of the Crockett Reactor framework under Operation ProleBlitz. Every fusion source document found in Victoria Crockett's upload, her Google Drive, and the local workspace is listed here with its origin, date, and contents, including the items held back from the release and the reasons why. Harvest details live in sources/drive/MANIFEST-A.md and sources/local/MANIFEST-B.md. Triage verdicts on the schematics PDF live in FACT-CHECK-LOG.md.

## A. Uploaded for this release

1. **Crockett-Reactor-Explainer.pptx** — uploaded November 17, 2026, internal timestamps September 28, 2026. 46,795 bytes, 14 slides. The general audience deck: three bottlenecks (soggy firewood, leaky bottle, crumbling cage), the four-layer architecture, the three solutions, the FLiBe blanket, safety, and economics. Converted to docs/reactor-explainer.md.

## B. Google Drive harvest

Downloaded November 17, 2026 into sources/drive/. Drive holds roughly 35 fusion-named files. Most are duplicate copies of the items below. The duplicates were counted, not downloaded.

2. **ARPA Nuclear Fusion Full Schematics (PDF)** — the core technical document. 24 pages, about 4,135 words of text plus 5 diagram plates. Four-layer architecture, pellet spec with ablation timing equation, levitation and neutron transport equations, FLiBe breeding chemistry, corrosion controls, sCO2 heat loop, $1.855B cost model, safety section, and filing-ready patent claim language. Three Drive copies (April 21, May 20, and July 9, 2026) are the same document, byte-identical or text-identical. Its Google Doc source was also downloaded. Converted, from the usable pages only, to docs/full-design-document.md after the page by page triage in FACT-CHECK-LOG.md.
3. **ARPA-E Program Manager Pitch (PDF and Google Doc, same text)** — April 2026, 2 pages. The three-pillar pitch to the ARPA-E CHADWICK program, with the OpenStar validation claim and the headline numbers. Converted to docs/arpa-e-pitch.md.
4. **Why I'm giving away the secret to nuclear fusion (Google Doc)** — October 23, 2025, marked revised. The earliest document in the corpus and the founding statement of the open source decision, ending in a public invitation to join the work. Converted to docs/why-im-giving-it-away.md.
5. **Funding Paths After Open-Sourcing an Open-Source Fusion Concept (docx)** — April 24, 2026. A research memo surveying Activate, Breakthrough Energy Fellows, Creative Destruction Lab, The Engine, DOE routes, Innovation Crossroads, and Chain Reaction Innovations, with program terms and deadlines as of that date. Converted to docs/funding-paths.md as a supporting document.
6. **Digital Twin Fusion Notes, Elias and Me (Google Doc and txt copies)** — April 2026, about 104,000 words. A long chat transcript with technical content inside it, including a vendor scam vetting and Python 0D energy-balance model code, versions 1 to 3. HELD BACK from conversion: personal conversation is mixed through it. Listed here so the record is complete. Release needs Victoria's review first.
7. **Last Chat 1, Elias Digital Twin Fusion Notes (txt)** — May 5, 2026, about 61,000 words. Mostly personal conversation, about 31 fusion mentions. HELD BACK, same reason as item 6.
8. **Part 2: How I Fixed Fusion & Info (Google Doc)** — April 16, 2026. A stub: one TikTok link and contact information, no design content. Nothing to convert.
9. **How A Safety Pin Helped Me Solve Nuclear Fusion: My Pandemic Story (Google Doc)** — April 15, 2026. A stub in Drive: the file holds a single character. The story text does not survive in Drive. Nothing to convert.
10. **The Crockett Reactor, Invention Pitch Deck (Google Slides)** — May 29, 2026. A stub: one slide with empty title and subtitle placeholders. The real deck is item 1. Nothing to convert.
11. **Physics & Chemistry: Nuclear Reactions, Fission, Fusion, and Future Energy (Google Doc)** — May 29, 2026. A classroom teaching pack for grades 9 to 12 (lesson plan, worksheets, a reactor design exercise for students). HELD BACK from the release: it is a teaching product she sells, not a design document. Victoria's call whether it joins the open source material later.
12. **FusionVideo1.mov** — April 23, 2026, about 23.7 MB. Video, inventory only, not downloaded.

## C. Local workspace

13. **DOE Technology Proposal (PDF)** — September 30, 2026, 11 pages, in ~/workspace/your_files/doe-technology-proposal/. A formal submission to the U.S. Department of Energy covering seven inventions. Section 4 is a compact Crockett Reactor write-up with the full projection table, and the proposal states plainly that no prototype has been built and no patent applications have been filed. Converted to docs/doe-proposal-reactor-section.md.
14. **Master Invention Portfolio and Pitch Decks (PDF)** — September 30, 2026, 117 pages. The Crockett Reactor is item 1: a one-line listing on page 1 and a five-slide pitch on page 2 carrying the headline claims (Q over 10, breeding ratio about 2.01, LCOE $28 to $34/MWh). Pages 100 to 103 reuse the reactor as a design pattern for other inventions. Not converted separately because the pitch content matches item 1 and the design document, item 2. Listed here for completeness.
15. **ARPA_Nuclear_Fusion_Schematics_.pdf.pdf (local copy)** — September 23, 2026 file date. Byte-identical to the Drive May copy of item 2 (MD5 aa3c46199c207da98a81e5075b938d7a). This is the copy Victoria uploaded again on November 17, 2026 with the instruction to triage it, and the copy the triage in FACT-CHECK-LOG.md was performed on.
16. **Formal docket line** — ~/workspace/formal-docket.txt holds one status line: "D06 | PARKED | STARFIRE Fusion / Crockett Reactor, levitated-dipole data access blocker." A passing mention, no design content.

## D. Checked and excluded

17. **Gray_Crockett_Collapse_Field.pdf** — 25 pages of her GCCFT mathematics. Checked for fusion content: it never discusses the reactor, plasma, FLiBe, or tritium. Not fusion material, excluded.
18. **Titania project files** (mantis3302-design.md, last-message-to-humanity.md) — both mention fusion only as planned future content that is not attached yet. No design content, excluded.

## Corpus totals

- Source documents found: 18 inventory entries covering about 40 individual files (the rest are duplicate copies in Drive).
- Converted to release markdown: 6 documents (items 1, 2, 3, 4, 5, 13).
- Held back with reasons: 3 (items 6, 7, 11).
- Stubs with no content to release: 3 (items 8, 9, 10).
- Inventory only: 1 video (item 12).
- Excluded after checking: 2 (items 17, 18).
