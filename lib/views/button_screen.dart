import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:taskforbdcalling/utility/app_colors.dart';
import 'package:taskforbdcalling/utility/app_text.dart';

import '../data/model_class/android_version.dart';
import 'output_display_screen.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  Future<List<List<AndroidVersion>>> loadJsonFile(String fileName) async {
    final String response =
        await rootBundle.loadString('assets/json_file/$fileName');
    final List<dynamic> jsonData = json.decode(response);
    return sendJsonFile(jsonData);
  }

  List<List<AndroidVersion>> sendJsonFile(List<dynamic> jsonData) {
    return jsonData.map<List<AndroidVersion>>((element) {
      if (element is Map<String, dynamic>) {
        int maxKey =
            element.keys.map(int.parse).reduce((a, b) => a > b ? a : b);
        return List<AndroidVersion>.generate(maxKey + 1, (index) {
          return element.containsKey(index.toString())
              ? AndroidVersion(
                  id: element[index.toString()]['id'],
                  title: element[index.toString()]['title'],
                )
              : AndroidVersion(id: null, title: null);
        });
      } else if (element is List) {
        return element.map<AndroidVersion>((item) {
          return AndroidVersion(
            id: item['id'],
            title: item['title'],
          );
        }).toList();
      } else {
        throw const FormatException("Unexpected JSON");
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppText.bottomScreenAppBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                final data = await loadJsonFile('input1.json');
                if (context.mounted) {
                  navigatorToDisplayScreen(context, data, true);
                }
              },
              child: const Text(
                AppText.outputOne,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final data = await loadJsonFile('input2.json');
                if (context.mounted) {
                  navigatorToDisplayScreen(context, data, false);
                }
              },
              child:  const Text(
               AppText.outputTow,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigatorToDisplayScreen(BuildContext context,
      List<List<AndroidVersion>> jsonData, bool isDisplay1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayScreen(
          jsonData: jsonData,
          isDisplay1: isDisplay1,
        ),
      ),
    );
  }
}
