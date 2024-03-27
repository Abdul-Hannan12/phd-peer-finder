import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phd_peer/core/constants/colors.dart';
import 'package:phd_peer/ui/screens/splash_screen.dart';
import 'core/constants/hive_boxes.dart';
import 'firebase_options.dart';

void main() async {
  // await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  // await setupLocator();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  userBox = await Hive.openBox(userBoxName);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              modalBackgroundColor: Colors.transparent),
          appBarTheme: const AppBarTheme(
            shadowColor: backgoundColor,
            backgroundColor: backgoundColor,
            foregroundColor: backgoundColor,
            surfaceTintColor: backgoundColor,
          ),
          scaffoldBackgroundColor: backgoundColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primaryColor,
            secondary: backgoundColor,
          ),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
