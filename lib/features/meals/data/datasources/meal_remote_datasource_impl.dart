import 'package:mealdb_api_caching/core/constants/meal_db_api_constants.dart';
import 'package:mealdb_api_caching/core/network/dio_client.dart';
import 'package:mealdb_api_caching/features/meals/data/datasources/meal_remote_datasource.dart';
import 'package:mealdb_api_caching/features/meals/data/models/meal_model.dart';

class MealRemoteDatasourceImpl implements MealRemoteDataSource {
  DioClient dioClient;
  MealRemoteDatasourceImpl({required this.dioClient});
  @override
  Future<List<MealModel>> getMeals({int page = 0}) async {
    final response = await dioClient.get(
      TheMealDbApiConstants.filterEndpoint,
      queryParameters: {
        TheMealDbApiConstants.categoryParam:
            TheMealDbApiConstants.mealCategories[page],
      },
    );

    final mealsJson = response['meals'] as List<dynamic>? ?? [];

    return mealsJson
        .map((json) => MealModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<MealModel>> searchMeals(String query) async {
    final response = await dioClient.get(
      TheMealDbApiConstants.searchEndpoint,
      queryParameters: {TheMealDbApiConstants.searchParam: query},
    );

    final mealsJson = response['meals'] as List<dynamic>? ?? [];

    return mealsJson
        .map((json) => MealModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
