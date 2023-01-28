import 'package:flutter/material.dart';
import 'package:travel_places_ui/destinationDetail.dart';

List<Map> destinationdata = [
  {
    "destinationName": "Paris",
    "activityCount": "3 Activites",
    "description":
        "Paris is a city unlike any other. It is overflowing with culture, history, and beauty. And while people travel to Paris to see the Louvre",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "destinationName": "New York",
    "activityCount": "3 Activites",
    "description":
        "Cool, cosmopolitan, crowded, constantly evolving … the Big Apple blends big city splendor with small-town charm. Amid New York's iconic landmarks and towering skyscrapers",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "destinationName": "Tokyo",
    "activityCount": "3 Activites",
    "description":
        "Today, Tokyo offers a seemingly unlimited choice of shopping, entertainment, culture and dining to its visitors. The city's history can be",
    "img_path": "assets/images/paris_travel.webp"
  }
];

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
            height: ss.height * .33,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinationdata.length,
                itemBuilder: (BuildContext context, destinations_idx) {
                  return Padding(
                      padding: EdgeInsets.fromLTRB(
                          ss.width * .04, ss.width * .02, ss.width * .04, 0.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DestinationDetail(
                                destinationdata[destinations_idx]);
                          }));
                        },
                        child: Container(
                            width: ss.width * .46,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                    bottom: ss.height * .01,
                                    child: Container(
                                        height: ss.height * .47,
                                        width: ss.width * .46,
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).canvasColor,
                                            borderRadius: BorderRadius.circular(
                                                ss.height * .03)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              destinationdata[destinations_idx]
                                                  ["activityCount"],
                                            ),
                                            Text(
                                              destinationdata[destinations_idx]
                                                  ["description"],
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ))),
                                Container(
                                  height: ss.width * .46,
                                  child: Stack(children: [
                                    Hero(
                                      tag: destinationdata[destinations_idx]
                                          ["destinationName"],
                                      child: Container(
                                          height: ss.width * .46,
                                          width: ss.width * .46,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ss.width * .04),
                                              child: Image.asset(
                                                  destinationdata[
                                                          destinations_idx]
                                                      ["img_path"],
                                                  height: ss.height * .25,
                                                  width: ss.height * .25,
                                                  fit: BoxFit.fill))),
                                    ),
                                    Container(
                                        height: ss.height * .25,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                destinationdata[
                                                        destinations_idx]
                                                    ["destinationName"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: ss.width * .06))
                                          ],
                                        ))
                                  ]),
                                )
                              ],
                            )),
                      ));
                }))
      ],
    );
  }
}
