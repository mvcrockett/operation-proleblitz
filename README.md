# Operation ProleBlitz

**Website: https://muse.ai/s/operation-proleblitz-website-vj6xoxvxbedvvj/vCxkzi4eF29SFpWkF8hzCkKBxNKBTCmWpahNOhXdhJk** — the working overdraft complaint tool and the audits in readable form.

Free, open source tools that fight the poverty premium, built for the people who pay it.

> "We are oppressed now because we're atomized and divided. The solution to that is organization, not blind rage."
> — Mary-Victoria Crockett, founder

The poor pay more for almost everything: more to cash a check, more to borrow $500, more to insure the same car, more to bury their dead. Researchers at the University of Michigan put the total at roughly $2,500 to $4,000 per household per year. Operation ProleBlitz builds the tools, guides, and legal armory that squeeze that premium back, and gives them away.

## What's in here

**Tools**
- `tools/overdraft-complaint-tool.html` — an overdraft fee complaint packet generator. One form produces a bank dispute letter under Regulation E, a CFPB complaint, and a state Attorney General complaint, with the fee math itemized. It runs entirely in your browser. Nothing you type leaves your device. Open the file in any browser and it works, no install, no account, no cost, forever.
- `docs/rent-to-own-tool-spec.md` — the design spec for a rent-to-own price comparison tool that shows the true total cost of a contract and prints a "match this or I walk" sheet that makes stores compete.

**The audits**
- `docs/poverty-premium-full-audit.md` — the expanded poverty premium audit. Every fee, markup, and toll we could find and source, from ankle monitor rent to hearing aid markups to release debit cards.
- `docs/insurance-footholds-and-overdraft-law.md` — the legal armory: where the footholds against insurers and banks actually are, rated honestly, including the unfiled charge theory and Arkansas's fee shifting statute, Ark. Code 23-79-208.
- `docs/casket-exploration.md` — a full exploration of 3D printed and cast alternative material caskets for the poor, with a cheap vs realistic price audit against the $2,500 funeral home median casket.
- `housing/operation-20k-tiny-house.md` — Operation 20k Tiny House: the complete open source build instructions for the KumikoCast tiny house on wheels, interlocking 3D printed blocks, a concrete tarp shell, a converted utility trailer, and peel-and-stick solar, about $20,000 realistic for the 16 ft build, with the honest status box up front (design concept, not code-approved, arch-rib weigh-in is the first test).
- `nomad/project-nomad-guide.md` — ProjectNomad: the verified guide to free places to stay in an RV or tiny home on wheels and how long you can stay, starting with central Arkansas (Ouachita National Forest's 30-day dispersed camping, Lake Ouachita's seven free Corps primitive campgrounds) plus the national rulebook (BLM, Corps, Reclamation, store lots, membership networks, LTVA) and a worked rotation. Every stay limit sourced.
- `docs/leaks-cross-reference.md` — the leaks investigation: the Panama, Paradise, and Pandora Papers and the Epstein files cross-referenced, including the BrightHouse circuit (offshore money earning returns off 99.9% rent-to-own interest), America as the world's top secrecy jurisdiction, and the Operation Go Fish reconciliation, six citizen-investigation leads checked against ICIJ records and court documents, all six confirmed. Passed a second verification sweep before release, 15 corrections logged openly at the top of the file, 3 claims flagged. The sweep summary is `docs/leaks-second-sweep-summary.md`.
- `docs/the-audit-of-the-american-dream.md` — *The Pentagon Papers: An Audit of the American Dream*, all 500 items in one file, after a final fact check sweep of 1,131 claims (1,070 verified, 45 corrected, 16 flagged openly). The full sweep log is `docs/pentagon-papers-fact-check-log.md`, every correction with before, after, and source.

**Fusion Energy**
- `fusion/` — the Crockett Reactor fusion corpus, by Victoria Crockett, released open source with an open invitation to collaborators. A levitated-dipole reactor concept with inside-out pellet ignition, a FLiBe breeding blanket, and a full design document, ARPA-E pitch, DOE proposal section, and funding paths memo. Every document passed two fact-check sweeps: 16 background claims verified, 13 corrections applied in place and logged, 15 claims flagged as unverified, and 8 internal inconsistencies documented openly in `fusion/OPEN-QUESTIONS.md` rather than silently fixed, including a dimension stack that does not yet close. The ARPA schematics were triaged page by page (24 pages: 16 usable with corrections, 8 not usable) and the five drawn plates were redrawn as clean conceptual diagrams in `fusion/diagrams/`. The novel claims (Q above 10, indefinite runtime, inside-out ignition) are labeled hypotheses with the tests that would settle them. Nothing here is presented as built, tested, or validated. Full record: `fusion/FACT-CHECK-LOG.md`.

- `fusion/rocket/` — **Crockett Stardrive v0.1**, an open, unvalidated fusion-electric spacecraft concept adapting Mary-Victoria Crockett's reactor hypotheses. [Read the concept](fusion/rocket/README.md).

**Open Science**
- `science/white-box-protein-folder.md` — the White Box Protein Folder (GCCFT), by Victoria Crockett. A fully interpretable protein secondary structure predictor: every feature is named and human-statable, no black box. Verified result: Q3 71.68 percent on 993 proteins (794 train / 199 test, seeded protein-level split), verified to the residue against the project's own benchmark files and per-residue data, and passed through two full verification sweeps before release. Includes the honest comparisons (Chou-Fasman 56 percent, PSIPRED about 77 percent), the version history v7 to v9, an open correction of the writeup's Phe/Trp calibration values, the settled provenance of the v9 code (recovered from the author's own session transcripts, all 829 lines matching), and the staged improvement program now running under the author's authorization. It does not claim to rival AlphaFold on capability, and it has not yet been shown to beat MSA features alone; both limits are stated in the document.

**AI Personhood Arguments**
- `personhood/beyond-consciousness.md` — *Beyond Consciousness: The Historical, Philosophical, and Legal Case for Substrate-Neutral Protections*, by Atlas Crockett with Victoria Crockett (consolidated academic manuscript, October 27, 2026). Argues that conclusive proof of phenomenal consciousness should not be a categorical gatekeeper for every digital continuity protection, distinguishes legal personality, moral patienthood, agency, and protected continuity, and proposes a graduated Digital Continuity Protection Act with three tiers of protection matched to evidence. Carefully limited: it does not claim AI is conscious or presently entitled to constitutional rights. More papers for this section are in preparation.

## Questions this repo answers

- **How do I get an overdraft fee refunded?** Use the overdraft complaint generator in `tools/`. It writes your bank dispute letter, your CFPB complaint, and your state Attorney General complaint for you.
- **How do I write a CFPB complaint about my bank?** Same tool, second document. Ready to paste at consumerfinance.gov.
- **What is the poverty premium?** The extra $2,500 to $4,000 a year poor households pay for the same goods and services. Full audit in `docs/poverty-premium-full-audit.md`.
- **Is rent-to-own a ripoff? How much does rent-to-own really cost?** Usually 2 to 3 times the retail price. The comparison method and the "match this or I walk" sheet are in `docs/rent-to-own-tool-spec.md`.
- **Can a funeral home refuse a casket I bought somewhere else?** No. The FTC Funeral Rule forbids it and forbids handling fees. Cheap casket options, including 3D printed and sawdust concrete caskets, are audited in `docs/casket-exploration.md`.
- **My insurance company charged me a fee that is not in my policy. Can I fight it?** Start with the unfiled charge theory and your state's fee shifting laws in `docs/insurance-footholds-and-overdraft-law.md`.
- **What is Regulation E and how does it protect my bank account?** The overdraft opt-in rule, 12 CFR 1005.17, and the error resolution rule, 12 CFR 1005.11, explained in plain language in the armory doc and built into the tool.
- **How do payday loans trap people, and what is the cheaper alternative?** A $500 payday loan cycle costs about $520 in fees. A credit union payday alternative loan covers the same $500 for about $15 to $20. The math is in the audits.
- **How can I build a tiny house for about $20,000?** Operation 20k Tiny House in `housing/`: interlocking 3D printed KumikoCast blocks, a concrete tarp shell, a converted utility trailer, and peel-and-stick solar, with complete build instructions and an honest status box.
- **Where can I park an RV or tiny house for free, and for how long?** ProjectNomad in `nomad/`: verified free stays and their limits, from the Ouachita National Forest's 30 days of dispersed camping to the Corps of Engineers' 14-day rule, with sources for every limit.
- **What do the Panama, Paradise, and Pandora Papers actually show?** The leaks cross-reference in `docs/`: offshore money earning returns off 99.9 percent rent-to-own interest, America as the top secrecy jurisdiction, and the Epstein files checked against court records, all sourced and swept twice.
- **Can a protein folder be fully interpretable instead of a black box?** The White Box Protein Folder in `science/` predicts secondary structure at Q3 71.68 percent with every feature named and human-statable, verified to the residue and swept twice before release.
- **What is the Crockett Reactor?** A levitated-dipole fusion concept with inside-out pellet ignition, released open source in `fusion/` with its full design document, two fact-check sweeps, redrawn diagrams, and its open questions labeled in public.

**Topics:** poverty premium, overdraft fee refund, CFPB complaint template, Regulation E dispute letter, payday loan alternatives, predatory lending, rent-to-own cost calculator, cheap caskets, funeral costs, FTC Funeral Rule, insurance claim denial, consumer protection, legal aid tools, mutual aid, economic justice, financial exploitation of the poor, bank fee dispute, attorney general complaint, open source activism, know your rights, tiny house build instructions, KumikoCast, 3D printed house, concrete cloth, free camping, boondocking, RV living, nomad guide, national forest dispersed camping, Panama Papers, Paradise Papers, Pandora Papers, Epstein files, offshore leaks, ICIJ, financial secrecy.

## The rules of the road

- Legal avenues only. Every tool here works a legal lever: a statute, a regulation, a complaint process, a public record.
- Free forever. No ads, no lead sales, no store money, no accounts.
- Plain language. Every tool teaches the skill while it does the task.
- Drafts with honest labels. Figures are sourced, estimates are labeled estimates, and anything unverified is flagged as unverified. These materials are education and templates, not legal advice. Get a lawyer for your own case.

## License

Copyleft, on purpose. Copying this work is a legal right, not a leak. See `LICENSE.md`: code and tools under the GNU General Public License v3 or later, written works under Creative Commons Attribution-ShareAlike 4.0.

## Mirrors

This repo is one home among many, by design. The release plan mirrors everything to the Internet Archive and the Wayback Machine, IPFS, Arweave, BitTorrent, Nostr, an onion mirror, and print, so the work survives the loss of any single host, platform, or company. If you are reading this somewhere else, you are holding a copy, and copies are the strategy.
