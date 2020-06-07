import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropButton extends StatefulWidget {
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String _dropDownValue = 'Season 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DropdownButton<String>(
          underline: Container(
            color: Colors.white12,
          ),
          dropdownColor: Colors.blueGrey,
          value: _dropDownValue,
          items: <String>['Season 1', 'Season 2', 'Season 3']
              .map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          icon: FaIcon(
            FontAwesomeIcons.angleDown,
            color: Colors.white,
            size: 25,
          ),
          elevation: 16,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          onChanged: (String newValue) {
            setState(() {
              _dropDownValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
