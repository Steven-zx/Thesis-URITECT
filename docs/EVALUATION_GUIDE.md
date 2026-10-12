# Evaluation guide — 1.5.16+34

## Current implementation and checks

Offline camera/gallery analysis, final orientation-aware ten-pad localization, experimental per-analyte k-NN, early image-quality checks, measured photo overlays, safety checklist, provisional research Bayesian calculations, rule-based kidney follow-up and encrypted editable history. Physical tip-to-handle order is **LEU / NIT / URO / PRO / pH / BLD / SG / KET / BIL / GLU**. See [the contract](URITECT_FINAL_PAD_ORIENTATION.md).

The patient interface now uses concise statuses and plain-language results. Unconfirmed readings appear as Uncertain, and Bayesian percentages, confidence scores, references and rule/model IDs are confined to optional Research Details. The original data/calculations are preserved. See [the changed-file summary and safety choices](URITECT_UI_SIMPLIFICATION_2026-10-13.md).

The owner checkout passed **164 app tests and clean static analysis**. Copied app files match [the frozen inventory](build/SOURCE_SNAPSHOT.json). All prior assets/models/services match the pre-redesign [core guard](build/UNCHANGED_CORE.json). The complete suite was not independently repeated in this clean copy. [The receipt](build/EVALUATION_BUILD.json) verifies the APK source, identity, signing and offline assets/permissions. Prior clean-checkout verification files and the host latency benchmark remain historical evidence for their actual versions.

Observed environment: Flutter 3.41.9, Dart 3.11.5, Gradle 8.14.3, Android build-tools 36.0.0 and Android Studio bundled JDK. Use your own SDK/signing configuration; locked dependencies and the pinned Gradle wrapper are included. Run the commands in the README. Selected Python tests run with `python -m unittest discover -s pipeline -p 'test_*.py'` after installing pipeline/requirements.txt. This subset does not reproduce all owner-dataset experiments. The app does not require Python or a server.

Artifact paths in current index/receipts refer to the owner's original workspace. Full APK/source-archive verification requires those separately supplied owner artifacts; they are not bundled in Git.

## Review scope

Review detector/orientation in `lib/services/local_scan_analysis_service.dart`, reliability/timing and screening/renal engines in `lib/models`, and authentication/encryption/history in services and native Android source. The newly changed UI files are listed in the simplification note. Confirm unknown timing, duplicate inputs and omitted specimen codes cannot become current-specimen evidence. Check small phones/large text, uncertain readings, missing answers, urgent advice, Home/New Scan, and that optional research details hide on history backgrounding. Do not clear data for an in-place update test.

Use [the review form](DEVELOPER_EVALUATION_REVIEW_FORM.md) and [device checklist](URITECT_EVALUATION_DEVICE_CHECKLIST.csv). Record **Repository commit, release tag, or version reviewed**, APK SHA-256, device/Android version, steps and deidentified evidence. Obtain the source commit with `git rev-parse HEAD`. Older evaluator scores/signatures do not automatically apply to this redesign.

## Evidence still pending

No current-build real-device acceptance, reviewer signature or clinical validation is inferred from automated checks. [Physical-strip manufacturer/IFU verification](URITECT_PHYSICAL_STRIP_PROTOCOL.md), recorded professional/usability review and independent culture-confirmed calibration remain pending. URS-10T lot/dates and owner-transcribed mixed reading times are recorded; exact manufacturer chart/tolerances remain unverified. No model was retrained for this UI change.

[Grouped classification results](performance/GROUPED_EXPERIMENT.md) and [pH/SG experiments](performance/PH_SG_EXPERIMENT.md) remain exploratory, using inspected data with rare-class limits. Their raw review-sheet references belong to the owner workspace. Category accuracy is not disease-detection accuracy, and expert content review is not clinical outcome validation.
