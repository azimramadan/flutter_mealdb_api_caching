import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/meal.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/meal_remote_datasource.dart';

/// Implementation of MealRepository
/// Handles data operations and converts exceptions to failures
class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;

  MealRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Meal>>> getMeals({int page = 0}) async {
    try {
      // Call remote data source
      final mealModels = await remoteDataSource.getMeals(page: page);

      // Return success
      return Right(mealModels.cast<Meal>());
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on GenericNetworkException catch (e) {
      return Left(GenericNetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> searchMeals(String query) async {
    try {
      // Call remote data source
      final mealModels = await remoteDataSource.searchMeals(query);

      // Return success
      return Right(mealModels.cast<Meal>());
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on GenericNetworkException catch (e) {
      return Left(GenericNetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }
}
