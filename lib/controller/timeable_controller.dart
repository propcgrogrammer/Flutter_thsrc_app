import 'package:app_thsrc_001/model/trainInfo_model.dart';
import 'package:app_thsrc_001/service/timeable_service.dart';
import 'package:get/get.dart';

class TimeableController extends GetxController {
  var trainList = <TrainInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTimeable();
  }

  void fetchTimeable() async {
    var trains = await TimeableService().fetchTimeable();
    if (trains != null) {
      trainList.value = trains as List<TrainInfo>;
    }
  }
}
