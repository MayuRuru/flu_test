import 'package:flutter/material.dart';
import 'text_styles.dart';

class Prompt extends StatelessWidget {
//update constructor to tatget value:

  const Prompt({Key? key, required this.targetValue}) : super(key: key);

//final means it wont change:
  final int targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'PLAY ON',
            style: LabelTextStyle.bodyText1(context),
          ),
        ),
        Text('$targetValue'),
      ],
    );
  }
}
