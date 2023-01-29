import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DestinationDetail extends StatefulWidget {
  DestinationDetail(
    this.pdest, {
    Key? key,
  }) : super(key: key);

  Map pdest;
  @override
  _DestinationDetailState createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail> {
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Scaffold(body:Container(
      height: ss.height,
      child: Stack(children: [
        Container(
            height: ss.width,
            width: ss.width,
            child: Stack(children: [
              Hero(
                tag: widget.pdest["destinationName"],
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(ss.width*.08), bottomRight: Radius.circular(ss.width*.08)),
                  child: Image.asset(widget.pdest["img_path"],
                                  height: ss.width,
                                  width: ss.width,
                                  fit:BoxFit.fill
                ),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      IconButton(
                          onPressed: () {
                            print("search press");
                          },
                          icon: Icon(Icons.search))
                    ],
                  ),
                  Row(
                    children: [Text(widget.pdest["destinationName"])],
                  )
                ],
              )
            ])),
        Container(
            height: ss.height ,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
        height: ss.height - (ss.width ),child: ListView.builder(
                  itemCount: widget.pdest["activities"].length,
                  itemBuilder: (BuildContext context, activities_idx) {
                    return Container(
                        height: ss.height * .2,
                        width: ss.width * .96,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ss.width*.05),
                            color: Theme.of(context).canvasColor
                        ),
                        child: Row(children: [
                          Container(
                              height: ss.height * .2,
                              width: ss.width * .24,
                              child:ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(
                                      ss.width * .04),
                                  child:  Image.asset(widget.pdest["activities"]
                                  [activities_idx]["img_path"],
                                    height: ss.height * .2,
                                    width: ss.width * .24,
                                    fit:BoxFit.fill
                                  ))),
                          Container(
                              height: ss.height * .2,
                              child: Column(
                                  children: [
                                Row(
                                  children: [
                                    Container(
                                        height: ss.height * .12,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: ss.width * .6,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                  Text(
                                                    widget.pdest["activities"]
                                                            [activities_idx]
                                                        ["activity_name"],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                      widget.pdest["activities"]
                                                              [activities_idx]
                                                          ["activity_type"]),
                                                ])),
                                            Container(
                                                width: ss.width * .15,
                                                child: Column(children: [
                                                  Text(
                                                    widget.pdest["activities"]
                                                            [activities_idx]
                                                        ["activity_price"].toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),

                                                ]))
                                          ],
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                        width: ss.width * .76,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                          RatingWidget(
                                              num_stars:
                                                  widget.pdest["activities"]
                                                          [activities_idx]
                                                      ["num_stars"]),
                                          TimesWidget(
                                              times_list:
                                                  widget.pdest["activities"]
                                                          [activities_idx]
                                                      ["times_list"])
                                        ])),
                                  ],
                                )
                              ]))
                        ]));
                  }))
        ]))
      ]),
    ));
  }
}

class RatingWidget extends StatelessWidget {
  RatingWidget({Key? key, this.num_stars: 0}) : super(key: key);
  int num_stars;

  @override
  Widget build(BuildContext context) {

    var ss = MediaQuery.of(context).size;
    List<Widget> build_stars = [];

    int bsidx = 0;
    while (bsidx < num_stars) {
      build_stars.add(Container(child: Icon(Icons.star, size:ss.width * .05)));
      bsidx += 1;
    }
    return Row(
      children: build_stars,
    );
  }
}

const List timesinit = [];

class TimesWidget extends StatelessWidget {
  TimesWidget({Key? key, this.times_list: timesinit}) : super(key: key);
  List times_list;
  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;
    List<Widget> build_times = [];

    int btidx = 0;
    while (btidx <= 2) {
      if (btidx == 2) {
        build_times.add(Container(child: Text("...")));
        break;
      }
      build_times.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: ss.width*.02),
          child:Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(ss.width * .04),
            color: Theme.of(context).scaffoldBackgroundColor,),

          child: Padding(
              padding: EdgeInsets.fromLTRB(ss.width * .04, ss.width * .01, ss.width * .04, ss.width * .01),
              child:Text(times_list[btidx])))));
      btidx += 1;
    }

    return Row(
      children: build_times,
    );
  }
}
