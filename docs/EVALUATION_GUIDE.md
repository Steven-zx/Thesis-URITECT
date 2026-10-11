# Evaluation guide

## Current implementation

Offline camera/gallery analysis, orientation-aware ten-pad localization, per-analyte k-NN, confidence/distance checks, actual-photo progressive sampling overlays, safety checklist, provisional Bayesian UTI estimates, renal follow-up and protected editable history.

Physical order from tip toward handle: **LEU → NIT → URO → PRO → pH → BLD → SG → KET → BIL → GLU**. See [the contract](URITECT_FINAL_PAD_ORIENTATION.md).

The app model remains `direction_verified_experimental_v1_20261011`. No pH/SG experiment candidate was deployed. [Grouped results](performance/GROUPED_EXPERIMENT.md) and [focused experiments](performance/PH_SG_EXPERIMENT.md) are exploratory category-classification evidence, not disease-detection accuracy. Their references to raw review sheets and full historical experiment outputs refer to the owner's research workspace and are intentionally not included here.

## Environment and checks

Observed environment: Flutter 3.41.9, Dart 3.11.5, Gradle 8.14.3, Android build-tools 36.0.0 and Android Studio bundled JDK. Gradle wrapper and pubspec.lock are included. Use your own Android SDK configuration; no owner's local SDK paths or signing credentials are supplied.

The full owner checkout passed **143 Flutter tests, 50 Python tests and clean static analysis**. This smaller repository includes a subset of pipeline tests; do not claim it independently ran all 50. [The receipt](build/EVALUATION_BUILD.json) records observed checks, APK identity and hashes. [The source inventory](build/SOURCE_SNAPSHOT.json) identifies frozen app files. Artifact paths in those receipts are provenance paths in the owner's original workspace.

For selected Python checks, install `pipeline/requirements.txt`, then run `python -m unittest discover -s pipeline -p 'test_*.py'`. The app runs locally without the Python pipeline or a server. Python package versions used for the audit are [recorded here](performance/PYTHON_ENVIRONMENT.json).

## Review priorities

Inspect `lib/services/local_scan_analysis_service.dart` for geometry/orientation/inference; `runtime_pad_features.dart` for shared color math; `scan_model.dart` for reliability; `screening_fusion.dart` and `renal_followup.dart` for required-pad interpretation gates; `scan_history_service.dart` and native `HistorySecurity.kt` for persistence/security; and the analysis/results pages for lifecycle/navigation.

Complete [the device checklist](URITECT_EVALUATION_DEVICE_CHECKLIST.csv) with actual observations on two phones. Review [security guarantees and limits](URITECT_SECURITY_AND_INPUT_REVIEW_2026-10-10.md). Test in-place updates without clearing data. Geometry overlays do not guarantee correct readings; k-NN confidence is not a calibrated probability.

## Outstanding external evidence

Exact-build manual device acceptance, [physical-strip manufacturer/lot/expiry/IFU details](URITECT_PHYSICAL_STRIP_PROTOCOL.md), and [recorded expert/usability review](URITECT_STATISTICAL_AND_EXPERT_REVIEW_PACKET.md) remain pending. Pad orientation is owner-reported MedTech verified. Clinical calibration and local culture-confirmed outcome validation are not established. pH majority bias, SG class overlap, small rare-class support and inspected evaluation sets remain limitations. Preserve these disclosures in evaluation reports.

Report issues with device/Android version, steps, expected/actual behavior, build version and de-identified screenshots. Never upload participant identifiers, specimen photographs or signing credentials to a public issue.

## Restored opening screen

Build 1.5.12+29 restores the requested gradient opening screen. See [the change note](URITECT_OPENING_SCREEN_RESTORED_2026-10-12.md). Its source passed 144 app tests and static analysis in the owner checkout; copied app files match the new frozen inventory. The older clean-checkout test record remains historical evidence for 1.5.11+28.
