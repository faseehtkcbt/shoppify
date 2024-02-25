

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/authentication/login/presentation/bloc/login_bloc.dart';
import 'package:nasa_api/features/authentication/login/presentation/bloc/obscure_bloc.dart';
import 'package:nasa_api/methods/common_methods.dart';
import 'package:nasa_api/widgets/appTextStyle.dart';
import 'package:nasa_api/widgets/decoration.dart';
import 'package:nasa_api/widgets/space_around_field.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../main.dart';
import '../../../../../routes.dart';
import '../../../../../widgets/appbutton.dart';
import '../../../../../widgets/apptext.dart';
import '../../../../../widgets/errorbox.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
            height: height * 0.08,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: "Don't have an account? ",fontSize:  width * 0.03,textColor:  Colors.black,
                    fontWeight: FontWeight.w500),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.register);
                    },
                    child: AppText(text: "Register",fontSize:  width * 0.03, textColor: Colors.blueAccent,
                       fontWeight: FontWeight.w500))
              ],
            )),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, loginState) {
            if (loginState is LoginLoaded) {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homePage, (route) => false);
            } else if (loginState is LoginError) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return ErrorBox(
                      error: loginState.msg,
                      function: () {
                        Navigator.pop(context);
                      },
                      btText: "Cancel",
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  });
            }
          },
  builder: (context, state) {
    return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: customDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: height * 0.92,
                width: width,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceAroundField(height:height * 0.06),
                    // Image.asset(
                    //   "assets/Logo_black.png",
                    //   height: height * 0.06,
                    // ),
                    SpaceAroundField(height:height * 0.02),
                    Form(
                      key: formKey,
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: "Welcome Back ",fontSize:  width * 0.07,textColor:  Colors.black,
                                  fontWeight: FontWeight.w600),
                              Row(
                                children: [
                                  AppText(text: "to",fontSize:  width * 0.07,textColor:  Colors.black,
                                      fontWeight: FontWeight.w600),
                                  AppText(text: " Shoppify",fontSize:  width * 0.07,
                                      textColor:Colors.blueAccent,fontWeight:  FontWeight.w600),
                                ],
                              ),
                              AppText(
                                  text: "Hello there,Login to continue  ",
                                  fontSize: width * 0.035,
                                 textColor:  Colors.grey.shade500,
                                fontWeight:   FontWeight.w400),
                              SpaceAroundField(height: height * 0.02),
                              TextFormField(
                                autocorrect: true,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter E-mail';
                                  }
                                  if (CommonMethods().isEmailValid(value) == false) {
                                    return 'Enter correct E-Mail.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Enter your email address",
                                  labelStyle: appTextStyle(
                                   textColor:  Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.035,
                                  ),
                                  hintStyle: appTextStyle(
                                    textColor: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.035,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400)),
                                ),
                              ),
                              SpaceAroundField(height:height * 0.02),
                              BlocProvider<ObscureBloc>(
                                create: (context) => ObscureBloc(),
                                child: BlocConsumer<ObscureBloc, ObscureState>(
                                  listener: (context, state) {
                                    // TODO: implement listener
                                  },
                                  builder: (context, obscureState) {
                                    if (obscureState is ObscureChecked) {
                                      return TextFormField(
                                        autocorrect: true,
                                        controller: passwordConroller,
                                        keyboardType:
                                        TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter password';
                                          }
                                          return null;
                                        },
                                        obscureText: obscureState.check,
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            hintText: "Enter your password",
                                            labelStyle:  appTextStyle(
                                              textColor: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.035,
                                            ),
                                            hintStyle: appTextStyle(
                                              textColor: Colors.grey.shade400,
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.035,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade400)),
                                            suffixIcon: obscureState.check == true
                                                ? InkWell(
                                                onTap: () {
                                                  context
                                                      .read<ObscureBloc>()
                                                      .add(
                                                      ObscureCheck(check: obscureState.check));
                                                },
                                                child: const Icon(Icons
                                                    .visibility_outlined))
                                                : InkWell(
                                                onTap: () {
                                                  context
                                                      .read<ObscureBloc>()
                                                      .add(
                                                      ObscureCheck(check: obscureState.check));
                                                },
                                                child: const Icon(Icons
                                                    .visibility_off_outlined))),
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ),
                              SpaceAroundField(height:height * 0.015),

                              AppButton(
                                  btnColor:  Colors.blueAccent,
                                  btnText: "Login",
                                  height: height * 0.08,
                                  width: width,
                                  txtColor: Colors.white,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      ConnectionType c = await CommonMethods()
                                          .checkInternetConnection();
                                      if (c != ConnectionType.None) {
                                        context.read<LoginBloc>().add(CheckLogin(
                                            email: emailController.text,
                                            password: passwordConroller.text));
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ErrorBox(
                                                error:
                                                "Internet Connection is Required.Please Check Your Internet Connection!!",
                                                function: () {
                                                  Navigator.pop(context);
                                                },
                                                btText: "Close"));
                                      }
                                    }
                                  }),
                            ],
                          )),
                    )
                  ],
                )
              )),
        );
  },
));
  }
}
