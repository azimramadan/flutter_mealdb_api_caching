import '../models/meal_model.dart';

/// Interface for remote data source
/// Defines API operations
abstract class MealRemoteDataSource {
  Future<List<MealModel>> getMeals({int page = 0});
  Future<List<MealModel>> searchMeals(String query);
}
