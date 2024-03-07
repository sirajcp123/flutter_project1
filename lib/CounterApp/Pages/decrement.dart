import 'package:flutter/material.dart';
import 'package:state_management/CounterApp/Pages/increament.dart';
// import 'package:state_management/Pages/increament.dart';
// import 'package:state_management/Pages/increament.dart';
// import 'package:state_management/value%20notifire.dart';

class Decrement extends StatefulWidget {
  // const Decrement({super.key});
  dynamic count = 0;
  Decrement({required this.count,super.key});

  @override
  State<Decrement> createState() => _DecrementState();
}

class _DecrementState extends State<Decrement> {
  // int count = 0;
  int con = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decrement counter'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => Icrement(count: con))),
              child: const Text("GO"))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Count:${con = widget.count}",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          IconButton(
              onPressed: () {
                if (con >= widget.count) {
                  setState(() {
                    widget.count -= 1;
                  });
                }
              },
              icon: const Icon(Icons.remove))
        ],
      ),
    );
  }
}
