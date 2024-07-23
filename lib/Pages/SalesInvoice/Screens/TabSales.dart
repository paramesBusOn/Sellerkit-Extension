// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/ConstantRoutes.dart';
import 'package:sellerkit/Constant/ConstantSapValues.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/SalesController/TabSalesController.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/Inprocesspage.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/WonOrderPage.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/navdrawerOrder.dart';
import '../../../Widgets/Navi3.dart';
import '../Widgets/OpenOrder.dart';

class SalesTabPage extends StatefulWidget {
  SalesTabPage({Key? key}) : super(key: key);

  @override
  State<SalesTabPage> createState() => LeadsTabState();
}

class LeadsTabState extends State<SalesTabPage> with TickerProviderStateMixin {
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
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3, initialIndex: 0);
    controller!.addListener(_handleTabChange);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log("comeFromEnq: " + SalesTabController.comeFromEnq.toString());
      if (SalesTabController.comeFromEnq == -1) {
        log("comeFromEnq: 11");
        context.read<SalesTabController>().clearAllListData();
        context.read<SalesTabController>().callGetAllApi();
        // context.read<SalesTabController>().callSummaryApi();
        context.read<SalesTabController>().getLeadStatus();
      } else if (SalesTabController.comeFromEnq != -1) {
        log("comeFromEnq: 22");
        log("SalesTabController.isSameBranch: ${SalesTabController.isSameBranch}");

        if (SalesTabController.isSameBranch == true) {
          context.read<SalesTabController>().clearAllListData();
          context.read<SalesTabController>().callGetAllApi();
          // context.read<SalesTabController>().callSummaryApi();
          context.read<SalesTabController>().getLeadStatus();
          context.read<SalesTabController>().comeFromEnqApi(
              context, SalesTabController.comeFromEnq.toString());
        } else {
          context.read<SalesTabController>().clearAllListData();

          context.read<SalesTabController>().callGetAllApi();
          // context.read<SalesTabController>().callSummaryApi();
          context.read<SalesTabController>().getLeadStatus();
          context.read<SalesTabController>().comeFromEnqApi(
              context, SalesTabController.comeFromEnq.toString());
        }
      }
    });
  }

  void _handleTabChange() {
    setState(() {
      context.read<SalesTabController>().mycontroller[10].clear();
      context.read<SalesTabController>().setListData();
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
    return WillPopScope(
      onWillPop: onbackpress,
      child: Scaffold(
        key: scaffoldKey1,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          actions: [
            IconButton(
                color: Colors.transparent,
                onPressed: () {},
                icon: Icon(Icons.filter_alt))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Screens.bodyheight(context) * 0.02),
              child: Column(
                children: [
                  Container(
                    height: Screens.bodyheight(context) * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            Screens.width(context) * 0.01),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: TextField(
                      controller:
                          context.read<SalesTabController>().mycontroller[10],
                      onTap: () {
                        // Get.toNamed(ConstantRoutes.screenshot);
                      },
                      autocorrect: false,
                      onChanged: (v) {
                        if (controller!.index.toString() == "0") {
                          context
                              .read<SalesTabController>()
                              .SearchFilterOpenTab(v);
                        } else if (controller!.index.toString() == "1") {
                          context
                              .read<SalesTabController>()
                              .SearchFilterWonTab(v);
                        } else if (controller!.index.toString() == "2") {
                          context
                              .read<SalesTabController>()
                              .SearchFilterlostTab(v);
                        }
                      },
                      decoration: InputDecoration(
                        filled: false,
                        hintText: 'Search',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: theme.primaryColor,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 5,
                        ),
                      ),
                    ),
                  ),
                  TabBar(
                    controller: controller,
                    tabs: myTabs,
                  ),
                ],
              ),
            ),
          ),
          title: GestureDetector(
              onTap: () {
                //              Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => const pdf()),
                // );
              },
              child: Text('Sales Invoice')),
        ),
        // :AppBar(
        //    backgroundColor: theme.primaryColor,
        //   title: Text('Leads'),),
        drawer: drawer3(context),
        endDrawer: navDrawerSales(),
        body:
            //  ChangeNotifierProvider<SalesTabController>(
            //         create: (context) => SalesTabController(),
            //         builder: (context, child) {
            //           return Consumer<SalesTabController>(
            //               builder: (BuildContext context, provi, Widget? child) {
            //     return

            GestureDetector(
          onHorizontalDragUpdate: (details) {
            // Check if the user is swiping from left to right
            print(details.primaryDelta);
            if (details.primaryDelta! > ConstantValues.slidevalue!) {
              setState(() {
                Get.offAllNamed(ConstantRoutes.dashboard);
              });
            }
          },
          child: context.watch<SalesTabController>().datagotByApi == true &&
                  context
                      .watch<SalesTabController>()
                      .getLeadCheckDataExcep
                      .isEmpty &&
                  (context
                          .watch<SalesTabController>()
                          .getleadSummaryOpen
                          .isNotEmpty ||
                      context
                          .watch<SalesTabController>()
                          .getleadSummaryWon
                          .isNotEmpty) &&
                  (context
                          .watch<SalesTabController>()
                          .filterleadOpenAllData
                          .isNotEmpty ||
                      context
                          .watch<SalesTabController>()
                          .filterleadinProcessAllData
                          .isNotEmpty ||
                      context
                          .watch<SalesTabController>()
                          .filterleadClosedAllData
                          .isNotEmpty)
              ? TabBarView(controller: controller, children: [
                  OpenSalesPage(
                    theme: theme,
                    leadOpenAllData: context
                        .read<SalesTabController>()
                        .filterleadOpenAllData,
                    leadSummaryOpen:
                        context.read<SalesTabController>().getleadSummaryOpen,
                    provi: context.watch<SalesTabController>(),
                  ),
                  InProcessPageSales(
                    theme: theme,
                    InProcessAllData: context
                        .read<SalesTabController>()
                        .filterleadinProcessAllData,
                    leadSummaryinprocess: context
                        .read<SalesTabController>()
                        .getleadSummaryinprocess,
                    provi: context.read<SalesTabController>(),
                  ),
                  WonSalesPage(
                    theme: theme,
                    leadWonAllData: context
                        .read<SalesTabController>()
                        .filterleadClosedAllData,
                    leadSummaryWon:
                        context.read<SalesTabController>().getleadSummaryWon,
                    provi: context.read<SalesTabController>(),
                  ),
                ])
              : context.watch<SalesTabController>().datagotByApi == true &&
                      context
                          .watch<SalesTabController>()
                          .getLeadCheckDataExcep
                          .isEmpty &&
                      // (   context
                      //         .watch<SalesTabController>()
                      //         .getleadSummaryOpen
                      //         .isEmpty &&
                      //     context
                      //         .watch<SalesTabController>()
                      //         .getleadSummaryWon
                      //         .isEmpty) &&
                      (context
                              .watch<SalesTabController>()
                              .filterleadOpenAllData
                              .isEmpty &&
                          context
                              .watch<SalesTabController>()
                              .filterleadinProcessAllData
                              .isEmpty &&
                          context
                              .watch<SalesTabController>()
                              .filterleadClosedAllData
                              .isEmpty)
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // HelperFunctions.clearCheckedOnBoardSharedPref();
                            // HelperFunctions.clearUserLoggedInSharedPref();
                          },
                          child: Image.asset('Assets/no-data.png',
                              //               opacity: AnimationController(
                              //     vsync: this,
                              //     value: 1
                              // ),
                              // color:Colors.transparent,
                              // animate: true,
                              // repeat: true,

                              height: Screens.padingHeight(context) * 0.2,
                              width: Screens.width(context) * 0.5),
                        ),
                        Text(
                          "No data..!!",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))
                  : context.watch<SalesTabController>().datagotByApi == false &&
                          context
                              .watch<SalesTabController>()
                              .getLeadCheckDataExcep
                              .isEmpty &&
                          // (   context
                          //         .watch<SalesTabController>()
                          //         .getleadSummaryOpen
                          //         .isEmpty &&
                          //     context
                          //         .watch<SalesTabController>()
                          //         .getleadSummaryWon
                          //         .isEmpty) &&
                          (context
                                  .watch<SalesTabController>()
                                  .filterleadOpenAllData
                                  .isEmpty &&
                              context
                                  .watch<SalesTabController>()
                                  .filterleadinProcessAllData
                                  .isEmpty &&
                              context
                                  .watch<SalesTabController>()
                                  .filterleadClosedAllData
                                  .isEmpty)
                      ? Center(child: CircularProgressIndicator())
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              context
                                      .watch<SalesTabController>()
                                      .lottie!
                                      .isEmpty
                                  ? Container()
                                  : context
                                              .watch<SalesTabController>()
                                              .lottie!
                                              .isNotEmpty &&
                                          context
                                              .watch<SalesTabController>()
                                              .lottie!
                                              .contains(".png")
                                      ? InkWell(
                                          onTap: () {
                                            // HelperFunctions.clearCheckedOnBoardSharedPref();
                                            // HelperFunctions.clearUserLoggedInSharedPref();
                                          },
                                          child: Image.asset(
                                              '${context.watch<SalesTabController>().lottie}',
                                              //               opacity: AnimationController(
                                              //     vsync: this,
                                              //     value: 1
                                              // ),
                                              // color:Colors.transparent,
                                              // animate: true,
                                              // repeat: true,

                                              height: Screens.padingHeight(
                                                      context) *
                                                  0.2,
                                              width:
                                                  Screens.width(context) * 0.5),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            // HelperFunctions.clearCheckedOnBoardSharedPref();
                                            // HelperFunctions.clearUserLoggedInSharedPref();
                                          },
                                          child: Lottie.asset(
                                              '${context.watch<SalesTabController>().lottie}',
                                              animate: true,
                                              repeat: true,
                                              // height: Screens.padingHeight(context) * 0.3,
                                              width:
                                                  Screens.width(context) * 0.4),
                                        ),
                              Text(
                                context
                                    .watch<SalesTabController>()
                                    .getLeadCheckDataExcep,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
        ),
        //      }
        //     );
        //   }
        // ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'bt1',
              onPressed: () {
                context.read<SalesTabController>().clearfilterval();
                context.read<SalesTabController>().getdbmodel();
                scaffoldKey1.currentState?.openEndDrawer();
              },
              child: Icon(Icons.filter_alt),
            ),
            SizedBox(
              height: Screens.padingHeight(context) * 0.01,
            ),
            FloatingActionButton(
              heroTag: 'bt2',
              onPressed: () {
                Get.toNamed(ConstantRoutes.ordernew)!.then((value) {});
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
