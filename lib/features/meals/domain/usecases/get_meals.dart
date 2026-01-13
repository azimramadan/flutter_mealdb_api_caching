import 'package:dartz/dartz.dart';
import 'package:mealdb_api_caching/core/constants/meal_db_api_constants.dart';
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
  Future<Either<Failure, List<Meal>>> call({int page = 0}) async {
    if (page < 0 || page > TheMealDbApiConstants.maxpage) {
      return Left(
        InvalidInputFailure(
          'Page number must be between 0 and ${TheMealDbApiConstants.maxpage}',
        ),
      );
    }
    return await repository.getMeals(page: page);
  }
}
