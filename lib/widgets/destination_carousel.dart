import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelator/models/destination.dart';
import 'package:travelator/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  final List<Destination> _destinations = [
    new Destination("Bellandur", 23, "Busy roads, Busy roads, Busy roads",
        "India", "assets/bellandur.png"),
    new Destination("Koramangala", 35, "Night life, Night life, Night life",
        "India", "assets/koramangala.png"),
    new Destination(
        "Yelahanka",
        12,
        "Cheap alchohol, Cheap alchohol, Cheap alchohol",
        "India",
        "assets/yelahanka.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Destinations",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1)),
              GestureDetector(
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                onTap: () {
                  print("see all tapped");
                },
              )
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _destinations.length,
              itemBuilder: (BuildContext context, int index) {
                Destination destination = _destinations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DestinationScreen(
                                destination: destination,
                              ))),
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: 210.0,
                      child: Stack(alignment: Alignment.topCenter, children: <
                          Widget>[
                        Positioned(
                          bottom: 0.0,
                          child: Container(
                              height: 120.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${destination.activities} activities',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2)),
                                    Text(destination.description,
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: destination.image,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: 180.0,
                                    width: 180.0,
                                    image: AssetImage(destination.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(destination.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.locationArrow,
                                              size: 12.0, color: Colors.white),
                                          SizedBox(width: 5.0),
                                          Text(
                                            destination.country,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ])),
                );
              }),
        )
      ],
    );
  }
}
