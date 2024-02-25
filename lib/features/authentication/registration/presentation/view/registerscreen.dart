

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/authentication/login/presentation/bloc/obscure_bloc.dart';
import 'package:nasa_api/features/authentication/registration/data/modal/registermodel.dart';
import 'package:nasa_api/features/authentication/registration/presentation/bloc/register_bloc.dart';
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

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordConroller = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  bool containsUpperCase(String value) {
    for (var char in value.runes) {
      if (String.fromCharCode(char).toUpperCase() == String.fromCharCode(char)) {
        return true;
      }
    }
    return false;
  }

  bool containsLowerCase(String value) {
    for (var char in value.runes) {
      if (String.fromCharCode(char).toLowerCase() == String.fromCharCode(char)) {
        return true;
      }
    }
    return false;
  }

  bool containsNumeric(String value) {
    for (var char in value.runes) {
      if (String.fromCharCode(char).contains(RegExp(r'[0-9]'))) {
        return true;
      }
    }
    return false;
  }

  bool containsSpecialChar(String value) {
    String specialCharPattern = r'[!@#\$%^&*()-+?]';
    return value.contains(RegExp(specialCharPattern));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
            height: height * 0.08,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: "Already have an account? ",fontSize:  width * 0.03,textColor:  Colors.black,
                    fontWeight: FontWeight.w500),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    child: AppText(text: "Login", fontSize: width * 0.03, textColor: Colors.blueAccent,
                        fontWeight:FontWeight.w500))
              ],
            )),
        body: SingleChildScrollView(
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
                  child:BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, registerState) {
                      if (registerState is RegisterLoaded) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.black,
                            content: AppText(text:registerState.msg,fontSize:  width * 0.033,
                               textColor:  Colors.white,fontWeight:  FontWeight.w500)));
                        Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
                      } else if (registerState is RegisterError) {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorBox(
                                error: registerState.msg,

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

                      // TODO: implement listener
                    },
  builder: (context, state) {
    return Column(
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
                                AppText(text: "Register Account ",fontSize:  width * 0.07,textColor:  Colors.black,
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
                                    text: "Hello there,Register to continue  ",
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
                                  child: BlocConsumer<ObscureBloc,
                                      ObscureState>(
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
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter password';
                                            } else if (value.length < 8) {
                                              return 'Password must contain minimum 8 characters';
                                            }
                                            else if (!containsUpperCase(value) || !containsLowerCase(value) || !containsNumeric(value) || (!containsSpecialChar(value))) {
                                              return 'Password must contain atleast\none uppercase character, one lowercase character,\none number and one special character';
                                            }
                                            else {
                                              return null;
                                            }
                                          },
                                          obscureText: obscureState.check,
                                          decoration: InputDecoration(
                                              labelText: "Password",
                                              hintText:
                                              "Enter your password",
                                              labelStyle:
                                              appTextStyle(
                                                textColor: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.035,
                                              ),
                                              hintStyle:
                                              appTextStyle(
                                                textColor: Colors.grey.shade400,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.035,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  borderSide: BorderSide(
                                                      color:Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade400)),
                                              suffixIcon: obscureState
                                                  .check ==
                                                  true
                                                  ? InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                        ObscureBloc>()
                                                        .add(ObscureCheck(check: obscureState.check));
                                                  },
                                                  child: const Icon(Icons
                                                      .visibility_outlined))
                                                  : InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                        ObscureBloc>()
                                                        .add(ObscureCheck(check: obscureState.check));
                                                  },
                                                  child: const Icon(Icons.visibility_off_outlined))),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                                SpaceAroundField(height:height * 0.02),
                                BlocProvider<ObscureBloc>(
                                  create: (context) => ObscureBloc(),
                                  child: BlocConsumer<ObscureBloc,
                                      ObscureState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                    },
                                    builder: (context, obscureState) {
                                      if (obscureState is ObscureChecked) {
                                        return TextFormField(
                                          autocorrect: true,
                                          controller: confirmController,
                                          keyboardType:
                                          TextInputType.visiblePassword,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter password';
                                            } else if (value !=
                                                passwordConroller.text) {
                                              return "Password and Confirm password must be same";
                                            }
                                            return null;
                                          },
                                          obscureText: obscureState.check,
                                          decoration: InputDecoration(
                                              labelText: "Confirm Password",
                                              hintText:
                                              "Confirm your password",
                                              labelStyle:
                                              appTextStyle(
                                                textColor: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.035,
                                              ),
                                              hintStyle:
                                              appTextStyle(
                                                textColor: Colors.grey.shade400,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.035,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade400)),
                                              suffixIcon: obscureState
                                                  .check ==
                                                  true
                                                  ? InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                        ObscureBloc>()
                                                        .add(ObscureCheck(check: obscureState.check));
                                                  },
                                                  child: const Icon(Icons
                                                      .visibility_outlined))
                                                  : InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                        ObscureBloc>()
                                                        .add(ObscureCheck(check: obscureState.check));
                                                  },
                                                  child: const Icon(Icons.visibility_off_outlined))),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                                SpaceAroundField(height:height * 0.02),

                                AppButton(
                                    btnColor:  Colors.blueAccent,
                                    btnText: "Register",
                                    height: height * 0.08,
                                    width: width,
                                    txtColor: Colors.white,
                                    function: () async {
                                      if (formKey.currentState!.validate()) {
                                        ConnectionType c = await CommonMethods()
                                            .checkInternetConnection();
                                        if (c != ConnectionType.None) {
                                          context.read<RegisterBloc>().add(CheckRegister(
                                              registerModal:RegisterModal(email: emailController.text, pswrd: passwordConroller.text)));
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
                  );
  },
)
              )),
        ));
  }
}
