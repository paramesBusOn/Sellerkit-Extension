// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Controller/OrderController/OrderNewController.dart';
import '../../../../../Constant/Screen.dart';

class SearchItemsSO extends StatefulWidget {
  const SearchItemsSO({super.key});
// final List<StockSnapTModelDB>? searchedData;
//OrderNewController prdsrch;
  @override
  State<SearchItemsSO> createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItemsSO> {
  // List<StockSnapTModelDB> getsearchedData = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
        insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Container(
          width: Screens.width(context)*0.7,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: Screens.width(context) *0.61,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 240, 235, 235)),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: TextField(
                      autofocus: true,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        setState(() {
                          context.read<OrderNewController>().filterList(val);
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Inventories",
                        hintStyle: theme.textTheme.bodyMedium!.copyWith(),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // alignment: Alignment.topCenter,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        icon: Icon(Icons.close)),
                  )
                ],
              ),
              SizedBox(
                height: Screens.bodyheight(context) * 0.01,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount:
                        context.read<OrderNewController>().getAllProductDetails.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          
                          setState(() {
  context.read<OrderNewController>().resetItems(i);
                          context.read<OrderNewController>().isUpdateClicked =
                              false;
                          // context
                          //     .read<OrderNewController>()
                          //     .showBottomSheetInsert(context, i);
                          context
                              .read<OrderNewController>()
                              .showBottomSheetInsert(context, i);
                          });
                          // log("total Qty: ${context.watch<OrderNewController>().getfilterSearchedData
                          // [index].displayQty}");
                        },
                        child: Card(
                          child: Container(
                              width: Screens.bodyheight(context) * 0.8,
                              // height: ProHeight * 0.3,
                              padding: EdgeInsets.only(
                                top: Screens.bodyheight(context) * 0.01,
                                left: Screens.width(context) * 0.01,
                                right: Screens.width(context) * 0.01,
                                bottom: Screens.bodyheight(context) * 0.005,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                          "Item code: ${context.read<OrderNewController>().getAllProductDetails[i].itemCode}"),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: Screens.width(context) * 0.4,
                                      child: Text(
                                        "Date: " +
                                            context
                                                .read<OrderNewController>()
                                                .config
                                                .alignDate(context
                                                    .read<OrderNewController>()
                                                    .getAllProductDetails[i]
                                                    .refreshedRecordDate!),
                                        // context
                                        //     .watch<OrderNewController>()
                                        //     .config
                                        //     .alignDate(context
                                        //         .read<OrderNewController>()
                                        //         .getAllProductDetails[i]
                                        //         .refreshedRecordDate!),
                                        style: theme.textTheme.bodyText1
                                            ?.copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
