// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/SalesController/SalesNewController.dart';

class SalesCashWidget extends StatefulWidget {
  SalesCashWidget({
    Key? key,
    required this.theme,
    required this.cashHeight,
    required this.cashWidth,
  }) : super(key: key);
  double cashHeight;
  double cashWidth;
  final ThemeData theme;

  @override
  State<SalesCashWidget> createState() => _SalesCashWidgetState();
}

class _SalesCashWidgetState extends State<SalesCashWidget> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.only(
          top: widget.cashHeight * 0.01,
          left: widget.cashHeight * 0.01,
          right: widget.cashHeight * 0.01,
          bottom: widget.cashHeight * 0.01),
      width: widget.cashWidth,
      height: widget.cashHeight,
      child:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
         Center(
                                    child: Wrap(
                                        spacing: 10.0, // width
                                            runSpacing: 8.0, //height
                                        children: listContainersPaymentTerms(
                                          theme,
                                        )),
                                  ),
        ],),
      )
      
         
      );
      
    
      // context.read<SalesTabController>().editqty == true
      //     ? Center(
      //         child: Container(
      //           height: widget.cashHeight * 0.29,
      //           width: widget.cashWidth * 0.25,
      //           child: GestureDetector(
      //               onTap: () async {
      //                 context.read<SalesTabController>().nullErrorMsg();

      //                 if (context.read<SalesTabController>().selectedcust == null) {
      //                   showDialog(
      //                       context: context,
      //                       barrierDismissible: true,
      //                       builder: (BuildContext context) {
      //                         return AlertDialog(
      //                             contentPadding: EdgeInsets.all(0),
      //                             content: AlertBox(
      //                                 payMent: 'Alert',
      //                                 errormsg: true,
      //                                 widget: Center(
      //                                     child: ContentContainer(
      //                                   content: 'Choose cusotmer..!!',
      //                                   theme: widget.theme,
      //                                 )),
      //                                 buttonName: null));
      //                       });
      //                 } else if (context
      //                         .read<SalesTabController>()
      //                         .getScanneditemData
      //                         .length <
      //                     1) {
      //                   showDialog(
      //                       context: context,
      //                       barrierDismissible: true,
      //                       builder: (BuildContext context) {
      //                         return AlertDialog(
      //                             contentPadding: EdgeInsets.all(0),
      //                             content: AlertBox(
      //                                 payMent: 'Alert',
      //                                 errormsg: true,
      //                                 widget: Center(
      //                                     child: ContentContainer(
      //                                   content: 'Choose Product..!!',
      //                                   theme: widget.theme,
      //                                 )),
      //                                 buttonName: null));
      //                       });
      //                 } else {
      //                   context.read<SalesTabController>().schemebtnclk = true;
      //                   await context
      //                       .read<SalesTabController>()
      //                       .scehmeapiforckout(context, widget.theme);
      //                 }
      //                 context.read<SalesTabController>().disableKeyBoard(context);
      //               },
      //               child: Container(
      //                   alignment: Alignment.center,
      //                   padding: EdgeInsets.only(
      //                       left: widget.cashHeight * 0.01,
      //                       right: widget.cashHeight * 0.01),
      //                   height: widget.cashHeight * 0.29,
      //                   width: widget.cashWidth * 0.25,
      //                   decoration: BoxDecoration(
      //                     color: Colors.grey.withOpacity(0.05),
      //                     borderRadius: BorderRadius.circular(5),
      //                   ),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         alignment: Alignment.centerLeft,
      //                         height: widget.cashHeight * 0.4,
      //                         width: widget.cashWidth * 0.05,
      //                         decoration: BoxDecoration(
      //                           image: DecorationImage(
      //                             image: AssetImage("assets/disssccimg.png"),
      //                           ),
      //                           borderRadius: BorderRadius.circular(5),
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: widget.cashWidth * 0.17,
      //                         child: Text("Scheme",
      //                             // "Finance",
      //                             style: widget.theme.textTheme.bodyMedium
      //                                 ?.copyWith(color: Colors.black)),
      //                       ),
      //                     ],
      //                   ))),
      //         ),
      //       )
      //     : Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   context.read<SalesTabController>().nullErrorMsg();

      //                   if (context.read<SalesTabController>().getScanneditemData.length <
      //                       1) {
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: true,
      //                         builder: (BuildContext context) {
      //                           return AlertDialog(
      //                               contentPadding: EdgeInsets.all(0),
      //                               content: AlertBox(
      //                                   payMent: 'Alert',
      //                                   errormsg: true,
      //                                   widget: Center(
      //                                       child: ContentContainer(
      //                                     content: 'Choose Product..!!',
      //                                     theme: widget.theme,
      //                                   )),
      //                                   buttonName: null));
      //                         });
      //                   } else {
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: false,
      //                         builder: (BuildContext context) {
      //                           return StatefulBuilder(builder: (context, st) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: 
                                      
      //                                 AlertBox(
      //                                   payMent: 'Payment Mode - Cash',
      //                                   widget: forCashDialog(context),
      //                                   buttonName: 'OK',
      //                                   callback: () {
      //                                     st(
      //                                       () {
      //                                         context
      //                                             .read<SalesTabController>()
      //                                             .addEnteredAmtType('Cash',
      //                                                 context, 1, widget.theme);
      //                                       },
      //                                     );
      //                                   },
      //                                 ));
                              
      //                           });
      //                         });
      //                   }
      //                   context.read<SalesTabController>().disableKeyBoard(context);
      //                 },
      //                 child: Container(
      //                     alignment: Alignment.center,
      //                     padding: EdgeInsets.only(
      //                         top: widget.cashHeight * 0.01,
      //                         left: widget.cashHeight * 0.01,
      //                         right: widget.cashHeight * 0.01,
      //                         bottom: widget.cashHeight * 0.01),
      //                     height: widget.cashHeight * 0.29,
      //                     width: widget.cashWidth * 0.25,
      //                     decoration: BoxDecoration(
      //                       color: Colors.grey.withOpacity(0.05),
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                     child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Container(
      //                             padding: EdgeInsets.only(
      //                                 left: widget.cashHeight * 0.01,
      //                                 right: widget.cashHeight * 0.01),
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(5),
      //                               image: DecorationImage(
      //                                 image: AssetImage("assets/Cashpng.png"),
      //                               ),
      //                             ),
      //                             alignment: Alignment.center,
      //                             height: widget.cashHeight * 0.13,
      //                             width: widget.cashWidth * 0.05,
      //                           ),
      //                           Container(
      //                               alignment: Alignment.centerLeft,
      //                               width: widget.cashWidth * 0.17,
      //                               child: Text(
      //                                 "Cash",
      //                                 style: widget.theme.textTheme.bodyMedium,
      //                               )),
      //                         ])),
      //               ),
      //               GestureDetector(
      //                   onTap: () {
      //                     context.read<SalesTabController>().nullErrorMsg();
      //                     if (context.read<SalesTabController>().getScanneditemData.length <
      //                         1) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose Product..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: false,
      //                           builder: (BuildContext context) {
      //                             return StatefulBuilder(
      //                                 builder: (context, st) {
      //                               return AlertDialog(
      //                                   contentPadding: EdgeInsets.all(0),
      //                                   content: AlertBox(
      //                                       callback: () {
      //                                         st(
      //                                           () {
      //                                             context
      //                                                 .read<SalesTabController>()
      //                                                 .addEnteredAmtType(
      //                                                     'Cheque',
      //                                                     context,
      //                                                     2,
      //                                                     widget.theme);
      //                                           },
      //                                         );
      //                                       },
      //                                       payMent: 'Payment Mode - Cheque',
      //                                       widget: forCheque(context),
      //                                       buttonName: 'OK'));
      //                             });
      //                           });
      //                     }
      //                     context.read<SalesTabController>().disableKeyBoard(context);
      //                   },
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       padding: EdgeInsets.only(
      //                           left: widget.cashHeight * 0.01,
      //                           right: widget.cashHeight * 0.01),
      //                       height: widget.cashHeight * 0.29,
      //                       width: widget.cashWidth * 0.25,
      //                       decoration: BoxDecoration(
      //                         color: Colors.grey.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(5),
      //                       ),
      //                       child: Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             Container(
      //                                 alignment: Alignment.center,
      //                                 height: widget.cashHeight * 0.13,
      //                                 width: widget.cashWidth * 0.04,
      //                                 decoration: BoxDecoration(
      //                                   color:
      //                                       Color.fromARGB(255, 155, 65, 228),
      //                                   borderRadius: BorderRadius.circular(4),
      //                                 ),
      //                                 child: Icon(
      //                                   Icons.credit_card,
      //                                   color: Colors.white,
      //                                   size: widget.cashHeight * 0.1,
      //                                 )),
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               width: widget.cashWidth * 0.17,
      //                               child: Text("Cheque",
      //                                   style: widget.theme.textTheme.bodyMedium
      //                                       ?.copyWith()),
      //                             ),
      //                           ]))),
      //               GestureDetector(
      //                   onTap: () {
      //                     context.read<SalesTabController>().nullErrorMsg();
      //                     if (context.read<SalesTabController>().getScanneditemData.length <
      //                         1) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose Product..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: false,
      //                           builder: (BuildContext context) {
      //                             return StatefulBuilder(
      //                                 builder: (context, st) {
      //                               return AlertDialog(
      //                                   contentPadding: EdgeInsets.all(0),
      //                                   content: AlertBox(
      //                                     callback: () {
      //                                       st(
      //                                         () {
      //                                           context
      //                                               .read<SalesTabController>()
      //                                               .addEnteredAmtType(
      //                                                   'Card',
      //                                                   context,
      //                                                   3,
      //                                                   widget.theme);
      //                                         },
      //                                       );
      //                                     },
      //                                     payMent: 'Payment Mode - Card',
      //                                     widget: forCard(context, "Card"),
      //                                     buttonName: 'OK',
      //                                   ));
      //                             });
      //                           });
      //                     }
      //                     context.read<SalesTabController>().disableKeyBoard(context);
      //                   },
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       padding: EdgeInsets.only(
      //                           left: widget.cashHeight * 0.01,
      //                           right: widget.cashHeight * 0.01),
      //                       height: widget.cashHeight * 0.29,
      //                       width: widget.cashWidth * 0.25,
      //                       decoration: BoxDecoration(
      //                         //  color: Colors.red,
      //                         color: Colors.grey.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(5),
      //                       ),
      //                       child: Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               height: widget.cashHeight * 0.12,
      //                               width: widget.cashWidth * 0.05,
      //                               decoration: BoxDecoration(
      //                                 image: DecorationImage(
      //                                   image:
      //                                       AssetImage("assets/creditIcon.png"),
      //                                 ),
      //                                 borderRadius: BorderRadius.circular(5),
      //                               ),
      //                             ),
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               width: widget.cashWidth * 0.17,
      //                               child: Text("Card",
      //                                   style: widget.theme.textTheme.bodyMedium
      //                                       ?.copyWith(color: Colors.black)),
      //                             ),
      //                           ]))),
      //             ],
      //           ),

      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               GestureDetector(
      //                   onTap: () {
      //                     context.read<SalesTabController>().nullErrorMsg();
      //                     if (context.read<SalesTabController>().getScanneditemData.length <
      //                         1) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose Product..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: false,
      //                           builder: (BuildContext context) {
      //                             return StatefulBuilder(
      //                                 builder: (context, st) {
      //                               return AlertDialog(
      //                                   contentPadding: EdgeInsets.all(0),
      //                                   content: AlertBox(
      //                                       callback: () {
      //                                         st(() {
      //                                           context
      //                                               .read<SalesTabController>()
      //                                               .addEnteredAmtType(
      //                                                   'Wallet',
      //                                                   context,
      //                                                   5,
      //                                                   widget.theme);
      //                                         });
      //                                       },
      //                                       payMent: 'Payment Mode - Wallet',
      //                                       widget: forwallet(context),
      //                                       buttonName: 'OK'));
      //                             });
      //                           });
      //                     }
      //                     context.read<SalesTabController>().disableKeyBoard(context);
      //                   },
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       padding: EdgeInsets.only(
      //                           left: widget.cashHeight * 0.01,
      //                           right: widget.cashHeight * 0.01),
      //                       height: widget.cashHeight * 0.29,
      //                       width: widget.cashWidth * 0.25,
      //                       decoration: BoxDecoration(
      //                         //  color: Colors.red,
      //                         color: Colors.grey.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(5),
      //                       ),
      //                       child: Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               height: widget.cashHeight * 0.12,
      //                               width: widget.cashWidth * 0.05,
      //                               decoration: BoxDecoration(
      //                                 image: DecorationImage(
      //                                   image: AssetImage("assets/NetIcon.png"),
      //                                 ),
      //                                 borderRadius: BorderRadius.circular(5),
      //                               ),
      //                             ),
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               width: widget.cashWidth * 0.17,
      //                               child: Text("Wallet",
      //                                   style: widget.theme.textTheme.bodyMedium
      //                                       ?.copyWith(color: Colors.black)),
      //                             ),
      //                           ]))),
      //               GestureDetector(
      //                   onTap: () {
      //                     context.read<SalesTabController>().nullErrorMsg();
      //                     if (context.read<SalesTabController>().getScanneditemData.length <
      //                         1) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose Product..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: false,
      //                           builder: (BuildContext context) {
      //                             return StatefulBuilder(
      //                                 builder: (context, st) {
      //                               return AlertDialog(
      //                                   contentPadding: EdgeInsets.all(0),
      //                                   content: AlertBox(
      //                                       callback: () {
      //                                         st(() {
      //                                           context
      //                                               .read<SalesTabController>()
      //                                               .addEnteredAmtType(
      //                                                   'Transfer',
      //                                                   context,
      //                                                   4,
      //                                                   widget.theme);
      //                                         });
      //                                       },
      //                                       payMent: 'Payment Mode - Transfer',
      //                                       widget: forTransfer(context),
      //                                       buttonName: 'OK'));
      //                             });
      //                           });
      //                     }
      //                     context.read<SalesTabController>().disableKeyBoard(context);
      //                   },
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       padding: EdgeInsets.only(
      //                           left: widget.cashHeight * 0.01,
      //                           right: widget.cashHeight * 0.01),
      //                       height: widget.cashHeight * 0.29,
      //                       width: widget.cashWidth * 0.25,
      //                       decoration: BoxDecoration(
      //                         color: Colors.grey.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(5),
      //                       ),
      //                       child: Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               height: widget.cashHeight * 0.12,
      //                               width: widget.cashWidth * 0.05,
      //                               decoration: BoxDecoration(
      //                                 image: DecorationImage(
      //                                   image: AssetImage("assets/upiicon.png"),
      //                                 ),
      //                                 borderRadius: BorderRadius.circular(5),
      //                               ),
      //                             ),
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               width: widget.cashWidth * 0.17,
      //                               child: Text("Transfer",
      //                                   style: widget.theme.textTheme.bodyMedium
      //                                       ?.copyWith(color: Colors.black)),
      //                             ),
      //                           ]))),
      //               GestureDetector(
      //                   onTap: () async {
      //                     context.read<SalesTabController>().nullErrorMsg();

      //                     if (context.read<SalesTabController>().selectedcust == null) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose cusotmer..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else if (context
      //                             .read<SalesTabController>()
      //                             .getScanneditemData
      //                             .length <
      //                         1) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose Product..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else {
      //                       context.read<SalesTabController>().schemebtnclk = true;
      //                       await context
      //                           .read<SalesTabController>()
      //                           .scehmeapiforckout(context, widget.theme);
      //                       // await context.read<SalesTabController>().salesOrderSchemeData();
      //                       // await context.read<SalesTabController>().callSchemeOrderAPi();
      //                       // await context
      //                       //     .read<SalesTabController>()
      //                       //     .calculatescheme(context, widget.theme);
      //                     }
      //                     context.read<SalesTabController>().disableKeyBoard(context);
      //                   },
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       padding: EdgeInsets.only(
      //                           left: widget.cashHeight * 0.01,
      //                           right: widget.cashHeight * 0.01),
      //                       height: widget.cashHeight * 0.29,
      //                       width: widget.cashWidth * 0.25,
      //                       decoration: BoxDecoration(
      //                         color: Colors.grey.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(5),
      //                       ),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Container(
      //                             alignment: Alignment.centerLeft,
      //                             height: widget.cashHeight * 0.4,
      //                             width: widget.cashWidth * 0.05,
      //                             decoration: BoxDecoration(
      //                               image: DecorationImage(
      //                                 image:
      //                                     AssetImage("assets/disssccimg.png"),
      //                               ),
      //                               borderRadius: BorderRadius.circular(5),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: widget.cashWidth * 0.17,
      //                             child: Text("Scheme",
      //                                 // "Finance",
      //                                 style: widget.theme.textTheme.bodyMedium
      //                                     ?.copyWith(color: Colors.black)),
      //                           ),
      //                         ],
      //                       ))),
      //             ],
      //           ),
      //           // SizedBox(
      //           //   height: cashHeight * 0.03,
      //           // ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   context.read<SalesTabController>().nullErrorMsg();
      //                   if (context.read<SalesTabController>().getselectedcust == null) {
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: true,
      //                         builder: (BuildContext context) {
      //                           return AlertDialog(
      //                               contentPadding: EdgeInsets.all(0),
      //                               content: AlertBox(
      //                                 payMent: 'Alert',
      //                                 errormsg: true,
      //                                 widget: Center(
      //                                     child: ContentContainer(
      //                                   content: 'Choose customer..!!',
      //                                   theme: widget.theme,
      //                                 )),
      //                                 buttonName: null,
      //                               ));
      //                         });
      //                   } else if (context
      //                           .read<SalesTabController>()
      //                           .getScanneditemData
      //                           .length <
      //                       1) {
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: true,
      //                         builder: (BuildContext context) {
      //                           return AlertDialog(
      //                               contentPadding: EdgeInsets.all(0),
      //                               content: AlertBox(
      //                                   payMent: 'Alert',
      //                                   errormsg: true,
      //                                   widget: Center(
      //                                       child: ContentContainer(
      //                                     content: 'Choose Product..!!',
      //                                     theme: widget.theme,
      //                                   )),
      //                                   buttonName: null));
      //                         });
      //                   } else {
      //                     // posController.getselectedcust!.point = "9000";
      //                     context.read<SalesTabController>().mycontroller[37].text =
      //                         context.read<SalesTabController>().getselectedcust!.point!;
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: false,
      //                         builder: (BuildContext context) {
      //                           return StatefulBuilder(builder: (context, st) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                   callback: () {
      //                                     st(() {
      //                                       context
      //                                           .read<SalesTabController>()
      //                                           .addEnteredAmtType(
      //                                               'Points Redemption',
      //                                               context,
      //                                               8,
      //                                               widget.theme);
      //                                     });
      //                                   },
      //                                   buttonName: 'OK',
      //                                   payMent:
      //                                       'Payment Mode - Points Redemption',
      //                                   widget: forPoints(context),
      //                                 ));
      //                           });
      //                         });
      //                   }
      //                   context.read<SalesTabController>().disableKeyBoard(context);
      //                 },
      //                 child: Container(
      //                     alignment: Alignment.center,
      //                     padding: EdgeInsets.only(
      //                         left: widget.cashHeight * 0.01,
      //                         right: widget.cashHeight * 0.01),
      //                     height: widget.cashHeight * 0.29,
      //                     width: widget.cashWidth * 0.25,
      //                     decoration: BoxDecoration(
      //                       //  color: Colors.red,
      //                       color: Colors.grey.withOpacity(0.05),
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                     child: Text("Point Redemption",
      //                         style: widget.theme.textTheme.bodyMedium
      //                             ?.copyWith(color: Colors.black))),
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   context.read<SalesTabController>().nullErrorMsg();

      //                   if (context.read<SalesTabController>().selectedcust == null) {
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: true,
      //                         builder: (BuildContext context) {
      //                           return AlertDialog(
      //                               contentPadding: EdgeInsets.all(0),
      //                               content: AlertBox(
      //                                   payMent: 'Alert',
      //                                   errormsg: true,
      //                                   widget: Center(
      //                                       child: ContentContainer(
      //                                     content: 'Choose Customer..!!',
      //                                     theme: widget.theme,
      //                                   )),
      //                                   buttonName: null));
      //                         });
      //                   } else if (context
      //                           .read<SalesTabController>()
      //                           .getScanneditemData
      //                           .length <
      //                       1) {
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: true,
      //                         builder: (BuildContext context) {
      //                           return AlertDialog(
      //                               contentPadding: EdgeInsets.all(0),
      //                               content: AlertBox(
      //                                   payMent: 'Alert',
      //                                   errormsg: true,
      //                                   widget: Center(
      //                                       child: ContentContainer(
      //                                     content: 'Choose Product..!!',
      //                                     theme: widget.theme,
      //                                   )),
      //                                   buttonName: null));
      //                         });
      //                   } else {
      //                     // if (context.read<SalesTabController>().selectedcust!.accBalance! < 1) {
      //                     context.read<SalesTabController>().mycontroller[35].text = context
      //                         .read<SalesTabController>()
      //                         .selectedcust!
      //                         .accBalance
      //                         .toString();
      //                     showDialog(
      //                         context: context,
      //                         barrierDismissible: false,
      //                         builder: (BuildContext context) {
      //                           return StatefulBuilder(builder: (context, st) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                   payMent:
      //                                       'Payment Mode - Account Balance',
      //                                   widget: forAccBal(context),
      //                                   buttonName: 'OK',
      //                                   callback: () {
      //                                     st(() {
      //                                       context
      //                                           .read<SalesTabController>()
      //                                           .adjamt(context, widget.theme);
      //                                     });
      //                                   },
      //                                 ));
      //                           });
      //                         });
      //                     // }
      //                   }
      //                   context.read<SalesTabController>().disableKeyBoard(context);
      //                 },
      //                 child: Container(
      //                   alignment: Alignment.center,
      //                   padding: EdgeInsets.only(
      //                       left: widget.cashHeight * 0.01,
      //                       right: widget.cashHeight * 0.01),
      //                   height: widget.cashHeight * 0.29,
      //                   width: widget.cashWidth * 0.25,
      //                   decoration: BoxDecoration(
      //                     //  color: Colors.red,
      //                     color: Colors.grey.withOpacity(0.05),
      //                     borderRadius: BorderRadius.circular(5),
      //                   ),
      //                   child:
      //                       //  Row(
      //                       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       //     crossAxisAlignment: CrossAxisAlignment.center,
      //                       //     children: [
      //                       // Container(
      //                       //   alignment: Alignment.centerLeft,
      //                       //   height: cashHeight * 0.13,
      //                       //   width: cashWidth * 0.05,
      //                       //   decoration: BoxDecoration(
      //                       //     image: DecorationImage(
      //                       //       image: AssetImage("assets/Couponimg.png"),
      //                       //     ),
      //                       //     borderRadius: BorderRadius.circular(5),
      //                       //   ),
      //                       // ),
      //                       // Container(

      //                       //   alignment: Alignment.center,
      //                       //   width: cashWidth * 0.17,
      //                       //   child:
      //                       Text("Account Balance",
      //                           style: widget.theme.textTheme.bodyMedium
      //                               ?.copyWith(color: Colors.black)),
      //                 ),
      //                 // ])
      //               ),
      //               GestureDetector(
      //                   onTap: () {
      //                     context.read<SalesTabController>().nullErrorMsg();
      //                     if (context.read<SalesTabController>().getScanneditemData.length <
      //                         1) {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: true,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                                 contentPadding: EdgeInsets.all(0),
      //                                 content: AlertBox(
      //                                     payMent: 'Alert',
      //                                     errormsg: true,
      //                                     widget: Center(
      //                                         child: ContentContainer(
      //                                       content: 'Choose Product..!!',
      //                                       theme: widget.theme,
      //                                     )),
      //                                     buttonName: null));
      //                           });
      //                     } else {
      //                       showDialog(
      //                           context: context,
      //                           barrierDismissible: false,
      //                           builder: (BuildContext context) {
      //                             return StatefulBuilder(
      //                                 builder: (context, st) {
      //                               return AlertDialog(
      //                                   contentPadding: EdgeInsets.all(0),
      //                                   content: AlertBox(
      //                                       callback: () {
      //                                         st(() {
      //                                           context
      //                                               .read<SalesTabController>()
      //                                               .addEnteredAmtType(
      //                                                   'Credit',
      //                                                   context,
      //                                                   10,
      //                                                   widget.theme);
      //                                         });
      //                                       },
      //                                       payMent: 'Payment Mode - Credit',
      //                                       widget: forCredit(
      //                                         context,
      //                                       ),
      //                                       buttonName: 'OK'));
      //                             });
      //                           });
      //                     }
      //                     context.read<SalesTabController>().disableKeyBoard(context);
      //                   },
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       padding: EdgeInsets.only(
      //                           left: widget.cashHeight * 0.01,
      //                           right: widget.cashHeight * 0.01),
      //                       height: widget.cashHeight * 0.29,
      //                       width: widget.cashWidth * 0.25,
      //                       decoration: BoxDecoration(
      //                         //  color: Colors.red,
      //                         color: Colors.grey.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(5),
      //                       ),
      //                       child: Text("Credit",
      //                           style: widget.theme.textTheme.bodyMedium
      //                               ?.copyWith(color: Colors.black))))
      //             ],
      //           ),
      //         ],
      //       ),
    
    
    // );
 
  }
 List<Widget> listContainersPaymentTerms(
    ThemeData theme,
  ) {
    return List.generate(
      context.read<SalesNewController>().paymode.length,
      (index) => InkWell(
        onTap: () {
           setState(() {
             context.read<SalesNewController>().selectpaymentTerms(
              context
                  .read<SalesNewController>()
                  .paymode[index]
                  .ModeName
                  .toString(),
              context.read<SalesNewController>().paymode[index].ModeName!,
              context.read<SalesNewController>().paymode[index].Code!,
              context,
               context.read<SalesNewController>().paymode[index],
               index
              );
           });
       
          
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Stack(
            children: [
              Container(
                width: Screens.width(context) * 0.1,
                height: Screens.bodyheight(context) * 0.06,
                //  padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: 
                    // context
                    //             .read<SalesNewController>()
                    //             .isSelectedpaymentTermsCode ==
                            context
                                .read<SalesNewController>()
                                .paymode[index]
                                .isselected ==true
                        ? Color(0xffB299A5) //theme.primaryColor.withOpacity(0.5)
                        : Colors.grey.withOpacity(0.20),
                    // border: Border.all(color: theme.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8)
                    ),
                    alignment: Alignment.center,
                child: context.read<SalesNewController>().paymode[index].amount !=null && context.read<SalesNewController>().paymode[index].amount !=""? 
                Text("Rs.${context.read<SalesNewController>().config.slpitCurrency22(context.read<SalesNewController>().paymode[index].amount.toString())}",style: theme.textTheme.bodyText1?.copyWith(
                         color: context
                               .read<SalesNewController>()
                               .paymode[index]
                               .isselected ==true
                             ? theme.primaryColor //,Colors.white
                             : theme.primaryColor,
                       ) ,):
                   Text("${context
                           .read<SalesNewController>()
                           .paymode[index]
                           .ModeName
                           .toString()}",
                            maxLines: 8,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                           style: theme.textTheme.bodyText1?.copyWith(
                         color: context
                               .read<SalesNewController>()
                               .paymode[index]
                               .isselected ==true
                             ? theme.primaryColor //,Colors.white
                             : theme.primaryColor,
                       ) ,
                           ),
              ),
          
           Positioned(
            top: Screens.padingHeight(context)*0.005,
            left:Screens.width(context)*0.01,
            child: context.watch<SalesNewController>().paymode[index].amount !=null && context.watch<SalesNewController>().paymode[index].amount !=""?Text("${context.read<SalesNewController>().paymode[index].ModeName}",style:theme.textTheme.bodyText1?.copyWith(color:theme.primaryColor,fontSize: 10)):Text("")
            )
                //  Positioned(
                //     top: Screens.padingHeight(context)*0.005,
                //     left:Screens.width(context)*0.01,
                //     child: context.read<SalesNewController>().paymode[index].amount !=null && context.read<SalesNewController>().paymode[index].amount !=""?Text("Rs.${context.read<SalesNewController>().paymode[index].amount}",style:theme.textTheme.bodyText1?.copyWith(color:theme.primaryColor,fontSize: 10)):Text("")
                //     )
            ],
          ),
        ),
      ),
    );
  }
  // forCashDialog(BuildContext context) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       width: widget.cashWidth * 1.1,
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.05,
  //           left: widget.cashWidth * 0.05,
  //           right: widget.cashWidth * 0.01,
  //           bottom: widget.cashHeight * 0.1),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: widget.theme.textTheme.bodyMedium
  //                   ?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Form(
  //             key: context.read<SalesTabController>().formkey[1],
  //             child: Row(
  //               children: [
  //                 Text('Amount'),
  //                 SizedBox(width: widget.cashWidth * 0.02),
  //                 Container(
  //                   child: IconButton(
  //                       onPressed: () {
  //                         context.read<SalesTabController>().cpyBtnclik(22);
  //                       },
  //                       icon: Icon(
  //                         Icons.copy,
  //                         // size: widget.cashHeight * 0.15,
  //                       )),
  //                 ),
  //                 SizedBox(width: widget.cashWidth * 0.04),
  //                 Container(
  //                   width: widget.cashWidth * 0.7,
  //                   alignment: Alignment.centerRight,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3),
  //                     color: Colors.grey.withOpacity(0.001),
  //                   ),
  //                   child: TextFormField(
  //                     autofocus: true,
  //                     controller: context.read<SalesTabController>().mycontroller[22],
  //                     cursorColor: Colors.grey,
  //                     keyboardType: TextInputType.number,
  //                     // textInputAction: TextInputAction.,
  //                     onChanged: (v) {},
  //                     validator: (value) {
  //                       if (value!.isEmpty) {
  //                         return ' Please Enter the Amount';
  //                       } else {
  //                         return null;
  //                       }
  //                     },
  //                     decoration: InputDecoration(
  //                       errorBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5),
  //                         borderSide: BorderSide(color: Colors.red),
  //                       ),
  //                       focusedErrorBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5),
  //                         borderSide: BorderSide(color: Colors.red),
  //                       ),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5),
  //                         borderSide: BorderSide(color: Colors.grey),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5),
  //                         borderSide: BorderSide(color: Colors.grey),
  //                       ),
  //                       hintText: 'Enter the Amount',
  //                       hintStyle: widget.theme.textTheme.bodyMedium
  //                           ?.copyWith(color: Colors.grey),
  //                       filled: false,
  //                       // enabledBorder: InputBorder.none,
  //                       // focusedBorder: InputBorder.none,
  //                       contentPadding: const EdgeInsets.symmetric(
  //                         vertical: 10,
  //                         horizontal: 25,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forCheque(BuildContext context) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.05,
  //           left: widget.cashHeight * 0.05,
  //           right: widget.cashHeight * 0.05,
  //           bottom: widget.cashHeight * 0.05),
  //       width: widget.cashWidth * 1.1,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: widget.theme.textTheme.bodyMedium
  //                   ?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //               child: Form(
  //                   key: context.read<SalesTabController>().formkey[2],
  //                   child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Container(
  //                               alignment: Alignment.centerLeft,
  //                               // height: cashHeight * 0.1,
  //                               // width: Screens.width(context) * 0.18,
  //                               child: Text("Cheque No"),
  //                             ),
  //                             Container(
  //                               // height: cashHeight * 0.2,
  //                               width: widget.cashWidth * 0.7,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(3),
  //                                 color: Colors.grey.withOpacity(0.01),
  //                               ),
  //                               child: TextFormField(
  //                                 keyboardType: TextInputType.number,
  //                                 autofocus: true,
  //                                 maxLength: 6,
  //                                 controller:
  //                                     context.read<SalesTabController>().mycontroller[23],
  //                                 cursorColor: Colors.grey,
  //                                 style: widget.theme.textTheme.bodyMedium
  //                                     ?.copyWith(),
  //                                 onChanged: (v) {},
  //                                 validator: ((value) {
  //                                   if (value!.isEmpty) {
  //                                     return " Please Enter Cheque Number";
  //                                   } else if (value.length < 6) {
  //                                     return " Please Enter a 6 digit Cheque Number";
  //                                   } else {
  //                                     return null;
  //                                   }
  //                                 }),
  //                                 decoration: InputDecoration(
  //                                   counterText: '',
  //                                   filled: false,
  //                                   errorBorder: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     borderSide: BorderSide(color: Colors.red),
  //                                   ),
  //                                   focusedErrorBorder: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     borderSide: BorderSide(color: Colors.red),
  //                                   ),
  //                                   enabledBorder: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     borderSide:
  //                                         BorderSide(color: Colors.grey),
  //                                   ),
  //                                   focusedBorder: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     borderSide:
  //                                         BorderSide(color: Colors.grey),
  //                                   ),
  //                                   contentPadding: const EdgeInsets.symmetric(
  //                                     vertical: 5,
  //                                     horizontal: 10,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: widget.cashHeight * 0.05),
  //                         Container(
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: cashHeight * 0.1,
  //                                 child: Text("Cheque Date"),
  //                               ),
  //                               Container(
  //                                 // height: cashHeight * 0.2,
  //                                 width: widget.cashWidth * 0.7,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(3),
  //                                   color: Colors.grey.withOpacity(0.01),
  //                                 ),
  //                                 // child: GestureDetector(
  //                                 //   onTap: () {
  //                                 //     st(() {
  //                                 //       context.read<SalesTabController>().getDate(context, 'Cheque');
  //                                 //     });
  //                                 //   },
  //                                 child: TextFormField(
  //                                   onTap: () {
  //                                     context
  //                                         .read<SalesTabController>()
  //                                         .getDate(context, 'Cheque');
  //                                   },
  //                                   autofocus: true,
  //                                   readOnly: true,
  //                                   controller:
  //                                       context.read<SalesTabController>().mycontroller[24],
  //                                   cursorColor: Colors.grey,
  //                                   style: widget.theme.textTheme.bodyMedium
  //                                       ?.copyWith(),
  //                                   onChanged: (v) {},
  //                                   validator: (value) {
  //                                     if (value!.isEmpty) {
  //                                       return '  Please Enter the Cheque Date';
  //                                     } else {
  //                                       return null;
  //                                     }
  //                                   },
  //                                   decoration: InputDecoration(
  //                                     suffixIcon: IconButton(
  //                                         onPressed: () {
  //                                           print("Cheque Date");
  //                                           context
  //                                               .read<SalesTabController>()
  //                                               .getDate(context, 'Cheque');
  //                                         },
  //                                         icon: Icon(Icons.date_range)),
  //                                     filled: false,
  //                                     focusedErrorBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.red),
  //                                     ),
  //                                     errorBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.red),
  //                                     ),
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.grey),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.grey),
  //                                     ),
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                       vertical: 10,
  //                                       horizontal: 10,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                               // ),
  //                             ],
  //                           ),
  //                         ),
  //                         SizedBox(height: widget.cashHeight * 0.05),
  //                         Container(
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               SizedBox(
  //                                 width: widget.cashWidth * 0.35,
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Container(
  //                                       alignment: Alignment.centerLeft,
  //                                       // height: cashHeight * 0.1,
  //                                       child: Text("Amount"),
  //                                     ),
  //                                     IconButton(
  //                                         onPressed: () {
  //                                           context
  //                                               .read<SalesTabController>()
  //                                               .cpyBtnclik(25);
  //                                         },
  //                                         icon: Icon(
  //                                           Icons.copy,
  //                                           //size: widget.cashHeight * 0.15,
  //                                         )),
  //                                   ],
  //                                 ),
  //                               ),
  //                               Container(
  //                                 // height: cashHeight * 0.2,
  //                                 width: widget.cashWidth * 0.7,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(3),
  //                                   color: Colors.grey.withOpacity(0.01),
  //                                 ),
  //                                 child: TextFormField(
  //                                   autofocus: true,
  //                                   controller:
  //                                       context.read<SalesTabController>().mycontroller[25],
  //                                   cursorColor: Colors.grey,
  //                                   style: widget.theme.textTheme.bodyMedium
  //                                       ?.copyWith(),
  //                                   keyboardType: TextInputType.number,
  //                                   onChanged: (v) {},
  //                                   validator: (value) {
  //                                     if (value!.isEmpty) {
  //                                       return ' Please Enter the Amount';
  //                                     } else {
  //                                       return null;
  //                                     }
  //                                   },
  //                                   decoration: InputDecoration(
  //                                     // hintText: posController.boolCash == true
  //                                     //     ? '${posController.getBalancePaid().toStringAsFixed(2)}'
  //                                     //     : '',
  //                                     filled: false,
  //                                     focusedErrorBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.red),
  //                                     ),
  //                                     errorBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.red),
  //                                     ),
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.grey),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.grey),
  //                                     ),
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                       vertical: 5,
  //                                       horizontal: 10,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         SizedBox(height: widget.cashHeight * 0.05),
  //                         Container(
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: cashHeight * 0.1,
  //                                 child: Text("Remarks"),
  //                               ),
  //                               Container(
  //                                 // height: cashHeight * 0.2,
  //                                 width: widget.cashWidth * 0.7,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(3),
  //                                   color: Colors.grey.withOpacity(0.01),
  //                                 ),
  //                                 child: TextFormField(
  //                                   autofocus: true,
  //                                   controller:
  //                                       context.read<SalesTabController>().mycontroller[26],
  //                                   cursorColor: Colors.grey,
  //                                   style: widget.theme.textTheme.bodyMedium
  //                                       ?.copyWith(),
  //                                   onChanged: (v) {},
  //                                   // validator: (value) {
  //                                   //   if (value!.isEmpty) {
  //                                   //     return '  Please Enter the Remark';
  //                                   //   } else {
  //                                   //     return null;
  //                                   //   }
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     filled: false,
  //                                     focusedErrorBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.red),
  //                                     ),
  //                                     errorBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.red),
  //                                     ),
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.grey),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.grey),
  //                                     ),
  //                                     // enabledBorder: InputBorder.none,
  //                                     // focusedBorder: InputBorder.none,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                       vertical: 5,
  //                                       horizontal: 10,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ]))),

  //           // ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forCard(BuildContext context, String cardType) {
  //   final theme = Theme.of(context);
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       color: Colors.white,
  //       width: widget.cashWidth * 1.1,
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.05,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.05),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //             child: Form(
  //                 key: context.read<SalesTabController>().formkey[3],
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // height: cashHeight * 0.1,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Payment Terminal"),
  //                         ),
  //                         SizedBox(height: widget.cashHeight * 0.05),
  //                         Container(
  //                           // height: cashHeight * 0.24,
  //                           width: widget.cashWidth * 0.7,
  //                           padding: EdgeInsets.only(
  //                             left: widget.cashHeight * 0.01,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey),
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: DropdownButtonHideUnderline(
  //                             child: DropdownButton(
  //                               focusColor: Colors.white,
  //                               hint: Text(
  //                                 'Select Payment Terminal',
  //                                 style: TextStyle(
  //                                     fontSize: 14,
  //                                     color:
  //                                         context.read<SalesTabController>().gethintcolor ==
  //                                                 true
  //                                             ? Colors.red
  //                                             : Colors.grey),
  //                               ),
  //                               items: context
  //                                   .read<SalesTabController>()
  //                                   .getpayTerminal
  //                                   .map((item) => DropdownMenuItem<String>(
  //                                         value: item,
  //                                         child: Text(
  //                                           item,
  //                                           style: const TextStyle(
  //                                             fontSize: 14,
  //                                           ),
  //                                         ),
  //                                       ))
  //                                   .toList(),
  //                               value: context.read<SalesTabController>().paymentterm,
  //                               onChanged: (value) {
  //                                 st(() {
  //                                   context.read<SalesTabController>().paymentterm = value;
  //                                 });
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: widget.cashHeight * 0.05),
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                             alignment: Alignment.centerLeft,
  //                             // width: Screens.width(context) * 0.05,
  //                             child: Text("Approval No"),
  //                           ),
  //                           Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[27],
  //                               cursorColor: Colors.grey,
  //                               style: theme.textTheme.bodyMedium?.copyWith(),
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Approval Number';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: widget.cashHeight * 0.05),
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                             alignment: Alignment.centerLeft,
  //                             child: Text("Card Reference"),
  //                           ),
  //                           Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.text,
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[28],
  //                               cursorColor: Colors.grey,
  //                               style: theme.textTheme.bodyMedium?.copyWith(),
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Card Reference';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: widget.cashHeight * 0.05),
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           SizedBox(
  //                             width: widget.cashWidth * 0.3,
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Container(
  //                                   alignment: Alignment.centerLeft,
  //                                   // height: cashHeight * 0.1,
  //                                   child: Text("Amount"),
  //                                 ),
  //                                 IconButton(
  //                                     onPressed: () {
  //                                       context.read<SalesTabController>().cpyBtnclik(29);
  //                                     },
  //                                     icon: Icon(
  //                                       Icons.copy,
  //                                       //size: widget.cashHeight * 0.15,
  //                                     )),
  //                               ],
  //                             ),
  //                           ),
  //                           Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[29],
  //                               cursorColor: Colors.grey,
  //                               style: theme.textTheme.bodyMedium?.copyWith(),
  //                               keyboardType: TextInputType.number,
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Amount';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 )),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forTransfer(BuildContext context) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.02,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.02),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: widget.theme.textTheme.bodyMedium
  //                   ?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //               child: Form(
  //             key: context.read<SalesTabController>().formkey[4],
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Trans Type"),
  //                         ),
  //                         Container(
  //                           width: widget.cashWidth * 0.7,
  //                           padding: EdgeInsets.only(
  //                             left: widget.cashHeight * 0.01,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey),
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: DropdownButtonHideUnderline(
  //                             child: DropdownButton(
  //                               focusColor: Colors.white,
  //                               hint: Text(
  //                                 'Select Trans Type',
  //                                 style: TextStyle(
  //                                   fontSize: 14,
  //                                   color: context.read<SalesTabController>().gethintcolor ==
  //                                           false
  //                                       ? Colors.grey
  //                                       : Colors.red,
  //                                 ),
  //                               ),
  //                               items: context
  //                                   .read<SalesTabController>()
  //                                   .gettransType
  //                                   .map((item) => DropdownMenuItem<String>(
  //                                         value: item,
  //                                         child: Text(
  //                                           item,
  //                                           style: const TextStyle(
  //                                             fontSize: 14,
  //                                           ),
  //                                         ),
  //                                       ))
  //                                   .toList(),
  //                               value: context.read<SalesTabController>().selectedType,
  //                               onChanged: (value) {
  //                                 st(() {
  //                                   context.read<SalesTabController>().selectedType = value;
  //                                 });
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Trans Reference"),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[30],
  //                             cursorColor: Colors.grey,
  //                             style:
  //                                 widget.theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Trans Reference';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SizedBox(
  //                           width: widget.cashWidth * 0.35,
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: cashHeight * 0.1,
  //                                 child: Text("Amount"),
  //                               ),
  //                               IconButton(
  //                                   onPressed: () {
  //                                     st(() {
  //                                       context.read<SalesTabController>().cpyBtnclik(31);
  //                                     });
  //                                   },
  //                                   icon: Icon(
  //                                     Icons.copy,
  //                                     //size: widget.cashHeight * 0.15,
  //                                   )),
  //                             ],
  //                           ),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[31],
  //                             cursorColor: Colors.grey,
  //                             style:
  //                                 widget.theme.textTheme.bodyMedium?.copyWith(),
  //                             keyboardType: TextInputType.number,
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Amount';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ]),
  //           )),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forwallet(BuildContext context) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.02,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.02),
  //       child: Column(
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: widget.theme.textTheme.bodyMedium
  //                   ?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //             child: Form(
  //                 key: context.read<SalesTabController>().formkey[5],
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Wallet"),
  //                         ),
  //                         SizedBox(height: widget.cashHeight * 0.05),
  //                         Container(
  //                           width: widget.cashWidth * 0.7,
  //                           padding: EdgeInsets.only(
  //                             left: widget.cashHeight * 0.01,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey),
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: DropdownButtonHideUnderline(
  //                             child: DropdownButton(
  //                               focusColor: Colors.white,
  //                               hint: Text(
  //                                 'Select Wallet Type',
  //                                 style: TextStyle(
  //                                     fontSize: 14,
  //                                     color:
  //                                         context.read<SalesTabController>().gethintcolor ==
  //                                                 true
  //                                             ? Colors.red
  //                                             : Colors.grey),
  //                               ),
  //                               items: context
  //                                   .read<SalesTabController>()
  //                                   .walletlist
  //                                   .map((item) => DropdownMenuItem<String>(
  //                                         value: item,
  //                                         child: Text(
  //                                           item,
  //                                           style: const TextStyle(
  //                                             fontSize: 14,
  //                                           ),
  //                                         ),
  //                                       ))
  //                                   .toList(),
  //                               value: context.read<SalesTabController>().wallet,
  //                               onChanged: (value) {
  //                                 st(() {
  //                                   context.read<SalesTabController>().wallet = value;
  //                                 });
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: widget.cashHeight * 0.05),
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                             alignment: Alignment.centerLeft,
  //                             // width: Screens.width(context) * 0.05,
  //                             child: Text("Waller ID"),
  //                           ),
  //                           Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[32],
  //                               cursorColor: Colors.grey,
  //                               style: widget.theme.textTheme.bodyMedium
  //                                   ?.copyWith(),
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Wallet ID';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: widget.cashHeight * 0.05),
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                             alignment: Alignment.centerLeft,
  //                             // width: Screens.width(context) * 0.05,
  //                             child: Text("Payment Reference"),
  //                           ),
  //                           Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[33],
  //                               cursorColor: Colors.grey,
  //                               style: widget.theme.textTheme.bodyMedium
  //                                   ?.copyWith(),
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Payment Reference';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: widget.cashHeight * 0.05),
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           SizedBox(
  //                             width: widget.cashWidth * 0.35,
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Container(
  //                                   alignment: Alignment.centerLeft,
  //                                   // height: cashHeight * 0.1,
  //                                   child: Text("Amount"),
  //                                 ),
  //                                 IconButton(
  //                                     onPressed: () {
  //                                       context.read<SalesTabController>().cpyBtnclik(34);
  //                                     },
  //                                     icon: Icon(
  //                                       Icons.copy,
  //                                       //size: widget.cashHeight * 0.15,
  //                                     )),
  //                               ],
  //                             ),
  //                           ),
  //                           Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[34],
  //                               cursorColor: Colors.grey,
  //                               style: widget.theme.textTheme.bodyMedium
  //                                   ?.copyWith(),
  //                               keyboardType: TextInputType.number,
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Amount';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 )),
  //           )
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forCashConfirm(BuildContext context) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       padding: EdgeInsets.only(
  //         top: widget.cashHeight * 0.01,
  //         left: widget.cashHeight * 0.09,
  //         right: widget.cashHeight * 0.09,
  //       ),
  //       height: widget.cashHeight * 1,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //               height: widget.cashHeight * 0.6,
  //               alignment: Alignment.center,
  //               child: Text("Is full amount Rs. " +
  //                       context.read<SalesTabController>().config.splitValues(
  //                           '${context.watch<SalesTabController>().getBalancePaid().toStringAsFixed(2)}') //'${context.read<SalesTabController>().getBalancePaid().toStringAsFixed(2)'}
  //                   )),
  //           Container(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 GestureDetector(
  //                     onTap: () {
  //                       st(
  //                         () {
  //                           context
  //                               .read<SalesTabController>()
  //                               .fullamt('Cash', context, widget.theme);
  //                         },
  //                       );
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(5),
  //                         color: Colors.blue,
  //                       ),
  //                       alignment: Alignment.center,
  //                       width: widget.cashWidth * 0.2,
  //                       height: widget.cashHeight * 0.3,
  //                       child: Text(
  //                         "Yes",
  //                         style: widget.theme.textTheme.bodyMedium
  //                             ?.copyWith(color: Colors.white),
  //                       ),
  //                     )),
  //                 GestureDetector(
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                       context.read<SalesTabController>().nullErrorMsg();
  //                       showDialog(
  //                           context: context,
  //                           barrierDismissible: true,
  //                           builder: (BuildContext context) {
  //                             return StatefulBuilder(builder: (context, st) {
  //                               return AlertDialog(
  //                                   contentPadding: EdgeInsets.all(0),
  //                                   content: AlertBox(
  //                                     payMent: 'Payment Mode - Cash',
  //                                     widget: forCashDialog(
  //                                       context,
  //                                     ),
  //                                     buttonName: 'OK',
  //                                     callback: () {
  //                                       st(
  //                                         () {
  //                                           context
  //                                               .read<SalesTabController>()
  //                                               .addEnteredAmtType('Cash',
  //                                                   context, 1, widget.theme);
  //                                         },
  //                                       );
  //                                     },
  //                                   ));
  //                             });
  //                           });
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(5),
  //                         color: Colors.blue,
  //                       ),
  //                       alignment: Alignment.center,
  //                       width: widget.cashWidth * 0.2,
  //                       height: widget.cashHeight * 0.3,
  //                       child: Text(
  //                         "Partial Amount",
  //                         style: widget.theme.textTheme.bodyMedium
  //                             ?.copyWith(color: Colors.white),
  //                       ),
  //                     ))
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forAccBal(
  //   BuildContext context,
  // ) {
  //   // final theme = Theme.of(context);
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       width: widget.cashWidth * 1.1,
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.02,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.02),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.watch<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: widget.theme.textTheme.bodyMedium
  //                   ?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //               child: Form(
  //             key: context.read<SalesTabController>().formkey[7],
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Available Balance"),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             readOnly: true,
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[35],
  //                             cursorColor: Colors.grey,
  //                             style:
  //                                 widget.theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Account Balance';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Amount to Adjust"),
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             // context.read<SalesTabController>().getDate(context);
  //                           },
  //                           child: Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.allow(
  //                                     RegExp(r"[0-9.]")),
  //                               ],
  //                               autofocus: true,
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[36],
  //                               cursorColor: Colors.grey,
  //                               style: widget.theme.textTheme.bodyMedium
  //                                   ?.copyWith(),
  //                               onChanged: (v) {},
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Adjust Amount';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ]),
  //           )),
  //           SizedBox(height: widget.cashHeight * 0.05),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // // forCoupons(BuildContext context, PosController posC) {
  // forPoints(BuildContext context) {
  //   final theme = Theme.of(context);
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       width: widget.cashWidth * 1.1,
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.02,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.02),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.watch<SalesTabController>().getmsgforAmount}",
  //               style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //               child: Form(
  //             key: context.read<SalesTabController>().formkey[8],
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Available Points"),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             readOnly: true,
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[37],
  //                             cursorColor: Colors.grey,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             // validator: (value) {
  //                             //   if (value!.isEmpty) {
  //                             //     return ' Please Enter the Available Points';
  //                             //   } else {
  //                             //     return null;
  //                             //   }
  //                             // },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Points to Redeem"),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             onEditingComplete: () {
  //                               st(() {
  //                                 context.read<SalesTabController>().pointconvert();
  //                               });
  //                             },
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[38],
  //                             autofocus: true,
  //                             keyboardType: TextInputType.number,
  //                             cursorColor: Colors.grey,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Redeem points';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   InkWell(
  //                     onTap: () {
  //                       st(() {
  //                         context.read<SalesTabController>().pointconvert();
  //                       });
  //                     },
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       height: widget.cashHeight * 0.25,
  //                       decoration: BoxDecoration(
  //                         color: theme.primaryColor,
  //                       ),
  //                       child: Center(
  //                         child: Container(
  //                           alignment: Alignment.center,
  //                           child: Text(
  //                             "Convert points to redeem",
  //                             textAlign: TextAlign.center,
  //                             style: theme.textTheme.bodyLarge
  //                                 ?.copyWith(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SizedBox(
  //                           width: widget.cashWidth * 0.3,
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: cashHeight * 0.1,
  //                                 child: Text("Amount"),
  //                               ),
  //                               // IconButton(
  //                               //     onPressed: () {
  //                               //       st(() {
  //                               //         context.read<SalesTabController>().pointconvert();
  //                               //       });
  //                               //     },
  //                               //     icon: Icon(
  //                               //       Icons.copy,
  //                               //       size: cashHeight * 0.15,
  //                               //     )),
  //                             ],
  //                           ),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             onTap: () {
  //                               st(() {
  //                                 context.read<SalesTabController>().pointconvert();
  //                               });
  //                             },
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[40],
  //                             cursorColor: Colors.grey,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             keyboardType: TextInputType.number,
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Amount';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ]),
  //           )),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forDiscount(
  //   BuildContext context,
  // ) {
  //   final theme = Theme.of(context);
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       width: widget.cashWidth * 1.1,
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.02,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.02),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.read<SalesTabController>().getmsgforAmount}",
  //               style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //               child: Form(
  //             key: context.read<SalesTabController>().formkey[9],
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Finance Type"),
  //                         ),
  //                         Container(
  //                           width: widget.cashWidth * 0.7,
  //                           padding: EdgeInsets.only(
  //                             left: widget.cashHeight * 0.01,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey),
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: DropdownButtonHideUnderline(
  //                             child: DropdownButton(
  //                               focusColor: Colors.white,
  //                               hint: Text(
  //                                 'Select Finance Type',
  //                                 style: TextStyle(
  //                                   fontSize: 14,
  //                                   color: context.read<SalesTabController>().gethintcolor ==
  //                                           false
  //                                       ? Colors.grey
  //                                       : Colors.red,
  //                                 ),
  //                               ),
  //                               items: context
  //                                   .read<SalesTabController>()
  //                                   .getdiscountType
  //                                   .map((item) => DropdownMenuItem<String>(
  //                                         value: item,
  //                                         child: Text(
  //                                           item,
  //                                           style: const TextStyle(
  //                                             fontSize: 14,
  //                                           ),
  //                                         ),
  //                                       ))
  //                                   .toList(),
  //                               value: context.read<SalesTabController>().discount,
  //                               onChanged: (value) {
  //                                 st(() {
  //                                   context.read<SalesTabController>().discount = value;
  //                                 });
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Finance Reference"),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[41],
  //                             cursorColor: Colors.grey,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Discount Reference';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SizedBox(
  //                           width: widget.cashWidth * 0.3,
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: cashHeight * 0.1,
  //                                 child: Text("Amount"),
  //                               ),
  //                               IconButton(
  //                                   onPressed: () {
  //                                     context.read<SalesTabController>().cpyBtnclik(42);
  //                                   },
  //                                   icon: Icon(
  //                                     Icons.copy,
  //                                     //size: widget.cashHeight * 0.15,
  //                                   )),
  //                             ],
  //                           ),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[42],
  //                             cursorColor: Colors.grey,
  //                             keyboardType: TextInputType.number,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Amount';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ]),
  //           )),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // forCredit(BuildContext context) {
  //   final theme = Theme.of(context);
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       width: widget.cashWidth * 1.1,
  //       padding: EdgeInsets.only(
  //           top: widget.cashHeight * 0.02,
  //           left: widget.cashHeight * 0.1,
  //           right: widget.cashHeight * 0.1,
  //           bottom: widget.cashHeight * 0.02),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Text(
  //               context.read<SalesTabController>().getmsgforAmount == null
  //                   ? ''
  //                   : "${context.read<SalesTabController>().getmsgforAmount}",
  //               style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red),
  //             ),
  //           ),
  //           Container(
  //               child: Form(
  //             key: context.read<SalesTabController>().formkey[10],
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Credit Reference"),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[43],
  //                             cursorColor: Colors.grey,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Credit Reference';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           alignment: Alignment.centerLeft,
  //                           // width: Screens.width(context) * 0.05,
  //                           child: Text("Recovery Date"),
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             // context.read<SalesTabController>().getDate(context);
  //                           },
  //                           child: Container(
  //                             // height: cashHeight * 0.2,
  //                             width: widget.cashWidth * 0.7,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(3),
  //                               color: Colors.grey.withOpacity(0.01),
  //                             ),
  //                             child: TextFormField(
  //                               readOnly: true,
  //                               controller:
  //                                   context.read<SalesTabController>().mycontroller[44],
  //                               cursorColor: Colors.grey,
  //                               style: theme.textTheme.bodyMedium?.copyWith(),
  //                               onChanged: (v) {},
  //                               onTap: () {
  //                                 context
  //                                     .read<SalesTabController>()
  //                                     .recoveryGetDate(context, 'Credit');
  //                               },
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return ' Please Enter the Recovery Date';
  //                                 } else {
  //                                   return null;
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 suffixIcon:
  //                                     // IconButton(
  //                                     //     onPressed: () {
  //                                     //       context.read<SalesTabController>().getDate(context, 'Credit');
  //                                     //     },
  //                                     Icon(Icons.date_range),
  //                                 filled: false,
  //                                 focusedErrorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 errorBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.red),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   borderSide: BorderSide(color: Colors.grey),
  //                                 ),
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 5,
  //                                   horizontal: 10,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: widget.cashHeight * 0.05),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SizedBox(
  //                           width: widget.cashWidth * 0.3,
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: cashHeight * 0.1,
  //                                 child: Text("Amount"),
  //                               ),
  //                               IconButton(
  //                                   onPressed: () {
  //                                     context.read<SalesTabController>().cpyBtnclik(45);
  //                                   },
  //                                   icon: Icon(
  //                                     Icons.copy,
  //                                     //size: widget.cashHeight * 0.15,
  //                                   )),
  //                             ],
  //                           ),
  //                         ),
  //                         Container(
  //                           // height: cashHeight * 0.2,
  //                           width: widget.cashWidth * 0.7,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(3),
  //                             color: Colors.grey.withOpacity(0.01),
  //                           ),
  //                           child: TextFormField(
  //                             controller:
  //                                 context.read<SalesTabController>().mycontroller[45],
  //                             cursorColor: Colors.grey,
  //                             style: theme.textTheme.bodyMedium?.copyWith(),
  //                             keyboardType: TextInputType.number,
  //                             onChanged: (v) {},
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return ' Please Enter the Amount';
  //                               } else {
  //                                 return null;
  //                               }
  //                             },
  //                             decoration: InputDecoration(
  //                               filled: false,
  //                               focusedErrorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               errorBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.red),
  //                               ),
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                                 borderSide: BorderSide(color: Colors.grey),
  //                               ),
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 5,
  //                                 horizontal: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ]),
  //           )),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // validate() {
  //   return Container(
  //     child: Text("Ggggggggg"),
  //   );
  // }


}
