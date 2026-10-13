# URITECT — developer evaluation

Frozen Android research prototype **1.5.17+35**, package `ph.edu.wvsu.uritect`. Start with [the evaluation guide](docs/EVALUATION_GUIDE.md).

- `uritect_app/`: frozen app source, locked dependencies, offline models/fonts and tests.
- `pipeline/`: selected feature/schema helpers, tests and owner-artifact verification tooling.
- `docs/`: review forms, limitations and frozen build/performance evidence.

From `uritect_app`, run `flutter pub get`, `flutter analyze`, `flutter test`. For local installation use `flutter build apk --debug`. Owner signing keys are excluded; distribute the signed APK separately with [its checksum](docs/build/SHA256SUMS.txt).

The current version restores visible model predictions with secondary reliability labels, adds prompt-free sealed scan saving, populated checklist editing, consistent teal actions and a category reference legend. Read [the implementation and acceptance note](docs/URITECT_CURRENT_SCAN_WORKFLOW_2026-10-13.md). Timing, eligibility, confidence and serious-symptom gates remain intact; saved-history reads still require authentication.

Please complete [the review form](docs/DEVELOPER_EVALUATION_REVIEW_FORM.md), including **Repository commit, release tag, or version reviewed**. Previous-version ratings do not automatically evaluate this redesign.

Raw research datasets, patient history, signing credentials, SDK paths, caches and binaries are excluded. Existing deidentified regression fixtures are included for app tests. Dataset-dependent reproductions require separately authorized access. This research prototype has no established clinical calibration; no project license is granted by this evaluation package. Agree distribution and contribution terms with the owner.

## Latest evaluator evidence: 13 October 2026

The app remains **1.5.17+35**. This repository update adds the [release brief](docs/URITECT_DEVELOPER_EVALUATION_RELEASE_BRIEF_2026-10-13.md), [corrected-baseline five-metric results](docs/URITECT_CORRECTED_BASELINE_FIVE_METRICS_2026-10-13.md), and [completed legacy-data audit](docs/performance/legacy_dataset_audit_2026-10-13/REPORT.md), with its tools and dependency closure. Of 2,028 unique images, 210 qualified for the versioned pool, including six legacy RHU photos. No candidate met the promotion criteria, so the classifier, clinical gates and APK are unchanged. Raw photos, per-photo manifests and cleaned feature rows remain private.

Record the **current repository commit** using `git rev-parse HEAD` alongside app version **1.5.17+35**. The app source was frozen at earlier commit `7c8361a`; this documentation/tools update has its own commit. APK installation on RMX3933 is [recorded](docs/build/INSTALLATION.json); complete device workflow acceptance remains pending.
