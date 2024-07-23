// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_new

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/ConstantRoutes.dart';
import 'package:sellerkit/Constant/ConstantSapValues.dart';
import 'package:sellerkit/Controller/SalesController/TabSalesController.dart';
import 'package:sellerkit/Pages/SalesInvoice/Widgets/FollowDialog.dart';
import '../../../../Constant/Screen.dart';
import '../../../Constant/Configuration.dart';
import '../../../Controller/OrderController/TabOrderController.dart';
import '../../../Models/PostQueryModel/OrdersCheckListModel/GetAllOrderModel.dart';
import '../../../Models/PostQueryModel/OrdersCheckListModel/GetOrderSummary.dart';

class OpenSalesPage extends StatefulWidget {
  const OpenSalesPage({Key? key,
      required this.theme,
      required this.leadOpenAllData,
      required this.leadSummaryOpen,
      required this.provi
      })
      : super(key: key);

  final ThemeData theme;

  final List<GetAllOrderData> leadOpenAllData;

  final List<SummaryOrderData> leadSummaryOpen;

  final SalesTabController provi;

  @override
  State<OpenSalesPage> createState() => _OpenSalesPageState();
}

class _OpenSalesPageState extends State<OpenSalesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: Screens.width(context),
      height: Screens.bodyheight(context),
      padding: EdgeInsets.symmetric(
          horizontal: Screens.width(context) * 0.01,
          vertical: Screens.bodyheight(context) * 0.02),
      child: GestureDetector(onHorizontalDragUpdate: (details) {
                    // Check if the user is swiping from left to right
                    print(details.primaryDelta);
                    if (details.primaryDelta! > ConstantValues.slidevalue!) {
                      setState(() {
                        Get.offAllNamed(ConstantRoutes.dashboard);
                      });
                    }
                  },
        child: Column(
          children: [
            Card(
              child: Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: Screens.width(context) * 0.01,
                // ),
                width: Screens.width(context),
               // height: Screens.bodyheight(context) * 0.16,
                padding: EdgeInsets.symmetric(
                    horizontal: Screens.width(context) * 0.01,
                    vertical: Screens.bodyheight(context) * 0.01
                    ),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(color: Colors.black26)
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize:MainAxisSize.min,
                  children: [
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Container(
                      child: Text(
                        // "Open Orders",
                        "${widget.leadSummaryOpen[0].Caption}",
                        style: widget.theme.textTheme.bodyText1
                            ?.copyWith(color: widget.theme.primaryColor),
                      ),
                    ),
                        Container(
                            width: Screens.width(context) * 0.4,
                            child: Text(
                              "Target ₹ " +
                              widget.leadSummaryOpen[0].Target!.toString(),
                                  // Config.k_m_b_generator(
                                  //     widget.leadSummaryOpen[0].Target!.toStringAsFixed(0)),
                               textAlign: TextAlign.end,
                              // style: widget.theme.textTheme.headline6,
                            )),
                        // Container(
                        //   alignment: Alignment.centerRight,
                        //   width: Screens.width(context) * 0.4,
                        //   child: Text(
                        //       // widget.leadSummaryOpen[0].column!.toStringAsFixed(0) +
                        //           " Orders"),
                        // )
                      ],
                    ),
              
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: Screens.width(context) * 0.3,
                            child: Text(
                              "₹ " 
                              +
                                  Config.k_m_b_generator(widget
                                      .leadSummaryOpen[0].Value!
                                      .toStringAsFixed(0)),
                             
                              style: widget.theme.textTheme.headline6,
                            )
                            ),
                       Container(
                      alignment: Alignment.centerRight,
                      // width: Screens.width(context),
                      child: Text(
                        "Balance to go ₹ "
                         +widget
                                .leadSummaryOpen[0].BTG!
                                .toString(),
                            // Config.k_m_b_generator(widget
                            //     .leadSummaryOpen[0].BTG!
                            //     .toStringAsFixed(0)),
                        style: widget.theme.textTheme.bodyText1,
                      ),
                    )
              
                      ],
                    ),
                    Container(
                          alignment: Alignment.centerLeft,
                          width: Screens.width(context) * 0.4,
                          child: Text(
                            widget.leadSummaryOpen[0].column!
                                  .toStringAsFixed(0) +
                              " Orders (This Month)"),
                        )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Screens.bodyheight(context) * 0.008,
            ),
            Expanded(
              child: RefreshIndicator(
                // key: new GlobalKey<RefreshIndicatorState>(),
                  //  key: RIKeys.riKey6,
                  onRefresh: (){
                     return context.read<SalesTabController>().swipeRefreshIndiactor();
                    },
                child:widget.leadOpenAllData.isEmpty?Center(child: Column(
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
                        width: Screens.width(context)*0.5
                        ),
                  ),
                    Text("No data..!!",textAlign: TextAlign.center,),
                  ],
                ),): ListView.builder(
                  itemCount: widget.leadOpenAllData.length,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: (){
                        // print("lead entry: "+widget.leadOpenAllData[i].LeadDocEntry.toString());
                        //    print("lead entry: "+widget.leadOpenAllData[i].Mobile .toString());
                      },
                      onDoubleTap: () {
                         showDialog<dynamic>(
                              context: context,
                              builder: (_) {
                                widget.provi.updateFollowUpDialog = false;
                               // context.read<SalesTabController>().resetValues();
                                return FollowDialogSales( index: i,leadOpenAllData:widget.leadOpenAllData [i]);
                              }).then((value) {
                                setState(() {
                                  widget.provi.refershAfterClosedialog();
                                widget.provi.callGetAllApi();
                                //  widget.provi.callSummaryApi();
                                });
                              });
                      },
                      onLongPress: (){
                         showDialog<dynamic>(
                              context: context,
                              builder: (_) {
                                widget.provi.updateFollowUpDialog = false;
                               // context.read<SalesTabController>().resetValues();
                                return FollowDialogSales( index: i,leadOpenAllData:widget.leadOpenAllData[i]);
                              }).then((value) {
                                setState(() {
                                 widget.provi.refershAfterClosedialog();
                                 widget.provi.callGetAllApi();
                                //  widget.provi.callSummaryApi();
                                });
                             
                              });
                      },
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Screens.width(context) * 0.01,
                              vertical: Screens.bodyheight(context) * 0.006),
                          decoration: BoxDecoration(
                              color:Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                              // border: Border.all(color: Colors.black26)
                              // border: Border(bottom: BorderSide(color: Colors.black38))
                              ),
                          width: Screens.width(context),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // color: Colors.amber,
                                    width: Screens.width(context) * 0.3,
                                    child: Text(
                                      "Customer",
                                      style: widget.theme.textTheme.bodyText2
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    width: Screens.width(context) * 0.3,
                                    child: Text(
                                      "",
                                      style: widget.theme.textTheme.bodyText2
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Screens.width(context) * 0.3,
                                    child: Text(
                                        "${widget.leadOpenAllData[i].CustomerName}", //  "${context.watch<EnquiryUserContoller>().getopenEnqData[i].CardName}",
                                        style:
                                            widget.theme.textTheme.bodyText2?.copyWith(
                                          color: widget.theme.primaryColor,
                                          // fontWeight: FontWeight.bold
                                        )),
                                  ),
                                  Container(
                                    width: Screens.width(context) * 0.3,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        //context
                                        // leadOpenAllData[i].DocDate!.isEmpty?'':
                                        //  context.read<SalesTabController>().config.alignDate(
                                        "#${widget.leadOpenAllData[i].OrderNum}",
                                        //),//         // .watch<EnquiryUserContoller>()
                                        // .config
                                        // .alignDate(
                                        //     "${context.watch<EnquiryUserContoller>().getopenEnqData[i].EnqDate}"),
                                        style:
                                            widget.theme.textTheme.bodyText2?.copyWith(
                                          color: widget.theme.primaryColor,
                                          //fontWeight: FontWeight.bold
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Screens.bodyheight(context) * 0.01,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Screens.width(context),
                                    child: Text(
                                      "Product",
                                      style: widget.theme.textTheme.bodyText2
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    width: Screens.width(context),
                                    // color: Colors.red,
                                    child: Text(
                                    "${widget.leadOpenAllData[i].Product}",
                                        style: widget.theme.textTheme.bodyText2
                                        //?.copyWith(color: Colors.grey),
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Screens.bodyheight(context) * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Screens.width(context) * 0.3,
                                    // color: Colors.red,
                                    child: Text(
                                        "Order Date", //  "Looking for ${context.watch<EnquiryUserContoller>().getopenEnqData[i].Lookingfor}",
                                        style:
                                            widget.theme.textTheme.bodyText2?.copyWith(
                                                //color:theme.primaryColor,
                                                //fontWeight: FontWeight.bold
                                                color: Colors.grey)),
                                  ),
                                  Container(
                                    width: Screens.width(context) * 0.3,
                                    //color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        "Order Value", //  "₹ ${context.watch<EnquiryUserContoller>().getopenEnqData[i].PotentialValue}",
                                        style:
                                            widget.theme.textTheme.bodyText2?.copyWith(
                                                //color:theme.primaryColor,
                                                //fontWeight: FontWeight.bold
                                                color: Colors.grey)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Screens.width(context) * 0.3,
                                    child: Text(
                                        widget.leadOpenAllData[i].DocDate!.isEmpty
                                            ? ''
                                            : context
                                                .read<SalesTabController>()
                                                .config
                                                .alignDate(
                                                    "${widget.leadOpenAllData[i].DocDate}"), //  "Looking for ${context.watch<EnquiryUserContoller>().getopenEnqData[i].Lookingfor}",
                                        style:
                                            widget.theme.textTheme.bodyText2?.copyWith(
                                                //color:theme.primaryColor,
                                                //fontWeight: FontWeight.bold
                                                )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var format = NumberFormat.currency(
                                        name: "INR",
                                        locale: 'en_IN',
                                        decimalDigits:
                                            0, // change it to get decimal places
                                        symbol: '₹ ',
                                      );
                                      String formattedCurrency =
                                          format.format(30000);
                                      print(formattedCurrency);
                                    },
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      width: Screens.width(context) * 0.2,
                                      child: Text(
                                          widget.leadOpenAllData[i].Value == -1
                                              ? ""
                                              : context
                                                  .read<SalesTabController>()
                                                  .config
                                                  .slpitCurrency(widget.leadOpenAllData[
                                                          i]
                                                      .Value!
                                                      .toStringAsFixed(
                                                          0)), //  "₹ ${context.watch<EnquiryUserContoller>().getopenEnqData[i].PotentialValue}",
                                          style: widget.theme.textTheme.bodyText2
                                              ?.copyWith(
                                                  //color:theme.primaryColor,
                                                  //fontWeight: FontWeight.bold
                                                  )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Screens.bodyheight(context) * 0.01,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: Screens.width(context),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: Screens.width(context) * 0.02,
                                        right: Screens.width(context) * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.green[200],
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                          widget.leadOpenAllData[i]
                                                  .CurrentStatus!
                                                  .isEmpty
                                              ? ''
                                              : "${widget.leadOpenAllData[i].CurrentStatus}",
                                          style: widget.theme.textTheme.bodyText2
                                              ?.copyWith(
                                            //color:theme.primaryColor,
                                            color: Colors.green[700],
                                            // fontWeight: FontWeight.bold
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Screens.bodyheight(context) * 0.01,
                              ),
                              
                              Container(
                                // color: Colors.green[200],
                                alignment: Alignment.centerLeft,
                                width: Screens.width(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                      widget.leadOpenAllData[i].createdon!.isEmpty
                                          ? ''
                                          : "Created Date: " +
                                          context
                                                .read<SalesTabController>()
                                                .config
                                                .alignDate(
                                                    "${widget.leadOpenAllData[i].createdon}"),
                                              // context
                                              //     .watch<SalesTabController>()
                                              //     .config
                                              //     .subtractDateTime(
                                              //         "${widget.leadOpenAllData[i].LastUpdateTime}"), //     "${context.watch<EnquiryUserContoller>().getopenEnqData[i].Status}",
                                      style:
                                          widget.theme.textTheme.bodyText2?.copyWith(
                                        color: Colors.grey,
                                        // color: Colors.green[700],
                                        // fontWeight: FontWeight.bold
                                      )),
                                ),
                              )
                              
                              // Container(
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: Screens.width(context) * 0.1),
                              //     child: Divider(
                              //       thickness: 1,
                              //     ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
