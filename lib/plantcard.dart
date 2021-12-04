import 'package:flutter/material.dart';

class PlantCard extends StatefulWidget {
  final String title;
  final double humidity, growth;
  const PlantCard(
      {Key? key, this.title = "MODULE", this.humidity = 0, this.growth = 0})
      : super(key: key);

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            value: widget.growth,
                            color: Colors.lightGreen,
                            backgroundColor: Colors.black12,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            top: 30,
                            child: Text(
                              "${widget.growth * 100}%",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Humidity",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text("${widget.humidity * 100}%  "),
                            SizedBox(
                              width: 205,
                              height: 10,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: widget.humidity,
                                  backgroundColor: Colors.black12,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.lightBlue),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Temperature:       22° C",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
