import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lati_marvel/helpers/consts.dart';
import 'package:lati_marvel/screens/home_screen.dart';
import 'package:lati_marvel/providers/baseProvider.dart';
import 'package:lati_marvel/providers/auth_provider.dart';
import 'package:lati_marvel/providers/moviesProvider.dart';
import 'package:lati_marvel/screens/auth/splashScreen.dart';
import 'package:lati_marvel/screens/auth/login_screern.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get mainColor => null;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseProvider>(
          create: (context) => BaseProvider(),
        ),
        ChangeNotifierProvider<MoviesProvider>(
          create: (context) => MoviesProvider(),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel',
        theme: ThemeData(
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: mainColor,
            confirmButtonStyle: ButtonStyle(
              textStyle: WidgetStatePropertyAll(TextStyle(color: mainColor)),
            ),
            cancelButtonStyle: ButtonStyle(
                textStyle: WidgetStatePropertyAll(TextStyle(color: mainColor))),
            inputDecorationTheme: InputDecorationTheme(
              helperStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            // labelStyle: TextStyle(color: Colors.black87),
            // textTheme: GoogleFonts.almaraiTextTheme(),
            // colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
            // useMaterial3: false,
            // appBarTheme: const AppBarTheme(
            //   iconTheme: IconThemeData(color: Colors.black),
            //   backgroundColor: Colors.white,
            //   elevation: 0,
            //   centerTitle: true,
            // ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .initializeAuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, authenticationConsumer, child) {
        return AnimatedSwitcher(
          duration: animationDuration,
          child: authenticationConsumer.authenticated
              ? HomeScreen()
              : LoginScreen(),
        );
      },
    );
  }
}
