import 'package:machine_learning_x_flutter/domain/entities/params/params_entity.dart';

class InsuranceParamsEntity extends ParamsEntity {
  final int age;
  final String sex;
  final String bmi;
  final int children;
  final String smoker;
  final String region;
  InsuranceParamsEntity({
    required this.age,
    required this.sex,
    required this.bmi,
    required this.children,
    required this.smoker,
    required this.region,
  });

  @override
  List<Object?> get props => [age, sex, bmi, children, smoker, region];
}
