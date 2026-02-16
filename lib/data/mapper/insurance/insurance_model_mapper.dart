import 'package:machine_learning_x_flutter/data/models/insurance/insurance_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';

extension InsuranceModelMapper on InsuranceModel {
  InsuranceEntity toEntity() {
    return InsuranceEntity(
      description: description,
      predictedCharges: predictedCharges,
      riskCategory: riskCategory,
    );
  }
}
