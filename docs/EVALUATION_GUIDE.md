# Evaluation guide — 1.5.17+35

## Current implementation and checks

Offline camera/gallery analysis, final orientation-aware ten-pad localization, experimental per-analyte k-NN, early image-quality checks, measured photo overlays, safety checklist, provisional research Bayesian calculations, rule-based kidney follow-up and encrypted editable history. Physical tip-to-handle order is **LEU / NIT / URO / PRO / pH / BLD / SG / KET / BIL / GLU**. See [the contract](URITECT_FINAL_PAD_ORIENTATION.md).

Actual available model predictions are visible with secondary Low confidence, Provisional or Unverified labels. Clinical gates still determine which inputs can support calculations. Current scan completion seals an encrypted inbox without authentication; explicit history access authenticates and merges verified records. Checklist edits restore answers and upsert the same scan ID. Teal responsive actions and a reference-only category legend are included. Actual color swatches await the owner chart. See [the current implementation and acceptance note](URITECT_CURRENT_SCAN_WORKFLOW_2026-10-13.md). Bayesian percentages and technical evidence remain optional research details.

The owner checkout passed **176 app tests and clean static analysis**. Copied app files match [the frozen inventory](build/SOURCE_SNAPSHOT.json). All existing assets/models and analysis services match the previous-build [core guard](build/UNCHANGED_CORE.json). History storage and native Android sealing intentionally changed. Host storage tests do not establish Android Keystore authorization on real phones. The complete suite was not independently repeated in this clean copy. [The receipt](build/EVALUATION_BUILD.json) verifies the APK source, identity, signing and offline assets/permissions. Prior clean-checkout verification files and the host latency benchmark remain historical evidence for their actual versions.

Observed environment: Flutter 3.41.9, Dart 3.11.5, Gradle 8.14.3, Android build-tools 36.0.0 and Android Studio bundled JDK. Use your own SDK/signing configuration; locked dependencies and the pinned Gradle wrapper are included. Run the commands in the README. Selected Python tests run with `python -m unittest discover -s pipeline -p 'test_*.py'` after installing pipeline/requirements.txt. This subset does not reproduce all owner-dataset experiments. The app does not require Python or a server.

Artifact paths in current index/receipts refer to the owner's original workspace. Full APK/source-archive verification requires those separately supplied owner artifacts; they are not bundled in Git.

## Review scope

Review detector/orientation in `lib/services/local_scan_analysis_service.dart`, reliability/timing and screening/renal engines in `lib/models`, and authentication/encryption/history in services and native Android source. The current changes are listed in the workflow note, including the sealed inbox in HistorySecurity.kt and scan_history_service.dart. Confirm unknown timing, duplicate inputs and omitted specimen codes cannot become current-specimen evidence. Check small phones/large text, secondary reliability labels, populated checklist editing, same-ID updates, no-password current scanning, explicit-history authentication, sealed-photo recovery, missing answers, urgent advice, Home/New Scan, and that private research details hide on history backgrounding. After a restart with locked old records, duplicate checking may remain incomplete until history is explicitly opened; clinical gates fail closed while photo review still works. Do not clear data for an in-place update test.

Use [the review form](DEVELOPER_EVALUATION_REVIEW_FORM.md) and [device checklist](URITECT_EVALUATION_DEVICE_CHECKLIST.csv). Record **Repository commit, release tag, or version reviewed**, APK SHA-256, device/Android version, steps and deidentified evidence. Obtain the source commit with `git rev-parse HEAD`. Older evaluator scores/signatures do not automatically apply to this redesign.

## Evidence still pending

No current-build real-device acceptance, reviewer signature or clinical validation is inferred from automated checks. [Physical-strip manufacturer/IFU verification](URITECT_PHYSICAL_STRIP_PROTOCOL.md), recorded professional/usability review and independent culture-confirmed calibration remain pending. URS-10T lot/dates and owner-transcribed mixed reading times are recorded; exact manufacturer chart/tolerances remain unverified. No model was retrained and no accuracy improvement is claimed. The new public-key sealing path still needs in-place update, lock/cancel/background and restart checks on actual Android devices.

[Grouped classification results](performance/GROUPED_EXPERIMENT.md) and [pH/SG experiments](performance/PH_SG_EXPERIMENT.md) remain exploratory, using inspected data with rare-class limits. Their raw review-sheet references belong to the owner workspace. Category accuracy is not disease-detection accuracy, and expert content review is not clinical outcome validation.

## Completed legacy audit and corrected-baseline metrics

Use [the corrected-baseline five-metric table](URITECT_CORRECTED_BASELINE_FIVE_METRICS_2026-10-13.md) for the 112-photo historical confirmation baseline. The candidate table in GROUPED_EXPERIMENT.md is an uninstalled research comparison, not installed-model performance. The [new legacy-data comparison](performance/legacy_dataset_audit_2026-10-13/REPORT.md) uses a different 140-photo paired development target; do not mix these figures. No new classifier was promoted.

The audit tools are included under pipeline with their local dependency closure and pinned research dependencies. Automated pipeline tests in this clean checkout use synthetic/deidentified fixtures; owner raw data are required to reproduce the image audit or fitted experiments. Private datasets and per-photo outputs are intentionally excluded. The original binary labels were preserved. Reviewer-side audit defaults use the reviewer home directory rather than the owner-specific path, and generated diagnostic harness directories are created when needed. These portability adjustments do not alter image, category or model decisions.

The [installation receipt](build/INSTALLATION.json) documents an in-place APK update and version verification on RMX3933, without clearing data. It is not a completed device acceptance test. Use `git rev-parse HEAD` to identify the current documentation/tools commit in the review form.
