import 'package:flutter/material.dart';
import 'package:travelator/models/hotel.dart';

class HotelCarousel extends StatelessWidget {
  final List<Hotel> _hotels = [
    new Hotel(
        "Taj", "Taj Hotel, Bellandur Road - 560103", 5000, "assets/hotel.png"),
    new Hotel("Sarovar Portico", "Sarovar Portico, Bellandur Road - 560103",
        4500, "assets/hotel2.png"),
    new Hotel("Ibis", "Ibis Hotel, Bellandur Road - 560103", 3200,
        "assets/hotel3.png")
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
              Text("Exclusive Hotels",
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
              itemCount: _hotels.length,
              itemBuilder: (BuildContext context, int index) {
                Hotel hotel = _hotels[index];
                return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 240.0,
                    child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                                height: 140.0,
                                width: 240.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(hotel.name,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2)),
                                      SizedBox(height: 2.0),
                                      Text(hotel.address,
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(height: 2.0),
                                      Text('₹${hotel.price} / night',
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w600))
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 180.0,
                                width: 210.0,
                                image: AssetImage(hotel.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ]));
              }),
        )
      ],
    );
  }
}
