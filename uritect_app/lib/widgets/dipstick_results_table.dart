import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../models/dipstick_results_data.dart';
import '../models/strip_reading_schedule.dart';

/// Keep numerical values visible; disclose uncertainty without ten paragraphs.
class DipstickResultsTable extends StatelessWidget {
  final List<DipstickResultRow> rows;
  final Map<String, double> analyteConfidences;
  final double requiredConfidence;
  final double? secondsAfterDipping;
  const DipstickResultsTable({
    super.key,
    required this.rows,
    this.analyteConfidences = const {},
    this.requiredConfidence = .55,
    this.secondsAfterDipping,
  });

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: AppColors.bgCard,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(
                Icons.science_outlined,
                size: 18,
                color: AppColors.primaryMain,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Analyte readings',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(14, 0, 14, 12),
          child: Text(
            'Tap an analyte for timing, confidence and reference details.',
            style: TextStyle(fontSize: 12),
          ),
        ),
        for (final row in rows) ...[
          const Divider(height: 1, color: AppColors.border),
          _analyte(context, row),
        ],
      ],
    ),
  );

  Widget _analyte(BuildContext context, DipstickResultRow row) {
    final confidence = analyteConfidences[row.name];
    final timing = StripReadingSchedule.reportedTimeMatches(
      row.code,
      secondsAfterDipping,
    );
    final seconds = StripReadingSchedule.secondsByCode[row.code];
    final lowConfidence = confidence == null || confidence < requiredConfidence;
    final warnings = [
      if (!timing) 'Image review only',
      if (lowConfidence)
        confidence == null ? 'Confidence unavailable' : 'Low confidence',
    ];
    return ExpansionTile(
      key: PageStorageKey('reading-${row.code}'),
      tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      shape: const Border(),
      collapsedShape: const Border(),
      iconColor: AppColors.primaryMain,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(row.name, style: const TextStyle(fontSize: 14))),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              row.result.toLowerCase() == 'neg' ? 'Negative' : row.result,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ],
      ),
      subtitle: warnings.isEmpty
          ? null
          : Text(
              warnings.join(' · '),
              style: TextStyle(color: Colors.orange.shade900, fontSize: 11),
            ),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timing
                    ? 'Reported time matches $seconds s schedule'
                    : seconds == null
                    ? 'Reading time is unverified for this analyte.'
                    : 'Requires $seconds s after dipping; this photo is for image review only.',
              ),
              const SizedBox(height: 6),
              Text(
                confidence == null
                    ? 'Per-analyte confidence was not recorded.'
                    : 'Vote confidence: ${(confidence * 100).toStringAsFixed(0)}%${lowConfidence ? ' · provisional' : ''}',
              ),
              const Text(
                'Neighbor agreement is not a calibrated probability.',
                style: TextStyle(fontSize: 11),
              ),
              const SizedBox(height: 6),
              Text('Reference: ${row.referenceRange}'),
            ],
          ),
        ),
      ],
    );
  }
}
