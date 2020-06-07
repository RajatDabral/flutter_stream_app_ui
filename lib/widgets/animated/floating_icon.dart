import 'package:flutter/material.dart';

class FloatingIcon extends StatefulWidget {
  @override
  _FloatingIconState createState() => _FloatingIconState();
}

class _FloatingIconState extends State<FloatingIcon>
    with SingleTickerProviderStateMixin {

      bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.cancel),
      onPressed: (){
        setState(() {
          _isVisible = !_isVisible;
        });
      
      },
      
    );
  }
}
