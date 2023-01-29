import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

List<Map> hoteldata = [
  {
    "hotelName": "Paris",
    "hotelLocation": "5 Activites",
    "price": "Stuff",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "hotelName": "Paris",
    "hotelLocation": "2 Activites",
    "price": "Stuff",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "hotelName": "Paris",
    "hotelLocation": "3 Activites",
    "price": "Stuff",
    "img_path": "assets/images/paris_travel.webp"
  },
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                                bottom: ss.height * .1,
                                child: Container(
                                    height: ss.height * .15,
                                    decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            ss.height * .03)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
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
