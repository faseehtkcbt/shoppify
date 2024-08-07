import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/bloc_providers.dart';
import 'package:nasa_api/routes.dart';

import 'features/splash/presentation/pages/splash_screen.dart';

var height;
var width;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // To properly connect project with firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCcHo8m1rL-NqhyIp1ngDTqnalYxzzO2GA",
        appId: "1:617334604013:android:d33be2174c84b2ae2d8ce4",

        projectId: "shoppiy", messagingSenderId: '',
        ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: MaterialApp(
          title: 'Shoppify',
          debugShowCheckedModeBanner: false,
          routes: Routes.routes,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
  }
}
