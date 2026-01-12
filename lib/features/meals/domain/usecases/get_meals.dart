import 'package:dartz/dartz.dart';
import 'package:mealdb_api_caching/features/meals/domain/entities/meal.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/meal_repository.dart';

/// UseCase to get all meals
/// Follows Single Responsibility Principle
class GetMeals {
  final MealRepository repository;

  GetMeals(this.repository);

  /// Execute the use case
  /// Returns Either<Failure, List<Meal>>
  Future<Either<Failure, List<Meal>>> call() async {
    return await repository.getMeals();
  }
}
