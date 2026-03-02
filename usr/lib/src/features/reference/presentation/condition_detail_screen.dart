import 'package:flutter/material.dart';
import 'package:couldai_user_app/src/features/reference/domain/medical_condition.dart';

class ConditionDetailScreen extends StatelessWidget {
  const ConditionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final condition = ModalRoute.of(context)!.settings.arguments as MedicalCondition;

    return Scaffold(
      appBar: AppBar(
        title: Text(condition.shortName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              condition.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 24),
            _buildSection(context, 'Definition', condition.definition),
            _buildSection(context, 'CD4 Threshold', condition.cd4Threshold),
            _buildSection(context, 'Risk Factors', condition.riskFactors),
            _buildSection(context, 'Signs & Symptoms', condition.symptoms),
            _buildSection(context, 'Diagnosis', condition.diagnosis),
            const Divider(height: 32),
            _buildSection(context, 'Primary Prophylaxis', condition.primaryProphylaxis),
            _buildSection(context, 'Treatment', condition.treatment),
            _buildSection(context, 'Secondary Prophylaxis', condition.secondaryProphylaxis),
            const Divider(height: 32),
            _buildSection(context, 'ART Timing', condition.artTiming),
            _buildSection(context, 'IRIS Risk', condition.irisRisk),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    if (content.isEmpty || content == 'N/A') return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}
