import 'package:frontend/features/home/pages/customer_list/customer_list_services.dart';
import 'package:frontend/model/customer.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class CustomerListController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var isLoading = true.obs;
  var allCustomer = <Customer>[].obs;
  final box = GetStorage();

  void fetchAllCustomer() async {
    try {
      isLoading(true);
      var customers = await CustomerListServices.getCustomers(
        token: box.read("token"),
      );
      allCustomer.assignAll(customers);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
