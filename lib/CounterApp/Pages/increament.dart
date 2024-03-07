import 'package:flutter/material.dart';
import 'package:state_management/CounterApp/Pages/decrement.dart';
// import 'package:state_management/Pages/increament.dart';
// import 'package:state_management/Pages/increament.dart';
// import 'package:state_management/Pages/increament.dart';
// import 'package:state_management/value%20notifire.dart';

class Icrement extends StatefulWidget {
  // const Decrement({super.key});
  dynamic count = 0;
  Icrement({required this.count, super.key});

  @override
  State<Icrement> createState() => _IcrementState();
}

class _IcrementState extends State<Icrement> {
  // int count = 0;
  int con = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment counter'),
        actions: [
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Decrement(
                            count: con,
                          ))),
              child: const Text("Go"))
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
                if (con <= widget.count) {
                  setState(() {
                    widget.count += 1;
                  });
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
