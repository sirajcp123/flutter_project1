import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final a = Provider<String>((ref) => "Hi Rashid");

class Main extends ConsumerStatefulWidget {
  const Main({Key? key}) : super(key: key);

  _Main createState() => _Main();
}

class _Main extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) {
    final b = ref.watch(a);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(b),
          ],
        ),
      ),
    );
  }
}
