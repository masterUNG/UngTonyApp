import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ungtonyapp/utility/my_constant.dart';
import 'package:ungtonyapp/widgets/show_image.dart';
import 'package:ungtonyapp/widgets/show_text.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  var titles = <String>[
    'Find people who math',
    'Easily message & call the',
    "Don't wait anymore, find",
  ];
  var bodys = <String>[
    'with you',
    'people you like',
    'out your soul mate now',
  ];
  var paths = <String>[
    'images/intro1.png',
    'images/intro2.png',
    'images/intro3.png',
  ];

  var pageViewModels = <PageViewModel>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      setState(() {
        pageViewModels.add(createPageViewModel(
            title: titles[i], body: bodys[i], path: paths[i]));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IntroductionScreen(
        pages: pageViewModels,
        onDone: () {
          print('onDone Work');
          Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.rountAuthen, (route) => false);
        },
        done: ShowText(
          label: 'Done',
          textStyle: MyConstant().h3ActiveStyle(),
        ),
        skip: ShowText(
          label: 'Skip',
          textStyle: MyConstant().h3ActiveStyle(),
        ),
        showSkipButton: true,
        next: ShowText(
          label: 'Next',
          textStyle: MyConstant().h3ActiveStyle(),
        ),
        showNextButton: true,
      )),
    );
  }

  PageViewModel createPageViewModel(
      {required String title, required String body, required String path}) {
    return PageViewModel(
      titleWidget: ShowText(
        label: title,
        textStyle: MyConstant().h2Style(),
      ),
      body: body,
      image: ShowImage(path: path),
    );
  }
}
