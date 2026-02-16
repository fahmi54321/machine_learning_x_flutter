import 'package:machine_learning_x_flutter/presentation/core/params/params.dart';

class InsuranceParams extends Params {
  final int age;
  final String sex;
  final String bmi;
  final int children;
  final String smoker;
  final String region;
  InsuranceParams({
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
