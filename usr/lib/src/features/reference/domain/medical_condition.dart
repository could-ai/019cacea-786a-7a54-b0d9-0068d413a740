enum ConditionType {
  infection,
  syndrome,
}

class MedicalCondition {
  final String id;
  final String name;
  final String shortName;
  final ConditionType type;
  final String definition;
  final String riskFactors;
  final String cd4Threshold;
  final String symptoms;
  final String diagnosis;
  final String primaryProphylaxis;
  final String treatment;
  final String secondaryProphylaxis;
  final String artTiming;
  final String irisRisk;

  const MedicalCondition({
    required this.id,
    required this.name,
    required this.shortName,
    required this.type,
    required this.definition,
    required this.riskFactors,
    required this.cd4Threshold,
    required this.symptoms,
    required this.diagnosis,
    required this.primaryProphylaxis,
    required this.treatment,
    required this.secondaryProphylaxis,
    required this.artTiming,
    required this.irisRisk,
  });
}
