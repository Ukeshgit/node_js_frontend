import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/riverpod_get_post/provider/api_provider.dart';
import 'package:nodejs_tut/riverpod_get_post/view/create_user_view.dart';

class RegData extends ConsumerWidget {
  const RegData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var apidata = ref.watch(apiProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateUserView();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("API"), backgroundColor: Colors.deepPurple),
      body: Container(
        child: apidata.when(
          data: (data) {
            return Container(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(data.data[index].name),
                      Text(data.data[index].year.toString()),
                      Text(data.data[index].pantoneValue),
                    ],
                  );
                },
              ),
            );
          },
          error: (error, StackTrace) {
            print(error);
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
