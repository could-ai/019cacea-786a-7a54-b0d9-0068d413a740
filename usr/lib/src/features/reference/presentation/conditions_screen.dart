import 'package:flutter/material.dart';
import 'package:couldai_user_app/src/features/reference/data/conditions_data.dart';
import 'package:couldai_user_app/src/features/reference/domain/medical_condition.dart';

class ConditionsScreen extends StatelessWidget {
  const ConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Conditions'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/compare');
            },
            icon: const Icon(Icons.compare_arrows),
            label: const Text('Compare All'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ConditionsData.conditions.length,
        itemBuilder: (context, index) {
          final condition = ConditionsData.conditions[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                condition.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    condition.definition,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  if (condition.cd4Threshold != 'N/A')
                    Chip(
                      label: Text('CD4 Threshold: ${condition.cd4Threshold}'),
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/condition-detail',
                  arguments: condition,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
