import 'package:dartz/dartz.dart';
import 'package:mealdb_api_caching/features/meals/domain/entities/meal.dart';

import '../../../../core/errors/failures.dart';

/// Repository interface - defines what data operations are needed
/// Implementation details are in data layer
abstract class MealRepository {
  Future<Either<Failure, List<Meal>>> getMeals();

  Future<Either<Failure, List<Meal>>> searchMeals(String query);
}
