# URITECT — developer evaluation

Frozen Android research prototype **1.5.16+34**, package `ph.edu.wvsu.uritect`. Start with [the evaluation guide](docs/EVALUATION_GUIDE.md).

- `uritect_app/`: frozen app source, locked dependencies, offline models/fonts and tests.
- `pipeline/`: selected feature/schema helpers, tests and owner-artifact verification tooling.
- `docs/`: review forms, limitations and frozen build/performance evidence.

From `uritect_app`, run `flutter pub get`, `flutter analyze`, `flutter test`. For local installation use `flutter build apk --debug`. Owner signing keys are excluded; distribute the signed APK separately with [its checksum](docs/build/SHA256SUMS.txt).

The current version implements [the user-friendly UI redesign](docs/URITECT_UI_SIMPLIFICATION_2026-10-13.md). Research-only values and technical explanations are optional; timing, eligibility, confidence, serious-symptom and history-security safeguards remain intact.

Please complete [the review form](docs/DEVELOPER_EVALUATION_REVIEW_FORM.md), including **Repository commit, release tag, or version reviewed**. Previous-version ratings do not automatically evaluate this redesign.

Raw research datasets, patient history, signing credentials, SDK paths, caches and binaries are excluded. Existing deidentified regression fixtures are included for app tests. Dataset-dependent reproductions require separately authorized access. This research prototype has no established clinical calibration; no project license is granted by this evaluation package. Agree distribution and contribution terms with the owner.
