import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/riverpod_get_post/counter_app/riverpod/counter_provider.dart';

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Building all of these");

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, WidgetRef ref, Widget? child) {
                final data = ref.watch(counterProvider);
                return Text(data.toString(), style: TextStyle(fontSize: 40));
              },
            ),
          ],
        ),
      ),
    );
  }
}
