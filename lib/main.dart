// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:aaaoleu/add_module_modal.dart';
import 'package:aaaoleu/no_glow_scroll.dart';
import 'package:aaaoleu/providers/modules.dart';
import 'package:aaaoleu/services/embedded.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';
import 'plantcard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModuleProvider()),
      ],
      child: const LightWay(),
    ),
  );
}

class LightWay extends StatelessWidget {
  const LightWay({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
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
  final textController = TextEditingController(text: "192.168.43.104");

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      List<String> moduleURIs = prefs.getStringList("MODULES") ?? [];

      print("\n\n\n\nSP: $moduleURIs\n\n\n\n");

      for (String moduleURI in moduleURIs) {
        EmbeddedService.getData(moduleURI).then((data) {
          if (data != null) {
            context.read<ModuleProvider>().addModule(data);
            print("Added module from SharedPrefs: ${data.toString()}");
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 42.0),
                    child: Text(
                      "My Plants",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: context.watch<ModuleProvider>().results.length,
                    itemBuilder: (context, index) {
                      final module =
                          context.watch<ModuleProvider>().results[index];

                      return PlantCard(
                        title: module.name,
                        humidity: module.humidity,
                        growth: module.growth,
                        temp: module.temperature,
                        lightOn: module.lightOn,
                        pH: module.pH,
                        onLongPress: () {
                          final modules =
                              context.read<ModuleProvider>().results;
                          modules.removeAt(index);
                          context.read<ModuleProvider>().results = modules;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Deleted module")),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () async {
                      AddModuleSheet.show(context, textController, () async {
                        final data = await EmbeddedService.addModule(
                          "http://${textController.value.text}/",
                        );

                        if (data != null) {
                          context.read<ModuleProvider>().addModule(data);
                          print("\nAdded module: ${data.toString()}\n\n");
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              data != null
                                  ? "Successfully added!"
                                  : "Someting went wrong...",
                            ),
                          ),
                        );

                        Navigator.pop(context);
                      });
                    },
                    icon: const Icon(Icons.add_rounded, color: Colors.white),
                    label: const Text(
                      "Add new module",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text(
                    "Long tap a module to delete it",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
