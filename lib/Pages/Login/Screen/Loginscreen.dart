// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_build_context_synchronously, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/ConstantSapValues.dart';
import 'package:sellerkit/Pages/Login/Widgets/TermsAndConditions3.dart';
import '../../../Constant/ConstantRoutes.dart';
import '../../../Constant/AppConstant.dart';
import '../../../Constant/Screen.dart';
import '../../../Constant/padings.dart';
import '../../../Controller/LoginController/LoginController.dart';
import '../../../Widgets/custom_shake_transtition.dart';
import '../../Splash/Widgets/custom_elevatedBtn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Paddings constant = Paddings();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double width = Screens.width(context) - (Screens.width(context) / 2);
    final double height = Screens.bodyheight(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider<LoginController>(
            create: (context) => LoginController(context),
            builder: (context, child) {
              return Consumer<LoginController>(
                  builder: (BuildContext context, prdlog, Widget? child) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Screens.width(context) / 2,
                        height: Screens.fullHeight(context),
                        // decoration: BoxDecoration(
                        color: theme.primaryColor,
                        //     borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(
                        //             Screens.width(context) * 0.2))),
                        // padding: EdgeInsets.symmetric(
                        //     vertical: height * 0.1,
                        //     horizontal: width * 0.1),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(
                            //   "Login",
                            //   style: theme.textTheme.headline5
                            //       ?.copyWith(color: Colors.white),
                            // )
                          ],
                        ),
                      ),
                      body(width, Screens.fullHeight(context), prdlog, theme,
                          context)
                    ],
                  ),
                );
              });
            }));
  }

  Container body(double width, double height, LoginController prdlog,
      ThemeData theme, BuildContext context) {
    return Container(
      width: width,
      height: height,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          // color: Colors.red,
          //borderRadius: BorderRadius.only(bottomLeft:Radius.circular( Screens.width(context)*0.2))
          ),
      padding:
          EdgeInsets.symmetric(vertical: height * 0.1, horizontal: width * 0.1),
      child: Form(
        key: prdlog.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.topCenter,
                width: width,
                height: height * 0.1,
                child: Text(
                  "Login",
                  style: theme.textTheme.headline5?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            Visibility(
              visible: prdlog.geterroMsgVisble,
              child: Container(
                alignment: Alignment.center,
                width: width,
                child: Column(
                  children: [
                    Text(
                      prdlog.errorMsh,
                      style: theme.textTheme.bodyText1
                          ?.copyWith(color: Colors.red),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: width * 0.02,
                    )
                  ],
                ),
              ),
            ),
            CustomShakeTransition(
              duration: const Duration(milliseconds: 900),
              child: SizedBox(
                child: TextFormField(
                  controller: prdlog.mycontroller[0],
                  keyboardType: TextInputType.text,
                  style: theme.textTheme.bodyText2,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Required*";
                    }
                    // else if (!data.contains("@")) {
                    //   return "Enter Valid Email*";
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      size: 25,
                    ),
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomShakeTransition(
              duration: const Duration(milliseconds: 900),
              child: SizedBox(
                child: TextFormField(
                  controller: prdlog.mycontroller[1],
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Required*";
                    }
                    return null;
                  },
                  obscureText: prdlog.getHidepassword,
                  style: theme.textTheme.bodyText2,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      size: 25,
                    ),
                    suffixIcon: IconButton(
                      icon: prdlog.getHidepassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        prdlog.obsecure();
                      },
                    ),
                    labelText: "Password",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    visualDensity:
                        VisualDensity(horizontal: -4.0, vertical: -4.0),
                    value: prdlog.TCbool,
                    onChanged: (value) {
                      setState(() {
                        prdlog.setTermsAConditionsValue(value);
                        // _acceptTerms = value ?? false;
                      });
                    },
                  ),
                  Text('I accept the '),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pdfViwer()),
                      );
                      // await showDialog<dynamic>(

                      //     context: context,
                      //     builder: (_) {
                      //       return TermsAndConditionsBox();
                      //     });
                    },
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            prdlog.TCbool == false
                ? CustomSpinkitdButton(
                    color: Colors.grey[300],
                    onTap: () {
                      // setState(() {
                      //  prdlog.erroMsgVisble=true;
                      //  prdlog.errorMsh=''
                      // });
                    },
                    isLoading: prdlog.isLoading,
                    label: 'Login',
                    labelLoading: "Login",
                    textcolor: Colors.grey,
                    // labelLoading: AppLocalizations.of(context)!.signing,
                    // label: AppLocalizations.of(context)!.sign_in,
                  )
                : CustomSpinkitdButton(
                    // color: Colors.grey[300],
                    onTap: prdlog.getsettingError == true ||
                            prdlog.isLoading == true
                        ? null
                        : () async {
                            prdlog.validateLogin(context);
                            // prdlog.testApi();
                          },
                    isLoading: prdlog.isLoading,
                    label: 'Login',
                    labelLoading: "Login",
                    textcolor: Colors.white,
                    // labelLoading: AppLocalizations.of(context)!.signing,
                    // label: AppLocalizations.of(context)!.sign_in,
                  ),
            SizedBox(
              height: height * 0.03,
            ),
            InkWell(
                onTap: () {
                  LoginController.loginPageScrn = true;
                  // ForgotPasswordController.loginscrn = true;
                  // print("LoginController.loginpage:${LoginController.loginPageScrn}");
                  Get.toNamed(ConstantRoutes.forgotregister);
                },
                child: Text("Forgot password?")),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () async {
                      // bool res =
                      //     await prdlog.checkloc();
                      // if (res == true) {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                contentPadding: EdgeInsets.all(0),
                                insetPadding: EdgeInsets.all(
                                    Screens.bodyheight(context) * 0.02),
                                content: settings(
                                    context, prdlog, height, width * 0.8));
                          });
                    },
                    child: SizedBox(
                        //color: Colors.amber,
                        width: width * 0.1,
                        child: Icon(
                          Icons.settings,
                          color: theme.primaryColor,
                        ))),
                Text(
                  ConstantValues.appversion.isEmpty
                      ? "${AppConstant.version}"
                      : "${ConstantValues.appversion}",
                  // 'V 1.0.8',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  settings(BuildContext context, LoginController logCon, double height,
      double width) {
    final theme = Theme.of(context);
    return StatefulBuilder(builder: (context, st) {
      return Container(
        padding: EdgeInsets.only(
            top: height * 0.01,
            left: width * 0.03,
            right: width * 0.03,
            bottom: height * 0.01),
        width: width * 1.1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 1.1,
                height: height * 0.05,
                color: theme.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: height * 0.02, right: height * 0.02),
                      // color: Colors.red,
                      width: width * 0.7,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Configure",
                        style: theme.textTheme.bodyText2
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: height * 0.025,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Form(
                key: logCon.formkey2,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        controller: logCon.mycontroller[3],
                        cursorColor: Colors.grey,
                        //keyboardType: TextInputType.number,
                        onChanged: (v) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the Customer Id';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Customer ID',
                          hintStyle: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                          filled: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: logCon.progrestext == true
                    ? null
                    : () {
                        st(() {
                          logCon.settingvalidate(context);
                        });
                      },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 0.045,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                  ),
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: logCon.progrestext == true
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Ok",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyText1
                                  ?.copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
