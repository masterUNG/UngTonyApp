// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ungtonyapp/utility/my_constant.dart';
import 'package:ungtonyapp/widgets/show_text.dart';

class ShowTitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  const ShowTitle({
    Key? key,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 8, bottom: 8),
          child: ShowText(
            label: title,
            textStyle: MyConstant().h2Style(),
          ),
        ),
        ShowText(
          label: subTitle ?? '',
          textStyle: MyConstant().h3ActiveStyle(),
        )
      ],
    );
  }
}
