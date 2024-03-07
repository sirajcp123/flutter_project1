import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/main.dart';

class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);
  void increment() {
    state++;
  }

 
}

class STP extends ConsumerWidget {
  const STP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pro = ref.watch(counterPro);
    return Scaffold(
      body: Text("Count:$pro"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterPro.notifier).increment();
          if (pro == 10) {
            ref.refresh(counterPro);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
