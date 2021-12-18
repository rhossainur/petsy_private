import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/image_picker.dart';
import 'routes/route.dart' as route;
import 'package:provider/provider.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>AuthService()),
      ChangeNotifierProvider(create: (_)=>ImagePickingService())
    ],
  child: const MyApp(),));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petsy',
      theme: _customTheme(),
      onGenerateRoute: route.controller,
      initialRoute: route.driverClass,
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
ThemeData _customTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: createMaterialColor(const Color(0xFF6db784)),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0
    )
  );
}