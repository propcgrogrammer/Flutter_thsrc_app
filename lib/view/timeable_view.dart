import 'package:app_thsrc_001/controller/timeable_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThsrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '高鐵時刻表',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThsrPage(title: '高鐵時刻表'),
    );
  }
}

class ThsrPage extends StatelessWidget {
  ThsrPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final TimeableController controller = Get.put(TimeableController());

  List<int> colorCodes = <int>[600, 300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(title),
        ),
        body: TimeableListView());
  }
}

class TimeableListView extends StatelessWidget {
  TimeableListView({Key? key}) : super(key: key);
  final TimeableController controller = Get.find<TimeableController>();

  List<int> colorCodes = <int>[600, 300];

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: controller.trainList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(6.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.amber[colorCodes[index % colorCodes.length]],
                  child: Text(controller.trainList[index].getFullTrainInfo())),
            );
          },
        ));
  }
}
