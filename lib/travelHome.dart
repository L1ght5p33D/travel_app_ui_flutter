import 'package:flutter/material.dart';
import 'package:travel_places_ui/destinationCaro.dart';

class TravelHome extends StatefulWidget {
  const TravelHome({super.key});

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Next Destination"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.airplanemode_on_sharp)),
                IconButton(onPressed: () {}, icon: Icon(Icons.hotel)),
                IconButton(onPressed: () {}, icon: Icon(Icons.directions_walk)),
                IconButton(onPressed: () {}, icon: Icon(Icons.tour))
              ],
            ),
            DestinationCarousel()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
