import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String num ='0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 100),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbuttom('AC',Colors.black,Colors.grey),
              calcbuttom('+/-',Colors.black,Colors.grey),
              calcbuttom('%',Colors.black,Colors.grey),
              calcbuttom('/',Colors.black,Colors.orange),

            ],
          ),
          SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbuttom('7',Colors.black,Colors.grey),
              calcbuttom('8',Colors.black,Colors.grey),
              calcbuttom('9',Colors.black,Colors.grey),
              calcbuttom('x',Colors.black,Colors.orange),

            ],
          ),
          SizedBox(height: 20,),Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbuttom('4',Colors.black,Colors.grey),
              calcbuttom('5',Colors.black,Colors.grey),
              calcbuttom('6',Colors.black,Colors.grey),
              calcbuttom('-',Colors.black,Colors.orange),

            ],
          ),
          SizedBox(height: 20,),Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbuttom('1',Colors.black,Colors.grey),
              calcbuttom('2',Colors.black,Colors.grey),
              calcbuttom('3',Colors.black,Colors.grey),
              calcbuttom('+',Colors.black,Colors.orange),

            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              InkWell(
                onTap: ()=>calculation(num),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(

                    padding: EdgeInsets.all(25),
                    alignment: Alignment.centerLeft,
                    height: 100,
                    width: 200,
                    child: Text(num,style: TextStyle(
                      fontSize: 40,
                      color: Colors.black
                    ),),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              ),
              calcbuttom('.', Colors.black, Colors.grey),
              SizedBox(width: 25,),
              calcbuttom('=', Colors.black, Colors.orange)
            ],
          )

        ],
      ),
    );
  }

  Widget calcbuttom(String btntxt, Color txtcolor,Color btncolor) {
    return InkWell(
      onTap:() => calculation(btntxt),
      child: Container(
        alignment: Alignment.center,
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: btncolor
        ),
          child: Text('$btntxt',
            style: TextStyle(
              fontSize: 40,
              color: txtcolor,
            ),
          ),



      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
