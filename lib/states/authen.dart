import 'package:flutter/material.dart';
import 'package:ungtonyapp/utility/my_constant.dart';
import 'package:ungtonyapp/widgets/show_button.dart';
import 'package:ungtonyapp/widgets/show_form.dart';
import 'package:ungtonyapp/widgets/show_image.dart';
import 'package:ungtonyapp/widgets/show_text.dart';
import 'package:ungtonyapp/widgets/show_text_button.dart';
import 'package:ungtonyapp/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                newLogo(boxConstraints: boxConstraints),
                newAppName(),
                const ShowTitle(title: 'Email'),
                newEmail(),
                const ShowTitle(title: 'Password'),
                newPassword(),
                newRemember(context),
                buttonSignIn(boxConstraints),
                newForgot(),
                newSignUp()
              ],
            ),
          );
        }),
      ),
    );
  }

  Row newSignUp() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ShowText(label: "Don't have an account ? "),
                  ShowTextButton(label: 'Sign Up', pressFunc: () {}),
                ],
              );
  }

  ShowTextButton newForgot() =>
      ShowTextButton(label: 'Forgot the Password ?', pressFunc: () {});

  Container buttonSignIn(BoxConstraints boxConstraints) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: boxConstraints.maxWidth,
      child: ShowButton(
        label: 'Sign In',
        pressFunc: () {},
      ),
    );
  }

  Theme newRemember(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: MyConstant.primary,
        ),
        child: CheckboxListTile(
            activeColor: MyConstant.primary,
            controlAffinity: ListTileControlAffinity.leading,
            title: ShowText(
              label: 'Remember Me',
              textStyle: MyConstant().h3ActiveStyle(),
            ),
            value: remember,
            onChanged: (value) {
              setState(() {
                remember = value!;
              });
            }));
  }

  ShowForm newPassword() {
    return ShowForm(
      hind: 'Password',
      obsecu: redEye,
      redEyeFunc: () {
        setState(() {
          redEye = !redEye;
        });
      },
    );
  }

  ShowForm newEmail() {
    return ShowForm(
      hind: 'Email',
    );
  }

  ShowText newAppName() {
    return ShowText(
      label: "Let's Sign You In",
      textStyle: MyConstant().h1Style(),
    );
  }

  Container newLogo({required BoxConstraints boxConstraints}) {
    return Container(
      margin: const EdgeInsets.only(top: 32, bottom: 8),
      width: boxConstraints.maxWidth * 0.35,
      child: const ShowImage(path: 'images/logo.png'),
    );
  }
}
