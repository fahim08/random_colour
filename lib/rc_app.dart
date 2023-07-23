import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_colour/common/rc_constants.dart';
import 'package:random_colour/common/res/rc_colors.dart';
import 'package:random_colour/common/res/rc_dimens.dart';
import 'package:random_colour/common/res/rc_strings.dart';

///Random Colors App
class RCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: RandomColourApp(),
    );
  }
}

///Random Colors App
class RandomColourApp extends StatefulWidget {
  @override
  State<RandomColourApp> createState() => _RandomColourAppState();
}

class _RandomColourAppState extends State<RandomColourApp> {
  Color _initialBackgroundColor = Colors.white;
  Color _initialTextColor = Colors.black;

  void changeBackgroundColor() {
    setState(() {
      _initialBackgroundColor = _generateRandomColor();
      _updateTextColor();
    });
  }

  void _updateTextColor() {
    // Calculate the luminance of the background color
    final double luminance = _initialBackgroundColor.computeLuminance();

    // Determine the contrast color based on the background luminance
    _initialTextColor =
        luminance > RCConstants.cvBaseLuminous ? Colors.black : Colors.white;
  }

  Color _generateRandomColor() {
    final Random random = Random();

    return Color.fromRGBO(
      random.nextInt(RCConstants.cvRGBMaxValue),
      random.nextInt(RCConstants.cvRGBMaxValue),
      random.nextInt(RCConstants.cvRGBMaxValue),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.color(cvAppBar),
          title: Text(
            context.string(tvAppBarTitle),
            style: TextStyle(
              fontSize: RCDimens.dvFontSize,
              color: context.color(cvAppBarText),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: _initialBackgroundColor,
        body: Center(
          child: Text(
            context.string(tvHelloThere),
            style: TextStyle(
              fontSize: RCDimens.dvFontSize,
              color: _initialTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
