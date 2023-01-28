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

  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.search),
          Icon(Icons.home),
          Icon(Icons.perm_device_information_outlined)
        ],
      )),
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
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.airplanemode_on_sharp)),
                IconButton(onPressed: () {}, icon: Icon(Icons.hotel)),
                IconButton(onPressed: () {}, icon: Icon(Icons.directions_walk)),
                IconButton(
                    onPressed: () {
                      print("setting dark theme");
                      if (isdark) {
                        MyApp.of(context).changeTheme(ThemeMode.dark);
                      } else {
                        MyApp.of(context).changeTheme(ThemeMode.light);
                      }
                      setState(() {
                        isdark = !isdark;
                      });
                      ;
                    },
                    icon: Icon(Icons.tour))
              ],
            ),
            DestinationCarousel(),
            HotelCarousel()
          ],
        ),
      ),
    );
  }
}
