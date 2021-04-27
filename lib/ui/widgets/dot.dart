import 'package:flutter/material.dart';

class DotWidget extends StatefulWidget {
  final Color color;
  final double size;
  final EdgeInsets padding;

  const DotWidget({
    Key key,
    this.color,
    this.size = 16,
    this.padding,
  }) : super(key: key);

  @override
  _DotWidgetState createState() => _DotWidgetState();
}

class _DotWidgetState extends State<DotWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color ?? Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}