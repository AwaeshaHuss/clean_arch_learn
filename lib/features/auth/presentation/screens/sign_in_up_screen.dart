import 'package:clean_arch_learn/core/utils.dart';
import 'package:clean_arch_learn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_learn/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInUpScreen extends StatefulWidget {
  const SignInUpScreen({super.key});

  @override
  _SignInUpScreenState createState() => _SignInUpScreenState();
}

class _SignInUpScreenState extends State<SignInUpScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();
  final TextEditingController _registerEmailController = TextEditingController();
  final TextEditingController _registerPasswordController = TextEditingController();
  bool _isSequre = true;
  bool _visiable = false;

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
            email: _loginEmailController.text.trim(), 
            password: _loginPasswordController.text.trim(),
            status: state.status,
            ),
            _buildLoginScreen(context,
            email: _loginEmailController.text.trim(), 
            password: _loginPasswordController.text.trim(),
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
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          16.height,
          _buildRegisterEmailTextField(),
          16.height,
          _buildRegisterPasswordTextField(),
          16.height,
          _buildSubmitButton(title: 'Register', (){
            AuthBloc.get(context).add(RegisterEvent(context, email: email, password: password));
          }),
          22.height,
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
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          16.height,
          _buildLoginEmailTextField(),
          16.height,
          _buildLoginPasswordTextField(),
          16.height,
          _buildSubmitButton(title: 'Login', (){
            AuthBloc.get(context).add(LoginEvent(context, email: email, password: password));
          }),
          22.height,
          _buildFooterButton(
            'Not registered yet? Register',
            () => _pageController.animateToPage(0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut),
          ),
          22.height,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider()),
              Text(' Social '),
              Expanded(child: Divider()),
            ],
          ),
          22.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton.filledTonal(onPressed: (){
                //TODO ==> impl google signIn
              }, icon: const Icon(Icons.g_mobiledata_sharp)),
              IconButton.filledTonal(onPressed: (){
                //TODO ==> impl apple signIn
              }, icon: const Icon(Icons.apple)),
              IconButton.filledTonal(onPressed: (){
                //TODO ==> impl facebook signIn
              }, icon: const Icon(Icons.facebook)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLoginEmailTextField() {
    return Column(
      children: [
        TextField(
          controller: _loginEmailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
          ),
          onTap: () {
            setState(() {
              _visiable=!_visiable;
            });
          },
        ),
        AnimatedSwitcher(duration: const Duration(milliseconds: 320), transitionBuilder: (child, animation) {
          return SizeTransition(sizeFactor: animation, child: child);
        },
        child: _visiable ? Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    )
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Email 1'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 1 selected');
                          }
                          setState(() {
                            _visiable = false;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Email 2'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 2 selected');
                          }
                          setState(() {
                            _visiable = false;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Email 3'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 3 selected');
                          }
                          setState(() {
                            _visiable = false;
                          });
                        },
                      ),
                    ],
                  ),
                ) : null,
        )
      ],
    );
  }

  Widget _buildRegisterEmailTextField() {
    return TextField(
      controller: _registerEmailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
      ),
    );
  }

  Widget _buildLoginPasswordTextField() {
    return TextField(
      controller: _loginPasswordController,
      obscureText: _isSequre,
      decoration: InputDecoration(
         suffixIcon: InkWell(
          onTap: () => setState(() {
            _isSequre=!_isSequre;
          }),
          child: _isSequre ? const Icon(Icons.lock_outline) : const Icon(Icons.lock_open)),
        labelText: 'Password',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
      ),
    );
  }

  Widget _buildRegisterPasswordTextField() {
    return TextField(
      controller: _registerPasswordController,
      obscureText: _isSequre,
      decoration: InputDecoration(
         suffixIcon: InkWell(
          onTap: () => setState(() {
            _isSequre=!_isSequre;
          }),
          child: _isSequre ? const Icon(Icons.lock_outline) : const Icon(Icons.lock_open)),
        labelText: 'Password',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
      ),
    );
  }

  Widget _buildSubmitButton(Function() onPressed, {required String title}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 18.0),
        child: Text(title),
      ),
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
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
