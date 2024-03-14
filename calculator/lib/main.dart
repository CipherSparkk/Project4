import 'package:intl/intl.dart';
import 'package:calculator/enlarge.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var input = '';
  var output = '';
  int countdot =0;
  bool conditionfor0 = false;

  void onButtonClickfunction(operator)
  {
    var ch1;
    var ch;
    int l=0;
    if(input.isNotEmpty) {
      l = input.length-1;
      ch = input[l];
    }
    if(input.length >2) {
      ch1 = input[l - 1];
    }
    if ((input == '') && (operator == '-'))
    {
      input = input + operator;
      setState(() {

      });
    }
    else if((input == '' || input =='-') && (operator == '+' || operator =="x" || operator == '/' || operator =='%'))
      {
          setState(() {

          });
      }
    else if (operator == 'C') {
      input = '';
      output = '';
      countdot =0;
            setState(() {

            });
          }
    else if((ch == '+' || ch == '-') && (operator =='+' || operator =='-'))
      {
        input = input.substring(0,l);
        input = input + operator;
        setState(() {
        });
      }
    else if(( ch == 'x' || ch == '/' || ch == '+' || ch == '%' || ch =='-') && (operator == 'x' || operator == '/' || operator == '+' || operator == '%'))
    {
      input = input.substring(0,l);
      input = input + operator;
      setState(() {
      });
    }
    else if(( ch1 == 'x' || ch1 == '/' || ch1 == '+' || ch1 == '%' || ch1 =='-') && (ch == '+' || ch == '%' || ch =='/' || ch =='x') && (operator == 'x' || operator == '/' || operator == '+' || operator == '%' || operator =='-'))
        {input = input.substring(0,l-1);
        input = input + operator;
        setState(() {
        });
    }
     else if(input.length>2)
    {
      if(( ch1 == 'x' || ch1 == '/' || ch1 == '%') && (ch == '-') && (operator == 'x' || operator == '/' || operator == '+' || operator == '%' || operator =='-'))
         input = input.substring(0,l-1);
         input = input + operator;
         setState(() {
         });
       }
     else {
            input = input + operator;
            setState(() {

            });
          }
     if((input[l]== 'x' || input[l] == '/' || input[l] == '+' || input[l] == '%' || input[l] =='-') && (input[l-1] == 'x' || input[l-1] == '/' || input[l-1] == '+' || input[l-1] == '%'))
       {
         var ch2 = input[l];
         input = input.substring(0,l-1);
         input = input + ch2;
       }
    conditionfor0 = false;
     countdot =0;
  }

  Container numbers (txtnum)
  {
    return Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          int l=0;
          if(input.isNotEmpty) {
            l = input.length - 1;
          }
          if((input == '' && txtnum == '0') || (input == '0' && txtnum == '0'))
            {
                input = '0';
            }
          else if((input == '' && txtnum == "00") || (input == '0' && txtnum == "00"))
            {
              input = '0';
            }
          else if(((txtnum == '0') || (txtnum == '00')) && (input[l] == 'x' || input[l] == '/' || input[l] == '+' || input[l] == '%' || input[l] =='-')) {
              input += '0';
              conditionfor0 = true;
          }
          else if(conditionfor0 == true && (txtnum == '0' || txtnum == '00'))
            {
                // Do Nothing
            }
          else if(conditionfor0 == true)
            {
                input = input.substring(0,l) + txtnum;
                conditionfor0 = false;
            }
          else if(txtnum =='.')
            {
              countdot++;
              if(countdot > 1){
                // Do Nothing
              }
              else
                {
                  if(input.isEmpty)
                    {
                      input = '0' + txtnum;
                    }
                  else {
                    input = input + txtnum;
                  }
                }
            }
          else if(input == '0')
            input = txtnum;
          else {
            input = input + txtnum;
          }
          setState(() {
          });

        },
        child: Text(txtnum, style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(
          ),
        ),
      ),
    );
  }

  Container boxwithsize (txtnum,size,clr)
  {
    return Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          onButtonClickfunction(txtnum);
        },
        child: Text(txtnum, style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w800,
        ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: clr,
          shape: CircleBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator', style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,),
                  alignment: Alignment.topRight,
                   // margin: EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          output = '';
                          input = '';
                          countdot = 0;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => enlarge(),));
                      },
                      child: Icon(Icons.open_in_full_sharp, size: 27, color: Colors.deepPurpleAccent,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade50,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 15,),
                      alignment: Alignment.bottomRight,
                      child: Text(input.toString(), style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 15,),
                      alignment: Alignment.bottomRight,
                      child: Text(output.toString(), style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                      ),),
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
                  boxwithsize('C',22.0, Colors.deepPurple.shade50),
                  boxwithsize('%',25.0, Colors.deepPurple.shade50),
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (input.length > 0) {
                          input = input.substring(0, input.length - 1);
                          setState(() {

                          });
                        }
                      },
                      child: Icon(Icons.backspace_outlined, size: 29,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade50,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  boxwithsize('/',23.0, Colors.deepPurple.shade50),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numbers('7'),
                  numbers('8'),
                  numbers('9'),
                  boxwithsize('x',21.0, Colors.deepPurple.shade50),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numbers('4'),
                  numbers('5'),
                  numbers('6'),
                  boxwithsize('-', 30.0, Colors.deepPurple.shade50),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numbers('1'),
                  numbers('2'),
                  numbers('3'),
                  boxwithsize('+', 25.0, Colors.deepPurple.shade50)
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numbers('00'),
                    numbers('0'),
                    numbers('.'),
                    Container(
                      height: 80,
                        width: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          calculation:
                          if(input.isNotEmpty)
                          {
                            var userinput = input.replaceAll('x','*');
                            var l = input.length-1;
                            if(userinput[l] == '*' ||  userinput[l] == '/' ||  userinput[l] == '+' ||  userinput[l] == '-' )
                            {
                              userinput = userinput.substring(0,l);
                            }
                            else
                            {
                              userinput = userinput.substring(0,l+1);
                            }
                            if (userinput[l] == '%') {
                              userinput = userinput.substring(0, l) + '*0.01';
                            }
                            else
                              {
                                var str = userinput.replaceAll('%', '*0.01*');
                                userinput = str.substring(0,str.length);
                              }
                            Parser p = Parser();
                            Expression exp = p.parse(userinput);
                            ContextModel cm = ContextModel();
                            var finalval = exp.evaluate(EvaluationType.REAL, cm);
                            var formatter = NumberFormat('#,###,###.##########');
                            finalval = formatter.format(finalval);
                            output = finalval.toString();
                            setState(() {
                            });
                          }

                        },
                        child: Text('=', style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 27,
                          color: Colors.white,
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.deepOrange,
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
    );
  }
}



