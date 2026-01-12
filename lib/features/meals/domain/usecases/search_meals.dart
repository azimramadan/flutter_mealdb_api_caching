import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

/// UseCase to search meals by name
/// Accepts search query as parameter
class SearchMeals {
  final MealRepository repository;

  SearchMeals(this.repository);

  /// Execute the use case with search query
  /// Returns Either<Failure, List<Meal>>
  Future<Either<Failure, List<Meal>>> call(String query) async {
    // يمكن إضافة validations هنا
    if (query.isEmpty) {
      return Left(CacheFailure('Search query cannot be empty'));
    }

    return await repository.searchMeals(query);
  }
}
