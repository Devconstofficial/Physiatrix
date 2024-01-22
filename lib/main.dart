import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/UserProfiling/googlesigin.dart';
import 'package:physiatrix/Screens/UserProfiling/login.dart';
import 'package:physiatrix/empty.dart';
import 'package:physiatrix/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => GoogleSigninProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My App',
            initialRoute: SplashScreen.id,
            routes: {
              SplashScreen.id: (context) => const SplashScreen(),
              Empty1.id: (context) => const Empty1(),
            },
            home: Consumer<GoogleSigninProvider>(
              builder: (context, googleSigninProvider, child) {
                if (googleSigninProvider.user != null) {
                  return const Empty1();
                } else {
                  return child!;
                }
              },
              child: const Login(
                role: '',
              ),
            ),
            theme: ThemeData(
              unselectedWidgetColor: Colors.white,
              primarySwatch: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
