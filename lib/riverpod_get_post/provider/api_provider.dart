import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/riverpod_get_post/model/api_response_model.dart';
import 'package:nodejs_tut/riverpod_get_post/controller/controller.dart';
import 'package:nodejs_tut/riverpod_get_post/model/create_user_model.dart';

//get
final apiProvider = FutureProvider.autoDispose<ApiResponseModel>((ref) async {
  return Apihelper.fetchData();
});
//post

final userProvider = StateNotifierProvider<UserNotifier, CreateUserResponse?>((
  ref,
) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<CreateUserResponse?> {
  UserNotifier() : super(null);

  Future<void> createUser(String name, String job, WidgetRef ref) async {
    try {
      ref.read(loadingProvider.notifier).state = true;
      final user = await Apihelper.createUser(name: name, job: job);
      state = user;
    } catch (e) {
      ref.read(loadingProvider.notifier).state = false;
      state = null;
      if (kDebugMode) {
        print(e);
      }
    } finally {
      ref.read(loadingProvider.notifier).state = false;
    }
  }
}

final loadingProvider = StateProvider<bool>((ref) => false);
