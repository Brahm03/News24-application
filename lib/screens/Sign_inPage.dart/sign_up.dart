import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/PM_const.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/iconConst.dart';
import 'package:prac1/core/constants/radiusconst.dart';
import 'package:prac1/screens/settings/profile_page.dart';
import 'package:prac1/widgets/Mytextformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _key = GlobalKey<FormState>();

  Color _color = ColorsConst.lightGrey;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Center(
                child: FadeInDownBig(child: IconConst.logo2),
              )),
          Expanded(
              flex: 7,
              child: Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getHeight(258),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FadeInLeftBig(
                                child: MyTextformField(
                                    type: TextInputType.name,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'fill the gap';
                                      }
                                    },
                                    controller: username,
                                    hint: 'Username'),
                              ),
                              FadeInRightBig(
                                child: MyTextformField(
                                    type: TextInputType.emailAddress,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'fill the gap';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(v)) {
                                        return "please include an '@' in the email adress '$v' is missing '@' ";
                                      } else if (v == ' ') {
                                        return 'has an error in your email address';
                                      }
                                    },
                                    controller: email,
                                    hint: 'Email'),
                              ),
                              FadeInLeftBig(
                                child: MyTextformField(
                                    type: TextInputType.multiline,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'fill the gap';
                                      } else if (v.length < 8) {
                                        return 'enter 8 letters';
                                      }
                                    },
                                    controller: password,
                                    hint: 'Password'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getHeight(49),
                        ),
                        FadeInUp(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: username.text.isNotEmpty ||
                                          email.text.isEmpty ||
                                          password.text.isNotEmpty
                                      ? _color
                                      : _color = ColorsConst.black,
                                  fixedSize: Size(getWidth(150), getHeight(40)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          RadiusConst.medium))),
                              onPressed: () {
                                setState(() {});
                                if (_key.currentState!.validate()) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/main', (route) => false);
                                }
                              },
                              child: const Text('Sign up')),
                        ),
                        SizedBox(
                          height: getHeight(40),
                        ),
                        Center(
                          child: FadeInUpBig(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  color: ColorsConst.black,
                                  height: 1,
                                  width: getWidth(80),
                                ),
                                const Text('or sign in with'),
                                Container(
                                  color: ColorsConst.black,
                                  height: 1,
                                  width: getWidth(80),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeInDownBig(child: IconConst.mail),
                            FadeInUpBig(child: IconConst.google),
                            FadeInDownBig(child: IconConst.facebook),
                            FadeInUpBig(child: IconConst.twitter),
                            FadeInDownBig(child: IconConst.apple),
                          ],
                        ),
                        SizedBox(
                          height: getHeight(30),
                        ),
                        FadeInUp(
                          child: SizedBox(
                              height: getHeight(36),
                              width: getWidth(294),
                              child: const Text(
                                  'By signing up to News24 you are accepting our Terms & Conditions')),
                        )
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}
