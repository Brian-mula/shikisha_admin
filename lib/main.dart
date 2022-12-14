import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/views/home_page.dart';
import 'package:shikishaadmin/views/order.dart';
import 'package:shikishaadmin/views/orders.dart';
import 'package:shikishaadmin/views/seller.dart';
import 'package:shikishaadmin/views/sellers.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const HomeScreen(),
        '/sellers': (context) => const Sellers(),
        '/seller': (context) => const Seller(),
        '/orders': (context) => const Orders(),
        '/order': (context) => const Order()
      },
    );
  }
}
