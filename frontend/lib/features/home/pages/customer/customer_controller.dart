import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/features/home/pages/customer/customer_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomerController extends GetxController {
  RxBool isLoading = false.obs;
  final box = GetStorage();

  Future<void> addCustomer({
    required String customerName,
    required String customerPhone,
    required String customerAddress,
  }) async {
    try {
      isLoading(true);
      var token = box.read("token");
      var res = await CustomerService.addCustomer(
          customerName: customerName,
          customerPhone: customerPhone,
          customerAddress: customerAddress,
          token: token);

      if (res) {
        Fluttertoast.showToast(msg: "Customer Add Success");
        isLoading(false);
      } else {
        Fluttertoast.showToast(msg: "Customer Add Fail");
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
