abstract class TheMealDbApiConstants {
  /// Note: Ensure baseUrl ends with '/' and endpoint **does not** start with '/'
  /// so that Dio can correctly concatenate them into a valid URL.

  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  static const Duration timeout = Duration(seconds: 30);

  static const String listEndpoint = 'list.php';
  static const String filterEndpoint = 'filter.php';

  /// 'listValue' is used with listEndpoint to fetch all categories.
  /// For filterEndpoint, 'c' takes a specific category name instead of 'listValue'.
  static const String categoryParam = 'c';
  static const String listValue = 'list';
}
