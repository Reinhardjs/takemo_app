import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takemo_app/ui/screens/bikeproductapp/BikeProductsScreen.dart';

import 'AppProductButton.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {

  final double height;

  const HomeAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeAppBarState();
  }
}

class _HomeAppBarState extends State<HomeAppBar> {

  static const platform = const MethodChannel('flutter.native/toast_helper');
  String _responseFromNativeCode = 'Waiting for Response...';


  Future<void> responseFromNativeCode() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('showToast');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }

    setState(() {
      _responseFromNativeCode = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 50),
        child: new WavyHeaderImage(),
      ),
      Positioned(
          bottom: MediaQuery
              .of(context)
              .size
              .height * 0.0275 + 18.5,
          child: Column(
            children: <Widget>[
              // Ini widget search bar
              new Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: MediaQuery
                          .of(context)
                          .size
                          .width * 0.08),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term'),
                  ),
                  constraints: BoxConstraints(maxWidth: 285),
                  height: 45,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.825,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery
                          .of(context)
                          .size
                          .height * 0.07,
                      horizontal: 15.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(100)),
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
                  )),

              // Ini widget 3 kotak di bawah search bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BikeProductsScreen(),
                          ),
                        );
                      },
                      child: AppProductButton(
                          imageAsset: "assets/bike_icon.png",
                          padding: 10.0
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BikeProductsScreen(),
                          ),
                        );
                      },
                      child: AppProductButton(
                          imageAsset: "assets/service_icon.png",
                          padding: 20.0
                      )
                  ),
                  GestureDetector(
                      onTap: responseFromNativeCode,
                      child: AppProductButton(
                          imageAsset: "assets/wash_icon.png",
                          padding: 20.0
                      )
                  )
                ],
              )
            ],
          )),
    ]);
  }

}

class WavyHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: BottomCurvedClipper(),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.9),
          blurRadius: 10.0, // has the effect of softening the shadow
          spreadRadius: 2, // has the effect of extending the shadow
          offset: Offset(
            0, // horizontal, move right 0
            3, // vertical, move down 10
          ),
        )
      ],
      child: new Container(
        constraints: BoxConstraints(minHeight: 150),
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        decoration: new BoxDecoration(
          color: Color(0xFF272727),
        ),
      ),
    );
  }
}

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 4, size.height - 30.0);
    var firstEndPoint = Offset(size.width / 2, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.75, size.height - 30);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//class MyAppBar extends StatelessWidget {
//  MyAppBar({this.title});
//
//  // Fields in a Widget subclass are always marked "final".
//
//  final Widget title;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 56.0, // in logical pixels
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      decoration: BoxDecoration(color: Colors.blue[500]),
//      // Row is a horizontal, linear layout.
//      child: Row(
//        // <Widget> is the type of items in the list.
//        children: <Widget>[
//          IconButton(
//            icon: Icon(Icons.menu),
//            tooltip: 'Navigation menu',
//            onPressed: null, // null disables the button
//          ),
//          // Expanded expands its child to fill the available space.
//          Expanded(
//            child: title,
//          ),
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//      ),
//    );
//  }
//}
