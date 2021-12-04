import 'package:flutter/material.dart';

class AddModuleSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  Center(
                    child: Text(
                      "Add a new Module",
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a search term',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
