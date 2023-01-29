import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

List<Map> hoteldata = [
  {
    "hotelName": "&Beyond Mnemba Island",
    "hotelLocation": "Zanzibar, Tanzania",
    "price": "\$1270 / night",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "hotelName": "Belmond",
    "hotelLocation": "Caruso, Amalfi Coast",
    "price": "\$736 / night",
    "img_path": "assets/images/paris_travel.webp"
  },
  {
    "hotelName": "Soneva Jani",
    "hotelLocation": "Maldives",
    "price": "\$900 / night",
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
    return Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: ss.width * .04),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exclusive Hotels",
                          style: TextStyle(fontSize: ss.width * .05,
                                            fontWeight: FontWeight.w600)),
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
                height: ss.height * .43,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hoteldata.length,
                    itemBuilder: (BuildContext context, hotels_idx) {
                      return Padding(
                          padding: EdgeInsets.fromLTRB(
                              ss.width * .04, ss.width * .02, ss.width * .04, 0.0),
                          child: GestureDetector(
                            onTap: () {
                              print("get hotel indx" + hotels_idx.toString());

                            },
                            child: Container(
                                width: ss.width * .53,
                                decoration: BoxDecoration(
                                  // color: Colors.black,
                                    color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(
                                        ss.height * .03)),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Positioned(
                                        bottom: ss.height * .01,
                                        child: Container(
                                            height: ss.width * .33,
                                            width: ss.width * .48,
                                            decoration: BoxDecoration(
                                              // color: Colors.black,
                                                color:
                                                Theme.of(context).canvasColor,
                                                borderRadius: BorderRadius.circular(
                                                    ss.height * .03)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: ss.width * .18,
                                                    padding: EdgeInsets.only(bottom:ss.width * .01, left: ss.width * .01,  right: ss.width * .01, top:ss.width * .12),
                                                    child: Text(
                                                      hoteldata[hotels_idx]
                                                      ["hotelName"],
                                                      style: TextStyle(fontWeight: FontWeight.w700,
                                                                        fontSize: ss.width * .045
                                                      ),
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom:ss.width * .01, left: ss.width * .02,  right: ss.width * .01),
                                                    child:
                                                    SizedBox(
                                                        height: ss.width * .05,
                                                        width: ss.width * .44,
                                                        child:
                                                        Text(
                                                          hoteldata[hotels_idx]
                                                          ["hotelLocation"],
                                                          overflow: TextOverflow.ellipsis,
                                                          // softWrap: true,
                                                          style: TextStyle(fontSize: ss.width * .035,
                                                              fontWeight: FontWeight.w200) ,
                                                        ))
                                                ),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children:[
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom:ss.width * .01, left: ss.width * .02,  right: ss.width * .01),
                                                    child:
                                                    SizedBox(
                                                        height: ss.width * .05,
                                                        width: ss.width * .33,
                                                        child:
                                                        Text(
                                                          hoteldata[hotels_idx]
                                                          ["price"],
                                                          // overflow: TextOverflow.ellipsis,
                                                          softWrap: true,
                                                          style: TextStyle(fontSize: ss.width * .035,
                                                              fontWeight: FontWeight.w400) ,
                                                        ))
                                                )])
                                              ],
                                            ))),
                                    Container(
                                      height: ss.width * .46,
                                      width: ss.width * .44,
                                      child:
                                        Hero(
                                          tag: hoteldata[hotels_idx]
                                          ["hotelName"],
                                          child: Container(
                                              height: ss.width * .46,
                                              width: ss.width * .44,
                                              child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      ss.width * .04),
                                                  child: Image.asset(
                                                      hoteldata[
                                                      hotels_idx]
                                                      ["img_path"],
                                                      height: ss.width * .33,
                                                      width: ss.width * .44,
                                                      fit: BoxFit.fill))),
                                        ),
                                        )
                                      ]),
                            )         ),
                      );
                    }))
          ],
        ));
  }
}
