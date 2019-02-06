import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  /*
   Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
   */
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your Weight in Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your Weight in Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your Weight in Venus is ${_finalResult.toStringAsFixed(1)}";

      break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your Weight",
                      hintText: "In Pound",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  // three radio button
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttos
                      new Radio<int>(
                          activeColor: Colors.lightBlue,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.indigoAccent,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.green,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  // Result Text
                  new Text(
                    _weightController.text.isEmpty ? "Please enter Weight" : _formattedText + "lbs",
                      //"$formattedText lbs",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 19.4,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38;
    }
  }
}
