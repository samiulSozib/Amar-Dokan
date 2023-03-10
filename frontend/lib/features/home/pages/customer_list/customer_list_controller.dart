import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/features/home/pages/customer_list/customer_list_services.dart';
import 'package:frontend/model/customer.dart';
import 'package:frontend/model/transaction.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class CustomerListController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var isLoading = true.obs;
  var isLoading1 = true.obs;
  var allCustomer = <Customer>[].obs;
  var transactions = <TransactionElement>[].obs;
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

  void createTransaction(
      {required int dokanId,
      required int customerId,
      required double transactionAmount,
      required String notes,
      required String type}) async {
    try {
      isLoading(true);
      var result = await CustomerListServices.createTransaction(
          token: box.read("token"),
          dokanId: dokanId,
          customerId: customerId,
          transactionAmount: transactionAmount,
          notes: notes,
          type: type);

      if (result) {
        Fluttertoast.showToast(msg: "Transaction Success");
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchAllTransaction(
      {required int dokanId, required int customerId}) async {
    try {
      isLoading1(true);
      var abc = await CustomerListServices.getTransection(
        dokanId: dokanId,
        customerId: customerId,
        token: box.read("token"),
      );

      isLoading1(false);
      transactions.assignAll(abc);
      print(transactions);
    } finally {
      isLoading1(false);
    }
  }
}
