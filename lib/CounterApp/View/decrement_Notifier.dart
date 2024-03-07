import 'package:flutter/material.dart';
import 'package:state_management/CounterApp/Controllor/value_Notifier.dart';

class DecrementNotifier extends StatelessWidget {
  const DecrementNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decrement Counter"),
        actions: [IconButton(onPressed: () =>Navigator.pop(context), icon: const Text("Go"))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: vNote,
                builder: (context, value, _) {
                  return Text("Count: $value",style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
                }),
            FloatingActionButton(
              onPressed: () {
                vNote.value--;
              },
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
