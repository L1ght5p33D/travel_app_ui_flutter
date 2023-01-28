import 'package:flutter/material.dart';

List<Map> hoteldata = [
  {"hotelName": "Paris", "hotelLocation": "3 Activites", "price": "Stuff"},
  {"hotelName": "Paris", "hotelLocation": "3 Activites", "price": "Stuff"},
  {"hotelName": "Paris", "hotelLocation": "3 Activites", "price": "Stuff"},
];

class HotelCarousel extends StatefulWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: ss.width * .04),
            child: Row(children: [
              Text("Exclusive Hotels",
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
                itemCount: hoteldata.length,
                itemBuilder: (BuildContext context, hotels_idx) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: ss.width * .3,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                                bottom: ss.height * .01,
                                child: Container(
                                    color: Theme.of(context).backgroundColor,
                                    height: ss.height * .15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ss.height * .03)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hoteldata[hotels_idx]["hotelName"],
                                        ),
                                        Text(
                                          hoteldata[hotels_idx]
                                              ["hotelLocation"],
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ))),
                            Container(
                              height: ss.height * .25,
                              child: Stack(children: [
                                Hero(
                                    tag: hoteldata[hotels_idx]["hotelName"],
                                    child: Container(
                                        height: ss.height * .25,
                                        child: Image.asset(hoteldata[hotels_idx]
                                            ["img_path"]))),
                              ]),
                            )
                          ],
                        )),
                  );
                }))
      ],
    );
  }
}
