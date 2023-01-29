import 'package:flutter/material.dart';

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
            width: ss.width,
            height: ss.width,
            child: Stack(children: [
              Hero(
                tag: widget.pdest["destinationName"],
                child: Image.asset(widget.pdest["img_path"]),
              ),
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
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              height: ss.height - (ss.width * .8),
              child: ListView.builder(
                  itemCount: widget.pdest["activities"].length,
                  itemBuilder: (BuildContext context, activities_idx) {
                    return Container(
                        height: ss.height * .2,
                        child: Row(children: [
                          Container(
                              height: ss.height * .2,
                              width: ss.width * .24,
                              child: Image.asset(widget.pdest["activities"]
                                  [activities_idx]["img_path"])),
                          Container(
                              height: ss.height * .2,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                        height: ss.height * .12,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: ss.width * .15,
                                                child: Column(children: [
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
                                                        ["activity_price"],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(widget.pdest[
                                                              "activities"]
                                                          [activities_idx]
                                                      ["activity_price_type"]),
                                                ]))
                                          ],
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: ss.height * .15,
                                        child: Column(children: [
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
        ])
      ]),
    ));
  }
}

class RatingWidget extends StatelessWidget {
  RatingWidget({Key? key, this.num_stars: 0}) : super(key: key);
  int num_stars;

  @override
  Widget build(BuildContext context) {
    List<Widget> build_stars = [];

    int bsidx = 0;
    while (bsidx < num_stars) {
      build_stars.add(Container(child: Icon(Icons.star)));
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
    List<Widget> build_times = [];

    int btidx = 0;
    while (btidx <= 2) {
      if (btidx == 2) {
        build_times.add(Container(child: Text("...")));
        break;
      }
      build_times.add(Container(child: Text(times_list[btidx])));
      btidx += 1;
    }

    return Row(
      children: build_times,
    );
  }
}
