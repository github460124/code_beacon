import 'package:flutter/material.dart';

class TransformIcon extends StatefulWidget {
  final IconData iconData;
  final String string;

  const TransformIcon({Key key, this.iconData, this.string}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TransformIcon();
  }
}

class _TransformIcon extends State<TransformIcon>
    with TickerProviderStateMixin {
  AnimationController animationControllerTransIcon;
  Animation animationIcon;
  Animation animationText;

  bool isButChecked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _OnTap,
      child: Container(
        color: Colors.white,
        child: SizedBox(
          height: 60,
          width: 120,
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Transform.scale(
                    scale: getScaleValue(animationText.value),
                    child: Transform.rotate(
                      angle: getRotateValue(animationIcon.value),
                      child: Icon(
                        widget.iconData,
                        size: 30,
                        color: getColor(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.scale(
                    scale: getScaleValue(animationText.value),
                    child: Text(
                      widget.string,
                      style: TextStyle(color: getColor(), fontSize: 18,fontFamily: 'siyuan'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    animationControllerTransIcon =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationIcon =
        Tween(begin: 0.0, end: 0.8).animate(animationControllerTransIcon);
    animationText =
        Tween(begin: 1.0, end: 0.2).animate(animationControllerTransIcon);
    animationIcon.addListener(() {
      setState(() {});
    });
    animationText.addListener(() {
      setState(() {});
    });
  }

  _OnTap() {
    if (!isButChecked) {
      animationControllerTransIcon.reset();
      animationControllerTransIcon.forward();
      print("111");
    }
    if (isButChecked) {
      animationControllerTransIcon.reset();
      animationControllerTransIcon.forward();
      print("222");
    }
    isButChecked = !isButChecked;
    //animationControllerTransIcon.reset();
  }

  double getScaleValue(double value) {
    if (value >= 0.8) {
      return value;
    } else if (value > 0.4) {
      return 1.6 - value;
    } else {
      return 0.8 + value;
    }
  }

  double getRotateValue(double value) {
    if (value <= 0.2) {
      return value;
    } else if (value <= 0.6) {
      return 0.4 - value;
    } else {
      return -(0.8 - value);
    }
  }

  getColor() {
    if (isButChecked) {
      return Colors.amber;
    } else
      return Colors.grey;
  }
}
