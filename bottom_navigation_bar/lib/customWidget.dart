import 'package:flutter/material.dart';

class BottomNavItem extends StatefulWidget {
  const BottomNavItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Icon icon;

  @override
  _BottomNavItemState createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (isHover) {
        setState(() {
          _isHover = isHover;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            height: 2,
            width: 20,
            color: _isHover ? Colors.white : Colors.transparent,
            duration: Duration(milliseconds: 200),
          ),
          SizedBox(
            height: 25,
          ),
          widget.icon,
          Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
