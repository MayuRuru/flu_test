import 'package:flutter/material.dart';
import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

//underscore marks that its private:
class _GamePageState extends State<GamePage> {
//late modifier: we are going to set the variable and th constructor, but we are going to initialize it before using it.

  late GameModel _model;
  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(
              targetValue: _model.target,
            ),
            Control(model: _model),
            TextButton(
              child: const Text(
                'Hit me!',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                _showAlert(context);
              },
            ),
            Score(
              totalScore: _model.totalScore,
              round: _model.round,
            ),
          ],
        ),
      ),
    );
  }

//a context represents the current widget in which to find out about the screen location information

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
      child: const Text('Awesome!'),
      onPressed: () {
        Navigator.of(context).pop();
        print('Awesome pressed!'); // dollar sign to use string literals
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hello pop up'),
          content: Text('The slider\'s value is ${_model.current}.'),
          actions: [
            okButton,
          ],
          elevation: 5,

          /// z position (how close or far form its parent)
        );
      },
    );
  }
}