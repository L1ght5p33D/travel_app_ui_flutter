import 'package:flutter/material.dart';
import 'package:travel_places_ui/destinationCaro.dart';
import 'package:travel_places_ui/hotelCaro.dart';
import 'package:travel_places_ui/main.dart';

class TravelHome extends StatefulWidget {
  TravelHome({super.key});

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  bool isdark = false;

  Color airplane_fill_color = Colors.white;
  Color airplane_icon_color = Colors.black;
  Color bed_fill_color = Colors.white;
  Color bed_icon_color = Colors.black;
  Color walk_fill_color = Colors.white;
  Color walk_icon_color = Colors.black;
  Color flag_fill_color = Colors.white;
  Color flag_icon_color = Colors.black;

  bool airplane_fill_color_active = true;
  bool bed_fill_color_active = false;
  bool walk_fill_color_active = false;
  bool flag_fill_color_active = false;

  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;

    if (airplane_fill_color_active) {
        airplane_fill_color = Color(0xffbbfce4);
        airplane_icon_color = Colors.black;
    }
    else{
        airplane_fill_color = Colors.white;
        airplane_icon_color = Colors.black;
         }
    if (bed_fill_color_active) {
        bed_fill_color = Color(0xffbbfce4);
        bed_icon_color = Colors.black;
    }
    else{
        bed_fill_color = Colors.white;
        bed_icon_color = Colors.black;
   }
    if (walk_fill_color_active) {
        walk_fill_color = Color(0xffbbfce4);
        walk_icon_color = Colors.black;
    }
    else{
        walk_fill_color = Colors.white;
        walk_icon_color = Colors.black;
       }
    if (flag_fill_color_active) {
        flag_fill_color = Color(0xffbbfce4);
        flag_icon_color = Colors.black;
    }
    else{
        flag_fill_color = Colors.white;
        flag_icon_color = Colors.black;
 }
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: ss.width * .03),
              child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.search),
          Icon(Icons.home),
          Icon(Icons.perm_device_information_outlined)
        ],
      ))),
      body: Container(
        height: ss.height,

        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(ss.width * .05),
                      child: Text("Find Your Next Destination",
                          style: TextStyle(fontSize: ss.width * .08))),
                )
              ],
            ),
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: ss.width * .12,
                    child:
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      airplane_fill_color_active = true;
                      bed_fill_color_active = false;
                      walk_fill_color_active = false;
                      flag_fill_color_active = false;
                    });
                  },
                  splashColor: Colors.tealAccent,
                  elevation: 2.0,
                  fillColor: airplane_fill_color,
                  child: Icon(
                      Icons.airplanemode_on_sharp,
                  color: airplane_icon_color,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                )),
                Container(
                    width: ss.width * .12,
                    child:
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      airplane_fill_color_active = false;
                      bed_fill_color_active = true;
                      walk_fill_color_active = false;
                      flag_fill_color_active = false;
                    });
                  },
                  splashColor: Colors.tealAccent,
                  elevation: 2.0,
                  fillColor: bed_fill_color,
                  child: Icon(Icons.hotel,
                      color: bed_icon_color
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                )),
                Container(
                    width: ss.width * .12,
                    child:
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      airplane_fill_color_active = false;
                      bed_fill_color_active = false;
                      walk_fill_color_active = true;
                      flag_fill_color_active = false;
                    });
                  },
                  splashColor: Colors.tealAccent,
                  elevation: 2.0,
                  fillColor: walk_fill_color,
                  child: Icon(Icons.directions_walk,
                  color: walk_icon_color,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                )),
                Container(
                    width: ss.width * .12,
                    child:RawMaterialButton(
                  onPressed: () {
                    if (!isdark) {
                    MyApp.of(context).changeTheme(ThemeMode.dark);
                  } else {
                    MyApp.of(context).changeTheme(ThemeMode.light);
                  }
                  setState(() {
                    isdark = !isdark;
                  });
                  setState(() {
                    airplane_fill_color_active = false;
                    bed_fill_color_active = false;
                    walk_fill_color_active = false;
                    flag_fill_color_active = true;
                  });
                  },
                      splashColor: Colors.tealAccent,
                  elevation: 2.0,
                  fillColor: flag_fill_color,
                  child: Icon(Icons.tour,
                            color:flag_icon_color
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                )),
              ],
            ),
            Container(height: ss.height * .04,),
            DestinationCarousel(),
            Container(height: ss.height * .04,),
            HotelCarousel()
          ],
        ),
      ),
    );
  }
}
