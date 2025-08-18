import 'dart:convert';

import 'package:driver/apis/log_in_user.dart';
import 'package:driver/constants_components/enter_way.dart';
import 'package:driver/modles/constant_colors.dart';
import 'package:driver/mywigets/email_field.dart';
import 'package:driver/mywigets/my_home_page.dart';
import 'package:driver/mywigets/password_field.dart';
import 'package:driver/mywigets/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

GlobalKey<FormState> formState = GlobalKey();
GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  LogInUser logInUserAccount = LogInUser();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      backgroundColor: ConstantColors.backgroundColorSignIn,
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height / 9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image.asset('images/driver_login_icon.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: EmailField(enterType: EnterWay.logIn),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: PhoneField(enterType: EnterWay.logIn),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: PasswordField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: MaterialButton(
                    color:
                        ConstantColors.backgroundColorTabBarIndicatorSelected,
                    padding: const EdgeInsets.all(15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    minWidth: double.infinity,
                    onPressed: () async {
                      formState.currentState!
                          .save(); //this for make phone number and email is optional in log in screen (entry type)
                      if (formState.currentState!.validate()) {
                        formState.currentState!.save();
                        Response response = await logInUserAccount.logInUser();
                        var data = jsonDecode(response.body);
                        if (response.statusCode == 202 ||
                            response.statusCode == 201) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${data['msg']}'),
                              backgroundColor:
                                  ConstantColors.backgroundOfSnackBarRight,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${data['msg']}'),
                              backgroundColor:
                                  ConstantColors.backgroundOfSnackBarFalse,
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
