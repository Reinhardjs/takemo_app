import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealerButton extends StatelessWidget {

  DealerButton({Key key, this.title = "Producers", this.imageAsset, this.imageUrl, this.padding = 20.0})
      : super(key: key);

  final String title;
  final String imageAsset;
  final String imageUrl;
  final double padding;

  @override
  Widget build(BuildContext context) {

    double borderRadius = 10;

    Widget getImage(String imageAsset, String imageUrl){
      if (imageAsset != "" && imageAsset != null){
        // example, imageAsset = "assets/bike_icon.png"
        return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image(image: AssetImage(imageAsset), fit: BoxFit.fill));
      } else if (imageUrl != "" && imageUrl != null){
        return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(imageUrl, fit: BoxFit.fill));
      }
    }

    return new Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: getImage(imageAsset, imageUrl),
            )
            // Text(title)
          ],
        ),
        padding: EdgeInsets.all(this.padding),
        margin: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 0.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius:
          new BorderRadius.all(new Radius.circular(borderRadius)),
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