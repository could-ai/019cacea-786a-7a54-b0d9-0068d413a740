import 'package:flutter/material.dart';
import 'package:couldai_user_app/src/features/reference/data/conditions_data.dart';
import 'package:couldai_user_app/src/features/reference/domain/medical_condition.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter out IRIS for the main comparison table as it's a syndrome, not an OI with same attributes
    final conditions = ConditionsData.conditions.where((c) => c.type == ConditionType.infection).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Condition Comparison'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 24,
            headingRowColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            columns: const [
              DataColumn(label: Text('Condition', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('CD4 Threshold', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Primary Prophylaxis', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Treatment (1st Line)', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('ART Timing', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: conditions.map((condition) {
              return DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: 120,
                      child: Text(
                        condition.shortName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                       Navigator.pushNamed(
                        context,
                        '/condition-detail',
                        arguments: condition,
                      );
                    },
                  ),
                  DataCell(Text(condition.cd4Threshold)),
                  DataCell(
                    SizedBox(
                      width: 200,
                      child: Text(
                        _truncate(condition.primaryProphylaxis),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 200,
                      child: Text(
                        _truncate(condition.treatment),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 150,
                      child: Text(
                        condition.artTiming,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  String _truncate(String text) {
    // Helper to clean up long text for table view
    final firstSentence = text.split('.').first;
    if (firstSentence.length > 100) {
      return '${firstSentence.substring(0, 100)}...';
    }
    return firstSentence;
  }
}
