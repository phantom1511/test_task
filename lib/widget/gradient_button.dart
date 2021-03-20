import 'package:flutter/material.dart';

import '../constants.dart';

class RaisedGradientButton extends StatelessWidget {
  final String label;
  final double size;
  final Function() onPressed;
  final Color color;

  const RaisedGradientButton(
      {Key key, this.label, this.size = 6, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 47,
      decoration: ShapeDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        gradient: LinearGradient(
            colors: [Palette.pictonBlueL, Palette.pictonBlue],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(size),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
