import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../models/dipstick_results_data.dart';
import '../models/strip_reading_schedule.dart';

/// Readable strip values; reference ranges are available on demand.
class DipstickResultsTable extends StatelessWidget {
  final List<DipstickResultRow> rows;
  final Map<String, double> analyteConfidences;
  final double requiredConfidence;
  final double? secondsAfterDipping;
  const DipstickResultsTable({
    super.key,
    required this.rows,
    this.analyteConfidences = const {},
    this.requiredConfidence = 0.55,
    this.secondsAfterDipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Analyte',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Strip reading',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          for (final row in rows) ...[
            const Divider(height: 1, color: AppColors.border),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      row.name,
                      style: const TextStyle(color: AppColors.textPrimary),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          row.result.toLowerCase() == 'neg'
                              ? 'Negative'
                              : row.result,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          StripReadingSchedule.reportedTimeMatches(
                                row.code,
                                secondsAfterDipping,
                              )
                              ? 'Reported time matches ${StripReadingSchedule.secondsByCode[row.code]} s schedule'
                              : 'Image review only · requires ${StripReadingSchedule.secondsByCode[row.code]} s',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                StripReadingSchedule.reportedTimeMatches(
                                  row.code,
                                  secondsAfterDipping,
                                )
                                ? AppColors.textPrimary
                                : Colors.orange.shade900,
                          ),
                        ),
                        if (analyteConfidences[row.name] != null)
                          Text(
                            'Vote confidence: ${(analyteConfidences[row.name]! * 100).toStringAsFixed(0)}%${analyteConfidences[row.name]! < requiredConfidence ? ' ? provisional' : ''}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 11,
                              color:
                                  analyteConfidences[row.name]! <
                                      requiredConfidence
                                  ? Colors.orange.shade900
                                  : AppColors.textPrimary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          const Divider(height: 1, color: AppColors.border),
          ExpansionTile(
            title: const Text(
              'Reference ranges',
              style: TextStyle(fontSize: 14),
            ),
            shape: const Border(),
            collapsedShape: const Border(),
            children: [
              for (final row in rows)
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          row.name,
                          style: const TextStyle(color: AppColors.textPrimary),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          row.referenceRange,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
