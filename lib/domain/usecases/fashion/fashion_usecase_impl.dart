import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/domain/entities/fashion/fashion_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/fashion/fashion_repository.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/fashion/fashion_usecase.dart';

class FashionUsecaseImpl implements FashionUsecase {
  final FashionRepository fashionRepository;
  const FashionUsecaseImpl({required this.fashionRepository});
  @override
  Future<Either<Failure, FashionEntity>> predict() {
    return fashionRepository.predict();
  }
}
