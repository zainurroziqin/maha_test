import 'package:flutter/material.dart';
import 'package:maha_test/application/pages/home_page.dart';
import 'injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Maha Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
          ),
          home: const HomePage(),
        );
      }
}