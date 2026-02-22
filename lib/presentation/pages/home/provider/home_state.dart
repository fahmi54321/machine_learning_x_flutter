import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/fashion_predictor_page.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/insurance_page.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/salaries_page.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/startup_page.dart';

class HomeState extends Equatable {
  final int currentIndex;
  final List<Widget> pages;
  const HomeState({required this.currentIndex, required this.pages});

  factory HomeState.initial() {
    return HomeState(
      currentIndex: 0,
      pages: [
        InsuranceWrapper(),
        SalariesPageWrapper(),
        StartupWrapper(),
        FashionPredictorWrapper(),
      ],
    );
  }

  HomeState copyWith({int? currentIndex, List<Widget>? pages}) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pages ?? this.pages,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [currentIndex, pages];
}
