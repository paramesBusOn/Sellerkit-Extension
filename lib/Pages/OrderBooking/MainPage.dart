import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/ConstantRoutes.dart';
import 'package:sellerkit/Constant/ConstantSapValues.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/OrderController/OrderNewController.dart';
import 'package:sellerkit/Pages/OrderBooking/Screens/TabOrders.dart';
import 'package:sellerkit/Pages/OrderBooking/TabScreen/Newtabpage.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/pos-widget/SOBar.dart';
import 'package:sellerkit/Widgets/Navi3.dart';

class OrderMainpage extends StatefulWidget {
  const OrderMainpage({super.key});

  @override
  State<OrderMainpage> createState() => _OrderMainpageState();
}

class _OrderMainpageState extends State<OrderMainpage> {
  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Open'),
    Tab(text: 'In-Process'),
    Tab(text: 'Closed'),
    // Tab(text: 'Lost'),
  ];
  TabController? controller;
  @override
  static bool iscomfromLead = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        // log("  iscomfromLead;"+  iscomfromLead.toString());

        if (ConstantValues.multistoreuser == 1) {
          context.read<OrderNewController>().restricteddialog(context);
        } else {
          if (iscomfromLead == false) {
            log("ANBU222::");
            context.read<OrderNewController>().init();
          } else if (iscomfromLead == true) {
            log("ANBU::");
            context.read<OrderNewController>().checkComeFromEnq(context);

            iscomfromLead = false;
          }
        }
      });

      // print("sap user id: "+ConstantValues.sapUserID);

      // log("page on: "+context.read<OrderNewController>().pageChanged.toString());
      // log("showItemList"+context.read<OrderNewController>().showItemList.toString());
      //  log("oldcutomer: "+context.read<OrderNewController>().oldcutomer.toString());
    });
  }

  DateTime? currentBackPressTime;
  Future<bool> onbackpress() {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.dashboard);
      return Future.value(true);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 800) {
        return OrdersTabPage();
      } else {
        return WillPopScope(
            onWillPop: onbackpress,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              // key: scaffoldKey1,
              drawerEnableOpenDragGesture: false,
              backgroundColor: Colors.grey[300],
              // appBar:  SOappbar("Sales Order",scaffoldKey1, theme, context ),
              drawer: drawer3(context),
              //  endDrawer: navDrawerOrder(),
              body: (context
                          .read<OrderNewController>()
                          .getexceptionOnApiCall
                          .isEmpty &&
                      context
                              .read<OrderNewController>()
                              .getcustomerapicLoading ==
                          true)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (context
                              .read<OrderNewController>()
                              .getexceptionOnApiCall
                              .isNotEmpty &&
                          context
                                  .read<OrderNewController>()
                                  .getcustomerapicLoading ==
                              false)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context
                                    .read<OrderNewController>()
                                    .getexceptionOnApiCall,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      : NewOrdersTabPage(),

              //  floatingActionButton: Padding(
              //     padding:  EdgeInsets.only(
              //       left: Screens.width(context)*0.4
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       // crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         // FloatingActionButton(
              //         //   heroTag: 'bt1',
              //         //   onPressed: () {
              //         //     context.read<OrderTabController>().clearfilterval();
              //         //     context.read<OrderTabController>().getdbmodel();
              //         //     scaffoldKey1.currentState?.openEndDrawer();
              //         //   },
              //         //   child: Icon(Icons.filter_alt),
              //         // ),
              //         // SizedBox(
              //         //   height: Screens.padingHeight(context) * 0.01,
              //         // ),
              //         // FloatingActionButton(
              //         //   heroTag: 'bt2',
              //         //   onPressed: () {
              //         //     Get.toNamed(ConstantRoutes.ordernew)!.then((value) {});
              //         //   },
              //         //   child: Icon(Icons.add),
              //         // ),

              //       ],
              //     ),
              //   ),
            ));
      }
    });
  }
}
