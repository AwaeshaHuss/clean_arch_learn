import 'package:clean_arch_learn/config/bloc_observer.dart';
import 'package:clean_arch_learn/config/bloc_providers.dart';
import 'package:clean_arch_learn/config/cache/cache_helper.dart';
import 'package:clean_arch_learn/features/home/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_learn/config/injection_container.dart' as di show init;
import 'package:flutter_bloc/flutter_bloc.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  Bloc.observer = AppBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return blocProviders(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'clean arch learn',
        home: SplashScreen(),
      ),
    );
  }
}