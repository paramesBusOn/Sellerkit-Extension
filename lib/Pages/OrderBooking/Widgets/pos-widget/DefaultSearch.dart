// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/OrderController/TabOrderController.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/Inprocesspage.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/OpenOrder.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/WonOrderPage.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/navdrawerOrder.dart';


class SearhBoxSO extends StatefulWidget {
  SearhBoxSO({
    Key? key,
    required this.theme,
    required this.searchHeight,
    required this.searchWidth,
  }) : super(key: key);

  final ThemeData theme;
  double searchHeight;
  double searchWidth;

  @override
  State<SearhBoxSO> createState() => SearhBoxState();
}

class SearhBoxState extends State<SearhBoxSO> with TickerProviderStateMixin {
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
      log("comeFromEnq: " + OrderTabController.comeFromEnq.toString());
      if (OrderTabController.comeFromEnq == -1) {
        log("comeFromEnq: 11");
        context.read<OrderTabController>().clearAllListData();
        context.read<OrderTabController>().callGetAllApi();
        // context.read<OrderTabController>().callSummaryApi();
        context.read<OrderTabController>().getLeadStatus();
      } else if (OrderTabController.comeFromEnq != -1) {
        log("comeFromEnq: 22");
        log("OrderTabController.isSameBranch: ${OrderTabController.isSameBranch}");

        if (OrderTabController.isSameBranch == true) {
          context.read<OrderTabController>().clearAllListData();
          context.read<OrderTabController>().callGetAllApi();
          // context.read<OrderTabController>().callSummaryApi();
          context.read<OrderTabController>().getLeadStatus();
          context.read<OrderTabController>().comeFromEnqApi(
              context, OrderTabController.comeFromEnq.toString());
        } else {
          context.read<OrderTabController>().clearAllListData();

          context.read<OrderTabController>().callGetAllApi();
          // context.read<OrderTabController>().callSummaryApi();
          context.read<OrderTabController>().getLeadStatus();
          context.read<OrderTabController>().comeFromEnqApi(
              context, OrderTabController.comeFromEnq.toString());
        }
      }
    });
  }

  void _handleTabChange() {
    setState(() {
      context.read<OrderTabController>().mycontroller[10].clear();
      context.read<OrderTabController>().setListData();
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context);
    return AlertDialog(
        insetPadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.all(0),
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: SizedBox(
            width: widget.searchWidth * 2,
            //  height:searchHeight*0.9 ,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                 GestureDetector(
          onHorizontalDragUpdate: (details) {
            // Check if the user is swiping from left to right
            // print(details.primaryDelta);
            // if (details.primaryDelta! > ConstantValues.slidevalue!) {
            //   setState(() {
            //     Get.offAllNamed(ConstantRoutes.dashboard);
            //   });
            // }
          },
          child: context.watch<OrderTabController>().datagotByApi == true &&
                  context
                      .watch<OrderTabController>()
                      .getLeadCheckDataExcep
                      .isEmpty &&
                  (context
                          .watch<OrderTabController>()
                          .getleadSummaryOpen
                          .isNotEmpty ||
                      context
                          .watch<OrderTabController>()
                          .getleadSummaryWon
                          .isNotEmpty) &&
                  (context
                          .watch<OrderTabController>()
                          .filterleadOpenAllData
                          .isNotEmpty ||
                      context
                          .watch<OrderTabController>()
                          .filterleadinProcessAllData
                          .isNotEmpty ||
                      context
                          .watch<OrderTabController>()
                          .filterleadClosedAllData
                          .isNotEmpty)
              ? Container(
                 height: Screens.fullHeight(context),
                
                  // color: Colors.amber,
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   width: Screens.width(context) * 0.8,
                      //   height: 1000,
                      //   color: Colors.red,
                      // ),
                      Container(
                        width: Screens.width(context) * 0.68,
                        //  height: Screens.padingHeight(context)*0.8,
                        // color: Colors.grey[200],
                        padding: EdgeInsets.only(
                          top: Screens.padingHeight(context)*0.01,
                          left: Screens.width(context)*0.01,
                          bottom: Screens.padingHeight(context)*0.01,
                        ),
                        child: Column(
                          children: [
                            // Text("hi")
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                               height: Screens.bodyheight(context) * 0.07,
                                width:Screens.width(context) * 0.68,
                              child: TabBar(
                                unselectedLabelColor: theme.primaryColor,
                                indicatorColor: theme.primaryColor,
                                indicator: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                controller: controller,
                                tabs: myTabs,
                              ),
                            ),
                            SizedBox(
                              height: Screens.padingHeight(context)*0.01,
                            ),
                            Expanded(
                              child: Container(
                               decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                                child: TabBarView(
                                    controller: controller,
                                    children: [
                                      OpenOrderPage(
                                        theme: theme,
                                        leadOpenAllData: context
                                            .read<OrderTabController>()
                                            .filterleadOpenAllData,
                                        leadSummaryOpen: context
                                            .read<OrderTabController>()
                                            .getleadSummaryOpen,
                                        provi: context
                                            .watch<OrderTabController>(),
                                      ),
                                      InProcessPage(
                                        theme: theme,
                                        InProcessAllData: context
                                            .read<OrderTabController>()
                                            .filterleadinProcessAllData,
                                        leadSummaryinprocess:
                                            context.read<OrderTabController>().getleadSummaryinprocess,
                                        provi: context.read<OrderTabController>(),
                                      ),
                                      WonOrderPage(
                                        theme: theme,
                                        leadWonAllData: context
                                            .read<OrderTabController>()
                                            .filterleadClosedAllData,
                                        leadSummaryWon:
                                            context.read<OrderTabController>().getleadSummaryWon,
                                        provi: context.read<OrderTabController>(),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      navDrawerOrder()
                    ],
                  ),
                         
                )
              : context.watch<OrderTabController>().datagotByApi == true &&
                      context
                          .watch<OrderTabController>()
                          .getLeadCheckDataExcep
                          .isEmpty &&
                      // (   context
                      //         .watch<OrderTabController>()
                      //         .getleadSummaryOpen
                      //         .isEmpty &&
                      //     context
                      //         .watch<OrderTabController>()
                      //         .getleadSummaryWon
                      //         .isEmpty) &&
                      (context
                              .watch<OrderTabController>()
                              .filterleadOpenAllData
                              .isEmpty &&
                          context
                              .watch<OrderTabController>()
                              .filterleadinProcessAllData
                              .isEmpty &&
                          context
                              .watch<OrderTabController>()
                              .filterleadClosedAllData
                              .isEmpty)
                  ? Center(
                      child: Container(
                        height: Screens.padingHeight(context) ,
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
                                      
                                 height: Screens.padingHeight(context)*0.2 ,
                                width: Screens.width(context) * 0.5
                                ),
                          ),
                          Text(
                            "No data..!!",
                            textAlign: TextAlign.center,
                          ),
                        ],
                                            ),
                      ))
                  : context.watch<OrderTabController>().datagotByApi ==
                              false &&
                          context
                              .watch<OrderTabController>()
                              .getLeadCheckDataExcep
                              .isEmpty &&
                          // (   context
                          //         .watch<OrderTabController>()
                          //         .getleadSummaryOpen
                          //         .isEmpty &&
                          //     context
                          //         .watch<OrderTabController>()
                          //         .getleadSummaryWon
                          //         .isEmpty) &&
                          (context
                                  .watch<OrderTabController>()
                                  .filterleadOpenAllData
                                  .isEmpty &&
                              context
                                  .watch<OrderTabController>()
                                  .filterleadinProcessAllData
                                  .isEmpty &&
                              context
                                  .watch<OrderTabController>()
                                  .filterleadClosedAllData
                                  .isEmpty)
                      ? Container(
                        height: Screens.padingHeight(context),
                        child: Center(child: CircularProgressIndicator()))
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              context
                                      .watch<OrderTabController>()
                                      .lottie!
                                      .isEmpty
                                  ? Container()
                                  : context
                                              .watch<OrderTabController>()
                                              .lottie!
                                              .isNotEmpty &&
                                          context
                                              .watch<OrderTabController>()
                                              .lottie!
                                              .contains(".png")
                                      ? InkWell(
                                          onTap: () {
                                            // HelperFunctions.clearCheckedOnBoardSharedPref();
                                            // HelperFunctions.clearUserLoggedInSharedPref();
                                          },
                                          child: Image.asset(
                                              '${context.watch<OrderTabController>().lottie}',
                                              //               opacity: AnimationController(
                                              //     vsync: this,
                                              //     value: 1
                                              // ),
                                              // color:Colors.transparent,
                                              // animate: true,
                                              // repeat: true,
              
                                              height:
                                                  Screens.padingHeight(
                                                          context) *
                                                      0.2,
                                              width:
                                                  Screens.width(context) *
                                                      0.5),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            // HelperFunctions.clearCheckedOnBoardSharedPref();
                                            // HelperFunctions.clearUserLoggedInSharedPref();
                                          },
                                          child: Lottie.asset(
                                              '${context.watch<OrderTabController>().lottie}',
                                              animate: true,
                                              repeat: true,
                                              // height: Screens.padingHeight(context) * 0.3,
                                              width:
                                                  Screens.width(context) *
                                                      0.4),
                                        ),
                              Text(
                                context
                                    .watch<OrderTabController>()
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
        
                // Container(
                //     alignment: Alignment.centerLeft,
                //     width: widget.searchWidth,
                //     padding: EdgeInsets.all(widget.searchHeight * 0.01),
                //     child: Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Container(
                //               child: Form(
                //                 key: context.read<SOCon>().formkey[0],
                //                 child: Row(
                //                   children: [
                //                     Container(
                //                       alignment: Alignment.center,
                //                       // color: Colors.blue,
                //                       width: widget.searchWidth * 0.08,
                //                       child: Text("From Date"),
                //                     ),
                //                     Container(
                //                       height: widget.searchHeight * 0.07,
                //                       width: widget.searchWidth * 0.15,
                //                       decoration: BoxDecoration(
                //                           // //color: Colors.amber,
                //                           //   borderRadius: BorderRadius.circular(4),
                //                           //  border: Border.all(),
                //                           ),
                //                       child:
                //                           // Center(child: Text("2023-03-03"))
                //                           TextFormField(
                //                         controller: context.read<SOCon>().mycontroller[100],
                //                         readOnly: true,
                //                         validator: (value) {
                //                           if (value!.isEmpty) {
                //                             return "Required";
                //                           }
                //                           null;
                //                           return null;
                //                         },
                //                         onTap: () {
                //                           context.read<SOCon>().getDate2(context, 'From');
                //                         },
                //                         decoration: InputDecoration(
                //                             contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                //                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                //                             //   labelText: "Date",
                //                             hintText: "",
                //                             hintStyle: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                             suffixIcon: Icon(Icons.calendar_today)),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               child: Row(
                //                 children: [
                //                   Container(
                //                     alignment: Alignment.center,
                //                     // color: Colors.blue,
                //                     width: widget.searchWidth * 0.08,
                //                     child: Text("To Date"),
                //                   ),
                //                   Container(
                //                     height: widget.searchHeight * 0.07,
                //                     width: widget.searchWidth * 0.15,
                //                     decoration: BoxDecoration(
                //                         // //color: Colors.amber,
                //                         //   borderRadius: BorderRadius.circular(4),
                //                         //  border: Border.all(),
                //                         ),
                //                     child:
                //                         // Center(child: Text("2023-03-03"))
                //                         TextFormField(
                //                       validator: (value) {
                //                         if (value!.isEmpty) {
                //                           return "Required";
                //                         }
                //                         null;
                //                         return null;
                //                       },
                //                       readOnly: true,
                //                       controller: context.read<SOCon>().mycontroller[101],
                //                       onTap: () {
                //                         context.read<SOCon>().getDate2(context, 'To');
                //                       },
                //                       decoration: InputDecoration(
                //                           contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                //                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                //                           //   labelText: "Date",
                //                           hintText: "",
                //                           hintStyle: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                           suffixIcon: Icon(Icons.calendar_today)),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             GestureDetector(
                //               onTap: () {
                //                 setState(() {
                //                   if (context.read<SOCon>().formkey[0].currentState!.validate()) {
                //                     // StOut_Con.tappage.animateToPage(
                //                     //     ++StOut_Con.tappageIndex,
                //                     //     duration: Duration(milliseconds: 400),
                //                     //     curve: Curves.linearToEaseOut);
                //                     context.read<SOCon>().getSalesDataDatewise(context.read<SOCon>().mycontroller[100].text.toString(), context.read<SOCon>().mycontroller[101].text.toString());
                //                   }
                //                 });
                //               },
                //               child: Container(
                //                 height: widget.searchHeight * 0.07,
                //                 width: widget.searchWidth * 0.08,
                //                 decoration: BoxDecoration(color: widget.theme.primaryColor, borderRadius: BorderRadius.circular(5)),
                //                 child: Icon(
                //                   Icons.search,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ),
                //             Row(
                //               children: [
                //                 Container(
                //                   height: widget.searchHeight * 0.07,
                //                   width: widget.searchWidth * 0.3,
            
                //                   decoration: BoxDecoration(
                //                       // //color: Colors.amber,
                //                       //   borderRadius: BorderRadius.circular(4),
                //                       //  border: Border.all(),
                //                       ),
            
                //                   child: TextFormField(
                //                     // keyboardType: TextInputType.number,
                //                     onChanged: (value) {
                //                       setState(() {
                //                         context.read<SOCon>().filterSearchBoxList(value.trim());
                //                       });
                //                     },
            
                //                     // readOnly: true,
                //                     //  controller: settleCon.mycontroller[1],
                //                     decoration: InputDecoration(
                //                         hintText: "Search...",
                //                         contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                //                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                //                         //   labelText: "Date",
                //                         hintStyle: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black)),
                //                   ),
                //                   //Center(child: Text("2000"))
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: widget.searchHeight * 0.01,
                //         ),
                //       ],
                //     )),
                // Container(
                //   padding: EdgeInsets.only(right: widget.searchWidth * 0.01, left: widget.searchWidth * 0.01),
                //   decoration: BoxDecoration(color: widget.theme.primaryColor, borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.white)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         alignment: Alignment.centerLeft,
                //         width: widget.searchWidth * 0.12,
                //         //color: Colors.amber,
                //         child: Text(
                //           "Doc No",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         width: widget.searchWidth * 0.08,
                //         //color: Colors.amber,
                //         child: Text(
                //           "Doc Date",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         width: widget.searchWidth * 0.08,
                //         //color: Colors.amber,
                //         child: Text(
                //           "UserName",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         width: widget.searchWidth * 0.1,
                //         //color: Colors.amber,
                //         child: Text(
                //           "Terminal",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         width: widget.searchWidth * 0.08,
                //         //color: Colors.amber,
                //         child: Text(
                //           "SAP DocNo",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         width: widget.searchWidth * 0.12,
                //         //color: Colors.amber,
                //         child: Text(
                //           "Status",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         width: widget.searchWidth * 0.15,
                //         //color: Colors.amber,
                //         child: Text(
                //           "Customer Name",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.centerRight,
                //         width: widget.searchWidth * 0.12,
                //         //color: Colors.amber,
                //         child: Text(
                //           "Doc Total ",
                //           style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                //         ),
                //       ),
                //       // Container(
                //       //   alignment: Alignment.center,
                //       //   width: widget.searchWidth * 0.1,
                //       //   //color: Colors.amber,
                //       //   child: Text(
                //       //     "Type",
                //       //     style: widget.theme.textTheme.bodyText1!
                //       //         .copyWith(color: Colors.white),
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
            
                // Container(
                //   height: widget.searchHeight * 0.87,
                //   // color: Colors.green,
                //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                //   child: context.watch<SOCon>().filtersearchData.isEmpty
                //       ? Center(
                //           child: Text("No Data Here..!!"),
                //         )
                //       : ListView.builder(
                //           itemCount: context.read<SOCon>().filtersearchData.length,
                //           itemBuilder: (context, index) {
                //             return InkWell(
                //               onTap: () {
                //                 setState(() {
                //                   Navigator.pop(context);
                //                   context.read<SOCon>().fixDataMethod(context.read<SOCon>().filtersearchData[index].docentry);
                //                 });
                //               },
                //               child: Container(
                //                 padding: EdgeInsets.only(
                //                     top: widget.searchHeight * 0.03,
                //                     // left: widget.searchHeight * 0.02,
                //                     // right: widget.searchHeight * 0.02,
                //                     bottom: widget.searchHeight * 0.03),
                //                 decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey[300]!)),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Container(
                //                       alignment: Alignment.center,
                //                       width: widget.searchWidth * 0.13,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().filtersearchData[index].docNo}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.center,
                //                       width: widget.searchWidth * 0.08,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().config.alignDate(context.read<SOCon>().filtersearchData[index].docDate)}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.center,
                //                       width: widget.searchWidth * 0.08,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().filtersearchData[index].username}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.center,
                //                       width: widget.searchWidth * 0.1,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().filtersearchData[index].terminal}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.centerRight,
                //                       width: widget.searchWidth * 0.08,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().filtersearchData[index].sapNo}",
                //                         style: widget.theme.textTheme.bodyText1!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.center,
                //                       width: widget.searchWidth * 0.14,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().filtersearchData[index].qStatus}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.center,
                //                       width: widget.searchWidth * 0.15,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().filtersearchData[index].customeraName}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     Container(
                //                       padding: EdgeInsets.only(right: widget.searchWidth * 0.01),
                //                       alignment: Alignment.centerRight,
                //                       width: widget.searchWidth * 0.12,
                //                       //color: Colors.amber,
                //                       child: Text(
                //                         "${context.watch<SOCon>().config.splitValues(context.watch<SOCon>().filtersearchData[index].doctotal.toString())}",
                //                         style: widget.theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                //                       ),
                //                     ),
                //                     // Container(
                //                     //   alignment: Alignment.center,
                //                     //   width: widget.searchWidth * 0.1,
                //                     //   //color: Colors.amber,
                //                     //   child: Text(
                //                     //     "${widget.SalesCon.filtersearchData[index].type}",
                //                     //     style: widget
                //                     //         .theme.textTheme.bodyText1!
                //                     //         .copyWith(color: Colors.black),
                //                     //   ),
                //                     // ),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           }),
                // )
            
            // Container(),
              ],
            )));
  }
}
