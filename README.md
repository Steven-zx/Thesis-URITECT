# URITECT — developer evaluation

Frozen Android research prototype **1.5.15+33**, package `ph.edu.wvsu.uritect`.
Start with [the evaluation guide](docs/EVALUATION_GUIDE.md).

- `uritect_app/`: exact frozen app source, locked dependencies, model assets and tests.
- `pipeline/`: selected image/feature/schema helpers, dependency closure and focused tests.
- `docs/`: evaluation protocol, security scope, pad-order contract and build/performance evidence.

From `uritect_app`: `flutter pub get`, `flutter analyze`, `flutter test`.
For local installation: `flutter build apk --debug`.
Release signing keys are owner-managed and excluded. The signed evaluation APK is distributed separately with [its checksum](docs/build/SHA256SUMS.txt).

This repository excludes private research datasets, patient history, raw specimen photos, caches and historical binaries. Small pre-existing de-identified app regression fixtures are included for automated testing. Dataset-dependent experiments require separately authorized data access.

The classifier and Bayesian component are experimental; clinical validation is not established. No license is granted by this evaluation package; agree distribution and contribution terms with the project owner.

See [the evidence-gap response](docs/URITECT_EVIDENCE_GAP_REMEDIATION_2026-10-12.md) and [confirmed lot record](docs/URITECT_PHYSICAL_STRIP_RECORD.json). External acceptance remains pending.

The current build uses bundled [Poppins typography](docs/URITECT_POPPINS_TYPOGRAPHY_2026-10-12.md).

IT expert feedback is incorporated in the [scanner/UI update](docs/URITECT_IT_EXPERT_RECOMMENDATIONS_2026-10-12.md). Please complete [the review form](docs/DEVELOPER_EVALUATION_REVIEW_FORM.md), including **Repository commit, release tag, or version reviewed**.
