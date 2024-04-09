import 'package:flutter/material.dart';
import 'package:practic/shared_thyme_properties.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  Color buttonColor = ThymeProperties.buttonColor;
  Color buttonFontColor = ThymeProperties.buttonFontColor;

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0'; // Текущий вывод калькулятора.
  String _outputHistory = ''; // История операций.
  double _num1 = 0; // Первое число для операции.
  double _num2 = 0; // Второе число для операции.
  String _operand = ''; // Текущая операция.

  // Обработчик нажатия на кнопку.
  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      // Если нажата кнопка "C", очистить все данные.
      _output = '0';
      _outputHistory = '';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      // Если нажата кнопка операции, сохранить первое число и операцию.
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '0';
      _outputHistory += '$_num1 $_operand';
    } else if (buttonText == '.') {
      // Если нажата кнопка десятичной точки, добавить ее к числу, если ее еще нет.
      if (!_output.contains('.')) {
        _output += buttonText;
      }
    } else if (buttonText == '=') {
      // Если нажата кнопка "=", выполнить операцию и показать результат.
      _num2 = double.parse(_output);
      _outputHistory += '$_num2 = ';
      switch (_operand) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case '*':
          _output = (_num1 * _num2).toString();
          break;
        case '/':
          _output = (_num1 / _num2).toString();
          break;
      }
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else {
      // Если нажата обычная кнопка с цифрой, добавить ее к текущему выводу.
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    // Обновить состояние виджета для обновления интерфейса.
    setState(() {
      _output;
      _outputHistory;
    });
  }

  // Создание кнопки для калькулятора.
  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.buttonColor)),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, color: widget.buttonFontColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Счёты)'), // Заголовок на экране калькулятора.
      ),
      body: Column(
        children: <Widget>[
          // Отображение истории операций.
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _outputHistory,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          // Отображение текущего вывода.
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          // Размещение кнопок для цифр и операций.
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('C'),
                  buildButton('+'),
                ],
              ),
              Row(
                children: [
                  buildButton('='),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
