import 'package:equatable/equatable.dart';

/// Pure Dart class representing a Meal
/// No dependencies on Flutter or external packages (except Equatable for comparison)
class Meal extends Equatable {
  final String id;
  final String name;
  final String? category;
  final String? area;
  final String? instructions;
  final String? thumbnail;

  const Meal({
    required this.id,
    required this.name,
    this.category,
    this.area,
    this.instructions,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    area,
    instructions,
    thumbnail,
  ];

  @override
  bool get stringify => true;
}
