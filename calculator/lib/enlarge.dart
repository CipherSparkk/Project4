import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class BlinkingCursor extends StatefulWidget {
  @override
  _BlinkingCursorState createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.85,
      height: 52,
      color: _isVisible ? Colors.deepOrange : Colors.transparent,
    );
  }
}

class enlarge extends StatefulWidget {
  @override
  State<enlarge> createState() => _enlargeState();
}

class _enlargeState extends State<enlarge> {
  var input = '';
  var output = '';
  int countdot = 0;
  bool conditionfor0 = false;
  bool modeofoperation = false;
  var clr;

  bool isNumericUsing_tryParse(String string) {
    if (string.isEmpty) {
      return false;
    }
    final number = num.tryParse(string);
    if (number == null) {
      return false;
    }
    return true;
  }

  void helperfunc() {
    if (input.isNotEmpty) {
      Parser p = Parser();
      var userinput = input.replaceAll('x', '*');
      bool condition_3 = false;
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if ((userinput[i] == 'π' || userinput[i] == 'e') &&
            (userinput[j] == '!')) {
          condition_3 = true;
          break;
        }
      }
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if (userinput[i] == '√' &&
            (userinput[j] == 'π' || userinput[j] == 'e')) {
          userinput = userinput.substring(0, j) +
              '(' +
              userinput[j] +
              ')' +
              userinput.substring(j + 1, userinput.length);
        }
      }
      bool condition_2 = false;
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if (userinput[i] == '√' &&
            (userinput[j] == '^' || userinput[j] == '!')) {
          condition_2 = true;
          break;
        }
      }
      userinput = userinput.replaceAll('√', 'sqrt');
      for (int i = 0, j = i + 1, k = j + 1;
          k < userinput.length;
          i++, j++, k++) {
        if (isNumericUsing_tryParse(userinput[i]) &&
            userinput[j] == '(' &&
            isNumericUsing_tryParse(userinput[k])) {
          userinput = userinput.substring(0, i + 1) +
              '*' +
              userinput.substring(j, userinput.length);
        }
      }
      for (int i = 0, j = i + 1, k = j + 1;
          k < userinput.length;
          i++, j++, k++) {
        if (isNumericUsing_tryParse(userinput[i]) &&
            userinput[j] == '(' &&
            (userinput[k] == 'l' ||
                userinput[k] == 's' ||
                userinput[k] == 'c' ||
                userinput[k] == 't')) {
          userinput = userinput.substring(0, j) +
              '*' +
              userinput.substring(j, userinput.length);
        }
      }

      if (userinput[0] == 'log') {
        var log10 = '2.302585092994046*ln';
        userinput = userinput.replaceAll('log', 'log10');
      } else {
        var log10 = '*2.302585092994046*ln';
        userinput = userinput.replaceAll('log', 'log10');
      }
      if (userinput[userinput.length - 1] == '%') {
        userinput = userinput.substring(0, userinput.length - 1) + '/100';
      } else {
        var str = userinput.replaceAll('%', '*0.01*');
        userinput = str.substring(0, str.length);
      }
      int count1 = 0, count2 = 0;
      for (int i = 0; i < userinput.length; i++) {
        if (userinput[i] == '(') {
          count1++;
        }
        if (userinput[i] == ')') {
          count2++;
        }
      }
      while (count2 < count1) {
        userinput = userinput + ')';
        count2++;
      }
      bool condition_1 = false;
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if ((userinput[i] == '(' || userinput[i] == '^') &&
            (userinput[j] == '^' ||
                userinput[j] == '!' ||
                userinput[j] == '%' ||
                userinput[j] == '*' ||
                userinput[j] == '/' ||
                userinput[j] == '+' ||
                userinput[j] == '-')) {
          condition_1 = true;
          break;
        }
      }
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if ((isNumericUsing_tryParse(userinput[i]) ||
                userinput[i] == 'π' ||
                userinput[i] == 'e') &&
            (userinput[j] == 'l' ||
                userinput[j] == 's' ||
                userinput[j] == 'c' ||
                userinput[j] == 't')) {
          userinput = userinput.substring(0, i + 1) +
              '*' +
              userinput.substring(j, userinput.length);
        }
      }
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if ((isNumericUsing_tryParse(userinput[i]) ||
                userinput[i] == 'π' ||
                userinput[i] == 'e' ||
                userinput[i] == ')') &&
            (userinput[j] == 'π' || userinput[j] == 'e')) {
          userinput = userinput.substring(0, i + 1) +
              '*' +
              userinput.substring(j, userinput.length);
        }
      }
      for (int i = 0, j = i + 1; j < userinput.length; i++, j++) {
        if ((userinput[i] == 'π' || userinput[i] == 'e') &&
            isNumericUsing_tryParse(userinput[j])) {
          userinput = userinput.substring(0, i + 1) +
              '*' +
              userinput.substring(j, userinput.length);
        }
      }
      bool condition_4 = false;
      for (int i = 0; i < userinput.length - 1; i++) {
        if (userinput[i] == '.') {
          int j = i + 1;
          while (
              j < userinput.length && isNumericUsing_tryParse(userinput[j])) {
            j++;
          }
          if (userinput[j] == '!') {
            condition_4 = true;
            break;
          }
        }
      }

      userinput = userinput.replaceAll('e', 'e^1');
      userinput = userinput.replaceAll('π', pi.toString());

      if (userinput[0] == '^' ||
          userinput[0] == '!' ||
          userinput[0] == ')' ||
          (count2 > count1))
        output = 'Expression Error';
      else if (condition_1 == true || condition_2 == true) {
        output = 'Expression Error';
      } else if (condition_3 == true || condition_4 == true) {
        output = 'NaN';
      } else {
        final minvalue = 1e-12;
        final maxValue = 1e9;
        Expression exp = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalval = exp.evaluate(EvaluationType.REAL, cm);
        if (finalval.abs() > maxValue) {
          finalval = finalval.toStringAsExponential().replaceAll('e', 'E');
        }
        else if (finalval.abs() < minvalue) {
          finalval = finalval.toStringAsExponential().replaceAll('e', 'E');
        }
        else {
          final formatter = NumberFormat('#,###,###.###########');
          finalval = formatter.format(finalval);
        }
        output = finalval.toString();
        setState(() {});
      }
    } else
      output = '';
  }

  void onButtonClickfunction(operator) {
    var ch1;
    var ch;
    int l = 0;
    if (input != '') {
      l = input.length - 1;
      ch = input[l];
    }
    if (input.length > 2) {
      ch1 = input[l - 1];
    }
    if ((input.isEmpty) && (operator == '-')) {
      input = operator;
      setState(() {});
    } else if (operator == 'log' || operator == 'ln') {
      input = input + operator;
      input = input + '(';
      setState(() {});
    } else if (((input.isEmpty) || input == '-') &&
        (operator == '+' ||
            operator == "x" ||
            operator == '/' ||
            operator == '%')) {
      setState(() {});
    } else if (operator == 'C') {
      input = '';
      output = '';
      countdot = 0;
      setState(() {});
    } else if ((ch == '+' || ch == '-') &&
        (operator == '+' || operator == '-')) {
      input = input.substring(0, l);
      input = input + operator;
      setState(() {});
    } else if ((ch == 'x' ||
            ch == '/' ||
            ch == '+' ||
            ch == '%' ||
            ch == '-') &&
        (operator == 'x' ||
            operator == '/' ||
            operator == '+' ||
            operator == '%')) {
      input = input.substring(0, l);
      input = input + operator;
      setState(() {});
    } else if ((ch1 == 'x' ||
            ch1 == '/' ||
            ch1 == '+' ||
            ch1 == '%' ||
            ch1 == '-') &&
        (ch == '+' || ch == '%' || ch == '/' || ch == 'x') &&
        (operator == 'x' ||
            operator == '/' ||
            operator == '+' ||
            operator == '%' ||
            operator == '-')) {
      input = input.substring(0, l - 1);
      input = input + operator;
      setState(() {});
    } else if (input.length > 2) {
      if ((ch1 == 'x' || ch1 == '/' || ch1 == '%') &&
          (ch == '-') &&
          (operator == 'x' ||
              operator == '/' ||
              operator == '+' ||
              operator == '%' ||
              operator == '-')) input = input.substring(0, l - 1);
      input = input + operator;
      setState(() {});
    } else {
      input = input + operator;
      setState(() {});
    }
    if ((input[l] == 'x' ||
            input[l] == '/' ||
            input[l] == '+' ||
            input[l] == '%' ||
            input[l] == '-') &&
        (input[l - 1] == 'x' ||
            input[l - 1] == '/' ||
            input[l - 1] == '+' ||
            input[l - 1] == '%')) {
      var ch2 = input[l];
      input = input.substring(0, l - 1);
      input = input + ch2;
    }
    countdot = 0;
  }

  Container numbers(txtnum, size) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          int l = 0;
          if (input.isNotEmpty) {
            l = input.length - 1;
          }
          if (txtnum == 'deg') {
            clr = Colors.deepOrange;
            modeofoperation = true;
          } else if (txtnum == 'rad') {
            clr = Colors.deepOrange;
            modeofoperation = false;
          } else if (txtnum == 'inv') {
          } else if (((input.isEmpty) && txtnum == '0') ||
              ((input.isEmpty) && txtnum == '00')) {
            input = '0';
            setState(() {});
          } else if ((input == '0') && (txtnum == "0" || txtnum == "00")) {
            input = '0';
            setState(() {});
          } else if (((txtnum == '0') || (txtnum == '00')) &&
              (input[l] == 'x' ||
                  input[l] == '/' ||
                  input[l] == '+' ||
                  input[l] == '%' ||
                  input[l] == '-' ||
                  input[l] == '√' ||
                  input[l] == '^' ||
                  input[l] == '!' ||
                  input[l] == '(')) {
            input += '0';
            conditionfor0 = true;
            setState(() {});
          } else if (conditionfor0 == true &&
              (txtnum == '0' || txtnum == '00')) {
            // Do Nothing
          } else if (conditionfor0 == true) {
            input = input.substring(0, l) + txtnum;
            conditionfor0 = false;
            setState(() {});
          } else if (txtnum == '.') {
            countdot++;
            if (countdot > 1) {
              // Do Nothing
            } else {
              input = input + txtnum;
              setState(() {});
            }
          } else if (txtnum == 'sin' || txtnum == 'cos' || txtnum == 'tan') {
            input = input + txtnum + '(';
            setState(() {});
          } else {
            input = input + txtnum;
            setState(() {});
          }
        },
        child: Text(
          txtnum,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
        ),
      ),
    );
  }

  Container boxwithsize(txtnum, size, clr) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          onButtonClickfunction(txtnum);
        },
        child: Text(
          txtnum,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: clr,
          shape: CircleBorder(),
        ),
      ),
    );
  }

  Container boxwithsize2(txtnum, size) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          onButtonClickfunction(txtnum);
        },
        child: Text(
          txtnum,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        )),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SizedBox(
          width: 430,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                ),
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  input.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              BlinkingCursor(),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 15,
                          ),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            output.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: numbers('sin', 16.0)),
                      Expanded(child: numbers('cos', 16.0)),
                      Expanded(child: numbers('tan', 16.0)),
                      Expanded(child: numbers('rad', 16.0)),
                      Expanded(child: numbers('deg', 15.0)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: boxwithsize2('log', 16.0)),
                      Expanded(child: boxwithsize2('ln', 16.0)),
                      Expanded(child: boxwithsize2('(', 16.0)),
                      Expanded(child: boxwithsize2(')', 16.0)),
                      Expanded(child: numbers('inv', 16.0)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: numbers('!', 20.0)),
                      Expanded(
                          child: boxwithsize(
                              'C', 18.0, Colors.deepPurple.shade50)),
                      Expanded(
                          child: boxwithsize(
                              '%', 18.0, Colors.deepPurple.shade50)),
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              int l = 0;
                              if (input.isNotEmpty) {
                                l = input.length - 1;
                              }
                              if (input == '(' ||
                                  input == 'sin(' ||
                                  input == 'cos(' ||
                                  input == 'tan(' ||
                                  input == 'ln(' ||
                                  input == 'log(') {
                                input = '';
                              } else if ((input[l] == '(') &&
                                  (input[l - 1]) == 'n' &&
                                  (input[l - 2] == 'l')) {
                                input = input.substring(0, l - 2);
                              } else if ((input[l] == '(') &&
                                  (input[l - 1] == 'n' ||
                                      input[l - 1] == 's' ||
                                      input[l - 1] == 'g')) {
                                input = input.substring(0, l - 3);
                              } else if (input.length <= 1) {
                                input = '';
                              } else {
                                input = input.substring(0, l);
                              }
                              setState(() {});
                            },
                            child: Icon(
                              Icons.backspace_outlined,
                              size: 22,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade50,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: boxwithsize(
                              '/', 18.0, Colors.deepPurple.shade50)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: boxwithsize2('^', 19.0)),
                      Expanded(child: numbers('7', 17.0)),
                      Expanded(child: numbers('8', 17.0)),
                      Expanded(child: numbers('9', 17.0)),
                      Expanded(
                          child: boxwithsize(
                              'x', 20.0, Colors.deepPurple.shade50)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: numbers('√', 16.0)),
                      Expanded(child: numbers('4', 17.0)),
                      Expanded(child: numbers('5', 17.0)),
                      Expanded(child: numbers('6', 17.0)),
                      Expanded(
                          child: boxwithsize(
                              '-', 27.0, Colors.deepPurple.shade50)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: numbers('π', 17.0)),
                      Expanded(child: numbers('1', 17.0)),
                      Expanded(child: numbers('2', 17.0)),
                      Expanded(child: numbers('3', 17.0)),
                      Expanded(
                          child:
                              boxwithsize('+', 19.0, Colors.deepPurple.shade50))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: numbers('e', 19.0)),
                        Expanded(child: numbers('00', 17.0)),
                        Expanded(child: numbers('0', 18.0)),
                        Expanded(child: numbers('.', 17.0)),
                        Expanded(
                          child: Container(
                            height: 70,
                            width: 70,
                            child: ElevatedButton(
                              onPressed: () {
                                helperfunc();
                                setState(() {});
                              },
                              child: Text(
                                '=',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor: Colors.deepOrange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
