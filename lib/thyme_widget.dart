import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:practic/shared_thyme_properties.dart';

class ThymeWidget extends StatefulWidget {
  const ThymeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ThymeState();
}

class _ThymeState extends State<ThymeWidget> {
  Color buttonColor = ThymeProperties.buttonColor;
  Color buttonFontColor = ThymeProperties.buttonFontColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тема)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('Счёты)')),
          body: ListView(
            children: [
              ColorPicker(
                title: const Text("Цвет текста кнопок:"),
                color: buttonFontColor,
                onColorChanged: (Color value) =>
                    colorChanged(buttonColor, value),
              ),
              ColorPicker(
                title: const Text("Цвет кнопок:"),
                color: buttonColor,
                onColorChanged: (Color value) =>
                    colorChanged(value, buttonFontColor),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(ThymeProperties.buttonColor)),
                child: Text('Назад', style: TextStyle(color: ThymeProperties.buttonFontColor)),
              ),
            ],
          )),
    );
  }

  void colorChanged(Color buttonColor, Color buttonFontColor) {
    setState(() {
      this.buttonColor = buttonColor;
      this.buttonFontColor = buttonFontColor;
    });
    ThymeProperties.buttonColor = buttonColor;
    ThymeProperties.buttonFontColor = buttonFontColor;
  }
}
