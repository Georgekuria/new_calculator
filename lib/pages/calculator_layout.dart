import 'package:flutter/material.dart';
import 'package:new_calculator/methods/calculationMethods.dart';
import 'package:new_calculator/models/button_details.dart';
import 'package:new_calculator/utils/button_outlook.dart';

class CalculatorLayout extends StatefulWidget {
  const CalculatorLayout({super.key});

  @override
  State<CalculatorLayout> createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  CalculationMethods calculationMethods = CalculationMethods();

  static String number1 = "";
  static String operation = "";
  static String number2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [buildOutputSection(), buildButtonSection()],
      )),
    );
  }

  Widget buildOutputSection() {
    return Expanded(
        child: SingleChildScrollView(
      reverse: true,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "$number1$operation$number2".isEmpty
              ? "0"
              : "$number1$operation$number2",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          textAlign: TextAlign.end,
        ),
      ),
    ));
  }

  Widget buildButtonSection() {
    final screenSize = MediaQuery.of(context).size;
    return Wrap(
      children: Buttons.buttonValues
          .map((buttonValue) => SizedBox(
              width: [Buttons.n0].contains(buttonValue)
                  ? screenSize.width / 2
                  : screenSize.width / 4,
              height: screenSize.width / 4,
              child: buildButtonOutlook(buttonValue)))
          .toList(),
    );
  }

  Widget buildButtonOutlook(String buttonValue) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              color: getButtonColor(buttonValue),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200, spreadRadius: 4, blurRadius: 3)
              ]),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () => onButtonTapped(buttonValue),
            child: Text(
              buttonValue,
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Color getButtonColor(String buttonValue) {
    return [Buttons.del, Buttons.clr].contains(buttonValue)
        ? Colors.blue
        : [
            Buttons.per,
            Buttons.multiply,
            Buttons.add,
            Buttons.divide,
            Buttons.subtract
          ].contains(buttonValue)
            ? Colors.orange
            : Colors.black87;
  }

  onButtonTapped(String buttonValue) {
    appendButtonValue(buttonValue);
  }

  appendButtonValue(String buttonValue) {
    if (buttonValue != Buttons.dot && int.tryParse(buttonValue) == null) {
      if (operation.isNotEmpty && number2.isNotEmpty) {
        performCalculation();
      }
      operation = buttonValue;
    } else if (number1.isEmpty || operation.isEmpty) {
      if (buttonValue == Buttons.dot && number1.contains(Buttons.dot)) return;
      if (buttonValue == Buttons.dot &&
          (number1.isEmpty || number1 == Buttons.n0)) {
        buttonValue = "0.";
      }
      number1 += buttonValue;
    } else if (number2.isEmpty || operation.isNotEmpty) {
      if (buttonValue == Buttons.dot && number2.contains(Buttons.dot)) return;
      if (buttonValue == Buttons.dot &&
          (number2.isEmpty || number2 == Buttons.n0)) {
        buttonValue = "0.";
      }
      number2 += buttonValue;
    }
    setState(() {});
  }

  //perform final calculation
  performCalculation() {}
}
