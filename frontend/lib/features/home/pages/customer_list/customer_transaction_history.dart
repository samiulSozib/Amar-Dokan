import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/features/home/pages/customer_list/customer_list_controller.dart';
import 'package:frontend/model/customer.dart';
import 'package:get/get.dart';

import '../../../../model/transaction.dart';

class CustomerTransactionHostory extends StatefulWidget {
  Customer customer;
  CustomerTransactionHostory({required this.customer, super.key});

  @override
  State<CustomerTransactionHostory> createState() =>
      _CustomerTransactionHostoryState();
}

class _CustomerTransactionHostoryState
    extends State<CustomerTransactionHostory> {
  final CustomerListController _customerListController =
      Get.put(CustomerListController());

  @override
  void initState() {
    _customerListController.fetchAllTransaction(
        dokanId: widget.customer.dokanId!, customerId: widget.customer.id!);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.customer.customerName!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.customer.customerPhone!,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.customer.customerAddress!,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.customer.totalAmount!.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => _customerListController.isLoading1.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (constex, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white70,
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Date: ${_customerListController.transactions[index].createdAt}"),
                                      Text(
                                          "Transaction Amount: ${_customerListController.transactions[index].transactionAmount}"),
                                      _customerListController
                                                  .transactions[index]
                                                  .dokanstaff !=
                                              null
                                          ? Text(
                                              "Prepared By: ${_customerListController.transactions[index].dokanstaff!.staffName}")
                                          : const Text("Prepared By: Admin")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: _customerListController.transactions.length,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
