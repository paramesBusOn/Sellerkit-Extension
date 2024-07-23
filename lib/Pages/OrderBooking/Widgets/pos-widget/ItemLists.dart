// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_string_interpolations

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/OrderController/OrderNewController.dart';
import 'package:sellerkit/Controller/OrderController/TabOrderController.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/pos-widget/SearchProduct.dart';
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_string_interpolations

class SOSearchWidget extends StatefulWidget {
  SOSearchWidget(
      {Key? key,
      required this.theme,
      //required this.prdsrch,
      required this.searchHeight,
      required this.searchWidth})
      : super(key: key);

  final ThemeData theme;
  //OrderNewController prdsrch;
  double searchHeight;
  double searchWidth;

  @override
  State<SOSearchWidget> createState() => _SOSearchWidgetState();
}

class _SOSearchWidgetState extends State<SOSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: widget.searchHeight,
      width: widget.searchWidth,
      padding: EdgeInsets.only(top: widget.searchHeight * 0.01, left: widget.searchHeight * 0.01, right: widget.searchHeight * 0.01, bottom: widget.searchHeight * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Container(
                  alignment: Alignment.center,
                  width: widget.searchWidth * 1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 240, 235, 235)),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.grey.withOpacity(0.01),
                  ),
                  child: TextFormField(
                    // readOnly: context.watch<OrderNewController>().editqty,

                    // autofocus: true,
                    // focusNode: context.read<OrderNewController>().focusnode[0],
                    style: theme.textTheme.bodyMedium,
                    cursorColor: Colors.grey,
                   controller:
                      context.read<OrderNewController>().mycontroller[49],
                      onSaved: (v){

                      },
                    onEditingComplete: ()  {
                       context.read<OrderNewController>().scanneddatagetitem(context);
                      // // .then((value) {

                      // if (context.read<OrderNewController>().getSearchedData.isEmpty) {
                      //   showDialog(
                      //       context: context,
                      //       barrierDismissible: true,
                      //       builder: (BuildContext context) {
                      //         return AlertDialog(
                      //             contentPadding: EdgeInsets.all(0),
                      //             content: AlertBox(
                      //               payMent: 'Alert',
                      //               errormsg: true,
                      //               widget: Center(
                      //                   child: ContentContainer(
                      //                 content: 'Wrong Itemcode scanned..!!',
                      //                 theme: theme,
                      //               )),
                      //               buttonName: null,
                      //             ));
                      //       });
                      // } else if (context.read<OrderNewController>().getSearchedData.length == 1) {
                      //   context.read<OrderNewController>().singleitemsearch(context, theme, 0);
                      // } else {
                      //   showDialog<dynamic>(
                      //       context: context,
                      //       builder: (_) {
                      //         return SearchItemsSO();
                      //       });
                      // }
                      // });
                      // context.read<OrderNewController>().disableKeyBoard(context);
                      //  prdsrch.scannBAtch(context, theme);
                    },
                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Inventories',
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          //  color: Colors.grey
                          //   fontWeight: FontWeight.normal
                          ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {
                          // context.read<OrderNewController>().getAllList(context.read<OrderNewController>().searchcon.text.trim()).then((value) {
                            showDialog<dynamic>(
                                context: context,
                                builder: (_) {
                                  return SearchItemsSO();
                                });
                          // });
                        },
                        icon: Icon(
                          Icons.search,
                          // size: searchHeight * 0.05,
                          color: Colors.grey,
                        ),
                        color: theme.primaryColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
                  )),
          SizedBox(
            height: widget.searchHeight * 0.01,
          ),
          Container(
            padding: EdgeInsets.only(
              top: widget.searchHeight * 0.01,
              left: widget.searchHeight * 0.01,
              right: widget.searchHeight * 0.01,
              bottom: widget.searchHeight * 0.01,
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            //  height: searchHeight * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // context.read<OrderNewController>().viewdetails();
                  },
                  child: Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(
                        left: widget.searchHeight * 0.01,
                      ),
                      alignment: Alignment.centerLeft,
                      width: widget.searchWidth * 0.5,
                      child: Text(
                        "Product Information",
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                      )),
                ),
                SizedBox(
                  // color: Colors.green,
                  width: widget.searchWidth * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          // color: Colors.red,
                          alignment: Alignment.center,
                          width: widget.searchWidth * 0.07,
                          child: Text(
                            "Qty",
                            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                          )),
                      // Container(
                      //     // color: Colors.red,
                      //     alignment: Alignment.center,
                      //     width: widget.searchWidth * 0.13,
                      //     child: Text(
                      //       "Discount %",
                      //       style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                      //     )),
                      // Container(
                      //     // color: Colors.red,
                      //     alignment: Alignment.center,
                      //     width: widget.searchWidth * 0.15,
                      //     child: Text(
                      //       "Tax %",
                      //       style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                      //     )),
                      Container(
                          // color: Colors.red,
                          alignment: Alignment.center,
                          width: widget.searchWidth * 0.15,
                          child: Text(
                            "Price",
                            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: context.watch<OrderNewController>().showItemList == false
                  ? ListView.builder(
                      itemCount: context.read<OrderNewController>().getProduct.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                              padding: EdgeInsets.only(
                                top: widget.searchHeight * 0.01,
                                left: widget.searchHeight * 0.01,
                                right: widget.searchHeight * 0.01,
                                bottom: widget.searchHeight * 0.02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(0.12),
                              ),
                              child: Column(
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        // color: Colors.yellow,
                                
                                        width: widget.searchWidth * 0.5,
                                        // height: searchHeight * 0.02,
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "${context.watch<OrderNewController>().getProduct[index].ItemDescription.toString()}",
                                              maxLines: 2,
                                              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                                            ))),
                                                                   SizedBox(
                                  width: widget.searchWidth * 0.10,
                                  // color: Colors.yellow,
                                  // child: Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  child:     Container(
                                        // alignment: Alignment.center,
                                        // width: widget.searchWidth * 0.05,
                                        child:Text(context
                                                  .read<
                                                      OrderNewController>()
                                                  .getProduct[index]
                                                  .Quantity
                                                  .toString())
                                      ),
                                      // Container(
                                      //   width: searchWidth * 0.1,
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceEvenly,
                                      //     children: [
                                      // InkWell(
                                      //   onTap: () {
                                      //     prdsrch.itemdecrement(
                                      //         context, theme, index);
                                      //   },
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     width: searchWidth * 0.05,
                                      //     height: searchHeight * 0.05,
                                      //     color: Colors.blue,
                                      //     child: Icon(
                                      //       Icons.remove,
                                      //       color: Colors.white,
                                      //       size: searchHeight * 0.05,
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //     width: widget.searchWidth * 0.1,
                                      //     height: widget.searchHeight * 0.07,
                                      //     alignment: Alignment.center,
                                      //     // width: Screens.width(context) * 0.015,
                                      //     padding: EdgeInsets.symmetric(horizontal: widget.searchWidth * 0.005),
                                      //     // height: searchHeight *
                                      //     //     0.025,
                                      //     child: TextFormField(
                                      //       readOnly: true,
                                      //       textAlign: TextAlign.right,
                                      //       style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                                      //       onChanged: (v) {},
                                      //       cursorColor: Colors.grey,
                                      //       textDirection: TextDirection.ltr,
                                      //       keyboardType: TextInputType.number,
                                      //       onEditingComplete: () {
                                      //         // prdsrch.qtyEdited(index,context,theme);
                                      //       },
                                      //       // controller: context.read<OrderNewController>().qtymycontroller2[index],
                                      //       decoration: InputDecoration(
                                      //         filled: false,
                                      //         enabledBorder: OutlineInputBorder(
                                      //           borderRadius: BorderRadius.circular(5),
                                      //           borderSide: BorderSide(color: Colors.grey),
                                      //         ),
                                      //         focusedBorder: OutlineInputBorder(
                                      //           borderRadius: BorderRadius.circular(5),
                                      //           borderSide: BorderSide(color: Colors.grey),
                                      //         ),
                                      //         contentPadding: const EdgeInsets.symmetric(
                                      //           vertical: 0,
                                      //           horizontal: 5,
                                      //         ),
                                      //       ),
                                      //     )
                                
                                      //     // Text(
                                      //     //     "${prdsrch.getScanneditemData[index].Qty}",
                                      //     // style: theme.textTheme.bodyText2
                                      //     //     ?.copyWith(
                                      //     //         color: Colors.black)),
                                      //     ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     prdsrch.itemIncrement(
                                      //         index, context, theme);
                                      //   },
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     width: searchWidth * 0.05,
                                      //     height: searchHeight * 0.05,
                                      //     color: Colors.blue,
                                      //     child: Icon(
                                      //       Icons.add,
                                      //       color: Colors.white,
                                      //       size: searchHeight * 0.05,
                                      //     ),
                                      //   ),
                                      // ),
                                      //     ],
                                      //   ),
                                      // ),
                                
                                      // Container(
                                      //     width: widget.searchWidth * 0.09,
                                      //     height: widget.searchHeight * 0.07,
                                      //     // color: Colors.blue,
                                      //     alignment: Alignment.center,
                                      //     child: TextFormField(
                                      //       readOnly: true,
                                      //       textAlign: TextAlign.right,
                                      //       style: theme.textTheme.bodyMedium,
                                      //       onChanged: (v) {},
                                      //       onEditingComplete: () {
                                      //         // prdsrch.calCulateDocVal(
                                      //         //     context, theme);
                                      //       },
                                      //       cursorColor: Colors.grey,
                                      //       textDirection: TextDirection.ltr,
                                      //       keyboardType: TextInputType.number,
                                      //       controller: context.watch<OrderNewController>().discountcontroller2[index],
                                      //       decoration: InputDecoration(
                                      //         filled: false,
                                      //         enabledBorder: OutlineInputBorder(
                                      //           borderRadius: BorderRadius.circular(5),
                                      //           borderSide: BorderSide(color: Colors.grey),
                                      //         ),
                                      //         focusedBorder: OutlineInputBorder(
                                      //           borderRadius: BorderRadius.circular(5),
                                      //           borderSide: BorderSide(color: Colors.grey),
                                      //         ),
                                      //         contentPadding: const EdgeInsets.symmetric(
                                      //           vertical: 0,
                                      //           horizontal: 5,
                                      //         ),
                                      //       ),
                                      //     )
                                      //     //   Text(
                                      //     //  "${prdsrch.getScanneditemData[index].discount.toString()}",
                                      //     // //  getScanneditemData[index].
                                      //     // //   Maxdiscount}",
                                      //     //     style: theme.textTheme.bodyText2
                                      //     //         ?.copyWith(color: Colors.black),
                                      //     //   ),
                                      //     ),
                                      // Container(
                                      //   width: widget.searchWidth * 0.17,
                                      //   // color: Colors.blue,
                                      //   alignment: Alignment.centerRight,
                                      //   child: Text(context.read<OrderNewController>().getScanneditemData2[index].TaxRate == null ? '00' : ' ${context.watch<OrderNewController>().getScanneditemData2[index].TaxRate}', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black)),
                                      // ),
                                      
                                    
                                ),
                                 Container(
                                        // color: Colors.blue,
                                        width: widget.searchWidth * 0.20,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          context.read<OrderNewController>().config.slpitCurrency22("${context.watch<OrderNewController>().getProduct[index]
                                                      .Price}"),
                                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: widget.searchHeight * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Container(
                                    //     alignment: Alignment.centerLeft,
                                    //     child: Text(
                                    //       "${context.watch<OrderNewController>().getScanneditemData2[index].SerialBatch}",
                                    //       textAlign: TextAlign.start,
                                    //       style: theme.textTheme.bodyMedium?.copyWith(),
                                    //     )),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      // width: searchWidth * 0.13,
                                      child: Text(
                                        // "  |  DC-ABV12K-1YR",
                                        "${context.watch<OrderNewController>().getProduct[index]
                                                          .ItemCode}",
                                        style: theme.textTheme.bodyMedium?.copyWith(),
                                      ),
                                    ),
                                 
                                  
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              print(index);
                                              context
                                                  .read<
                                                      OrderNewController>()
                                                  .getProduct
                                                  .removeAt(index);
                                              if (context
                                                  .read<
                                                      OrderNewController>()
                                                  .productDetails
                                                  .isEmpty) {
                                                context
                                                    .read<
                                                        OrderNewController>()
                                                    .changeVisible();
                                              }
                                  
                                              for (int i = 0;
                                                  i <
                                                      context
                                                          .read<
                                                              OrderNewController>()
                                                          .productDetails
                                                          .length;
                                                  i++) {
                                                //  provi.productDetails[i].lineId =
                                                //     (i + 1).toString();
                                              }
                                            });
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          )),
                                      SizedBox(width: 10.0),
                                      GestureDetector(
                                          onTap: () {
                                          setState(() {
                                              context
                                                    .read<
                                                        OrderNewController>()
                                                    .mycontroller[10]
                                                    .text =
                                                context
                                                    .read<
                                                        OrderNewController>()
                                                    .getProduct[index]
                                                    .Price!
                                                    .toStringAsFixed(
                                                        2);
                                            context
                                                    .read<
                                                        OrderNewController>()
                                                    .mycontroller[11]
                                                    .text =
                                                context
                                                    .read<
                                                        OrderNewController>()
                                                    .getProduct[index]
                                                    .Quantity!
                                                    .toStringAsFixed(
                                                        2);
                                            context
                                                    .read<
                                                        OrderNewController>()
                                                    .mycontroller[11]
                                                    .text =
                                                context
                                                    .read<
                                                        OrderNewController>()
                                                    .getProduct[index]
                                                    .Quantity!
                                                    .toStringAsFixed(
                                                        0);
                                            context
                                                    .read<
                                                        OrderNewController>()
                                                    .total =
                                                context
                                                    .read<
                                                        OrderNewController>()
                                                    .getProduct[index]
                                                    .LineTotal!;
                                            context
                                                .read<
                                                    OrderNewController>()
                                                .isUpdateClicked = true;
                                  
                                            context
                                                .read<
                                                    OrderNewController>()
                                                .showBottomSheetInsertforedit(
                                                    context, index);
                                          });
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          )),
                                    ],
                                  ),
                                  ],
                                )
                              ])),
                        );
                      })
                  : Container()
                  // ListView.builder(
                  //     itemCount: context.watch<OrderNewController>().getScanneditemData.length,
                  //     itemBuilder: (context, index) {
                  //       return Card(
                  //         child: InkWell(
                  //           onTap: () {},
                  //           child: Container(
                  //               padding: EdgeInsets.only(
                  //                 top: widget.searchHeight * 0.01,
                  //                 left: widget.searchHeight * 0.01,
                  //                 right: widget.searchHeight * 0.01,
                  //                 bottom: widget.searchHeight * 0.02,
                  //               ),
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(5),
                  //                 color: Colors.grey.withOpacity(0.04),
                  //               ),
                  //               child: Column(children: [
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Row(
                  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Container(
                  //                             width: widget.searchWidth * 0.4,
                  //                             // color: Colors.green,
                  //                             // height: searchHeight * 0.02,
                  //                             alignment: Alignment.centerLeft,
                  //                             child: TextButton(
                  //                                 onPressed: () {},
                  //                                 child: Text(
                  //                                   context.read<OrderNewController>().getScanneditemData[index].ItemName ?? '', // "${context.watch<OrderNewController>().getScanneditemData[index].ItemName}",
                  //                                   maxLines: 2,
                  //                                   style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                  //                                 ))),
                  //                       ],
                  //                     ),
                  //                     SizedBox(
                  //                       width: widget.searchWidth * 0.5,
                  //                       // color: Colors.yellow,
                  //                       child: Row(
                  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           // Container(
                  //                           //   width: searchWidth * 0.1,
                  //                           //   child: Row(
                  //                           //     mainAxisAlignment:
                  //                           //         MainAxisAlignment.spaceEvenly,
                  //                           //     children: [
                  //                           // InkWell(
                  //                           //   onTap: () {
                  //                           //     prdsrch.itemdecrement(
                  //                           //         context, theme, index);
                  //                           //   },
                  //                           //   child: Container(
                  //                           //     alignment: Alignment.center,
                  //                           //     width: searchWidth * 0.05,
                  //                           //     height: searchHeight * 0.05,
                  //                           //     color: Colors.blue,
                  //                           //     child: Icon(
                  //                           //       Icons.remove,
                  //                           //       color: Colors.white,
                  //                           //       size: searchHeight * 0.05,
                  //                           //     ),
                  //                           //   ),
                  //                           // ),
                  //                           Container(
                  //                               width: widget.searchWidth * 0.1,
                  //                               height: widget.searchHeight * 0.07,
                  //                               alignment: Alignment.center,
                  //                               // width: Screens.width(context) * 0.015,
                  //                               padding: EdgeInsets.symmetric(horizontal: widget.searchWidth * 0.005),
                  //                               // height: searchHeight *
                  //                               //     0.025,
                  //                               child: TextFormField(
                  //                                 textAlign: TextAlign.right,
                  //                                 onTap: () {
                  //                                   context.read<OrderNewController>().qtymycontroller[index].text = context.read<OrderNewController>().qtymycontroller[index].text;
                  //                                   context.read<OrderNewController>().qtymycontroller[index].selection = TextSelection(
                  //                                     baseOffset: 0,
                  //                                     extentOffset: context.read<OrderNewController>().qtymycontroller[index].text.length,
                  //                                   );
                  //                                 },
                  //                                 style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                  //                                 onChanged: (v) {},
                  //                                 cursorColor: Colors.grey,
                  //                                 textDirection: TextDirection.ltr,
                  //                                 keyboardType: TextInputType.number,
                  //                                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //                                 onEditingComplete: () {
                  //                                   context.read<OrderNewController>().cpyfrmsq == true ? context.read<OrderNewController>().sqQtyEdited(index, context, theme) : context.read<OrderNewController>().qtyEdited(index, context, theme);
                  //                                   context.read<OrderNewController>().disableKeyBoard(context);
                  //                                 },
                  //                                 controller: context.read<OrderNewController>().qtymycontroller[index],
                  //                                 decoration: InputDecoration(
                  //                                   filled: false,
                  //                                   enabledBorder: OutlineInputBorder(
                  //                                     borderRadius: BorderRadius.circular(5),
                  //                                     borderSide: BorderSide(color: Colors.grey),
                  //                                   ),
                  //                                   focusedBorder: OutlineInputBorder(
                  //                                     borderRadius: BorderRadius.circular(5),
                  //                                     borderSide: BorderSide(color: Colors.grey),
                  //                                   ),
                  //                                   contentPadding: const EdgeInsets.symmetric(
                  //                                     vertical: 0,
                  //                                     horizontal: 5,
                  //                                   ),
                  //                                 ),
                  //                               )

                  //                               // Text(
                  //                               //     "${prdsrch.getScanneditemData[index].Qty}",
                  //                               // style: theme.textTheme.bodyText2
                  //                               //     ?.copyWith(
                  //                               //         color: Colors.black)),
                  //                               ),
                  //                           Container(
                  //                               width: widget.searchWidth * 0.09,
                  //                               height: widget.searchHeight * 0.07,
                  //                               // color: Colors.blue,
                  //                               alignment: Alignment.center,
                  //                               child: TextFormField(
                  //                                 readOnly: true,
                  //                                 textAlign: TextAlign.right,
                  //                                 style: theme.textTheme.bodyMedium,
                  //                                 onChanged: (v) {},
                  //                                 onTap: () {
                  //                                   context.read<OrderNewController>().discountcontroller[index].text = context.read<OrderNewController>().discountcontroller[index].text;
                  //                                   context.read<OrderNewController>().discountcontroller[index].selection = TextSelection(
                  //                                     baseOffset: 0,
                  //                                     extentOffset: context.read<OrderNewController>().discountcontroller[index].text.length,
                  //                                   );
                  //                                 },
                  //                                 onEditingComplete: () {
                  //                                   context.read<OrderNewController>().calCulateDocVal(context, theme);
                  //                                 },
                  //                                 cursorColor: Colors.grey,
                  //                                 textDirection: TextDirection.ltr,
                  //                                 keyboardType: TextInputType.number,
                  //                                 controller: context.read<OrderNewController>().discountcontroller[index],
                  //                                 decoration: InputDecoration(
                  //                                   filled: false,
                  //                                   enabledBorder: OutlineInputBorder(
                  //                                     borderRadius: BorderRadius.circular(5),
                  //                                     borderSide: BorderSide(color: Colors.grey),
                  //                                   ),
                  //                                   focusedBorder: OutlineInputBorder(
                  //                                     borderRadius: BorderRadius.circular(5),
                  //                                     borderSide: BorderSide(color: Colors.grey),
                  //                                   ),
                  //                                   contentPadding: const EdgeInsets.symmetric(
                  //                                     vertical: 0,
                  //                                     horizontal: 5,
                  //                                   ),
                  //                                 ),
                  //                               )
                  //                               // //   Text(
                  //                               // //  "${prdsrch.getScanneditemData[index].discount.toString()}",
                  //                               // // //  getScanneditemData[index].
                  //                               // // //   Maxdiscount}",
                  //                               // //     style: theme.textTheme.bodyText2
                  //                               // //         ?.copyWith(color: Colors.black),
                  //                               // //   ),
                  //                               ),

                  //                           Container(
                  //                             width: widget.searchWidth * 0.12,
                  //                             // color: Colors.blue,
                  //                             alignment: Alignment.centerRight,
                  //                             child: Text(context.read<OrderNewController>().getScanneditemData[index].TaxRate == null ? '00' : ' ${context.watch<OrderNewController>().getScanneditemData[index].TaxRate}', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black)),
                  //                           ),
                  //                           Container(
                  //                             // color: Colors.blue,
                  //                             width: widget.searchWidth * 0.17,
                  //                             alignment: Alignment.centerRight,
                  //                             child: Text(
                  //                               context.read<OrderNewController>().config.splitValues("${context.watch<OrderNewController>().getScanneditemData[index].SellPrice}"),
                  //                               style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 SizedBox(
                  //                   height: widget.searchHeight * 0.01,
                  //                 ),
                  //                 Row(
                  //                   children: [
                  //                     Container(
                  //                         alignment: Alignment.centerLeft,
                  //                         child: Text(
                  //                           "${context.read<OrderNewController>().getScanneditemData[index].SerialBatch}",
                  //                           textAlign: TextAlign.start,
                  //                           style: theme.textTheme.bodyMedium?.copyWith(),
                  //                         )),
                  //                     Container(
                  //                       alignment: Alignment.centerLeft,
                  //                       // width: searchWidth * 0.13,
                  //                       child: Text(
                  //                         // "  |  DC-ABV12K-1YR",
                  //                         " ${context.watch<OrderNewController>().getScanneditemData[index].ItemCode}",
                  //                         style: theme.textTheme.bodyMedium?.copyWith(),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 )
                  //               ])),
                  //         ),
                  //       );
                  //     })
                      ),

        
      Column(
        children: [
          Container(
             padding: EdgeInsets.only(
              top: widget.searchHeight * 0.01,
              left: widget.searchHeight * 0.01,
              right: widget.searchHeight * 0.01,
              bottom: widget.searchHeight * 0.01,
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                        // color: Colors.red,
                        padding: EdgeInsets.only(
                          left: widget.searchHeight * 0.005,
                        ),
                        alignment: Alignment.center,
                        width: widget.searchWidth * 0.4,
                        child: Text(
                          "Qty",
                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                        )),
                         Container(
                        // color: Colors.red,
                        padding: EdgeInsets.only(
                          left: widget.searchHeight * 0.005,
                        ),
                        alignment: Alignment.center,
                        width: widget.searchWidth * 0.4,
                        child: Text(
                          "Total Amount",
                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                        )),
                
            
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
               width: widget.searchWidth * 0.4,
                alignment: Alignment.center,
              child: Text(
                  "${context.read<OrderNewController>().getTotalGrossqty()}",
                  // maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: theme.primaryColor,
                  )),
            ),
            Container(
               alignment: Alignment.center,
               width: widget.searchWidth * 0.4,
              child: Text(
                  "${context.read<OrderNewController>().getTotalGrossAmount()}",
                  // maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: theme.primaryColor,
                  )),
            ),
          ],),
          SizedBox(
            height: Screens.padingHeight(context)*0.01,
          ),
        SizedBox(
                                  width: Screens.width(context),
                                child: TextFormField(
                                  controller: context
                                      .read<OrderNewController>()
                                      .mycontroller[15],
                                  minLines: 1,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      top: Screens.bodyheight(context) * 0.04,
                                      left: Screens.bodyheight(context) * 0.01,
                                    ),
                                    alignLabelWithHint: true,
                                    // border: OutlineInputBorder(),
                                    hintText: 'Notes',
                                  ),
                                ),
                              ),
        ],
      ),
        ],
      ),
    );
  }
}

// class SOSearchWidget extends StatelessWidget {
//   SOSearchWidget(
//       {Key? key,
//       required this.theme,
//       //required this.prdsrch,
//       required this.searchHeight,
//       required this.searchWidth})
//       : super(key: key);

//   final ThemeData theme;
//   //OrderNewController prdsrch;
//   double searchHeight;
//   double searchWidth;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       height: searchHeight,
//       width: searchWidth,
//       padding: EdgeInsets.only(
//           top: searchHeight * 0.01,
//           left: searchHeight * 0.01,
//           right: searchHeight * 0.01,
//           bottom: searchHeight * 0.01),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           context.read<OrderNewController>().scanneditemData2.isNotEmpty
//               ? Container()
//               : Container(
//                   alignment: Alignment.center,
//                   width: searchWidth * 1,
//                   decoration: BoxDecoration(
//                     border:
//                         Border.all(color: Color.fromARGB(255, 240, 235, 235)),
//                     borderRadius: BorderRadius.circular(3),
//                     color: Colors.grey.withOpacity(0.01),
//                   ),
//                   child: TextFormField(
//                     autofocus: true,
//                     focusNode: context.read<OrderNewController>().focusnode[0],
//                     style: theme.textTheme.bodyMedium,
//                     cursorColor: Colors.grey,
//                     controller: context.read<OrderNewController>().searchcon,
//                     onEditingComplete: () async {
//                       await context.read<OrderNewController>().getAllList(
//                           context.read<OrderNewController>().searchcon.text.trim());

//                       if (context.read<OrderNewController>().getSearchedData.length < 1) {
//                         showDialog(
//                             context: context,
//                             barrierDismissible: true,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                   contentPadding: EdgeInsets.all(0),
//                                   content: AlertBox(
//                                     payMent: 'Alert',
//                                     errormsg: true,
//                                     widget: Center(
//                                         child: ContentContainer(
//                                       content: 'Wrong Itemcode scanned..!!',
//                                       theme: theme,
//                                     )),
//                                     buttonName: null,
//                                   ));
//                             });
//                       } else if (context.read<OrderNewController>().getSearchedData.length ==
//                           1) {
//                         context
//                             .read<OrderNewController>()
//                             .singleitemsearch(context, theme, 0);
//                       } else {
//                         showDialog<dynamic>(
//                             context: context,
//                             builder: (_) {
//                               return SearchItemsSO();
//                             });
//                       }
//                       context.read<OrderNewController>().disableKeyBoard(context);
//                     },
//                     decoration: InputDecoration(
//                       filled: false,
//                       hintText: 'Inventories',
//                       hintStyle: theme.textTheme.bodyMedium?.copyWith(
//                           //  color: Colors.grey
//                           //   fontWeight: FontWeight.normal
//                           ),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           context
//                               .read<OrderNewController>()
//                               .getAllList(
//                                   context.read<OrderNewController>().searchcon.text.trim())
//                               .then((value) {
//                             showDialog<dynamic>(
//                                 context: context,
//                                 builder: (_) {
//                                   return SearchItemsSO();
//                                 });
//                           });
//                         },
//                         icon: Icon(
//                           Icons.search,
//                           // size: searchHeight * 0.05,
//                           color: Colors.grey,
//                         ),
//                         color: theme.primaryColor,
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15,
//                         horizontal: 10,
//                       ),
//                     ),
//                   )),
//           SizedBox(
//             height: searchHeight * 0.01,
//           ),
//           Container(
//             padding: EdgeInsets.only(
//               top: searchHeight * 0.01,
//               left: searchHeight * 0.01,
//               right: searchHeight * 0.01,
//               bottom: searchHeight * 0.01,
//             ),
//             decoration: BoxDecoration(
//               color: theme.primaryColor,
//             ),
//             //  height: searchHeight * 0.06,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // prdsrch.getcustaddresslist();
//                   },
//                   child: Container(
//                       // color: Colors.red,
//                       padding: EdgeInsets.only(
//                         left: searchHeight * 0.01,
//                       ),
//                       alignment: Alignment.centerLeft,
//                       width: searchWidth * 0.4,
//                       child: Text(
//                         "Product Information",
//                         style: theme.textTheme.bodyMedium
//                             ?.copyWith(color: Colors.white),
//                       )),
//                 ),
//                 Container(
//                   // color: Colors.green,
//                   width: searchWidth * 0.5,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                           // color: Colors.red,
//                           alignment: Alignment.center,
//                           width: searchWidth * 0.07,
//                           child: Text(
//                             "Qty",
//                             style: theme.textTheme.bodyMedium
//                                 ?.copyWith(color: Colors.white),
//                           )),
//                       Container(
//                           // color: Colors.red,
//                           alignment: Alignment.center,
//                           width: searchWidth * 0.13,
//                           child: Text(
//                             "Discount %",
//                             style: theme.textTheme.bodyMedium
//                                 ?.copyWith(color: Colors.white),
//                           )),
//                       Container(
//                           // color: Colors.red,
//                           alignment: Alignment.center,
//                           width: searchWidth * 0.15,
//                           child: Text(
//                             "Tax %",
//                             style: theme.textTheme.bodyMedium
//                                 ?.copyWith(color: Colors.white),
//                           )),
//                       Container(
//                           // color: Colors.red,
//                           alignment: Alignment.center,
//                           width: searchWidth * 0.15,
//                           child: Text(
//                             "Price",
//                             style: theme.textTheme.bodyMedium
//                                 ?.copyWith(color: Colors.white),
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//               child: context.read<OrderNewController>().getScanneditemData2.isNotEmpty
//                   ? ListView.builder(
//                       itemCount:
//                           context.read<OrderNewController>().getScanneditemData2.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: Container(
//                               padding: EdgeInsets.only(
//                                 top: searchHeight * 0.01,
//                                 left: searchHeight * 0.01,
//                                 right: searchHeight * 0.01,
//                                 bottom: searchHeight * 0.02,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.grey[300],
//                               ),
//                               child: Column(children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                             // color: Colors.yellow,

//                                             width: searchWidth * 0.4,
//                                             // height: searchHeight * 0.02,
//                                             alignment: Alignment.centerLeft,
//                                             child: TextButton(
//                                                 onPressed: () {},
//                                                 child: Text(
//                                                   "${context.watch<OrderNewController>().getScanneditemData2[index].ItemName.toString()}",
//                                                   maxLines: 2,
//                                                   style: theme
//                                                       .textTheme.bodyMedium
//                                                       ?.copyWith(
//                                                           color: Colors.black),
//                                                 ))),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: searchWidth * 0.55,
//                                       // color: Colors.yellow,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           // Container(
//                                           //   width: searchWidth * 0.1,
//                                           //   child: Row(
//                                           //     mainAxisAlignment:
//                                           //         MainAxisAlignment.spaceEvenly,
//                                           //     children: [
//                                           // InkWell(
//                                           //   onTap: () {
//                                           //     prdsrch.itemdecrement(
//                                           //         context, theme, index);
//                                           //   },
//                                           //   child: Container(
//                                           //     alignment: Alignment.center,
//                                           //     width: searchWidth * 0.05,
//                                           //     height: searchHeight * 0.05,
//                                           //     color: Colors.blue,
//                                           //     child: Icon(
//                                           //       Icons.remove,
//                                           //       color: Colors.white,
//                                           //       size: searchHeight * 0.05,
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                           Container(
//                                               width: searchWidth * 0.1,
//                                               height: searchHeight * 0.07,
//                                               alignment: Alignment.center,
//                                               // width: Screens.width(context) * 0.015,
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal:
//                                                       searchWidth * 0.005),
//                                               // height: searchHeight *
//                                               //     0.025,
//                                               child: TextFormField(
//                                                 readOnly: true,
//                                                 textAlign: TextAlign.right,
//                                                 style: theme
//                                                     .textTheme.bodyMedium
//                                                     ?.copyWith(
//                                                         color: Colors.black),
//                                                 onChanged: (v) {},
//                                                 cursorColor: Colors.grey,
//                                                 textDirection:
//                                                     TextDirection.ltr,
//                                                 keyboardType:
//                                                     TextInputType.number,
//                                                 onEditingComplete: () {
//                                                   // prdsrch.qtyEdited(index,context,theme);
//                                                 },
//                                                 controller: context
//                                                     .read<OrderNewController>()
//                                                     .qtymycontroller2[index],
//                                                 decoration: InputDecoration(
//                                                   filled: false,
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     borderSide: BorderSide(
//                                                         color: Colors.grey),
//                                                   ),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     borderSide: BorderSide(
//                                                         color: Colors.grey),
//                                                   ),
//                                                   contentPadding:
//                                                       const EdgeInsets
//                                                           .symmetric(
//                                                     vertical: 0,
//                                                     horizontal: 5,
//                                                   ),
//                                                 ),
//                                               )

//                                               // Text(
//                                               //     "${prdsrch.getScanneditemData[index].Qty}",
//                                               // style: theme.textTheme.bodyText2
//                                               //     ?.copyWith(
//                                               //         color: Colors.black)),
//                                               ),
//                                           // InkWell(
//                                           //   onTap: () {
//                                           //     prdsrch.itemIncrement(
//                                           //         index, context, theme);
//                                           //   },
//                                           //   child: Container(
//                                           //     alignment: Alignment.center,
//                                           //     width: searchWidth * 0.05,
//                                           //     height: searchHeight * 0.05,
//                                           //     color: Colors.blue,
//                                           //     child: Icon(
//                                           //       Icons.add,
//                                           //       color: Colors.white,
//                                           //       size: searchHeight * 0.05,
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                           //     ],
//                                           //   ),
//                                           // ),

//                                           Container(
//                                               width: searchWidth * 0.09,
//                                               height: searchHeight * 0.07,
//                                               // color: Colors.blue,
//                                               alignment: Alignment.center,
//                                               child: TextFormField(
//                                                 readOnly: true,
//                                                 textAlign: TextAlign.right,
//                                                 style:
//                                                     theme.textTheme.bodyMedium,
//                                                 onChanged: (v) {},
//                                                 onEditingComplete: () {
//                                                   // prdsrch.calCulateDocVal(
//                                                   //     context, theme);
//                                                 },
//                                                 cursorColor: Colors.grey,
//                                                 textDirection:
//                                                     TextDirection.ltr,
//                                                 keyboardType:
//                                                     TextInputType.number,
//                                                 controller: context
//                                                     .read<OrderNewController>()
//                                                     .mycontroller2[index],
//                                                 decoration: InputDecoration(
//                                                   filled: false,
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     borderSide: BorderSide(
//                                                         color: Colors.grey),
//                                                   ),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     borderSide: BorderSide(
//                                                         color: Colors.grey),
//                                                   ),
//                                                   contentPadding:
//                                                       const EdgeInsets
//                                                           .symmetric(
//                                                     vertical: 0,
//                                                     horizontal: 5,
//                                                   ),
//                                                 ),
//                                               )
//                                               //   Text(
//                                               //  "${prdsrch.getScanneditemData[index].discount.toString()}",
//                                               // //  getScanneditemData[index].
//                                               // //   Maxdiscount}",
//                                               //     style: theme.textTheme.bodyText2
//                                               //         ?.copyWith(color: Colors.black),
//                                               //   ),
//                                               ),
//                                           Container(
//                                             width: searchWidth * 0.17,
//                                             // color: Colors.blue,
//                                             alignment: Alignment.centerRight,
//                                             child: Text(
//                                                 context
//                                                             .read<OrderNewController>()
//                                                             .getScanneditemData2[
//                                                                 index]
//                                                             .TaxRate ==
//                                                         null
//                                                     ? '00'
//                                                     : ' ${context.watch<OrderNewController>().getScanneditemData2[index].TaxRate}',
//                                                 style: theme
//                                                     .textTheme.bodyMedium
//                                                     ?.copyWith(
//                                                         color: Colors.black)),
//                                           ),
//                                           Container(
//                                             // color: Colors.blue,
//                                             width: searchWidth * 0.17,
//                                             alignment: Alignment.centerRight,
//                                             child: Text(
//                                               context
//                                                   .read<OrderNewController>()
//                                                   .config
//                                                   .splitValues(
//                                                       "${context.watch<OrderNewController>().getScanneditemData2[index].SellPrice}"),
//                                               style: theme.textTheme.bodyMedium
//                                                   ?.copyWith(
//                                                       color: Colors.black),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: searchHeight * 0.01,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           "${context.watch<OrderNewController>().getScanneditemData2[index].SerialBatch}",
//                                           textAlign: TextAlign.start,
//                                           style: theme.textTheme.bodyMedium
//                                               ?.copyWith(),
//                                         )),
//                                     Container(
//                                       alignment: Alignment.centerLeft,
//                                       // width: searchWidth * 0.13,
//                                       child: Text(
//                                         // "  |  DC-ABV12K-1YR",
//                                         "${context.watch<OrderNewController>().getScanneditemData2[index].ItemCode}",
//                                         style: theme.textTheme.bodyMedium
//                                             ?.copyWith(),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ])),
//                         );
//                       })
//                   : ListView.builder(
//                       itemCount:
//                           context.watch<OrderNewController>().getScanneditemData.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: InkWell(
//                             onTap: () {},
//                             child: Container(
//                                 padding: EdgeInsets.only(
//                                   top: searchHeight * 0.01,
//                                   left: searchHeight * 0.01,
//                                   right: searchHeight * 0.01,
//                                   bottom: searchHeight * 0.02,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.grey.withOpacity(0.04),
//                                 ),
//                                 child: Column(children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                               width: searchWidth * 0.4,
//                                               // color: Colors.green,
//                                               // height: searchHeight * 0.02,
//                                               alignment: Alignment.centerLeft,
//                                               child: TextButton(
//                                                   onPressed: () {},
//                                                   child: Text(
//                                                     context
//                                                             .read<OrderNewController>()
//                                                             .getScanneditemData[
//                                                                 index]
//                                                             .ItemName ??
//                                                         '', // "${context.watch<OrderNewController>().getScanneditemData[index].ItemName}",
//                                                     maxLines: 2,
//                                                     style: theme
//                                                         .textTheme.bodyMedium
//                                                         ?.copyWith(
//                                                             color:
//                                                                 Colors.black),
//                                                   ))),
//                                         ],
//                                       ),
//                                       Container(
//                                         width: searchWidth * 0.5,
//                                         // color: Colors.yellow,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             // Container(
//                                             //   width: searchWidth * 0.1,
//                                             //   child: Row(
//                                             //     mainAxisAlignment:
//                                             //         MainAxisAlignment.spaceEvenly,
//                                             //     children: [
//                                             // InkWell(
//                                             //   onTap: () {
//                                             //     prdsrch.itemdecrement(
//                                             //         context, theme, index);
//                                             //   },
//                                             //   child: Container(
//                                             //     alignment: Alignment.center,
//                                             //     width: searchWidth * 0.05,
//                                             //     height: searchHeight * 0.05,
//                                             //     color: Colors.blue,
//                                             //     child: Icon(
//                                             //       Icons.remove,
//                                             //       color: Colors.white,
//                                             //       size: searchHeight * 0.05,
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                             Container(
//                                                 width: searchWidth * 0.1,
//                                                 height: searchHeight * 0.07,
//                                                 alignment: Alignment.center,
//                                                 // width: Screens.width(context) * 0.015,
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal:
//                                                         searchWidth * 0.005),
//                                                 // height: searchHeight *
//                                                 //     0.025,
//                                                 child: TextFormField(
//                                                   textAlign: TextAlign.right,
//                                                   onTap: () {
//                                                     context
//                                                             .read<OrderNewController>()
//                                                             .qtymycontroller[index]
//                                                             .text =
//                                                         context
//                                                             .read<OrderNewController>()
//                                                             .qtymycontroller[
//                                                                 index]
//                                                             .text;
//                                                     context
//                                                         .read<OrderNewController>()
//                                                         .qtymycontroller[index]
//                                                         .selection = TextSelection(
//                                                       baseOffset: 0,
//                                                       extentOffset: context
//                                                           .read<OrderNewController>()
//                                                           .qtymycontroller[
//                                                               index]
//                                                           .text
//                                                           .length,
//                                                     );
//                                                   },
//                                                   style: theme
//                                                       .textTheme.bodyMedium
//                                                       ?.copyWith(
//                                                           color: Colors.black),
//                                                   onChanged: (v) {},
//                                                   cursorColor: Colors.grey,
//                                                   textDirection:
//                                                       TextDirection.ltr,
//                                                   keyboardType:
//                                                       TextInputType.number,
//                                                   onEditingComplete: () {
//                                                     context
//                                                         .read<OrderNewController>()
//                                                         .qtyEdited(index,
//                                                             context, theme);
//                                                     context
//                                                         .read<OrderNewController>()
//                                                         .disableKeyBoard(
//                                                             context);
//                                                   },
//                                                   controller: context
//                                                       .read<OrderNewController>()
//                                                       .qtymycontroller[index],
//                                                   decoration: InputDecoration(
//                                                     filled: false,
//                                                     enabledBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                       borderSide: BorderSide(
//                                                           color: Colors.grey),
//                                                     ),
//                                                     focusedBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                       borderSide: BorderSide(
//                                                           color: Colors.grey),
//                                                     ),
//                                                     contentPadding:
//                                                         const EdgeInsets
//                                                             .symmetric(
//                                                       vertical: 0,
//                                                       horizontal: 5,
//                                                     ),
//                                                   ),
//                                                 )

//                                                 // Text(
//                                                 //     "${prdsrch.getScanneditemData[index].Qty}",
//                                                 // style: theme.textTheme.bodyText2
//                                                 //     ?.copyWith(
//                                                 //         color: Colors.black)),
//                                                 ),
//                                             Container(
//                                                 width: searchWidth * 0.09,
//                                                 height: searchHeight * 0.07,
//                                                 // color: Colors.blue,
//                                                 alignment: Alignment.center,
//                                                 child: TextFormField(
//                                                   readOnly: true,
//                                                   textAlign: TextAlign.right,
//                                                   style: theme
//                                                       .textTheme.bodyMedium,
//                                                   onChanged: (v) {},
//                                                   onTap: () {
//                                                     context
//                                                             .read<OrderNewController>()
//                                                             .discountcontroller[
//                                                                 index]
//                                                             .text =
//                                                         context
//                                                             .read<OrderNewController>()
//                                                             .discountcontroller[
//                                                                 index]
//                                                             .text;
//                                                     context
//                                                             .read<OrderNewController>()
//                                                             .discountcontroller[
//                                                                 index]
//                                                             .selection =
//                                                         TextSelection(
//                                                       baseOffset: 0,
//                                                       extentOffset: context
//                                                           .read<OrderNewController>()
//                                                           .discountcontroller[
//                                                               index]
//                                                           .text
//                                                           .length,
//                                                     );
//                                                   },
//                                                   onEditingComplete: () {
//                                                     context
//                                                         .read<OrderNewController>()
//                                                         .calCulateDocVal(
//                                                             context, theme);
//                                                   },
//                                                   cursorColor: Colors.grey,
//                                                   textDirection:
//                                                       TextDirection.ltr,
//                                                   keyboardType:
//                                                       TextInputType.number,
//                                                   controller: context
//                                                           .read<OrderNewController>()
//                                                           .discountcontroller[
//                                                       index],
//                                                   decoration: InputDecoration(
//                                                     filled: false,
//                                                     enabledBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                       borderSide: BorderSide(
//                                                           color: Colors.grey),
//                                                     ),
//                                                     focusedBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                       borderSide: BorderSide(
//                                                           color: Colors.grey),
//                                                     ),
//                                                     contentPadding:
//                                                         const EdgeInsets
//                                                             .symmetric(
//                                                       vertical: 0,
//                                                       horizontal: 5,
//                                                     ),
//                                                   ),
//                                                 )
//                                                 // //   Text(
//                                                 // //  "${prdsrch.getScanneditemData[index].discount.toString()}",
//                                                 // // //  getScanneditemData[index].
//                                                 // // //   Maxdiscount}",
//                                                 // //     style: theme.textTheme.bodyText2
//                                                 // //         ?.copyWith(color: Colors.black),
//                                                 // //   ),
//                                                 ),

//                                             Container(
//                                               width: searchWidth * 0.12,
//                                               // color: Colors.blue,
//                                               alignment: Alignment.centerRight,
//                                               child: Text(
//                                                   context
//                                                               .read<OrderNewController>()
//                                                               .getScanneditemData[
//                                                                   index]
//                                                               .TaxRate ==
//                                                           null
//                                                       ? '00'
//                                                       : ' ${context.watch<OrderNewController>().getScanneditemData[index].TaxRate}',
//                                                   style: theme
//                                                       .textTheme.bodyMedium
//                                                       ?.copyWith(
//                                                           color: Colors.black)),
//                                             ),
//                                             Container(
//                                               // color: Colors.blue,
//                                               width: searchWidth * 0.17,
//                                               alignment: Alignment.centerRight,
//                                               child: Text(
//                                                 context
//                                                     .read<OrderNewController>()
//                                                     .config
//                                                     .splitValues(
//                                                         "${context.watch<OrderNewController>().getScanneditemData[index].SellPrice}"),
//                                                 style: theme
//                                                     .textTheme.bodyMedium
//                                                     ?.copyWith(
//                                                         color: Colors.black),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: searchHeight * 0.01,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "${context.read<OrderNewController>().getScanneditemData[index].SerialBatch}",
//                                             textAlign: TextAlign.start,
//                                             style: theme.textTheme.bodyMedium
//                                                 ?.copyWith(),
//                                           )),
//                                       Container(
//                                         alignment: Alignment.centerLeft,
//                                         // width: searchWidth * 0.13,
//                                         child: Text(
//                                           // "  |  DC-ABV12K-1YR",
//                                           " ${context.watch<OrderNewController>().getScanneditemData[index].ItemCode}",
//                                           style: theme.textTheme.bodyMedium
//                                               ?.copyWith(),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ])),
//                           ),
//                         );
//                       })),
//         ],
//       ),
//     );
//   }
// }
