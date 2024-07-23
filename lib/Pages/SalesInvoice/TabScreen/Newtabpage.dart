// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellerkit/Constant/ConstantRoutes.dart';
import 'package:sellerkit/Constant/ConstantSapValues.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/pos-widget/BottomButton.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/pos-widget/CashandCheque.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/pos-widget/CustomerDetails.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/pos-widget/ItemLists.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/pos-widget/SOBar.dart';

class NewSalesTabPage extends StatefulWidget {
  const NewSalesTabPage({Key? key}) : super(key: key);

  @override
  State<NewSalesTabPage> createState() => LeadsTabState();
}

class LeadsTabState extends State<NewSalesTabPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // static const List<Tab> myTabs = <Tab>[
  //   Tab(text: 'Open'),
  //   Tab(text: 'In-Process'),
  //   Tab(text: 'Closed'),
  //   // Tab(text: 'Lost'),
  // ];
  // TabController? controller;
  // @override
  // static bool iscomfromLead = false;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     setState(() {
  //       // log("  iscomfromLead;"+  iscomfromLead.toString());

  //       if (ConstantValues.multistoreuser == 1) {
  //         context.read<OrderNewController>().restricteddialog(context);
  //       } else {
  //         if (iscomfromLead == false) {
  //           log("ANBU222::");
  //           context.read<OrderNewController>().init();
  //         } else if (iscomfromLead == true) {
  //           log("ANBU::");
  //           context.read<OrderNewController>().checkComeFromEnq(context);

  //           iscomfromLead = false;
  //         }
  //       }
  //     });

  //     // print("sap user id: "+ConstantValues.sapUserID);

  //     // log("page on: "+context.read<OrderNewController>().pageChanged.toString());
  //     // log("showItemList"+context.read<OrderNewController>().showItemList.toString());
  //     //  log("oldcutomer: "+context.read<OrderNewController>().oldcutomer.toString());
  //   });
  // }

  // DateTime? currentBackPressTime;
  // Future<bool> onbackpress() {
  //   DateTime now = DateTime.now();

  //   if (currentBackPressTime == null ||
  //       now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
  //     currentBackPressTime = now;
  //     Get.offAllNamed(ConstantRoutes.dashboard);
  //     return Future.value(true);
  //   } else {
  //     return Future.value(true);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double width3 = Screens.width(context) - (Screens.width(context) / 2);
    final double height = Screens.bodyheight(context);
    return
        // WillPopScope(
        //   onWillPop: onbackpress,
        //   child: Scaffold(
        //      resizeToAvoidBottomInset: false,
        //     key: scaffoldKey1,
        //     drawerEnableOpenDragGesture: false,
        //     backgroundColor: Colors.grey[300],
        //     drawer: drawer3(context),
        //     //  endDrawer: navDrawerOrder(),
        //     body:
        //  ChangeNotifierProvider<OrderTabController>(
        //         create: (context) => OrderTabController(),
        //         builder: (context, child) {
        //           return Consumer<OrderTabController>(
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
            child: SafeArea(
              child: Column(
                children: [
                  Salesappbar("Sales Invoice", theme, context),
                  Container(
                      color: Colors.grey.withOpacity(0.1),
                      height: Screens.bodyheight(context) * 0.95,
                      padding: EdgeInsets.only(
                        top: Screens.bodyheight(context) * 0.01,
                        left: Screens.bodyheight(context) * 0.01,
                        right: Screens.bodyheight(context) * 0.01,
                        bottom: Screens.bodyheight(context) * 0.01,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: Screens.width(context) * 0.5,
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SalesSearchWidget(
                                        searchHeight:
                                            Screens.bodyheight(context) * 0.93,
                                        searchWidth:
                                            Screens.width(context) * 0.48,
                                        theme: theme,
                                      ),
                                      // SOPaymentDetails(
                                      //   theme: widget.theme,
                                      //   paymentWidth: Screens.width(context) * 0.48,
                                      //   paymentHeight: Screens.bodyheight(context) * 0.22,
                                      // )
                                    ]),
                              )),
                          SizedBox(
                              width: Screens.width(context) * 0.48,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // // context.watch<SOCon>().loadingscrn == true
                                  // //     ?
                                  // //      Container(
                                  // //         width: Screens.width(context) * 0.48,
                                  // //         height: Screens.bodyheight(context) * 0.3,
                                  // //         child: Center(
                                  // //           child: CircularProgressIndicator(
                                  // //             color: widget.theme.primaryColor,
                                  // //           ),
                                  // //         ),
                                  // //       )
                                  // //     :
                                  SalesCustomerDetails(
                                    custWidth: Screens.width(context) * 0.48,
                                    custHeight:
                                        Screens.bodyheight(context) * 0.4,
                                    theme: theme,
                                  ),
                                  // // context.watch<SOCon>().getScanneditemData2.isNotEmpty && context.watch<SOCon>().getselectedcust2 != null
                                  // //     ? Container()
                                  // //     :
                                  SalesCashWidget(
                                    cashWidth: Screens.width(context) * 0.48,
                                    cashHeight:
                                        Screens.bodyheight(context) * 0.25,
                                    theme: theme,
                                  ),
                                  SalesBottomButtons(
                                    theme: theme,
                                    btnheight:
                                        Screens.bodyheight(context) * 0.28,
                                    btnWidth: Screens.width(context) * 0.48,
                                  )
                                ],
                              )),
                        ],
                      ))

                  //  SObillingTabScreen(theme:theme,),
                  // Container(
                  //    height: Screens.fullHeight(context),

                  //     // color: Colors.amber,
                  //     child:
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         // Container(
                  //         //   width: Screens.width(context) * 0.8,
                  //         //   height: 1000,
                  //         //   color: Colors.red,
                  //         // ),
                  //         Container(
                  //           width: Screens.width(context) * 0.75,
                  //           //  height: Screens.padingHeight(context)*0.8,
                  //           // color: Colors.grey[200],
                  //           padding: EdgeInsets.only(
                  //             top: Screens.padingHeight(context)*0.01,
                  //             left: Screens.width(context)*0.01,
                  //             bottom: Screens.padingHeight(context)*0.01,
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               // Text("hi")
                  //               Container(
                  //                 padding: EdgeInsets.all(5),
                  //                 decoration: BoxDecoration(
                  //                     color: Colors.white,
                  //                     borderRadius: BorderRadius.circular(5)),
                  //                  height: Screens.bodyheight(context) * 0.07,
                  //                   width:Screens.width(context) * 0.6,
                  //                 child: TabBar(
                  //                   unselectedLabelColor: theme.primaryColor,
                  //                   indicatorColor: theme.primaryColor,
                  //                   indicator: BoxDecoration(
                  //                       color: theme.primaryColor,
                  //                       borderRadius: BorderRadius.circular(5)),
                  //                   controller: controller,
                  //                   tabs: myTabs,
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: Screens.padingHeight(context)*0.01,
                  //               ),
                  //               Expanded(
                  //                 child: Container(
                  //                  decoration: BoxDecoration(
                  //                     color: Colors.white,
                  //                     borderRadius: BorderRadius.circular(5)),
                  //                   child: TabBarView(
                  //                       controller: controller,
                  //                       children: [
                  //                         OpenOrderPage(
                  //                           theme: theme,
                  //                           leadOpenAllData: context
                  //                               .read<OrderTabController>()
                  //                               .filterleadOpenAllData,
                  //                           leadSummaryOpen: context
                  //                               .read<OrderTabController>()
                  //                               .getleadSummaryOpen,
                  //                           provi: context
                  //                               .watch<OrderTabController>(),
                  //                         ),
                  //                         InProcessPage(
                  //                           theme: theme,
                  //                           InProcessAllData: context
                  //                               .read<OrderTabController>()
                  //                               .filterleadinProcessAllData,
                  //                           leadSummaryinprocess:
                  //                               context.read<OrderTabController>().getleadSummaryinprocess,
                  //                           provi: context.read<OrderTabController>(),
                  //                         ),
                  //                         WonOrderPage(
                  //                           theme: theme,
                  //                           leadWonAllData: context
                  //                               .read<OrderTabController>()
                  //                               .filterleadClosedAllData,
                  //                           leadSummaryWon:
                  //                               context.read<OrderTabController>().getleadSummaryWon,
                  //                           provi: context.read<OrderTabController>(),
                  //                         ),
                  //                       ]),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         navDrawerOrder()
                  //       ],
                  //     ),

                  //   ),
                ],
              ),
            )
            // : Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       // TabBar(
            //       //   controller: controller,
            //       //   tabs: myTabs,
            //       // ),
            //       context.watch<OrderTabController>().datagotByApi == true &&
            //               context
            //                   .watch<OrderTabController>()
            //                   .getLeadCheckDataExcep
            //                   .isEmpty &&
            //               // (   context
            //               //         .watch<OrderTabController>()
            //               //         .getleadSummaryOpen
            //               //         .isEmpty &&
            //               //     context
            //               //         .watch<OrderTabController>()
            //               //         .getleadSummaryWon
            //               //         .isEmpty) &&
            //               (context
            //                       .watch<OrderTabController>()
            //                       .filterleadOpenAllData
            //                       .isEmpty &&
            //                   context
            //                       .watch<OrderTabController>()
            //                       .filterleadinProcessAllData
            //                       .isEmpty &&
            //                   context
            //                       .watch<OrderTabController>()
            //                       .filterleadClosedAllData
            //                       .isEmpty)
            //           ? Center(
            //               child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 InkWell(
            //                   onTap: () {
            //                     // HelperFunctions.clearCheckedOnBoardSharedPref();
            //                     // HelperFunctions.clearUserLoggedInSharedPref();
            //                   },
            //                   child: Image.asset('Assets/no-data.png',
            //                       //               opacity: AnimationController(
            //                       //     vsync: this,
            //                       //     value: 1
            //                       // ),
            //                       // color:Colors.transparent,
            //                       // animate: true,
            //                       // repeat: true,

            //                       height: Screens.padingHeight(context) * 0.2,
            //                       width: Screens.width(context) * 0.5),
            //                 ),
            //                 Text(
            //                   "No data..!!",
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ],
            //             ))
            //           : context.watch<OrderTabController>().datagotByApi ==
            //                       false &&
            //                   context
            //                       .watch<OrderTabController>()
            //                       .getLeadCheckDataExcep
            //                       .isEmpty &&
            //                   // (   context
            //                   //         .watch<OrderTabController>()
            //                   //         .getleadSummaryOpen
            //                   //         .isEmpty &&
            //                   //     context
            //                   //         .watch<OrderTabController>()
            //                   //         .getleadSummaryWon
            //                   //         .isEmpty) &&
            //                   (context
            //                           .watch<OrderTabController>()
            //                           .filterleadOpenAllData
            //                           .isEmpty &&
            //                       context
            //                           .watch<OrderTabController>()
            //                           .filterleadinProcessAllData
            //                           .isEmpty &&
            //                       context
            //                           .watch<OrderTabController>()
            //                           .filterleadClosedAllData
            //                           .isEmpty)
            //               ? Center(child: CircularProgressIndicator())
            //               : Center(
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       context
            //                               .watch<OrderTabController>()
            //                               .lottie!
            //                               .isEmpty
            //                           ? Container()
            //                           : context
            //                                       .watch<OrderTabController>()
            //                                       .lottie!
            //                                       .isNotEmpty &&
            //                                   context
            //                                       .watch<OrderTabController>()
            //                                       .lottie!
            //                                       .contains(".png")
            //                               ? InkWell(
            //                                   onTap: () {
            //                                     // HelperFunctions.clearCheckedOnBoardSharedPref();
            //                                     // HelperFunctions.clearUserLoggedInSharedPref();
            //                                   },
            //                                   child: Image.asset(
            //                                       '${context.watch<OrderTabController>().lottie}',
            //                                       //               opacity: AnimationController(
            //                                       //     vsync: this,
            //                                       //     value: 1
            //                                       // ),
            //                                       // color:Colors.transparent,
            //                                       // animate: true,
            //                                       // repeat: true,

            //                                       height:
            //                                           Screens.padingHeight(
            //                                                   context) *
            //                                               0.2,
            //                                       width:
            //                                           Screens.width(context) *
            //                                               0.5),
            //                                 )
            //                               : InkWell(
            //                                   onTap: () {
            //                                     // HelperFunctions.clearCheckedOnBoardSharedPref();
            //                                     // HelperFunctions.clearUserLoggedInSharedPref();
            //                                   },
            //                                   child: Lottie.asset(
            //                                       '${context.watch<OrderTabController>().lottie}',
            //                                       animate: true,
            //                                       repeat: true,
            //                                       // height: Screens.padingHeight(context) * 0.3,
            //                                       width:
            //                                           Screens.width(context) *
            //                                               0.4),
            //                                 ),
            //                       Text(
            //                         context
            //                             .watch<OrderTabController>()
            //                             .getLeadCheckDataExcep,
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //     ],
            //   ),
            );
    //      }
    //     );
    //   }
    // ),
    // floatingActionButton: Padding(
    //   padding:  EdgeInsets.only(
    //     left: Screens.width(context)*0.4
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     // crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       // FloatingActionButton(
    //       //   heroTag: 'bt1',
    //       //   onPressed: () {
    //       //     context.read<OrderTabController>().clearfilterval();
    //       //     context.read<OrderTabController>().getdbmodel();
    //       //     scaffoldKey1.currentState?.openEndDrawer();
    //       //   },
    //       //   child: Icon(Icons.filter_alt),
    //       // ),
    //       SizedBox(
    //         height: Screens.padingHeight(context) * 0.01,
    //       ),
    //       FloatingActionButton(
    //         heroTag: 'bt2',
    //         onPressed: () {
    //           Get.toNamed(ConstantRoutes.ordernew)!.then((value) {});
    //         },
    //         child: Icon(Icons.add),
    //       ),
    //     ],
    //   ),
    // ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   ),
    // );
  }
}
