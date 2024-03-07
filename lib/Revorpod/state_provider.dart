import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/Revorpod/state_Provider_decrement_counter.dart';

final counter = StateProvider<int>((ref) => 0);

class CounterProvider extends ConsumerWidget {
  const CounterProvider({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counter);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                return ref.refresh(counter);
              },
              icon: const Icon(Icons.refresh)),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) =>const DecrementCounter()));
            },
            child:const Text("GO"),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count:${count.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counter.notifier).state++; //---first way
                //scond way
                // ref.read(counter.notifier).update((state) => state++);
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
