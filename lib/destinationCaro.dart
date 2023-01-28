import 'package:flutter/material.dart';

List destinations = ["Paris", "New York", "Tokyo"];

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: ss.width * .04),
            child: Row(children: [
              Text("Top Destinations",
                  style: TextStyle(fontSize: ss.width * .07)),
              GestureDetector(
                onTap: () {
                  print("push see all");
                },
                child: Text("See All",
                    style: Theme.of(context)
                        .copyWith(
                            textTheme: TextTheme(
                                bodySmall: TextStyle(color: Colors.lightBlue)))
                        .textTheme
                        .bodySmall),
              )
            ])),
        SizedBox(
            height: ss.height * .6,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, destinations_idx) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(),
                  );
                }))
      ],
    );
  }
}
