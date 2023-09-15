// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:next_life/pages.dart';
import 'package:page_transition/page_transition.dart';
import "./auth_tabs/onboarding.dart";
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../amplifyconfiguration.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/transfer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    _configureAmplify();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured');
      // await handleSuccessfulLogin();
      final authStatus = await Amplify.Auth.fetchAuthSession();
      if(authStatus.isSignedIn) Navigator.pushNamed(context, "/");
    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

  // Future<void> handleSuccessfulLogin() async {
  //   final authStatus = await Amplify.Auth.fetchAuthSession();
  //   if(!authStatus.isSignedIn) return;
  //   try {
  //     final result = await Amplify.Auth.fetchUserAttributes();
  //
  //     for (final element in result) {
  //       if (element.userAttributeKey == AuthUserAttributeKey.sub) {
  //         userId = element.value;
  //         getTableDataFromAWS();
  //       }
  //     }
  //
  //     Navigator.push(
  //       context,
  //       PageTransition(
  //         child: const OnBoarding(),
  //         type: PageTransitionType.rightToLeft,
  //       ),
  //     );
  //   } on AuthException catch (e) {
  //     safePrint('Error fetching user attributes: ${e.message}');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      // `authenticatorBuilder` is used to customize the UI for one or more steps
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
              child: CustomScaffold(
                  state: state,
                  // A prebuilt Sign In form from amplify_authenticator
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // SignInForm(),
                      Column(
                        children: <Widget>[
                          TextFormField(
                            controller: usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          TextButton(
                            onPressed: () async {
                              final email = usernameController.text;
                              final password = passwordController.text;
                              sendData.email = email;
                              sendData.password = password;
                              // Handle login here using Amplify or other authentication method
                              try {
                                final result = await Amplify.Auth.signIn(
                                  username: email,
                                  password: password,
                                );
                                if (result.isSignedIn) {
                                  Navigator.pushNamed(context, "/");
                                  // await handleSuccessfulLogin();
                                } else {
                                  // Handle login failure
                                  safePrint('Sign in failed');
                                }
                              } catch (e) {
                                // Handle login error
                                safePrint('Error during login: $e');
                              }
                            },
                            child: const Text('SignIn'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 0.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () => state.changeStep(
                              AuthenticatorStep.signUp,
                            ),
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                color: Color(0xFF949494),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.42),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                color: Color(0xFF949494),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: const Color(0xFFC3C3C3)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Image(
                                    image:
                                    AssetImage('assets/meta/google.png')),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Sign-in with Google',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: const Color(0xFFC3C3C3)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/meta/ic_twotone-apple.png')),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Sign-in with Apple',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: const Color(0xFFC3C3C3)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/meta/logos_facebook.png')),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Sign-in with Facebook',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: const Color(0xFFC3C3C3)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/meta/ri_amazon-fill.png')),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Sign-in with Amazon',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          case AuthenticatorStep.signUp:
            return Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
              child: CustomScaffold(
                state: state,
                // A prebuilt Sign Up form from amplify_authenticator
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 55),
                    const Text(
                      'Signup',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SignUpForm(),
                  ],
                ),
                // A custom footer with a button to take the user to sign in
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signIn,
                      ),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),
            );
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              // A prebuilt Confirm Sign Up form from amplify_authenticator
              body: ConfirmSignUpForm(),
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              // A prebuilt Reset Password form from amplify_authenticator
              body: ResetPasswordForm(),
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              // A prebuilt Confirm Reset Password form from amplify_authenticator
              body: const ConfirmResetPasswordForm(),
            );
          default:
          // Returning null defaults to the prebuilt authenticator for all other steps
            return null;
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: Authenticator.builder(),
        home: GestureDetector(
          onTap: () async {
            try {
              final result = await Amplify.Auth.fetchUserAttributes();

              for (final element in result) {
                if (element.userAttributeKey == AuthUserAttributeKey.sub) {
                  userId = element.value;
                  getTableDataFromAWS();
                }
              }
            } on AuthException catch (e) {
              safePrint('Error fetching user attributes: ${e.message}');
            }

            Navigator.push(
              context,
              PageTransition(
                child: const OnBoarding(),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.state,
    required this.body,
    this.footer,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App logo
              const Padding(
                padding: EdgeInsets.only(top: 10),
                // child: Center(child: FlutterLogo(size: 100)),
                child: Image(
                  image: AssetImage('assets/meta/logo.png'),
                  width: 150,
                  // width: logoWidth,
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: body,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
    );
  }
}
