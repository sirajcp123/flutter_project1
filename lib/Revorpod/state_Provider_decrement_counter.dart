import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/Revorpod/state_provider.dart';

class DecrementCounter extends ConsumerWidget {
  const DecrementCounter({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count1 = ref.watch(counter);
    return Scaffold(
      appBar: AppBar(
          title: const Text("Decrement Counter"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  return ref.refresh(counter);
                },
                icon: const Icon(Icons.refresh)),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count:${count1.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              onPressed: () {
                if (count1 > 0) {
                  ref.read(counter.notifier).state--;
                }
                //---first way
                //scond way
                // ref.read(counter.notifier).update((state) => state++);
              },
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
