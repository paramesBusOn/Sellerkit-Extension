// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_string_interpolations

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/SalesController/SalesNewController.dart';
import 'package:sellerkit/Pages/OrderBooking/Widgets/pos-widget/SearchProduct.dart';

// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_string_interpolations

class SalesSearchWidget extends StatefulWidget {
  SalesSearchWidget(
      {super.key,
      required this.theme,
      //required this.prdsrch,
      required this.searchHeight,
      required this.searchWidth});

  final ThemeData theme;
  //SalesNewController prdsrch;
  double searchHeight;
  double searchWidth;

  @override
  State<SalesSearchWidget> createState() => _SalesSearchWidgetState();
}

class _SalesSearchWidgetState extends State<SalesSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: widget.searchHeight,
      width: widget.searchWidth,
      padding: EdgeInsets.only(
          top: widget.searchHeight * 0.01,
          left: widget.searchHeight * 0.01,
          right: widget.searchHeight * 0.01,
          bottom: widget.searchHeight * 0.01),
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
                // readOnly: context.watch<SalesNewController>().editqty,

                // autofocus: true,
                // focusNode: context.read<SalesNewController>().focusnode[0],
                style: theme.textTheme.bodyMedium,
                cursorColor: Colors.grey,
                controller: context.read<SalesNewController>().mycontroller[49],
                onSaved: (v) {},
                onEditingComplete: () {
                  context
                      .read<SalesNewController>()
                      .scanneddatagetitem(context);
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
                      // context.read<SalesNewController>().getAllList(context.read<SalesNewController>().searchcon.text.trim()).then((value) {
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
                    // context.read<SalesNewController>().viewdetails();
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
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
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
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          )),
                      Container(
                          // color: Colors.red,
                          alignment: Alignment.center,
                          width: widget.searchWidth * 0.15,
                          child: Text(
                            "Price",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: context.watch<SalesNewController>().showItemList == false
                  ? ListView.builder(
                      itemCount:
                          context.read<SalesNewController>().getProduct.length,
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
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        // color: Colors.yellow,

                                        width: widget.searchWidth * 0.5,
                                        // height: searchHeight * 0.02,
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "${context.watch<SalesNewController>().getProduct[index].ItemDescription.toString()}",
                                              maxLines: 2,
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.black),
                                            ))),
                                    SizedBox(
                                      width: widget.searchWidth * 0.10,
                                      child: Text(context
                                          .read<SalesNewController>()
                                          .getProduct[index]
                                          .Quantity
                                          .toString()),
                                    ),
                                    Container(
                                      // color: Colors.blue,
                                      width: widget.searchWidth * 0.20,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        context
                                            .read<SalesNewController>()
                                            .config
                                            .slpitCurrency22(
                                                "${context.watch<SalesNewController>().getProduct[index].Price}"),
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: widget.searchHeight * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      // width: searchWidth * 0.13,
                                      child: Text(
                                        // "  |  DC-ABV12K-1YR",
                                        "${context.watch<SalesNewController>().getProduct[index].ItemCode}",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                context
                                                    .read<SalesNewController>()
                                                    .getProduct
                                                    .removeAt(index);
                                                if (context
                                                    .read<SalesNewController>()
                                                    .productDetails
                                                    .isEmpty) {
                                                  context
                                                      .read<
                                                          SalesNewController>()
                                                      .changeVisible();
                                                }

                                                for (int i = 0;
                                                    i <
                                                        context
                                                            .read<
                                                                SalesNewController>()
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
                                                        .read<SalesNewController>()
                                                        .mycontroller[10]
                                                        .text =
                                                    context
                                                        .read<
                                                            SalesNewController>()
                                                        .getProduct[index]
                                                        .Price!
                                                        .toStringAsFixed(2);
                                                context
                                                        .read<SalesNewController>()
                                                        .mycontroller[11]
                                                        .text =
                                                    context
                                                        .read<
                                                            SalesNewController>()
                                                        .getProduct[index]
                                                        .Quantity!
                                                        .toStringAsFixed(2);
                                                context
                                                        .read<SalesNewController>()
                                                        .mycontroller[11]
                                                        .text =
                                                    context
                                                        .read<
                                                            SalesNewController>()
                                                        .getProduct[index]
                                                        .Quantity!
                                                        .toStringAsFixed(0);
                                                context
                                                        .read<SalesNewController>()
                                                        .total =
                                                    context
                                                        .read<
                                                            SalesNewController>()
                                                        .getProduct[index]
                                                        .LineTotal!;
                                                context
                                                    .read<SalesNewController>()
                                                    .isUpdateClicked = true;

                                                context
                                                    .read<SalesNewController>()
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
                  : Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Screens.width(context) * 0.25,
                height: Screens.bodyheight(context) * 0.07,
                //  padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color:
                        Color(0xffB299A5) //theme.primaryColor.withOpacity(0.5)
                    ,
                    border: Border.all(color: theme.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Total Invoice Value Rs.${context.read<SalesNewController>().getTotalGrossAmount()}",
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyText1?.copyWith(
                          color: theme.primaryColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: Screens.width(context) * 0.2,
                child: TextFormField(
                  controller:
                      context.read<SalesNewController>().mycontroller[15],
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
