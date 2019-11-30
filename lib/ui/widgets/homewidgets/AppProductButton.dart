import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProductButton extends StatelessWidget {

  AppProductButton({Key key, this.imageAsset, this.padding = 20.0})
      : super(key: key);

  final String imageAsset;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(this.padding),
        child: Image(
            image: AssetImage(imageAsset),
            width: 50,
            height: 50),
        constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: 80,
            minHeight: 50,
            maxHeight: 80),
        height: MediaQuery
            .of(context)
            .size
            .width * 0.245,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.245,
        margin: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal:
            MediaQuery
                .of(context)
                .size
                .width * 0.035),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius:
          new BorderRadius.all(new Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 7.0,
              // has the effect of softening the shadow
              spreadRadius: 0.75,
              // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 0
                1, // vertical, move down 10
              ),
            )
          ],
        ));
  }
}