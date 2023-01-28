import 'package:flutter/material.dart';

List<Map> destinationdata = [
  {
    "destinationName": "Paris",
    "activityCount": "3 Activites",
    "description": "Stuff",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "destinationName": "New York",
    "activityCount": "3 Activites",
    "description": "ny stuff",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "destinationName": "Tokyo",
    "activityCount": "3 Activites",
    "description": " tokyo stuff",
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
                        onTap: () {},
                        child: Container(
                            width: ss.width * .35,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                    bottom: ss.height * .01,
                                    child: Container(
                                        height: ss.height * .15,
                                        width: ss.width * .36,
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
                                  height: ss.height * .25,
                                  child: Stack(children: [
                                    Hero(
                                        tag: destinationdata[destinations_idx]
                                            ["destinationName"],
                                        child: Container(
                                            height: ss.height * .25,
                                            width: ss.height * .25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ss.width * .02)),
                                            child: Image.asset(
                                                destinationdata[
                                                        destinations_idx]
                                                    ["img_path"],
                                                fit: BoxFit.cover))),
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
                                                    color: Colors.white))
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
