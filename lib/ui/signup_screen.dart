import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
// import 'package:plant_app/ui/root_page.dart';
import 'package:plant_app/ui/screens/widgets/custom_textfield.dart';
import 'package:plant_app/ui/signin_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signup.png'),
              const Text(
                'Đăng ký',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextfield(
                obscureText: false,
                hintText: "Email",
                icon: Icons.alternate_email,
              ),
              const CustomTextfield(
                obscureText: false,
                hintText: "Full Name",
                icon: Icons.person,
              ),
              const CustomTextfield(
                obscureText: true,
                hintText: "Password",
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              //action button
              GestureDetector(
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   PageTransition(
                  //       child: const RootPage(),
                  //       type: PageTransitionType.bottomToTop),
                  // );
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Row(
                children: const [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    // ignore: unnecessary_const
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //button singin with google button
              // Container(
              //   width: size.width,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Constants.primaryColor),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       SizedBox(
              //         height: 30,
              //         child: Image.asset('assets/images/google.png'),
              //       ),
              //       Text(
              //         'Sign Up with Google',
              //         style: TextStyle(
              //           color: Constants.blackColor,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const Signin(),
                        type: PageTransitionType.bottomToTop),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Have an account - ",
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}