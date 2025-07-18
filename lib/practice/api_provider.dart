import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/practice/api_response_model.dart';
import 'package:nodejs_tut/practice/controller.dart';

final apiProvider = FutureProvider.autoDispose<ApiResponseModel>((ref) async {
  return Apihelper.fetchData();
});
