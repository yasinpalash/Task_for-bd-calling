import 'package:flutter/material.dart';
import 'package:taskforbdcalling/utility/app_text.dart';

import '../data/model_class/android_version.dart';

class DisplayScreen extends StatelessWidget {
  final List<List<AndroidVersion>> jsonData;
  final bool isDisplay1;

  const DisplayScreen({super.key, required this.jsonData, required this.isDisplay1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isDisplay1?const Text(AppText.outputScreenAppBar1):const Text(AppText.outputScreenAppBar2),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
        child: ListView.builder(
          itemCount: jsonData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: jsonData[index].map((version) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text(
                        version.title ?? '',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
