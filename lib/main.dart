import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mbudzi/features/navigation/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Navigation(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: const MaterialColor(
            0xffFC8F22,
            {
              50: Color.fromRGBO(252, 143, 34, .1),
              100: Color.fromRGBO(252, 143, 34, .2),
              200: Color.fromRGBO(252, 143, 34, .3),
              300: Color.fromRGBO(252, 143, 34, .4),
              400: Color.fromRGBO(252, 143, 34, .5),
              500: Color.fromRGBO(252, 143, 34, .6),
              600: Color.fromRGBO(252, 143, 34, .7),
              700: Color.fromRGBO(252, 143, 34, .8),
              800: Color.fromRGBO(252, 143, 34, .9),
              900: Color.fromRGBO(252, 143, 34, 1),
            },
          ),
        ));
  }
}
