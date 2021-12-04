import 'package:flutter/material.dart';

class PlantCard extends StatefulWidget {
  final String title;
  final double temp, humidity, growth, pH, targetpH;
  final bool lightOn;
  const PlantCard({
    Key? key,
    this.title = "MODULE",
    this.humidity = 0,
    this.growth = 0,
    this.temp = 0,
    this.lightOn = true,
    required this.pH,
    this.targetpH = 7,
  }) : super(key: key);

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    Dialog(
                      insetPadding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 12,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Growth percentage: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 8,
                                            value: widget.growth,
                                            color: Colors.lightGreen,
                                            backgroundColor: Colors.black12,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          top: 50,
                                          child: Text(
                                            "${widget.growth * 100}%",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 24,
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Temperature:",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "${widget.temp} ° C",
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, bottom: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Humidity",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    height: 10,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
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
                            ),
                            Text(
                              "pH level: ${widget.pH}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Target pH for this plant: ${widget.targetpH}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 3, color: Colors.white),
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: widget.lightOn
                                      ? const Color.fromRGBO(215, 162, 222, 1)
                                      : Colors.grey,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Light ${widget.lightOn ? 'ON' : 'OFF'}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 18.0),
                              child: Text(
                                "Planted on: 25/11/2021",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: SizedBox(
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
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 2),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                strokeWidth: 8,
                                value: widget.growth,
                                color: Colors.lightGreen,
                                backgroundColor: Colors.black12,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              top: 40,
                              child: Text(
                                "${widget.growth * 100}".split('.')[0] + "%",
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
                                width: 195,
                                height: 10,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Temperature:       ${widget.temp} °C",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ])
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
