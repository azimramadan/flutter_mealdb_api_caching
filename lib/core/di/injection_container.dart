import 'package:get_it/get_it.dart';
import 'package:mealdb_api_caching/core/constants/meal_db_api_constants.dart';
import 'package:mealdb_api_caching/core/network/dio_client.dart';
import 'package:mealdb_api_caching/features/meals/data/datasources/meal_remote_datasource.dart';
import 'package:mealdb_api_caching/features/meals/data/datasources/meal_remote_datasource_impl.dart';
import 'package:mealdb_api_caching/features/meals/data/repositories/meal_repository_impl.dart';
import 'package:mealdb_api_caching/features/meals/domain/repositories/meal_repository.dart';
import 'package:mealdb_api_caching/features/meals/domain/usecases/get_meals.dart';
import 'package:mealdb_api_caching/features/meals/domain/usecases/search_meals.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: TheMealDbApiConstants.baseUrl),
  );

  sl.registerLazySingleton<MealRemoteDataSource>(
    () => MealRemoteDatasourceImpl(dioClient: sl()),
  );

  sl.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(remoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetMeals(sl()));
  sl.registerLazySingleton(() => SearchMeals(sl()));
}
