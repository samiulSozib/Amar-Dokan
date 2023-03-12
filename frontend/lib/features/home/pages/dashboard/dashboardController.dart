import 'package:frontend/features/home/pages/dashboard/dashboard_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../model/unpaidTransaction.dart';

class DashBoardController extends GetxController {
  final RxString dokanName = "".obs;
  final RxString dokanAddress = "".obs;
  final RxString dokanPhone = "".obs;
  final box = GetStorage();
  final RxInt unpaidCustomer = 0.obs;
  final RxDouble unpaidTotalAmount = 0.0.obs;
  final isLoading = false.obs;
  final unpaidHistoryByMonth = <Month>[].obs;

  @override
  void onInit() {
    getDokanInformation();
    getUnpaidInfo();
    getUnpaidByMonth();
    super.onInit();
  }

  void getDokanInformation() async {
    if (box.read("user")['type'] == 'dokanAdmin') {
      dokanName.value = box.read("user")['info']['dokanName'];
      dokanAddress.value = box.read("user")['info']['address'];
      dokanPhone.value = box.read("user")['info']['phone'];
    } else {
      dokanName.value = box.read("user")['info'][0]['dokanName'];
      dokanAddress.value = box.read("user")['info'][0]['address'];
      dokanPhone.value = box.read("user")['info'][0]['phone'];
    }
  }

  void getUnpaidInfo() async {
    try {
      var result = await DashBoardServices.getUnpaidCustomerAndAmount(
        token: box.read("token"),
      );
      unpaidCustomer.value = result[0].count!;
      unpaidTotalAmount.value = result[0].totalAmount!;
    } finally {}
  }

  void getUnpaidByMonth() async {
    try {
      isLoading(true);
      var result = await DashBoardServices.getUnpaidHistoryByMonth(
        token: box.read("token"),
      );
      unpaidHistoryByMonth.assignAll(result);
      print(unpaidHistoryByMonth);
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }
}
