import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/ContactApp/viw_screen.dart';
// import 'package:state_management/Revorpod/state_notefier_providor.dart';
// import 'package:state_management/Revorpod/consumerStateFulWiget.dart';
// import 'package:state_management/Revorpod/state_provider.dart';
// import 'package:state_management/ChangeNotier%20&%20inheriterWidget/Product_List/poduct_list_screen.dart';
// import 'package:state_management/ChangeNotier%20&%20inheriterWidget/Servies/cart_Servies.dart';
// import 'package:state_management/ChangeNotier%20&%20inheriterWidget/Servies/productServies.dart';

// import 'package:state_management/CounterApp/View/increment_Notifier.dart';
// import 'package:state_management/CounterApp/Pages/increament.dart';
// import 'package:state_management/value%20notifire.dart';
// final pr = Provider((ref) => 'hello World');

// final counterPro =
//     StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

//it is a provaider(state management tools.....)
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello",
      home:ViewScreen(),
    );
  }
}

// class Example extends ConsumerWidget {
//   const Example({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final pr1 = ref.watch(pr);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title:const Text("MyApp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: Center(child: Text(pr1.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold ),),),
//     );
//   }
// }
// class Example extends StatelessWidget {
//   const Example({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Reverpod"),
//         centerTitle: true,
//         backgroundColor: Colors.blue[300],
//       ),
//       body: Center(
//         child: Consumer(builder: (context, ref, child) {
//           final name = ref.watch(pr);
//           return Text(name);
//         }),
//       ),
//     );
//   }
// }
// class CartContainer extends InheritedWidget {
//   final CartServies cartServies;
//   const CartContainer({required this.cartServies, required super.child,super.key});
//   @override
//   bool updateShouldNotify(CartContainer oldWidget) {
//     return oldWidget.cartServies != cartServies;
//   }

//   static CartServies of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<CartContainer>()!
//         .cartServies;
//   }
// }

// class ProductContainer extends InheritedWidget {
//   final ProductServies productServies;
//   const ProductContainer({required this.productServies, required super.child,super.key});
//   @override
//   bool updateShouldNotify(ProductContainer oldWidget) {
//     return oldWidget.productServies != productServies;
//   }

//   static ProductServies of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<ProductContainer>()!
//         .productServies;
//   }
// }
