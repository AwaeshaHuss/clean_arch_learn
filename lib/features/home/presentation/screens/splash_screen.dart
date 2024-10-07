import 'package:clean_arch_learn/core/assets/app_assets.dart';
import 'package:clean_arch_learn/core/strings.dart';
import 'package:clean_arch_learn/features/auth/presentation/screens/sign_in_up_screen.dart';
import 'package:clean_arch_learn/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(seconds: 4)).whenComplete(() => _checkeUserLoggedIn());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppAssets.todosAnimation,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
  
  void _checkeUserLoggedIn() async{
    if(mounted){
      if(uToken.isNotEmpty){
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      }else{
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInUpScreen()),
      );
      }
    }
  }
}