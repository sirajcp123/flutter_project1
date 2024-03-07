import 'package:flutter/material.dart';
import 'package:state_management/CounterApp/Controllor/value_Notifier.dart';
import 'package:state_management/CounterApp/View/decrement_Notifier.dart';

class IncrementNotifier extends StatelessWidget {
  const IncrementNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment Counter"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DecrementNotifier())),
              icon: const Text("Go"))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: vNote,
                builder: (context, value, _) {
                  return Text(
                    "Count: $value",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  );
                }),
            FloatingActionButton(
              onPressed: () {
                vNote.value++;
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
