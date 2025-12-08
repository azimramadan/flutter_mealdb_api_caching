import 'package:get_it/get_it.dart';
import 'package:mealdb_api_caching/core/constants/meal_db_api_constants.dart';
import 'package:mealdb_api_caching/core/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: TheMealDbApiConstants.baseUrl),
  );
}
