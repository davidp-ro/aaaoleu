// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'plantcard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.muktaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 42.0, bottom: 42.0),
              child: Text(
                "My Plants",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
            const PlantCard(
              title: "Potato",
              humidity: 0.64,
              growth: 0.45,
              temp: 26,
              lightOn: false,
              pH: 6.4,
            ),
            const PlantCard(
              title: "Basil",
              humidity: 0.72,
              growth: 0.32,
              temp: 27,
              pH: 7.1,
            ),
            const PlantCard(
              title: "Cucumber",
              humidity: 0.49,
              growth: 0.79,
              temp: 26,
              pH: 6.9,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () => {},
              icon: const Icon(Icons.add_rounded),
              label: const Text(
                "Add new Module",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
