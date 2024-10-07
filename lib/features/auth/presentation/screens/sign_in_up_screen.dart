import 'package:clean_arch_learn/core/utils.dart';
import 'package:clean_arch_learn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_learn/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInUpScreen extends StatefulWidget {
  const SignInUpScreen({super.key});

  @override
  _SignInUpScreenState createState() => _SignInUpScreenState();
}

class _SignInUpScreenState extends State<SignInUpScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSequre = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state.status.isSuccess) Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        },
        builder: (context, state) => PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            _buildRegisterScreen(context,
            email: _emailController.text.trim(), 
            password: _passwordController.text.trim(),
            status: state.status,
            ),
            _buildLoginScreen(context,
            email: _emailController.text.trim(), 
            password: _passwordController.text.trim(),
            status: state.status,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterScreen(BuildContext context, {required String email, required String password, required AuthStateStatus status}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Register',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          16.height,
          _buildEmailTextField(),
          16.height,
          _buildPasswordTextField(),
          16.height,
          _buildSubmitButton(title: 'Register', (){
            AuthBloc.get(context).add(RegisterEvent(context, email: email, password: password));
          }),
          32.height,
          _buildFooterButton(
            'Have an account? Login',
            () => _pageController.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginScreen(BuildContext context, {required String email, required String password, required AuthStateStatus status}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          16.height,
          _buildEmailTextField(),
          16.height,
          _buildPasswordTextField(),
          16.height,
          _buildSubmitButton(title: 'Login', (){
            AuthBloc.get(context).add(LoginEvent(context, email: email, password: password));
          }),
          32.height,
          _buildFooterButton(
            'Not registered yet? Register',
            () => _pageController.animateToPage(0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: _isSequre,
      decoration: InputDecoration(
         suffixIcon: InkWell(
          onTap: () => setState(() {
            _isSequre=!_isSequre;
          }),
          child: _isSequre ? const Icon(Icons.lock_outline) : const Icon(Icons.lock_open)),
        labelText: 'Password',
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSubmitButton(Function() onPressed, {required String title}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }

  Widget _buildFooterButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
