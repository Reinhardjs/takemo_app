import 'package:flutter/cupertino.dart';

class PromoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PromoWidgetState();
  }

}

class _PromoWidgetState extends State<PromoWidget>{

  @override
  Widget build(BuildContext context){
    print("_PromoWidgetState build");

    return new Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      constraints: BoxConstraints(minHeight: 150),
      height: 85,
      decoration: new BoxDecoration(
        color: Color(0xFFefefef),
        borderRadius: new BorderRadius.all(new Radius.circular(10)),
//          color: Color(0xff181c1f),
      ),
    );
  }
}