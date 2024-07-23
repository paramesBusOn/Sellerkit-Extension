// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/OrderController/OrderNewController.dart';
import 'package:sellerkit/Controller/OrderController/TabOrderController.dart';


class SOBottomButtons extends StatefulWidget {
  SOBottomButtons(
      {Key? key,
      required this.theme,
      required this.btnWidth,
      required this.btnheight})
      : super(key: key);

  final ThemeData theme;
  double btnheight;
  double btnWidth;

  @override
  State<SOBottomButtons> createState() => SOBottomButtonsState();
}

class SOBottomButtonsState extends State<SOBottomButtons> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
          vertical: Screens.bodyheight(context)*0.01,
          horizontal: Screens.width(context) * 0.01),
      height: widget.btnheight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height:Screens.padingHeight(context)*0.15 ,
            // color: Colors.amber,
            child: Column(children: [
              context.watch<OrderNewController>(). postpaymentdata.isNotEmpty?     Container(
                        width: Screens.width(context),
                        height: Screens.bodyheight(context) * 0.15,
                        //  padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            //theme.primaryColor.withOpacity(0.5)
                            
                            // border: Border.all(color: theme.primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                          itemCount:context.read<OrderNewController>(). postpaymentdata.length,
                          itemBuilder: (BuildContext context,ind){
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Screens.width(context)*0.1,
                                              child:Text("${context.read<OrderNewController>(). postpaymentdata[ind].paymodename}", style: theme.textTheme.bodyText1?.copyWith(
                                                                    ))
                                            ),
                                         Container(
                                        child:Text(":", style: theme.textTheme.bodyText1?.copyWith(
                              ))
                                      ),
                                      Container(
                                        
                                        child:Text(" ${context.read<OrderNewController>().config.slpitCurrency22(context.read<OrderNewController>(). postpaymentdata[ind].amount.toString())}",
                                         style: theme.textTheme.bodyText1?.copyWith()
                                        )
                                      ),
                                          ],
                                        ),
                                      ),
                                     
            
                                      Container(
                                        
                                        child:InkWell(
                                          onTap:(){
                                            setState(() {
                                             context.read<OrderNewController>(). deletepaymode(context.read<OrderNewController>(). postpaymentdata[ind],ind );
                                              context.read<OrderNewController>(). postpaymentdata.removeAt(ind);
                                            });
            
                                          },
                                          child: Icon(Icons.delete,color:Colors.red))
                                        )
                                      
                                    ],
                                  ),
                                ],
                              ),
                            );
                        
                        }),
                      )
           :Container()
            ],),
          ),
     Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Container(
          width: Screens.width(context)*0.1,
          height: Screens.padingHeight(context)*0.05,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8),
           border: Border.all(color: theme.primaryColor)
         ),
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
             ) 
            ),
             child: Text("Suspend",style: theme.textTheme.bodyText1!.copyWith(color: theme.primaryColor),))),
               Container(
                width: Screens.width(context)*0.1,
          height: Screens.padingHeight(context)*0.05,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.primaryColor)
         ),
                child: ElevatedButton(
                  
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
               shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              
             ) 
            ),
                  child: Text("Hold",style: theme.textTheme.bodyText1!.copyWith(color: theme.primaryColor)))),
              Container(
                width: Screens.width(context)*0.1,
          height: Screens.padingHeight(context)*0.05,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: theme.primaryColor)
         ),
                child: ElevatedButton(
                  onPressed:context
                                      .watch<OrderNewController>()
                                      .getisloadingBtn ==
                                  true
                              ? null
                              : () {
                                  // print("aaaa");
                                  context
                                      .read<OrderNewController>()
                                      .thirPageBtnClicked(context);
                                },
                style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.grey[200],
               shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
             ) 
            ),
                 child:context
                                      .watch<OrderNewController>()
                                      .getisloadingBtn ==
                                  true
                              ? SizedBox(
                                  width: Screens.width(context) * 0.08,
                                  height: Screens.bodyheight(context) * 0.04,
                                  child: CircularProgressIndicator(
                                      color: Colors.white))
                              : Text("Check Out")))
      ],),
     ),
     
        ],
      ),
      
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     context.read<OrderTabController>().editqty == true
      //         ? Container()
      //         : 
      //         Container(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                   padding: EdgeInsets.all(widget.btnheight * 0.01),
      //                   child: Text(
      //                     context.read<OrderTabController>().getpaymentWay.isNotEmpty
      //                         ? "Payment Method"
      //                         : '',
      //                     textAlign: TextAlign.start,
      //                     style: widget.theme.textTheme.bodyLarge?.copyWith(
      //                       color: widget.theme.primaryColor,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   // color: Colors.green,
      //                   height: widget.btnheight * 0.65,
      //                   child: context.read<OrderTabController>().getpaymentWay2.isNotEmpty
      //                       ? ListView.builder(
      //                           shrinkWrap: true,
      //                           itemCount: context
      //                               .watch<OrderTabController>()
      //                               .getpaymentWay2
      //                               .length,
      //                           itemBuilder: (context, index) {
      //                             return InkWell(
      //                               onTap: () {},
      //                               child: Card(
      //                                 elevation: 2,
      //                                 child: Container(
      //                                     padding: EdgeInsets.only(
      //                                       right: widget.btnheight * 0.03,
      //                                       left: widget.btnheight * 0.03,
      //                                       bottom: widget.btnheight * 0.03,
      //                                       top: widget.btnheight * 0.03,
      //                                     ),
      //                                     decoration: BoxDecoration(
      //                                       color: Colors.grey[300],
      //                                       boxShadow: [
      //                                         BoxShadow(
      //                                           color: Colors.grey
      //                                               .withOpacity(0.5),
      //                                           spreadRadius: 3,
      //                                           blurRadius: 7,
      //                                           offset: Offset(0,
      //                                               3), // changes position of shadow
      //                                         ),
      //                                       ],
      //                                     ),
      //                                     child: Row(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.spaceBetween,
      //                                       children: [
      //                                         SizedBox(
      //                                           width: widget.btnWidth * 0.25,
      //                                           // color: Colors.red,
      //                                           child: Text(
      //                                             '${context.watch<OrderTabController>().getpaymentWay2[index].type}',
      //                                             // '${OrderTabController.getpaymentWay[index].dateTime}',
      //                                             style: widget
      //                                                 .theme.textTheme.bodyLarge
      //                                                 ?.copyWith(
      //                                                     color: Colors.black),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           width: widget.btnWidth * 0.28,
      //                                           // color: Colors.green,
      //                                           alignment: Alignment.centerLeft,
      //                                           child: Text(
      //                                             '${context.watch<OrderTabController>().getpaymentWay2[index].reference}',
      //                                             // '${OrderTabController.getpaymentWay[index].type}',
      //                                             style: widget
      //                                                 .theme.textTheme.bodyLarge
      //                                                 ?.copyWith(
      //                                                     color: Colors.black),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           // color: Colors.red,
      //                                           alignment:
      //                                               Alignment.centerRight,
      //                                           child: Text(
      //                                             context
      //                                                 .read<OrderTabController>()
      //                                                 .config
      //                                                 .splitValues(context
      //                                                     .read<OrderTabController>()
      //                                                     .getpaymentWay2[index]
      //                                                     .amt!
      //                                                     .toStringAsFixed(2)),
      //                                             style: widget
      //                                                 .theme.textTheme.bodyLarge
      //                                                 ?.copyWith(
      //                                                     color: Colors.black),
      //                                           ),
      //                                         ),
      //                                         context
      //                                                 .read<OrderTabController>()
      //                                                 .getpaymentWay2
      //                                                 .isNotEmpty
      //                                             ? Container(
      //                                                 width: widget.btnWidth *
      //                                                     0.05,
      //                                               )
      //                                             : InkWell(
      //                                                 onTap: () {
      //                                                   context
      //                                                       .read<OrderTabController>()
      //                                                       .removePayment(
      //                                                           index);
      //                                                 },
      //                                                 child: SizedBox(
      //                                                   width: widget.btnWidth *
      //                                                       0.05,
      //                                                   //  color: Colors.blue,
      //                                                   child: Icon(
      //                                                     Icons.delete,
      //                                                     color: Colors.red,
      //                                                   ),
      //                                                 ),
      //                                               )
      //                                       ],
      //                                     )),
      //                               ),
      //                             );
      //                           })
      //                       : ListView.builder(
      //                           shrinkWrap: true,
      //                           itemCount:
      //                               context.watch<OrderTabController>().getpaymentWay.length,
      //                           itemBuilder: (context, index) {
      //                             return InkWell(
      //                               onTap: () {},
      //                               child: Card(
      //                                 elevation: 2,
      //                                 child: Container(
      //                                     padding: EdgeInsets.only(
      //                                       right: widget.btnheight * 0.03,
      //                                       left: widget.btnheight * 0.03,
      //                                       bottom: widget.btnheight * 0.03,
      //                                       top: widget.btnheight * 0.03,
      //                                     ),

      //                                     // decoration: BoxDecoration(
      //                                     //   borderRadius: BorderRadius.circular(5),
      //                                     //  // color: Colors.grey.withOpacity(0.04),
      //                                     // ),
      //                                     decoration: BoxDecoration(
      //                                       color: Colors.white,
      //                                       boxShadow: [
      //                                         BoxShadow(
      //                                           color: Colors.grey
      //                                               .withOpacity(0.5),
      //                                           spreadRadius: 3,
      //                                           blurRadius: 7,
      //                                           offset: Offset(0,
      //                                               3), // changes position of shadow
      //                                         ),
      //                                       ],
      //                                     ),
      //                                     child: Row(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.spaceBetween,
      //                                       children: [
      //                                         SizedBox(
      //                                           width: widget.btnWidth * 0.25,
      //                                           // color: Colors.red,
      //                                           child: Text(
      //                                             '${context.read<OrderTabController>().getpaymentWay[index].type}',
      //                                             // '${OrderTabController.getpaymentWay[index].dateTime}',
      //                                             style: widget
      //                                                 .theme.textTheme.bodyLarge
      //                                                 ?.copyWith(
      //                                                     color: Colors.black),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           width: widget.btnWidth * 0.28,
      //                                           // color: Colors.green,
      //                                           alignment: Alignment.centerLeft,
      //                                           child: Text(
      //                                             '${context.read<OrderTabController>().getpaymentWay[index].reference}',
      //                                             // '${OrderTabController.getpaymentWay[index].type}',
      //                                             style: widget
      //                                                 .theme.textTheme.bodyLarge
      //                                                 ?.copyWith(
      //                                                     color: Colors.black),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           // color: Colors.red,
      //                                           alignment:
      //                                               Alignment.centerRight,
      //                                           child: Text(
      //                                             context
      //                                                 .read<OrderTabController>()
      //                                                 .config
      //                                                 .splitValues(context
      //                                                     .read<OrderTabController>()
      //                                                     .getpaymentWay[index]
      //                                                     .amt!
      //                                                     .toStringAsFixed(2)),
      //                                             style: widget
      //                                                 .theme.textTheme.bodyLarge
      //                                                 ?.copyWith(
      //                                                     color: Colors.black),
      //                                           ),
      //                                         ),
      //                                         InkWell(
      //                                           onTap: () {
      //                                             setState(() {
      //                                               context
      //                                                   .read<OrderTabController>()
      //                                                   .removePayment(index);
      //                                             });
      //                                           },
      //                                           child: SizedBox(
      //                                             width: widget.btnWidth * 0.05,
      //                                             //  color: Colors.blue,
      //                                             child: Icon(
      //                                               Icons.delete,
      //                                               color: Colors.red,
      //                                             ),
      //                                           ),
      //                                         )
      //                                       ],
      //                                     )),
      //                               ),
      //                             );
      //                           }),
      //                 ),
      //               ],
      //             ),
      //           ),
      //     context.watch<OrderTabController>().isApprove == true
      //         ? Container(
      //             child: Center(
      //                 child: SizedBox(
      //               width: widget.btnWidth * 0.18,
      //               height: widget.btnheight * 0.2,
      //               child: ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: widget.theme.primaryColor,
      //                   ),
      //                   onPressed: context.read<OrderTabController>().isLoading == true
      //                       ? null
      //                       : () {
      //                           setState(() {
      //                             context
      //                                 .read<OrderTabController>()
      //                                 .callApprovaltoDocApi(context);
      //                           });
      //                         },
      //                   child: Text("Save")),
      //             )

      //                 // GestureDetector(
      //                 // onTap: context.read<OrderTabController>().isLoading == true
      //                 //     ? null
      //                 //     : () {
      //                 //         setState(() {
      //                 //           context
      //                 //               .read<OrderTabController>()
      //                 //               .callApprovaltoDocApi(context);
      //                 //         });
      //                 //       },
      //                 //     child: Container(
      //                 //       width: widget.btnWidth * 0.2,
      //                 //       alignment: Alignment.center,
      //                 //       decoration: BoxDecoration(
      //                 //           // color: Colors.grey[400],
      //                 //           borderRadius: BorderRadius.circular(5),
      //                 //           border: Border.all(
      //                 //             color: widget.theme.primaryColor,
      //                 //           )),
      //                 //       height: widget.btnheight * 0.17,
      //                 //       child: Text("Save",
      //                 //           textAlign: TextAlign.center,
      //                 //           style: widget.theme.textTheme.bodyLarge?.copyWith(
      //                 //             color: widget.theme.primaryColor,
      //                 //           )),
      //                 //     )
      //                 ),
      //           )

      //         //   ],
      //         // ),

      //         : context.watch<OrderTabController>().editqty == true
      //             ? Container(
      //                 child: Center(
      //                   child: SizedBox(
      //                     width: widget.btnWidth * 0.18,
      //                     height: widget.btnheight * 0.2,
      //                     child: ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           backgroundColor: widget.theme.primaryColor,
      //                         ),
      //                         onPressed:
      //                             context.read<OrderTabController>().OndDisablebutton == true
      //                                 ? null
      //                                 : () {
      //                                     context.read<OrderTabController>().onClickUpdate(
      //                                         context, widget.theme);
      //                                     context
      //                                         .read<OrderTabController>()
      //                                         .disableKeyBoard(context);
      //                                   },
      //                         child: Text(
      //                           "Update",
      //                           style: widget.theme.textTheme.bodyMedium!
      //                               .copyWith(color: Colors.white),
      //                         )),
      //                   ),
      //                   // GestureDetector(
      //                   //     onTap:context
      //                   //                       .read<OrderTabController>()
      //                   //                       .OndDisablebutton ==
      //                   //                   true
      //                   //               ? null
      //                   //               : () {
      //                   //       setState(() {
      //                   //         context
      //                   //             .read<OrderTabController>()
      //                   //             .onClickUpdate(context, widget.theme);
      //                   //         // context.read<OrderTabController>().updatechangecheckout(
      //                   //         //     context, widget.theme);
      //                   //       });
      //                   //     },
      //                   //     child: Container(
      //                   //       width: widget.btnWidth * 0.2,
      //                   //       alignment: Alignment.center,
      //                   //       decoration: BoxDecoration(
      //                   //           // color: Colors.grey[400],
      //                   //           borderRadius: BorderRadius.circular(5),
      //                   //           border: Border.all(
      //                   //             color: widget.theme.primaryColor,
      //                   //           )),
      //                   //       height: widget.btnheight * 0.17,
      //                   //       child: Text("Update",
      //                   //           textAlign: TextAlign.center,
      //                   //           style: widget.theme.textTheme.bodyLarge
      //                   //               ?.copyWith(
      //                   //             color: widget.theme.primaryColor,
      //                   //           )),
      //                   //     )),
      //                   //   ],
      //                   // ),
      //                 ),
      //               )
      //             : Container(
      //                 padding: EdgeInsets.all(
      //                   widget.btnheight * 0.01,
      //                 ),
      //                 child: context.watch<OrderTabController>().selectedcust2 != null
      //                     ? Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         children: [
      //                           Container(
      //                               padding: EdgeInsets.all(
      //                                 widget.btnheight * 0.01,
      //                               ),
      //                               child: GestureDetector(
      //                                   onTap: () {
      //                                     setState(() {
      //                                       context.read<OrderTabController>().cancelbtn =
      //                                           true;
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .clickacancelbtn(
      //                                               context, widget.theme);
      //                                     });
      //                                   },
      //                                   child: Container(
      //                                     width: widget.btnWidth * 0.2,
      //                                     alignment: Alignment.center,
      //                                     decoration: BoxDecoration(
      //                                       color: Colors.grey[400],
      //                                       borderRadius:
      //                                           BorderRadius.circular(5),
      //                                       // border: Border.all(
      //                                       //   color: widget.theme.primaryColor,
      //                                       // )
      //                                     ),
      //                                     height: widget.btnheight * 0.15,
      //                                     child: context
      //                                                 .watch<OrderTabController>()
      //                                                 .cancelbtn ==
      //                                             false
      //                                         ? Text("Cancel",
      //                                             textAlign: TextAlign.center,
      //                                             style: widget
      //                                                 .theme.textTheme.bodySmall
      //                                                 ?.copyWith(
      //                                               color: Colors.black,
      //                                             ))
      //                                         : CircularProgressIndicator(
      //                                             color: widget
      //                                                 .theme.primaryColor),
      //                                   ))),
      //                           Container(
      //                               padding: EdgeInsets.all(
      //                                 widget.btnheight * 0.01,
      //                               ),
      //                               child: GestureDetector(
      //                                   onTap: () {
      //                                     setState(() {
      //                                       context.read<OrderTabController>().clickaEditBtn(
      //                                           context, widget.theme);

      //                                       // context.read<OrderTabController>().updateFixDataMethod(context, widget.theme);
      //                                     });
      //                                   },
      //                                   child: Container(
      //                                     width: widget.btnWidth * 0.2,
      //                                     alignment: Alignment.center,
      //                                     decoration: BoxDecoration(
      //                                         color: widget.theme.primaryColor
      //                                             .withOpacity(0.1),
      //                                         borderRadius:
      //                                             BorderRadius.circular(5),
      //                                         border: Border.all(
      //                                           color:
      //                                               widget.theme.primaryColor,
      //                                         )),
      //                                     height: widget.btnheight * 0.15,
      //                                     child: Text("Edit",
      //                                         textAlign: TextAlign.center,
      //                                         style: widget
      //                                             .theme.textTheme.bodySmall
      //                                             ?.copyWith(
      //                                           color: Colors.black,
      //                                         )),
      //                                   ))),
      //                           Container(
      //                               padding: EdgeInsets.all(
      //                                 widget.btnheight * 0.01,
      //                               ),
      //                               child: GestureDetector(
      //                                   onTap: () {
      //                                     setState(() {
      //                                       context.read<OrderTabController>().editqty =
      //                                           false;
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .selectedcust2 = null;
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .selectedcust25 = null;
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .scanneditemData2
      //                                           .clear();
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .paymentWay2
      //                                           .clear();
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .totalPayment2 = null;
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .custList2
      //                                           .clear();
      //                                       context.read<OrderTabController>().injectToDb();
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .getdraftindex();
      //                                       context
      //                                           .read<OrderTabController>()
      //                                           .mycontroller2[50]
      //                                           .text = "";
      //                                       context.read<OrderTabController>().cancelbtn =
      //                                           false;
      //                                     });
      //                                   },
      //                                   child: Container(
      //                                     width: widget.btnWidth * 0.2,
      //                                     alignment: Alignment.center,
      //                                     decoration: BoxDecoration(
      //                                       color: Colors.grey[400],
      //                                       borderRadius:
      //                                           BorderRadius.circular(5),
      //                                       // border: Border.all(
      //                                       //   color: widget.theme.primaryColor,
      //                                       // )
      //                                     ),
      //                                     height: widget.btnheight * 0.15,
      //                                     child: Text("Clear",
      //                                         textAlign: TextAlign.center,
      //                                         style: widget
      //                                             .theme.textTheme.bodySmall
      //                                             ?.copyWith(
      //                                           color: Colors.black,
      //                                         )),
      //                                   ))),
      //                         ],
      //                       )
      //                     : Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           SizedBox(
      //                               height: widget.btnheight * 0.2,
      //                               width: widget.btnWidth * 0.21,
      //                               child: ElevatedButton(
      //                                   style: ElevatedButton.styleFrom(
      //                                       backgroundColor: Colors.white,
      //                                       side: BorderSide(
      //                                         // width: 5.0,
      //                                         color: widget.theme.primaryColor,
      //                                       )),
      //                                   onPressed:
      //                                       context
      //                                                   .read<OrderTabController>()
      //                                                   .OndDisablebutton ==
      //                                               true
      //                                           ? null
      //                                           : () async {
      //                                               context
      //                                                   .read<OrderTabController>()
      //                                                   .loadingSqBtn = true;

      //                                               context
      //                                                   .read<OrderTabController>()
      //                                                   .disableKeyBoard(
      //                                                       context);
      //                                               context
      //                                                   .read<OrderTabController>()
      //                                                   .clearTextField();

      //                                               log(" context.watch<OrderTabController>().soSalesmodl.length:::${context.read<OrderTabController>().soSalesmodl.length}");
      //                                               context
      //                                                   .read<OrderTabController>()
      //                                                   .mycontroller[79]
      //                                                   .text = '';
      //                                               context
      //                                                           .read<OrderTabController>()
      //                                                           .getselectedcust ==
      //                                                       null
      //                                                   ? showDialog(
      //                                                       context: context,
      //                                                       barrierDismissible:
      //                                                           true,
      //                                                       builder:
      //                                                           (BuildContext
      //                                                               context) {
      //                                                         return AlertDialog(
      //                                                             contentPadding:
      //                                                                 EdgeInsets
      //                                                                     .all(
      //                                                                         0),
      //                                                             content:
      //                                                                 AlertBox(
      //                                                               payMent:
      //                                                                   'Alert',
      //                                                               errormsg:
      //                                                                   true,
      //                                                               widget: Center(
      //                                                                   child: ContentContainer(
      //                                                                 content:
      //                                                                     'Choose customer..!!',
      //                                                                 theme: widget
      //                                                                     .theme,
      //                                                               )),
      //                                                               buttonName:
      //                                                                   null,
      //                                                             ));
      //                                                       }).then((value) {
      //                                                       context
      //                                                               .read<OrderTabController>()
      //                                                               .loadingSqBtn =
      //                                                           false;
      //                                                     })
      //                                                   : context
      //                                                           .read<OrderTabController>()
      //                                                           .soSalesmodl
      //                                                           .isNotEmpty
      //                                                       ? setState(() {
      //                                                           showDialog(
      //                                                               context:
      //                                                                   context,
      //                                                               barrierDismissible:
      //                                                                   false,
      //                                                               builder:
      //                                                                   (BuildContext
      //                                                                       context) {
      //                                                                 return StatefulBuilder(builder:
      //                                                                     (context,
      //                                                                         st) {
      //                                                                   return AlertDialog(
      //                                                                       insetPadding: EdgeInsets.all(Screens.padingHeight(context) *
      //                                                                           0.01),
      //                                                                       contentPadding:
      //                                                                           EdgeInsets.zero,
      //                                                                       content: AlertBox(
      //                                                                         payMent: 'Sales Quotation',
      //                                                                         widget: forClickSQBtn(context, widget.theme),
      //                                                                         callback: () {
      //                                                                           context.read<OrderTabController>().clearsQaqty();
      //                                                                           context.read<OrderTabController>().salesQuodata();

      //                                                                           st(() {
      //                                                                             if (context.read<OrderTabController>().soData.isNotEmpty) {
      //                                                                               context.read<OrderTabController>().loadingSqBtn = false;
      //                                                                               Navigator.pop(context);
      //                                                                               showDialog(
      //                                                                                   context: context,
      //                                                                                   barrierDismissible: false,
      //                                                                                   builder: (BuildContext context) {
      //                                                                                     return AlertDialog(
      //                                                                                         insetPadding: EdgeInsets.all(widget.btnWidth * 0.01),
      //                                                                                         contentPadding: EdgeInsets.zero,
      //                                                                                         content: AlertBox(
      //                                                                                           payMent: 'Sales Order',
      //                                                                                           widget: forScanSQuo(context, widget.theme),
      //                                                                                           buttonName: "OK",
      //                                                                                           callback: () {
      //                                                                                             setState(() {
      //                                                                                               context.read<OrderTabController>().cpyfrmso = "CopyfromSo";

      //                                                                                               context.read<OrderTabController>().mapSQData(
      //                                                                                                     context,
      //                                                                                                     widget.theme,
      //                                                                                                   );
      //                                                                                             });
      //                                                                                           },
      //                                                                                         ));
      //                                                                                   });
      //                                                                             } else {
      //                                                                               showDialog(
      //                                                                                   context: context,
      //                                                                                   barrierDismissible: true,
      //                                                                                   builder: (BuildContext context) {
      //                                                                                     return AlertDialog(
      //                                                                                         contentPadding: EdgeInsets.all(0),
      //                                                                                         content: AlertBox(
      //                                                                                           payMent: 'Alert',
      //                                                                                           errormsg: true,
      //                                                                                           widget: Center(
      //                                                                                               child: ContentContainer(
      //                                                                                             content: 'Choose a Sales Quotation..!!',
      //                                                                                             theme: widget.theme,
      //                                                                                           )),
      //                                                                                           buttonName: null,
      //                                                                                         ));
      //                                                                                   });
      //                                                                             }
      //                                                                           });
      //                                                                         },
      //                                                                         buttonName: "OK",
      //                                                                       ));
      //                                                                 });
      //                                                               });
      //                                                         })
      //                                                       : showDialog(
      //                                                           context:
      //                                                               context,
      //                                                           barrierDismissible:
      //                                                               true,
      //                                                           builder:
      //                                                               (BuildContext
      //                                                                   context) {
      //                                                             return AlertDialog(
      //                                                                 contentPadding:
      //                                                                     EdgeInsets.all(
      //                                                                         0),
      //                                                                 content:
      //                                                                     AlertBox(
      //                                                                   payMent:
      //                                                                       'Alert',
      //                                                                   errormsg:
      //                                                                       true,
      //                                                                   widget: Center(
      //                                                                       child: ContentContainer(
      //                                                                     content:
      //                                                                         'No sales quotation here..!!',
      //                                                                     theme:
      //                                                                         widget.theme,
      //                                                                   )),
      //                                                                   buttonName:
      //                                                                       null,
      //                                                                 ));
      //                                                           }).then((value) {
      //                                                           context
      //                                                               .read<
      //                                                                   OrderTabController>()
      //                                                               .loadingSqBtn = false;
      //                                                         });

      //                                               context
      //                                                   .read<OrderTabController>()
      //                                                   .disableKeyBoard(
      //                                                       context);
      //                                             },
      //                                   child: context
      //                                               .read<OrderTabController>()
      //                                               .loadingSqBtn ==
      //                                           false
      //                                       ? Text(
      //                                           "Copy from SQ",
      //                                           style: widget
      //                                               .theme.textTheme.bodyMedium!
      //                                               .copyWith(
      //                                                   color: widget.theme
      //                                                       .primaryColor),
      //                                         )
      //                                       : CircularProgressIndicator(
      //                                           color:
      //                                               widget.theme.primaryColor,
      //                                         ))),
      //                           SizedBox(
      //                             height: widget.btnheight * 0.2,
      //                             width: widget.btnWidth * 0.18,
      //                             child: ElevatedButton(
      //                                 style: ElevatedButton.styleFrom(
      //                                     backgroundColor: Colors.white,
      //                                     side: BorderSide(
      //                                       // width: 5.0,
      //                                       color: widget.theme.primaryColor,
      //                                     )),
      //                                 onPressed: context
      //                                             .read<OrderTabController>()
      //                                             .OndDisablebutton ==
      //                                         true
      //                                     ? null
      //                                     : () {
      //                                         context
      //                                                 .read<OrderTabController>()
      //                                                 .OndDisablebutton ==
      //                                             true;
      //                                         if (context
      //                                                     .read<OrderTabController>()
      //                                                     .getselectedcust ==
      //                                                 null &&
      //                                             context
      //                                                 .read<OrderTabController>()
      //                                                 .getScanneditemData
      //                                                 .isEmpty) {
      //                                           showDialog(
      //                                               context: context,
      //                                               barrierDismissible: true,
      //                                               builder:
      //                                                   (BuildContext context) {
      //                                                 return AlertDialog(
      //                                                     contentPadding:
      //                                                         EdgeInsets.all(0),
      //                                                     content: AlertBox(
      //                                                       payMent: 'Alert',
      //                                                       errormsg: true,
      //                                                       widget: Center(
      //                                                           child:
      //                                                               ContentContainer(
      //                                                         content:
      //                                                             'Atleast Choose the Customer..!! or Product',
      //                                                         theme:
      //                                                             widget.theme,
      //                                                       )),
      //                                                       buttonName: null,
      //                                                     ));
      //                                               }).then((value) {
      //                                             context
      //                                                     .read<OrderTabController>()
      //                                                     .OndDisablebutton ==
      //                                                 false;
      //                                           });
      //                                         } else {
      //                                           showDialog(
      //                                               context: context,
      //                                               barrierDismissible: true,
      //                                               builder:
      //                                                   (BuildContext context) {
      //                                                 return AlertDialog(
      //                                                     contentPadding:
      //                                                         EdgeInsets.all(0),
      //                                                     content: AlertBox(
      //                                                       payMent:
      //                                                           'Suspended',
      //                                                       widget: forSuspend(
      //                                                           context,
      //                                                           widget.theme),
      //                                                       buttonName:
      //                                                           null, //'Ok',
      //                                                       // callback: () {
      //                                                       //   Navigator.pop(context);
      //                                                       //   OrderTabController.clearAllData();
      //                                                       // },
      //                                                     ));
      //                                               }).then((value) {
      //                                             context
      //                                                     .read<OrderTabController>()
      //                                                     .OndDisablebutton ==
      //                                                 false;
      //                                           });
      //                                         }
      //                                         context
      //                                             .read<OrderTabController>()
      //                                             .disableKeyBoard(context);
      //                                         context
      //                                                 .read<OrderTabController>()
      //                                                 .OndDisablebutton ==
      //                                             false;
      //                                       },
      //                                 child: Text(
      //                                   "Suspend",
      //                                   style: widget
      //                                       .theme.textTheme.bodyMedium!
      //                                       .copyWith(
      //                                           color:
      //                                               widget.theme.primaryColor),
      //                                 )),
      //                           ),
      //                           SizedBox(
      //                             // alignment: Alignment.center,
      //                             // decoration: BoxDecoration(
      //                             //     // color: Colors.grey[200],
      //                             //     borderRadius: BorderRadius.circular(5),
      //                             //     border: Border.all(
      //                             //       color: widget.theme.primaryColor,
      //                             //     )),
      //                             height: widget.btnheight * 0.2,
      //                             width: widget.btnWidth * 0.18,
      //                             child: ElevatedButton(
      //                                 style: ElevatedButton.styleFrom(
      //                                     backgroundColor: Colors.white,
      //                                     side: BorderSide(
      //                                       // width: 5.0,
      //                                       color: widget.theme.primaryColor,
      //                                     )),
      //                                 onPressed: context
      //                                             .read<OrderTabController>()
      //                                             .OndDisablebutton ==
      //                                         true
      //                                     ? null
      //                                     : () {
      //                                         context
      //                                             .read<OrderTabController>()
      //                                             .onHoldClicked(
      //                                                 context, widget.theme);
      //                                         context
      //                                             .read<OrderTabController>()
      //                                             .disableKeyBoard(context);

      //                                         // OrderTabController.getdraft();
      //                                       },
      //                                 child: Text(
      //                                   "Hold",
      //                                   style: widget
      //                                       .theme.textTheme.bodyMedium!
      //                                       .copyWith(
      //                                           color:
      //                                               widget.theme.primaryColor),
      //                                 )),
      //                           ),
      //                           SizedBox(
      //                             // alignment: Alignment.center,
      //                             // decoration: BoxDecoration(
      //                             //     // color: Colors.grey[200],
      //                             //     borderRadius: BorderRadius.circular(5),
      //                             //     border: Border.all(
      //                             //       color: widget.theme.primaryColor,
      //                             //     )),
      //                             height: widget.btnheight * 0.2,
      //                             width: widget.btnWidth * 0.15,
      //                             child: ElevatedButton(
      //                                 style: ElevatedButton.styleFrom(
      //                                     backgroundColor: Colors.white,
      //                                     side: BorderSide(
      //                                       // width: 5.0,
      //                                       color: widget.theme.primaryColor,
      //                                     )),
      //                                 onPressed: context
      //                                             .read<OrderTabController>()
      //                                             .OndDisablebutton ==
      //                                         true
      //                                     ? null
      //                                     : () {
      //                                         context.read<OrderTabController>().udfClear();
      //                                         showDialog(
      //                                             context: context,
      //                                             builder:
      //                                                 (BuildContext context) {
      //                                               return AlertDialog(
      //                                                   contentPadding:
      //                                                       EdgeInsets.all(0),
      //                                                   content: AlertBox(
      //                                                       payMent:
      //                                                           'Create UDF',
      //                                                       widget: createUDF(
      //                                                           context,
      //                                                           widget.theme),
      //                                                       callback: () {
      //                                                         setState(() {
      //                                                           if (context
      //                                                               .read<
      //                                                                   OrderTabController>()
      //                                                               .formkey[15]
      //                                                               .currentState!
      //                                                               .validate()) {
      //                                                             Navigator.pop(
      //                                                                 context);
      //                                                           }
      //                                                         });
      //                                                       },
      //                                                       buttonName: 'OK'));
      //                                             });
      //                                       },
      //                                 child: Text(
      //                                   "UDF",
      //                                   style: widget
      //                                       .theme.textTheme.bodyMedium!
      //                                       .copyWith(
      //                                           color:
      //                                               widget.theme.primaryColor),
      //                                 )),
      //                           ),
      //                           SizedBox(
      //                             width: widget.btnWidth * 0.18,
      //                             height: widget.btnheight * 0.2,
      //                             child: ElevatedButton(
      //                                 style: ElevatedButton.styleFrom(
      //                                   backgroundColor:
      //                                       widget.theme.primaryColor,
      //                                 ),
      //                                 onPressed: context
      //                                             .read<OrderTabController>()
      //                                             .OndDisablebutton ==
      //                                         true
      //                                     ? null
      //                                     : () {
      //                                         context
      //                                             .read<OrderTabController>()
      //                                             .changecheckout(
      //                                                 context, widget.theme);
      //                                         context
      //                                             .read<OrderTabController>()
      //                                             .disableKeyBoard(context);
      //                                       },
      //                                 child: Text(
      //                                   "Check Out",
      //                                   style: widget
      //                                       .theme.textTheme.bodyMedium!
      //                                       .copyWith(color: Colors.white),
      //                                 )),
      //                           ),
      //                         ],
      //                       ),
      //               ),
      //   ],
      // ),
   
    );
  }

  // forSuspend(BuildContext context, ThemeData theme) {
  //   return Container(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: Screens.width(context) * 0.04,
  //           vertical: Screens.bodyheight(context) * 0.01),
  //       child: Column(
  //         children: [
  //           SizedBox(
  //               height: widget.btnheight * 0.4,
  //               child: Center(
  //                   child: Text(
  //                       "You about to suspended all information will be unsaved  "))),
  //           SizedBox(
  //             height: Screens.bodyheight(context) * 0.01,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               SizedBox(
  //                 width: Screens.width(context) * 0.15,
  //                 child: ElevatedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                       context
  //                           .read<OrderTabController>()
  //                           .clearSuspendedData(context, theme);
  //                     },
  //                     child: Text("Yes")),
  //               ),
  //               SizedBox(
  //                 width: Screens.width(context) * 0.15,
  //                 child: ElevatedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: Text("No")),
  //               ),
  //             ],
  //           )
  //         ],
  //       ));
  // }

  // forClickSQBtn(BuildContext context, ThemeData theme) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return SingleChildScrollView(
  //       child: Container(
  //         // height: widget.btnheight * 2.5,
  //         // width: widget.btnWidth * 1.35,
  //         padding: EdgeInsets.all(widget.btnheight * 0.02),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               padding: EdgeInsets.all(widget.btnheight * 0.06),
  //               height: widget.btnWidth * 0.07,
  //               color: theme.primaryColor,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     alignment: Alignment.center,
  //                     width: widget.btnWidth * 0.3,
  //                     // color: Colors.green,
  //                     child: Text("S.Q Number",
  //                         style: theme.textTheme.bodyMedium?.copyWith(
  //                           color: Colors.white,
  //                         )),
  //                   ),
  //                   Container(
  //                     // color: Colors.green,
  //                     width: widget.btnWidth * 0.55,
  //                     alignment: Alignment.center,
  //                     child: Text("Customer Name",
  //                         style: theme.textTheme.bodyMedium?.copyWith(
  //                           color: Colors.white,
  //                         )),
  //                   ),
  //                   Container(
  //                     alignment: Alignment.center,
  //                     width: widget.btnWidth * 0.28,
  //                     // color: Colors.green,
  //                     child: Text("Date",
  //                         style: theme.textTheme.bodyMedium?.copyWith(
  //                           color: Colors.white,
  //                         )),
  //                   ),
  //                   Container(
  //                     alignment: Alignment.center,
  //                     width: widget.btnWidth * 0.17,
  //                     // color: Colors.red,
  //                     child: Text("Total",
  //                         style: theme.textTheme.bodyMedium?.copyWith(
  //                           color: Colors.white,
  //                         )),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.all(widget.btnheight * 0.02),
  //               height: widget.btnheight * 2.5,
  //               width: widget.btnWidth * 1.5,
  //               // height: widget.btnheight * 1.9,
  //               // width: double.infinity,

  //               //color: Colors.amber,
  //               child: ListView.builder(
  //                   itemCount: context.watch<OrderTabController>().soSalesmodl.length,
  //                   itemBuilder: (context, index) {
  //                     log(" ${context.read<OrderTabController>().soSalesmodl[index].checkBClr}");
  //                     return Card(
  //                         color: Colors.grey[200],
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(5),
  //                               color: context
  //                                               .read<OrderTabController>()
  //                                               .soSalesmodl[index]
  //                                               .invoiceClr ==
  //                                           1 &&
  //                                       context
  //                                               .read<OrderTabController>()
  //                                               .soSalesmodl[index]
  //                                               .checkBClr ==
  //                                           true
  //                                   ? Colors.blue.withOpacity(0.35)
  //                                   : Colors.grey.withOpacity(0.2)),
  //                           child: CheckboxListTile(
  //                               controlAffinity:
  //                                   ListTileControlAffinity.leading,
  //                               onChanged: (val) {
  //                                 context.read<OrderTabController>().itemDeSelect(index);
  //                               },
  //                               value: context
  //                                   .read<OrderTabController>()
  //                                   .soSalesmodl[index]
  //                                   .checkBClr,
  //                               title: Container(
  //                                 padding: EdgeInsets.only(
  //                                     left: widget.btnWidth * 0.01,
  //                                     right: widget.btnWidth * 0.01),
  //                                 //   color: Colors.amber,
  //                                 width: widget.btnWidth * 0.77,
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Container(
  //                                         // color: Colors.red,
  //                                         width: widget.btnWidth * 0.3,
  //                                         child: Text(
  //                                           "Order /${context.watch<OrderTabController>().soSalesmodl[index].sapInvoiceNum.toString()}",
  //                                           style: theme.textTheme.bodyLarge!
  //                                               .copyWith(),
  //                                         )),
  //                                     Container(
  //                                         alignment: Alignment.center,
  //                                         // color: Colors.red,
  //                                         width: widget.btnWidth * 0.45,
  //                                         child: Text(
  //                                           context
  //                                               .watch<OrderTabController>()
  //                                               .soSalesmodl[index]
  //                                               .custName
  //                                               .toString(),
  //                                           style: theme.textTheme.bodyLarge!
  //                                               .copyWith(),
  //                                         )),
  //                                     Container(
  //                                         width: widget.btnWidth * 0.28,
  //                                         alignment: Alignment.center,
  //                                         // color: Colors.pink,
  //                                         child: Text(
  //                                           context
  //                                               .watch<OrderTabController>()
  //                                               .soSalesmodl[index]
  //                                               .invoceDate
  //                                               .toString(),
  //                                           style: theme.textTheme.bodyLarge!
  //                                               .copyWith(),
  //                                         )),
  //                                     Container(
  //                                         alignment: Alignment.centerRight,
  //                                         width: widget.btnWidth * 0.18,
  //                                         // color: Colors.pink,

  //                                         child: Text(context
  //                                             .watch<OrderTabController>()
  //                                             .soSalesmodl[index]
  //                                             .invoceAmount
  //                                             .toString())),
  //                                   ],
  //                                 ),
  //                               )),
  //                         ));
  //                   }),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  // }

  // forScanSQuo(BuildContext context, ThemeData theme) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       // color: Colors.red,
  //       padding: EdgeInsets.all(
  //         widget.btnheight * 0.02,
  //       ),
  //       // height: widget.btnheight * 2.3,
  //       // width: widget.btnWidth * 1.3,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SizedBox(
  //             height: widget.btnheight * 0.05,
  //           ),
  //           context.read<OrderTabController>().getsoData.isNotEmpty
  //               ? Column(
  //                   children: [
  //                     Container(
  //                         height: widget.btnheight * 0.19,
  //                         padding: EdgeInsets.only(
  //                           left: widget.btnWidth * 0.02,
  //                           right: widget.btnWidth * 0.02,
  //                         ),
  //                         color: theme.primaryColor,
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             SizedBox(
  //                               width: widget.btnWidth * 0.15,
  //                               child: Text("Item Code",
  //                                   style: theme.textTheme.bodyMedium?.copyWith(
  //                                     color: Colors.white,
  //                                   )),
  //                             ),
  //                             Container(
  //                               // color: Colors.yellow,
  //                               alignment: Alignment.center,
  //                               width: widget.btnWidth * 0.5,

  //                               child: Text("Item Name",
  //                                   style: theme.textTheme.bodyMedium?.copyWith(
  //                                     color: Colors.white,
  //                                   )),
  //                             ),
  //                             // Container(
  //                             //   alignment: Alignment.center,
  //                             //   width: widget.btnWidth * 0.17,
  //                             //   // color: Colors.red,
  //                             //   child: Text("Serial Batch",
  //                             //       style: theme.textTheme.bodyMedium?.copyWith(
  //                             //         color: Colors.white,
  //                             //       )),
  //                             // ),
  //                             Container(
  //                               width: widget.btnWidth * 0.1,
  //                               alignment: Alignment.center,
  //                               child: Text("S.Q Qty",
  //                                   style: theme.textTheme.bodyMedium?.copyWith(
  //                                     color: Colors.white,
  //                                   )),
  //                             ),
  //                             SizedBox(
  //                               width: widget.btnWidth * 0.05,
  //                               child: Text("Qty",
  //                                   style: theme.textTheme.bodyMedium?.copyWith(
  //                                     color: Colors.white,
  //                                   )),
  //                             ),
  //                           ],
  //                         )),
  //                     SizedBox(
  //                       // color: Colors.amber,
  //                       height: widget.btnheight * 2.4,
  //                       width: widget.btnWidth * 1.5,
  //                       child: ListView.builder(
  //                           itemCount: context.watch<OrderTabController>().getsoData.length,
  //                           itemBuilder: (context, index) {
  //                             return GestureDetector(
  //                                 onTap: () {
  //                                   // context
  //                                   //     .read<OrderTabController>()
  //                                   //     .scannsolist(context, theme, index);
  //                                   // showDialog(
  //                                   //     context: context,
  //                                   //     barrierDismissible: true,
  //                                   //     builder: (BuildContext context) {
  //                                   //       return AlertDialog(
  //                                   //           contentPadding: EdgeInsets.all(0),
  //                                   //           content: AlertBox(
  //                                   //             payMent: 'Item List',
  //                                   //             widget: soItemseriallist(
  //                                   //                 context, theme),
  //                                   //             buttonName: null,
  //                                   //           ));
  //                                   //     });
  //                                 },
  //                                 child: Card(
  //                                   // color: Colors.red,
  //                                   child: Container(
  //                                     padding: EdgeInsets.all(6),
  //                                     width: widget.btnWidth * 11,
  //                                     height: widget.btnheight * 0.3,
  //                                     child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Container(
  //                                             alignment: Alignment.centerLeft,
  //                                             width: widget.btnWidth * 0.18,
  //                                             // color: Colors.green,
  //                                             child: Text(
  //                                               context
  //                                                   .watch<OrderTabController>()
  //                                                   .getsoData[index]
  //                                                   .ItemCode
  //                                                   .toString(),
  //                                               style: theme
  //                                                   .textTheme.bodyLarge!
  //                                                   .copyWith(),
  //                                             )),
  //                                         Container(
  //                                             alignment: Alignment.centerLeft,
  //                                             // color: Colors.green,
  //                                             width: widget.btnWidth * 0.55,
  //                                             child: Text(
  //                                               context
  //                                                   .watch<OrderTabController>()
  //                                                   .getsoData[index]
  //                                                   .ItemName
  //                                                   .toString(),
  //                                               style: theme
  //                                                   .textTheme.bodyLarge!
  //                                                   .copyWith(),
  //                                             )),
  //                                         Container(
  //                                             alignment: Alignment.centerRight,
  //                                             // color: Colors.green,
  //                                             width: widget.btnWidth * 0.1,
  //                                             child: Text(
  //                                               context
  //                                                   .watch<OrderTabController>()
  //                                                   .getsoData[index]
  //                                                   .Qty
  //                                                   .toString(),
  //                                               style: theme
  //                                                   .textTheme.bodyLarge!
  //                                                   .copyWith(),
  //                                             )),
  //                                         Container(
  //                                             width: widget.btnWidth * 0.08,
  //                                             // height: widget.btnheight * 0.16,
  //                                             // color: Colors.blue,
  //                                             alignment: Alignment.center,
  //                                             child: TextFormField(
  //                                               style:
  //                                                   theme.textTheme.bodyMedium,
  //                                               onTap: () {
  //                                                 context
  //                                                         .read<OrderTabController>()
  //                                                         .soqtycontroller[index]
  //                                                         .text =
  //                                                     context
  //                                                         .read<OrderTabController>()
  //                                                         .soqtycontroller[
  //                                                             index]
  //                                                         .text;
  //                                                 context
  //                                                     .read<OrderTabController>()
  //                                                     .soqtycontroller[index]
  //                                                     .selection = TextSelection(
  //                                                   baseOffset: 0,
  //                                                   extentOffset: context
  //                                                       .read<OrderTabController>()
  //                                                       .soqtycontroller[index]
  //                                                       .text
  //                                                       .length,
  //                                                 );
  //                                               },
  //                                               onChanged: (v) {},
  //                                               cursorColor: Colors.grey,
  //                                               textDirection:
  //                                                   TextDirection.rtl,
  //                                               keyboardType:
  //                                                   TextInputType.number,
  //                                               inputFormatters: [
  //                                                 FilteringTextInputFormatter
  //                                                     .digitsOnly
  //                                               ],
  //                                               onEditingComplete: () {
  //                                                 setState(() {
  //                                                   context
  //                                                       .read<OrderTabController>()
  //                                                       .soqtychangealertbc(
  //                                                           index,
  //                                                           context,
  //                                                           theme);
  //                                                 });

  //                                                 context
  //                                                     .read<OrderTabController>()
  //                                                     .disableKeyBoard(context);
  //                                               },
  //                                               controller: context
  //                                                   .read<OrderTabController>()
  //                                                   .soqtycontroller[index],
  //                                               decoration: InputDecoration(
  //                                                 enabledBorder:
  //                                                     OutlineInputBorder(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           5),
  //                                                   borderSide: BorderSide(
  //                                                       color: Colors.grey),
  //                                                 ),
  //                                                 focusedBorder:
  //                                                     OutlineInputBorder(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           5),
  //                                                   borderSide: BorderSide(
  //                                                       color: Colors.grey),
  //                                                 ),
  //                                                 contentPadding:
  //                                                     const EdgeInsets
  //                                                         .symmetric(
  //                                                   vertical: 5,
  //                                                   horizontal: 5,
  //                                                 ),
  //                                               ),
  //                                             )),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ));
  //                           }),
  //                     ),
  //                   ],
  //                 )
  //               : Container(),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // createUDF(BuildContext context, ThemeData theme) {
  //   return StatefulBuilder(builder: (context, st) {
  //     return Container(
  //       padding: EdgeInsets.all(10),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //               child: Form(
  //                   key: context.read<OrderTabController>().formkey[15],
  //                   child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Container(
  //                               alignment: Alignment.centerLeft,
  //                               // height: btnheight * 0.1,
  //                               child: Text("Customer Ref No"),
  //                             ),
  //                             SizedBox(width: widget.btnWidth * 0.05),
  //                             Container(
  //                               // height: btnheight * 0.2,
  //                               width: widget.btnWidth * 0.67,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(3),
  //                                 color: Colors.grey.withOpacity(0.01),
  //                               ),
  //                               child: TextFormField(
  //                                 autofocus: true,
  //                                 controller:
  //                                     context.read<OrderTabController>().udfController[0],
  //                                 cursorColor: Colors.grey,
  //                                 style: widget.theme.textTheme.bodyMedium
  //                                     ?.copyWith(),
  //                                 onChanged: (v) {},
  //                                 validator: (value) {
  //                                   if (value!.isEmpty) {
  //                                     return "Enter Customer Ref No";
  //                                   }
  //                                   return null;
  //                                 },
  //                                 onTap: () {},
  //                                 decoration: InputDecoration(
  //                                   filled: false,
  //                                   focusedErrorBorder: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     borderSide: BorderSide(color: Colors.red),
  //                                   ),
  //                                   errorBorder: OutlineInputBorder(
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
  //                                   // enabledBorder: InputBorder.none,
  //                                   // focusedBorder: InputBorder.none,
  //                                   contentPadding: const EdgeInsets.symmetric(
  //                                     vertical: 5,
  //                                     horizontal: 10,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: widget.btnheight * 0.05),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Container(
  //                               alignment: Alignment.centerLeft,
  //                               // height: btnheight * 0.1,
  //                               // width: Screens.width(context) * 0.18,
  //                               child: Text("Sales Order Type"),
  //                             ),
  //                             SizedBox(width: widget.btnWidth * 0.05),
  //                             Container(
  //                               // height: cashHeight * 0.24,
  //                               width: widget.btnWidth * 0.67,
  //                               padding: EdgeInsets.only(
  //                                 left: widget.btnheight * 0.01,
  //                               ),
  //                               // decoration: BoxDecoration(
  //                               //   border: Border.all(color: Colors.grey),
  //                               //   borderRadius: BorderRadius.circular(3),
  //                               //   color: Colors.grey.withOpacity(0.01),
  //                               // ),
  //                               child: DropdownButtonHideUnderline(
  //                                 child: DropdownButtonFormField(
  //                                   hint: Text(
  //                                     "Select Order Type",
  //                                     style: const TextStyle(
  //                                         color: Colors.grey, fontSize: 15),
  //                                   ),
  //                                   value: context
  //                                       .watch<OrderTabController>()
  //                                       .valueSelectedOrder,
  //                                   //dropdownColor:Colors.green,
  //                                   icon: Icon(Icons.arrow_drop_down),
  //                                   iconSize: 30,
  //                                   style: const TextStyle(
  //                                       color: Colors.black, fontSize: 16),
  //                                   isExpanded: true,
  //                                   validator: ((value) {
  //                                     if (value == null) {
  //                                       return 'Please Select Order Type';
  //                                     }
  //                                     return null;
  //                                   }),
  //                                   onChanged: (val) {
  //                                     setState(() {
  //                                       context
  //                                               .read<OrderTabController>()
  //                                               .valueSelectedOrder =
  //                                           val.toString();
  //                                       print("valll: " + val.toString());
  //                                     });
  //                                   },
  //                                   decoration: InputDecoration(
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                       vertical: 5,
  //                                       horizontal: 10,
  //                                     ),
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
  //                                   ),
  //                                   items: context
  //                                       .watch<OrderTabController>()
  //                                       .getSalesOrderType
  //                                       .map((e) {
  //                                     return DropdownMenuItem(
  //                                         value: e["value"],
  //                                         child: Text(e["name"].toString(),
  //                                             style: widget
  //                                                 .theme.textTheme.bodyMedium!
  //                                                 .copyWith(
  //                                                     color: Colors.black)));
  //                                   }).toList(),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: widget.btnheight * 0.05),
  //                         Container(
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: btnheight * 0.1,
  //                                 child: Text("GP Approval Required"),
  //                               ),
  //                               SizedBox(width: widget.btnWidth * 0.05),

  //                               Container(
  //                                 padding: EdgeInsets.only(
  //                                   left: widget.btnheight * 0.01,
  //                                 ),
  //                                 width: widget.btnWidth * 0.67,
  //                                 // padding: EdgeInsets.only(
  //                                 //     top: 1, left: 10, right: 10),
  //                                 // decoration: BoxDecoration(
  //                                 //     border: Border.all(color: Colors.grey),
  //                                 //     borderRadius: BorderRadius.circular(5)),
  //                                 child: DropdownButtonHideUnderline(
  //                                   child: DropdownButtonFormField(
  //                                     decoration: InputDecoration(
  //                                       contentPadding:
  //                                           const EdgeInsets.symmetric(
  //                                         vertical: 5,
  //                                         horizontal: 10,
  //                                       ),
  //                                       focusedErrorBorder: OutlineInputBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(5),
  //                                         borderSide:
  //                                             BorderSide(color: Colors.red),
  //                                       ),
  //                                       errorBorder: OutlineInputBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(5),
  //                                         borderSide:
  //                                             BorderSide(color: Colors.red),
  //                                       ),
  //                                       enabledBorder: OutlineInputBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(5),
  //                                         borderSide:
  //                                             BorderSide(color: Colors.grey),
  //                                       ),
  //                                       focusedBorder: OutlineInputBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(5),
  //                                         borderSide:
  //                                             BorderSide(color: Colors.grey),
  //                                       ),
  //                                     ),
  //                                     validator: ((value) {
  //                                       if (value == null) {
  //                                         return 'GP Approval Required*';
  //                                       }
  //                                       return null;
  //                                     }),
  //                                     hint: Text("GP Approval Required*",
  //                                         style: const TextStyle(
  //                                             color: Colors.grey,
  //                                             fontSize: 15)),
  //                                     value: context
  //                                         .watch<OrderTabController>()
  //                                         .valueSelectedGPApproval,
  //                                     //dropdownColor:Colors.green,
  //                                     icon: Icon(Icons.arrow_drop_down),
  //                                     iconSize: 30,
  //                                     style: const TextStyle(
  //                                         color: Colors.black, fontSize: 16),
  //                                     isExpanded: true,
  //                                     onChanged: (val) {
  //                                       setState(() {
  //                                         context
  //                                                 .read<OrderTabController>()
  //                                                 .valueSelectedGPApproval =
  //                                             val.toString();
  //                                         print("valll: " + val.toString());
  //                                       });
  //                                     },
  //                                     items: context
  //                                         .read<OrderTabController>()
  //                                         .getgrpApprovalRequired
  //                                         .map((e) {
  //                                       return DropdownMenuItem(
  //                                           value: e["value"],
  //                                           child: Text(
  //                                             e["name"].toString(),
  //                                             style: widget
  //                                                 .theme.textTheme.bodyMedium
  //                                                 ?.copyWith(),
  //                                           ));
  //                                     }).toList(),
  //                                   ),
  //                                 ),
  //                               ),
  //                               // ),
  //                             ],
  //                           ),
  //                         ),
  //                         SizedBox(height: widget.btnheight * 0.05),
  //                         Container(
  //                           // color: Colors.green,

  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: btnheight * 0.1,
  //                                 child: Text("Order Received Time"),
  //                               ),
  //                               SizedBox(width: widget.btnWidth * 0.05),
  //                               Container(
  //                                 width: widget.btnWidth * 0.67,
  //                                 // width: Screens.width(context) * 0.83,
  //                                 // color: Colors.blue,
  //                                 child: TextFormField(
  //                                   readOnly: true,
  //                                   onTap: () {
  //                                     context.read<OrderTabController>().selecTime(context);
  //                                   },
  //                                   validator: (value) {
  //                                     if (value!.isEmpty) {
  //                                       return "Enter Order Received Time";
  //                                     }
  //                                     return null;
  //                                   },
  //                                   controller:
  //                                       context.read<OrderTabController>().udfController[1],
  //                                   decoration: InputDecoration(
  //                                     suffixIcon: IconButton(
  //                                         onPressed: (() {
  //                                           st(
  //                                             () {
  //                                               context
  //                                                   .read<OrderTabController>()
  //                                                   .selecTime(context);
  //                                             },
  //                                           );
  //                                         }),
  //                                         icon: Icon(
  //                                           Icons.access_time,
  //                                           size: 28,
  //                                         )),
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 10, horizontal: 10),
  //                                     border: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide:
  //                                           BorderSide(color: Colors.green),
  //                                     ),
  //                                   ),
  //                                   cursorColor: theme.primaryColor,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         SizedBox(height: widget.btnheight * 0.05),
  //                         Container(
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 alignment: Alignment.centerLeft,
  //                                 // height: btnheight * 0.1,
  //                                 child: Text("Order Received Date"),
  //                               ),
  //                               SizedBox(width: widget.btnWidth * 0.05),
  //                               Container(
  //                                 // height: btnheight * 0.2,
  //                                 width: widget.btnWidth * 0.67,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(3),
  //                                   color: Colors.grey.withOpacity(0.01),
  //                                 ),
  //                                 child: TextFormField(
  //                                   // autofocus: true,
  //                                   readOnly: true,
  //                                   controller:
  //                                       context.read<OrderTabController>().udfController[2],
  //                                   cursorColor: Colors.grey,
  //                                   style: widget.theme.textTheme.bodyMedium
  //                                       ?.copyWith(),
  //                                   onChanged: (v) {},
  //                                   validator: (value) {
  //                                     if (value!.isEmpty) {
  //                                       return "Enter Order Received Date";
  //                                     }
  //                                     return null;
  //                                   },
  //                                   onTap: () {
  //                                     context
  //                                         .read<OrderTabController>()
  //                                         .getDate(context, 'UDF');
  //                                   },
  //                                   decoration: InputDecoration(
  //                                     suffixIcon: IconButton(
  //                                         onPressed: (() {
  //                                           context
  //                                               .read<OrderTabController>()
  //                                               .getDate(context, 'UDF');
  //                                         }),
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

}
