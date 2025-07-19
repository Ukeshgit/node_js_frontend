import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/riverpod_get_post/controller/enum.dart';
import 'package:nodejs_tut/riverpod_get_post/provider/api_provider.dart';
import 'package:nodejs_tut/riverpod_get_post/provider/button_state_notifier.dart';

class CreateUserView extends ConsumerStatefulWidget {
  const CreateUserView({super.key});

  @override
  ConsumerState<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends ConsumerState<CreateUserView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final nameController = TextEditingController();
    final jobController = TextEditingController();
    final isLoading = ref.watch(loadingProvider);
    final buttonStatus = ref.watch(buttonProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Create User')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Job',
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed:
                  buttonStatus == ButtonStatus.loading
                      ? null
                      : () async {
                        ref.read(buttonProvider.notifier).setLoading();
                        final name = nameController.text;
                        final job = jobController.text;
                        await ref
                            .read(userProvider.notifier)
                            .createUser(name, job, ref);
                        ref.read(buttonProvider.notifier).setSuccess();
                      },

              child:
                  buttonStatus == ButtonStatus.loading
                      ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                      : Text("Submit"),
            ),
            SizedBox(height: 44),
            if (isLoading)
              CircularProgressIndicator()
            else if (user != null)
              Text(user.name),
            // ListView.builder(itemBuilder: (context, index) {
            //   return Text(user.name);
            // },)
          ],
        ),
      ),
    );
  }
}
