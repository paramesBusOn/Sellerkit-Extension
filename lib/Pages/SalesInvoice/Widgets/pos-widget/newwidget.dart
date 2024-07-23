
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sellerkit/Constant/Screen.dart';
import 'package:sellerkit/Controller/SalesController/SalesNewController.dart';

class newcustSales extends StatefulWidget {
  const newcustSales({super.key});

  @override
  State<newcustSales> createState() => _newcustSalesState();
}

class _newcustSalesState extends State<newcustSales> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
     width: Screens.width(context),
    padding: EdgeInsets.symmetric(
                              horizontal: Screens.width(context) * 0.01,
                              vertical: Screens.bodyheight(context) * 0.008),
    child: Form(
      key:context.read<SalesNewController>().formkey[0],
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Screens.width(context) * 0.01,
                                      vertical: Screens.bodyheight(context) * 0.008),
                                  width: Screens.width(context)*0.5,
                                  height:Screens.padingHeight(context)*0.75 ,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: theme.primaryColor)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: Screens.width(context),
                                          child: Text(
                                            "Customer Info",
                                            style: theme.textTheme.headline6
                                                ?.copyWith(color: theme.primaryColor),
                                          ),
                                        ),
                                        TextFormField(
                                            controller: context
                                                .read<SalesNewController>()
                                                .mycontroller[0],
                                            focusNode: context
                                                .read<SalesNewController>()
                                                .focusNode2,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter Mobile Number";
                                              } else if (value.length > 10 ||
                                                  value.length < 10) {
                                                return "Enter a valid Mobile Number";
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () {
                                              if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[0]
                                                      .text
                                                      .length ==
                                                  10) {
                                                context
                                                    .read<SalesNewController>()
                                                    .callApi(context);
                                              }
                                            },
                                            onChanged: (v) {
                                              if (v.length == 10 &&
                                                  context
                                                          .read<SalesNewController>()
                                                          .getcustomerapicalled ==
                                                      false) {
                                                context
                                                    .read<SalesNewController>()
                                                    .callApi(context);
                                              } else if (v.length != 10) {
                                                context
                                                    .read<SalesNewController>()
                                                    .clearnum();
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              new LengthLimitingTextInputFormatter(10),
                                            ],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Mobile*',
                                              labelStyle: theme.textTheme.bodyText1!
                                                  .copyWith(color: Colors.grey),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in unfocused
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in focused
                                              ),
                                              border: const UnderlineInputBorder(),
                                              // enabledBorder: UnderlineInputBorder(),
                                              // focusedBorder: UnderlineInputBorder(),
                                              errorBorder: const UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(),
                                            )),
                                        SizedBox(
                                          height: Screens.bodyheight(context) * 0.01,
                                        ),
                                        Center(
                                          child: Wrap(
                                              spacing: 5.0, // width
                                              runSpacing: 10.0, // height
                                              children: listContainersCustomertags(
                                                theme,
                                              )),
                                        ),
                                        // SizedBox(
                                        //   height: Screens.bodyheight(context) * 0.005,
                                        // ),
                                        TextFormField(
                                            controller: context
                                                .read<SalesNewController>()
                                                .mycontroller[16],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter Customer";
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool = false;
                                                });
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid2(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool2 = false;
                                                });
                                              }
                                            },
                                            onChanged: (v) {
                                              // setState(() {
                                              //   context
                                              //       .read<SalesNewController>()
                                              //       .filterListcustomer(v);
                                              //   if (v.isEmpty) {
                                              //     context
                                              //         .read<SalesNewController>()
                                              //         .customerbool = false;
                                              //   } else {
                                              //     context
                                              //         .read<SalesNewController>()
                                              //         .customerbool = true;
                                              //   }
                                              // });
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Customer*',
                                              border: const UnderlineInputBorder(),
                                              labelStyle: theme.textTheme.bodyText1!
                                                  .copyWith(color: Colors.grey),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in unfocused
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in focused
                                              ),
                                              errorBorder: const UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(),
                                            )),
                                        Visibility(
                                          visible: context
                                              .read<SalesNewController>()
                                              .customerbool,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    Screens.bodyheight(context) * 0.01,
                                              ),
                                              context
                                                      .read<SalesNewController>()
                                                      .filterCustomerList
                                                      .isEmpty
                                                  ? Container()
                                                  : Container(
                                            
                                                      // color: Colors.amber,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(8),
                                                          border: Border.all(
                                                              color:
                                                                  theme.primaryColor)),
                                                      width: Screens.width(context),
                                                      height:
                                                          Screens.bodyheight(context) *
                                                              0.2,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .filterCustomerList
                                                              .length,
                                                          itemBuilder:
                                                              (BuildContext context,
                                                                  int i) {
                                                            return InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .customerbool = false;
                                                                  context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .getExiCustomerData(
                                                                          context
                                                                              .read<
                                                                                  SalesNewController>()
                                                                              .filterCustomerList[
                                                                                  i]
                                                                              .cardname
                                                                              .toString(),
                                                                          context
                                                                              .read<
                                                                                  SalesNewController>()
                                                                              .filterCustomerList[
                                                                                  i]
                                                                              .cardcode
                                                                              .toString());
                                                                  context
                                                                          .read<
                                                                              SalesNewController>()
                                                                          .mycontroller[16]
                                                                          .text =
                                                                      context
                                                                          .read<
                                                                              SalesNewController>()
                                                                          .filterCustomerList[
                                                                              i]
                                                                          .cardname
                                                                          .toString();
                                                                });
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.all(
                                                                        Screens.bodyheight(
                                                                                context) *
                                                                            0.008),
                                                                    alignment: Alignment
                                                                        .centerLeft,
                                                                    // color: Colors.red,
                                                                    height: Screens
                                                                            .bodyheight(
                                                                                context) *
                                                                        0.05,
                                                                    width:
                                                                        Screens.width(
                                                                            context),
                                                                    child: Text(
                                                                      "${context.watch<SalesNewController>().filterCustomerList[i].cardname}",
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyText1
                                                                          ?.copyWith(
                                                                              color: Colors
                                                                                  .black),
                                                                    ),
                                                                  ),
                                                                  const Divider()
                                                                ],
                                                              ),
                                                            );
                                                          })),
                                            ],
                                          ),
                                        ),
                                            
                                        TextFormField(
                                            controller: context
                                                .read<SalesNewController>()
                                                .mycontroller[1],
                                            onTap: () {
                                              if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool = false;
                                                });
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid2(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool2 = false;
                                                });
                                              }
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return "Enter Contact Name";
                                            //   }
                                            //   return null;
                                            // },
                                            decoration: InputDecoration(
                                              labelText: 'Contact Name',
                                              labelStyle: theme.textTheme.bodyText1!
                                                  .copyWith(color: Colors.grey),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in unfocused
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in focused
                                              ),
                                              border: const UnderlineInputBorder(),
                                              // enabledBorder: UnderlineInputBorder(),
                                              // focusedBorder: UnderlineInputBorder(),
                                              errorBorder: const UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(),
                                            )),
                                        TextFormField(
                                            controller: context
                                                .read<SalesNewController>()
                                                .mycontroller[6],
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                if (value.length > 10 ||
                                                    value.length < 10) {
                                                  return "Enter a valid Mobile Number";
                                                }
                                              }
                                              return null;
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return "Enter Alternate Mobile No";
                                            //   } else if (value.length > 10 || value.length < 10) {
                                            //     return "Enter a valid Mobile Number";
                                            //   }
                                            //   return null;
                                            // },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              new LengthLimitingTextInputFormatter(10),
                                            ],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Alternate Mobile No',
                                              labelStyle: theme.textTheme.bodyText1!
                                                  .copyWith(color: Colors.grey),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in unfocused
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in focused
                                              ),
                                              border: const UnderlineInputBorder(),
                                              // enabledBorder: UnderlineInputBorder(),
                                              // focusedBorder: UnderlineInputBorder(),
                                              errorBorder: const UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(),
                                            )),
                                        TextFormField(
                                            controller: context
                                                .read<SalesNewController>()
                                                .mycontroller[7],
                                            onTap: () {
                                              if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool = false;
                                                });
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid2(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool2 = false;
                                                });
                                              }
                                            },
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                //   // context.read<SalesQuotationCon>().ffff =
                                                //   //     "Please Enter the Email Address";
                                                //   return "Please Enter the Email Address";
                                                if (!RegExp(
                                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                    .hasMatch(value.trim())) {
                                                  // context.read<NewEnqController>().ffff ="Please Enter the Valid Email";
                                                  return "Please Enter the Valid Email";
                                                }
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                              labelStyle: theme.textTheme.bodyText1!
                                                  .copyWith(color: Colors.grey),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in unfocused
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in focused
                                              ),
                                              border: const UnderlineInputBorder(),
                                              // enabledBorder: UnderlineInputBorder(),
                                              // focusedBorder: UnderlineInputBorder(),
                                              errorBorder: const UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(),
                                            )),
                                        TextFormField(
                                            maxLength: 15,
                                            controller: context
                                                .read<SalesNewController>()
                                                .mycontroller[25],
                                            inputFormatters: [
                                              // FilteringTextInputFormatter.digitsOnly,
                                              new LengthLimitingTextInputFormatter(15),
                                            ],
                                            onTap: () {
                                              if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[18]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool = false;
                                                });
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isEmpty) {
                                                context
                                                    .read<SalesNewController>()
                                                    .ontapvalid2(context);
                                              } else if (context
                                                      .read<SalesNewController>()
                                                      .mycontroller[24]
                                                      .text
                                                      .isNotEmpty &&
                                                  context
                                                      .read<SalesNewController>()
                                                      .statecode2
                                                      .isNotEmpty) {
                                                setState(() {
                                                  context
                                                      .read<SalesNewController>()
                                                      .statebool2 = false;
                                                });
                                              }
                                            },
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                if (value.length != 15) {
                                                  return 'Enter Valid GST';
                                                }
                                              }
                                              return null;
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return "Enter Email";
                                            //   }else if(!value.contains("@")){
                                            //       return "Enter Valid Email";
                                            //   }
                                            //   return null;
                                            // },
                                            decoration: InputDecoration(
                                              counterText: '',
                                              labelText: 'GST No',
                                              labelStyle: theme.textTheme.bodyText1!
                                                  .copyWith(color: Colors.grey),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in unfocused
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                                //  when the TextFormField in focused
                                              ),
                                              border: const UnderlineInputBorder(),
                                              // enabledBorder: UnderlineInputBorder(),
                                              // focusedBorder: UnderlineInputBorder(),
                                              errorBorder: const UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(),
                                            )),
                                            //  Container(
                                            //                                       height: Screens.padingHeight(context)*0.1,
                                            //                                        child: DropdownButtonFormField(
                                            //                                          decoration: InputDecoration(
                                            //                                                   // hintText: 'Email',
                                            //                                                   labelText: 'Level of Interest',
                                            //                                                   border: UnderlineInputBorder(),
                                            //                                                   enabledBorder:
                                            //                                                       UnderlineInputBorder(borderSide:
                                            //                                             BorderSide(color: Colors.grey),),
                                            //                                                   focusedBorder:
                                            //                                                       UnderlineInputBorder(borderSide:
                                            //                                             BorderSide(color: Colors.grey),),
                                            //                                                   errorBorder:
                                            //                                                       UnderlineInputBorder(),
                                            //                                                   focusedErrorBorder:
                                            //                                                       UnderlineInputBorder(),
                                            //                                                 ),
                                            //                                                                      // hint: Text(
                                            //                                                                      //   context
                                            //                                                                      //       .watch<NewEnqController>()
                                            //                                                                      //       .gethinttextforOpenLead!,
                                            //                                                                      //   style: theme.textTheme.bodyText2?.copyWith(
                                            //                                                                      //       color: context
                                            //                                                                      //               .watch<NewEnqController>()
                                            //                                                                      //               .gethinttextforOpenLead!
                                            //                                                                      //               .contains(" *")
                                            //                                                                      //           ? Colors.red
                                            //                                                                      //           : Colors.black),
                                            //                                                                      // ),
                                            //                                                                      value: context
                                            //                                                                          .read<SalesNewController>()
                                            //                                                                          .valueChosedStatus,
                                            //                                                                      //dropdownColor:Colors.green,
                                            //                                                                      icon: Icon(Icons.arrow_drop_down),
                                            //                                                                      iconSize: 30,
                                            //                                                                      style: TextStyle(
                                            //                                                                          color: Colors.black, fontSize: 16),
                                            //                                                                      isExpanded: true,
                                            //                                                                      onChanged: (val) {
                                            //                                                                        setState(() {
                                            //                                                                          context
                                            //                                           .read<SalesNewController>()
                                            //                                           .choosedStatus(val.toString());
                                            //                                                                        });
                                            //                                                                      },
                                            //                                                                      items: context
                                            //                                                                          .read<SalesNewController>()
                                            //                                                                          .leveofdata
                                            //                                                                          .map((e) {
                                            //                                                                        return DropdownMenuItem(
                                            //                                         // ignore: unnecessary_brace_in_string_interps
                                            //                                         value: "${e.Code}",
                                            //                                         child: Container(
                                            //                                             // height: Screens.bodyheight(context)*0.1,
                                            //                                             child: Text("${e.Name}")));
                                            //                                                                      }).toList(),
                                            //                                                                    ),
                                            //                                      ),
                                        Container(
                                          height: Screens.padingHeight(context) * 0.1,
                                          child: DropdownButtonFormField(
                                            decoration: const InputDecoration(
                                              // hintText: 'Email',
                                              labelText: 'Select Order Type',
                                              border: UnderlineInputBorder(),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.grey),
                                              ),
                                              errorBorder: UnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(),
                                            ),
                                            // hint: Text(
                                            //   context
                                            //       .watch<NewEnqController>()
                                            //       .gethinttextforOpenLead!,
                                            //   style: theme.textTheme.bodyText2?.copyWith(
                                            //       color: context
                                            //               .watch<NewEnqController>()
                                            //               .gethinttextforOpenLead!
                                            //               .contains(" *")
                                            //           ? Colors.red
                                            //           : Colors.black),
                                            // ),
                                            value: context
                                                .read<SalesNewController>()
                                                .valueChosedCusType,
                                            //dropdownColor:Colors.green,
                                            icon: const Icon(Icons.arrow_drop_down),
                                            iconSize: 30,
                                            style: const TextStyle(
                                                color: Colors.black, fontSize: 16),
                                            isExpanded: true,
                                            onChanged: (val) {
                                              setState(() {
                                                context
                                                    .read<SalesNewController>()
                                                    .choosedType(val.toString());
                                              });
                                            },
                                            items: context
                                                .read<SalesNewController>()
                                                .ordertypedata
                                                .map((e) {
                                              return DropdownMenuItem(
                                                  // ignore: unnecessary_brace_in_string_interps
                                                  value: "${e.Code}",
                                                  child: Text("${e.Name}"));
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Screens.bodyheight(context) * 0.01,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
            
                                //billing 
                                Container(
                                  width: Screens.width(context)*0.45,
                                  // color:Colors.amber,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                                   Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Screens.width(context) * 0.03,
                                                vertical: Screens.bodyheight(context) *
                                                    0.008),
                                            width: Screens.width(context),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: theme.primaryColor)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: Screens.width(context),
                                                  child: Text(
                                                    "Billing Address",
                                                    style: theme.textTheme.headline6
                                                        ?.copyWith(
                                                            color: theme.primaryColor),
                                                  ),
                                                ),
                                                TextFormField(
                                                    controller: context
                                                        .read<SalesNewController>()
                                                        .mycontroller[2],
                                                    onTap: () {
                                                      if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool = false;
                                                        });
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid2(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool2 = false;
                                                        });
                                                      }
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter Address1";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: 'Address1*',
                                                      labelStyle: theme
                                                          .textTheme.bodyText1!
                                                          .copyWith(color: Colors.grey),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in unfocused
                                                      ),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in focused
                                                      ),
                                                      border: const UnderlineInputBorder(),
                                                      // enabledBorder: UnderlineInputBorder(),
                                                      // focusedBorder: UnderlineInputBorder(),
                                                      errorBorder:
                                                          const UnderlineInputBorder(),
                                                      focusedErrorBorder:
                                                          const UnderlineInputBorder(),
                                                    )),
                                                // SizedBox(
                                                //   height: Screens.bodyheight(context) * 0.01,
                                                // ),
                                                TextFormField(
                                                    controller: context
                                                        .read<SalesNewController>()
                                                        .mycontroller[3],
                                                    onTap: () {
                                                      if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool = false;
                                                        });
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid2(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool2 = false;
                                                        });
                                                      }
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter Address2";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: 'Address2*',
                                                      labelStyle: theme
                                                          .textTheme.bodyText1!
                                                          .copyWith(color: Colors.grey),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in unfocused
                                                      ),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in focused
                                                      ),
                                                      border: const UnderlineInputBorder(),
                                                      // enabledBorder: UnderlineInputBorder(),
                                                      // focusedBorder: UnderlineInputBorder(),
                                                      errorBorder:
                                                          const UnderlineInputBorder(),
                                                      focusedErrorBorder:
                                                          const UnderlineInputBorder(),
                                                    )),
                                                // SizedBox(
                                                //   height: Screens.bodyheight(context) * 0.01,
                                                // ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[17],
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return "Enter Area";
                                                            }
                                                            return null;
                                                          },
                                                          onTap: () {
                                                            if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool = false;
                                                              });
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid2(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool2 = false;
                                                              });
                                                            }
                                                          },
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListArea(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .areabool = false;
                                                              } else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .areabool = true;
                                                              }
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Area*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[5],
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return "Enter City";
                                                            }
                                                            return null;
                                                          },
                                                          onTap: () {
                                                            if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool = false;
                                                              });
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid2(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool2 = false;
                                                              });
                                                            }
                                                          },
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListCity(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .citybool = false;
                                                              } else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .citybool = true;
                                                              }
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'City*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                // Visibility(
                                                //   visible: context
                                                //       .read<SalesNewController>()
                                                //       .areabool,
                                                //   child: Column(
                                                //     children: [
                                                //       SizedBox(
                                                //         height:
                                                //             Screens.bodyheight(context) * 0.01,
                                                //       ),
                                                //       context
                                                //               .read<SalesNewController>()
                                                //               .filterCustomerList
                                                //               .isEmpty
                                                //           ? Container()
                                                //           : Container(
                                              
                                                //               // color: Colors.amber,
                                                //               decoration: BoxDecoration(
                                                //                   borderRadius:
                                                //                       BorderRadius.circular(8),
                                                //                   border: Border.all(
                                                //                       color:
                                                //                           theme.primaryColor)),
                                                //               width: Screens.width(context),
                                                //               height:
                                                //                   Screens.bodyheight(context) *
                                                //                       0.2,
                                                //               child: ListView.builder(
                                                //                   scrollDirection:
                                                //                       Axis.vertical,
                                                //                   itemCount: context
                                                //                       .read<
                                                //                           SalesNewController>()
                                                //                       .filterCustomerList
                                                //                       .length,
                                                //                   itemBuilder:
                                                //                       (BuildContext context,
                                                //                           int i) {
                                                //                     return InkWell(
                                                //                       onTap: () {
                                                //                         setState(() {
                                                //                           context
                                                //                               .read<
                                                //                                   SalesNewController>()
                                                //                               .areabool = false;
                                                //                           context
                                                //                                   .read<
                                                //                                       SalesNewController>()
                                                //                                   .mycontroller[17]
                                                //                                   .text =
                                                //                               context
                                                //                                   .read<
                                                //                                       SalesNewController>()
                                                //                                   .filterCustomerList[
                                                //                                       i]
                                                //                                   .area
                                                //                                   .toString();
                                                //                         });
                                                //                       },
                                                //                       child: Column(
                                                //                         children: [
                                                //                           Container(
                                                //                             padding: EdgeInsets.all(
                                                //                                 Screens.bodyheight(
                                                //                                         context) *
                                                //                                     0.008),
                                                //                             alignment: Alignment
                                                //                                 .centerLeft,
                                                //                             // color: Colors.red,
                                                //                             height: Screens
                                                //                                     .bodyheight(
                                                //                                         context) *
                                                //                                 0.05,
                                                //                             width:
                                                //                                 Screens.width(
                                                //                                     context),
                                                //                             child: Text(
                                                //                               "${context.watch<SalesNewController>().filterCustomerList[i].area}",
                                                //                               style: theme
                                                //                                   .textTheme
                                                //                                   .bodyText1
                                                //                                   ?.copyWith(
                                                //                                       color: Colors
                                                //                                           .black),
                                                //                             ),
                                                //                           ),
                                                //                           Divider()
                                                //                         ],
                                                //                       ),
                                                //                     );
                                                //                   })),
                                                //     ],
                                                //   ),
                                                // ),
                                                // // Visibility(
                                                //   visible: context
                                                //       .read<SalesNewController>()
                                                //       .citybool,
                                                //   child: Column(
                                                //     children: [
                                                //       SizedBox(
                                                //         height:
                                                //             Screens.bodyheight(context) * 0.01,
                                                //       ),
                                                //       context
                                                //               .read<SalesNewController>()
                                                //               .filterCustomerList
                                                //               .isEmpty
                                                //           ? Container()
                                                //           : Container(
                                              
                                                //               // color: Colors.amber,
                                                //               decoration: BoxDecoration(
                                                //                   borderRadius:
                                                //                       BorderRadius.circular(8),
                                                //                   border: Border.all(
                                                //                       color:
                                                //                           theme.primaryColor)),
                                                //               width: Screens.width(context),
                                                //               height:
                                                //                   Screens.bodyheight(context) *
                                                //                       0.2,
                                                //               child: ListView.builder(
                                                //                   scrollDirection:
                                                //                       Axis.vertical,
                                                //                   itemCount: context
                                                //                       .read<
                                                //                           SalesNewController>()
                                                //                       .filterCustomerList
                                                //                       .length,
                                                //                   itemBuilder:
                                                //                       (BuildContext context,
                                                //                           int i) {
                                                //                     return InkWell(
                                                //                       onTap: () {
                                                //                         setState(() {
                                                //                           context.read<
                                                //                               SalesNewController>();
                                              
                                                //                           context
                                                //                               .read<
                                                //                                   SalesNewController>()
                                                //                               .citybool = false;
                                                //                           context
                                                //                                   .read<
                                                //                                       SalesNewController>()
                                                //                                   .mycontroller[5]
                                                //                                   .text =
                                                //                               context
                                                //                                   .read<
                                                //                                       SalesNewController>()
                                                //                                   .filterCustomerList[
                                                //                                       i]
                                                //                                   .city
                                                //                                   .toString();
                                                //                         });
                                                //                       },
                                                //                       child: Column(
                                                //                         children: [
                                                //                           Container(
                                                //                             padding: EdgeInsets.all(
                                                //                                 Screens.bodyheight(
                                                //                                         context) *
                                                //                                     0.008),
                                                //                             alignment: Alignment
                                                //                                 .centerLeft,
                                                //                             // color: Colors.red,
                                                //                             height: Screens
                                                //                                     .bodyheight(
                                                //                                         context) *
                                                //                                 0.05,
                                                //                             width:
                                                //                                 Screens.width(
                                                //                                     context),
                                                //                             child: Text(
                                                //                               "${context.watch<SalesNewController>().filterCustomerList[i].city}",
                                                //                               style: theme
                                                //                                   .textTheme
                                                //                                   .bodyText1
                                                //                                   ?.copyWith(
                                                //                                       color: Colors
                                                //                                           .black),
                                                //                             ),
                                                //                           ),
                                                //                           Divider()
                                                //                         ],
                                                //                       ),
                                                //                     );
                                                //                   })),
                                                //     ],
                                                //   ),
                                                // ),
                                                // // SizedBox(
                                                //   height: Screens.bodyheight(context) * 0.005,
                                                // ),
                                              
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[4],
                                                          onTap: () {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .clearbool();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return "Enter Pincode";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListPincode(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .pincodebool = false;
                                                              } else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .pincodebool = true;
                                                              }
                                                            });
                                                          },
                                                          keyboardType:
                                                              TextInputType.number,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            new LengthLimitingTextInputFormatter(
                                                                6),
                                                          ],
                                                          decoration: InputDecoration(
                                                            labelText: 'Pincode*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18],
                                                          focusNode: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .focusNode1,
                                                          autovalidateMode:
                                                              AutovalidateMode.always,
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .isText1Correct = false;
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListState2(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool = false;
                                                              }
                                                              // else if(v.isNotEmpty&&context
                                                              //       .read<NewEnqController>()
                                                              //       .statecode.isEmpty){
                                                              //         log("ANBU");
                                              
                                                              //       }
                                              
                                                              else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .methidstate(
                                                                        context
                                                                            .read<
                                                                                SalesNewController>()
                                                                            .mycontroller[
                                                                                18]
                                                                            .text,
                                                                        context);
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool = true;
                                                              }
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              // return "Enter State";
                                                            } else if (value
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .methidstate(
                                                                      context
                                                                          .read<
                                                                              SalesNewController>()
                                                                          .mycontroller[
                                                                              18]
                                                                          .text,
                                                                      context);
                                                              FocusScope.of(context)
                                                                  .requestFocus(context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .focusNode1);
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .statebool = false;
                                                              return "Enter Correct State";
                                                            }
                                                            return null;
                                                          },
                                                          onEditingComplete: () {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .statebool = false;
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .focusNode1
                                                                  .unfocus();
                                                              // context
                                                              //   .read<NewEnqController>()
                                                              //   .  methodfortest();
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .methidstate(
                                                                      context
                                                                          .read<
                                                                              SalesNewController>()
                                                                          .mycontroller[
                                                                              18]
                                                                          .text,
                                                                      context);
                                              
                                                              // context
                                                              // .read<NewEnqController>()
                                                              // .statecode='';
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'State*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              
                                                Visibility(
                                                  visible: context
                                                      .read<SalesNewController>()
                                                      .pincodebool,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: Screens.bodyheight(
                                                                context) *
                                                            0.01,
                                                      ),
                                                      context
                                                              .read<
                                                                  SalesNewController>()
                                                              .filterCustomerList
                                                              .isEmpty
                                                          ? Container()
                                                          : Container(
                                              
                                                              // color: Colors.amber,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                  border: Border.all(
                                                                      color: theme
                                                                          .primaryColor)),
                                                              width: Screens.width(
                                                                  context),
                                                              height:
                                                                  Screens.bodyheight(
                                                                          context) *
                                                                      0.2,
                                                              child: ListView.builder(
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .filterCustomerList
                                                                      .length,
                                                                  itemBuilder:
                                                                      (BuildContext context,
                                                                          int i) {
                                                                    return InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          context
                                                                              .read<
                                                                                  SalesNewController>()
                                                                              .pincodebool = false;
                                                                          context.read<
                                                                              SalesNewController>();
                                              
                                                                          context
                                                                                  .read<
                                                                                      SalesNewController>()
                                                                                  .mycontroller[
                                                                                      4]
                                                                                  .text =
                                                                              context
                                                                                  .read<
                                                                                      SalesNewController>()
                                                                                  .filterCustomerList[
                                                                                      i]
                                                                                  .zipcode
                                                                                  .toString();
                                                                        });
                                                                      },
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.all(
                                                                                Screens.bodyheight(context) *
                                                                                    0.008),
                                                                            alignment:
                                                                                Alignment
                                                                                    .centerLeft,
                                                                            // color: Colors.red,
                                                                            height: Screens.bodyheight(
                                                                                    context) *
                                                                                0.05,
                                                                            width: Screens
                                                                                .width(
                                                                                    context),
                                                                            child: Text(
                                                                              "${context.watch<SalesNewController>().filterCustomerList[i].zipcode}",
                                                                              style: theme
                                                                                  .textTheme
                                                                                  .bodyText1
                                                                                  ?.copyWith(
                                                                                      color: Colors.black),
                                                                            ),
                                                                          ),
                                                                          const Divider()
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })),
                                                    ],
                                                  ),
                                                ),
                                              
                                                SizedBox(
                                                  height: Screens.bodyheight(context) *
                                                      0.01,
                                                ),
                                                context
                                                            .read<SalesNewController>()
                                                            .isText1Correct ==
                                                        true
                                                    ? Container(
                                                        padding: EdgeInsets.only(
                                                            right:
                                                                Screens.width(context) *
                                                                    0.1,
                                                            top: Screens.padingHeight(
                                                                    context) *
                                                                0.001),
                                                        alignment:
                                                            Alignment.centerRight,
                                                        child: Text(
                                                          "Enter Correct State",
                                                          style: theme
                                                              .textTheme.bodyText2!
                                                              .copyWith(
                                                                  color: Colors.red,
                                                                  fontSize: 12),
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ),
                                              
                                          SizedBox(
                                            height: Screens.bodyheight(context) * 0.015,
                                          ),
                                              //Ship
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Screens.width(context) * 0.03,
                                                vertical: Screens.bodyheight(context) *
                                                    0.008),
                                            width: Screens.width(context),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: theme.primaryColor)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: Screens.bodyheight(context) *
                                                      0.04,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: Screens.width(context) *
                                                            0.3,
                                                        child: Text(
                                                          "Shipping Address",
                                                          style: theme
                                                              .textTheme.headline6
                                                              ?.copyWith(
                                                                  color: theme
                                                                      .primaryColor),
                                                        ),
                                                      ),
                                                      Checkbox(
                                                        value: context
                                                            .read<SalesNewController>()
                                                            .value3,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            context
                                                                .read<
                                                                    SalesNewController>()
                                                                .converttoShipping(
                                                                    value!);
                                                            context
                                                                .read<
                                                                    SalesNewController>()
                                                                .value3 = value;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TextFormField(
                                                    controller: context
                                                        .read<SalesNewController>()
                                                        .mycontroller[19],
                                                    onTap: () {
                                                      if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool = false;
                                                        });
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid2(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool2 = false;
                                                        });
                                                      }
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter Address1";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: 'Address1*',
                                                      // fillColor: Colors.amber,
                                                      border: const UnderlineInputBorder(),
                                                      labelStyle: theme
                                                          .textTheme.bodyText1!
                                                          .copyWith(color: Colors.grey),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in unfocused
                                                      ),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in focused
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(),
                                                      focusedErrorBorder:
                                                          const UnderlineInputBorder(),
                                                    )),
                                                // SizedBox(
                                                //   height: Screens.bodyheight(context) * 0.005,
                                                // ),
                                                TextFormField(
                                                    controller: context
                                                        .read<SalesNewController>()
                                                        .mycontroller[20],
                                                    onTap: () {
                                                      if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[18]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool = false;
                                                        });
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isEmpty) {
                                                        context
                                                            .read<SalesNewController>()
                                                            .ontapvalid2(context);
                                                      } else if (context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24]
                                                              .text
                                                              .isNotEmpty &&
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statecode2
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .statebool2 = false;
                                                        });
                                                      }
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter Address2";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: 'Address2*',
                                                      border: const UnderlineInputBorder(),
                                                      labelStyle: theme
                                                          .textTheme.bodyText1!
                                                          .copyWith(color: Colors.grey),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in unfocused
                                                      ),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        //  when the TextFormField in focused
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(),
                                                      focusedErrorBorder:
                                                          const UnderlineInputBorder(),
                                                    )),
                                                // SizedBox(
                                                //   height: Screens.bodyheight(context) * 0.005,
                                                // ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[21],
                                                          onTap: () {
                                                            if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool = false;
                                                              });
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid2(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool2 = false;
                                                              });
                                                            }
                                                          },
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return "Enter Area";
                                                            }
                                                            return null;
                                                          },
                                                          // onTap: () {
                                                          //   setState(() {
                                                          //     context
                                                          //         .read<
                                                          //             SalesNewController>()
                                                          //         .clearbool();
                                                          //   });
                                                          // },
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListArea(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .areabool = false;
                                                              } else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .areabool = true;
                                                              }
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Area*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[22],
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return "Enter City";
                                                            }
                                                            return null;
                                                          },
                                                          onTap: () {
                                                            if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[18]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool = false;
                                                              });
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .ontapvalid2(context);
                                                            } else if (context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .mycontroller[24]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool2 = false;
                                                              });
                                                            }
                                                          },
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListCity(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .citybool = false;
                                                              } else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .citybool = true;
                                                              }
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'City*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                Visibility(
                                                  visible: context
                                                      .read<SalesNewController>()
                                                      .areabool,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: Screens.bodyheight(
                                                                context) *
                                                            0.01,
                                                      ),
                                                      context
                                                              .read<
                                                                  SalesNewController>()
                                                              .filterCustomerList
                                                              .isEmpty
                                                          ? Container()
                                                          : Container(
                                              
                                                              // color: Colors.amber,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                  border: Border.all(
                                                                      color: theme
                                                                          .primaryColor)),
                                                              width: Screens.width(
                                                                  context),
                                                              height:
                                                                  Screens.bodyheight(
                                                                          context) *
                                                                      0.2,
                                                              child: ListView.builder(
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .filterCustomerList
                                                                      .length,
                                                                  itemBuilder:
                                                                      (BuildContext context,
                                                                          int i) {
                                                                    return InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          context
                                                                              .read<
                                                                                  SalesNewController>()
                                                                              .areabool = false;
                                                                          context
                                                                                  .read<
                                                                                      SalesNewController>()
                                                                                  .mycontroller[
                                                                                      21]
                                                                                  .text =
                                                                              context
                                                                                  .read<
                                                                                      SalesNewController>()
                                                                                  .filterCustomerList[
                                                                                      i]
                                                                                  .area
                                                                                  .toString();
                                                                        });
                                                                      },
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.all(
                                                                                Screens.bodyheight(context) *
                                                                                    0.008),
                                                                            alignment:
                                                                                Alignment
                                                                                    .centerLeft,
                                                                            // color: Colors.red,
                                                                            height: Screens.bodyheight(
                                                                                    context) *
                                                                                0.05,
                                                                            width: Screens
                                                                                .width(
                                                                                    context),
                                                                            child: Text(
                                                                              "${context.watch<SalesNewController>().filterCustomerList[i].area}",
                                                                              style: theme
                                                                                  .textTheme
                                                                                  .bodyText1
                                                                                  ?.copyWith(
                                                                                      color: Colors.black),
                                                                            ),
                                                                          ),
                                                                          const Divider()
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })),
                                                    ],
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: context
                                                      .read<SalesNewController>()
                                                      .citybool,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: Screens.bodyheight(
                                                                context) *
                                                            0.01,
                                                      ),
                                                      context
                                                              .read<
                                                                  SalesNewController>()
                                                              .filterCustomerList
                                                              .isEmpty
                                                          ? Container()
                                                          : Container(
                                              
                                                              // color: Colors.amber,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                  border: Border.all(
                                                                      color: theme
                                                                          .primaryColor)),
                                                              width: Screens.width(
                                                                  context),
                                                              height:
                                                                  Screens.bodyheight(
                                                                          context) *
                                                                      0.2,
                                                              child: ListView.builder(
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .filterCustomerList
                                                                      .length,
                                                                  itemBuilder:
                                                                      (BuildContext context,
                                                                          int i) {
                                                                    return InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          context.read<
                                                                              SalesNewController>();
                                              
                                                                          context
                                                                              .read<
                                                                                  SalesNewController>()
                                                                              .citybool = false;
                                                                          context
                                                                                  .read<
                                                                                      SalesNewController>()
                                                                                  .mycontroller[
                                                                                      22]
                                                                                  .text =
                                                                              context
                                                                                  .read<
                                                                                      SalesNewController>()
                                                                                  .filterCustomerList[
                                                                                      i]
                                                                                  .city
                                                                                  .toString();
                                                                        });
                                                                      },
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.all(
                                                                                Screens.bodyheight(context) *
                                                                                    0.008),
                                                                            alignment:
                                                                                Alignment
                                                                                    .centerLeft,
                                                                            // color: Colors.red,
                                                                            height: Screens.bodyheight(
                                                                                    context) *
                                                                                0.05,
                                                                            width: Screens
                                                                                .width(
                                                                                    context),
                                                                            child: Text(
                                                                              "${context.watch<SalesNewController>().filterCustomerList[i].city}",
                                                                              style: theme
                                                                                  .textTheme
                                                                                  .bodyText1
                                                                                  ?.copyWith(
                                                                                      color: Colors.black),
                                                                            ),
                                                                          ),
                                                                          const Divider()
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: Screens.bodyheight(context) * 0.005,
                                                // ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[23],
                                                          onTap: () {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .clearbool();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return "Enter Pincode";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListPincode(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .pincodebool = false;
                                                              } else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .pincodebool = true;
                                                              }
                                                            });
                                                          },
                                                          keyboardType:
                                                              TextInputType.number,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            new LengthLimitingTextInputFormatter(
                                                                6),
                                                          ],
                                                          decoration: InputDecoration(
                                                            labelText: 'Pincode*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Screens.width(context) * 0.15,
                                                      child: TextFormField(
                                                          controller: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .mycontroller[24],
                                                          focusNode: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .focusNode3,
                                                          autovalidateMode:
                                                              AutovalidateMode.always,
                                                          onChanged: (v) {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .isText1Correct2 = false;
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .filterListState2(v);
                                                              if (v.isEmpty) {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool2 = false;
                                                              }
                                                              // else if(v.isNotEmpty&&context
                                                              //       .read<NewEnqController>()
                                                              //       .statecode.isEmpty){
                                                              //         log("ANBU");
                                              
                                                              //       }
                                              
                                                              else {
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .methidstate2(context
                                                                        .read<
                                                                            SalesNewController>()
                                                                        .mycontroller[
                                                                            24]
                                                                        .text);
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statebool2 = true;
                                                              }
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              // return "Enter State";
                                                            } else if (value
                                                                    .isNotEmpty &&
                                                                context
                                                                    .read<
                                                                        SalesNewController>()
                                                                    .statecode2
                                                                    .isEmpty) {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .methidstate2(context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .mycontroller[24]
                                                                      .text);
                                                              FocusScope.of(context)
                                                                  .requestFocus(context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .focusNode3);
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .statebool2 = false;
                                                              return "Enter Correct State";
                                                            }
                                                            return null;
                                                          },
                                                          onEditingComplete: () {
                                                            setState(() {
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .statebool2 = false;
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .focusNode3
                                                                  .unfocus();
                                                              // context
                                                              //   .read<NewEnqController>()
                                                              //   .  methodfortest();
                                                              context
                                                                  .read<
                                                                      SalesNewController>()
                                                                  .methidstate2(context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .mycontroller[24]
                                                                      .text);
                                              
                                                              // context
                                                              // .read<NewEnqController>()
                                                              // .statecode='';
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'State*',
                                                            border:
                                                                const UnderlineInputBorder(),
                                                            labelStyle: theme
                                                                .textTheme.bodyText1!
                                                                .copyWith(
                                                                    color: Colors.grey),
                                                            enabledBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in unfocused
                                                            ),
                                                            focusedBorder:
                                                                const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey),
                                                              //  when the TextFormField in focused
                                                            ),
                                                            errorBorder:
                                                                const UnderlineInputBorder(),
                                                            focusedErrorBorder:
                                                                const UnderlineInputBorder(),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                context
                                                            .read<SalesNewController>()
                                                            .isText1Correct2 ==
                                                        true
                                                    ? Container(
                                                        padding: EdgeInsets.only(
                                                            right:
                                                                Screens.width(context) *
                                                                    0.1,
                                                            top: Screens.padingHeight(
                                                                    context) *
                                                                0.001),
                                                        alignment:
                                                            Alignment.centerRight,
                                                        child: Text(
                                                          "Enter Correct State",
                                                          style: theme
                                                              .textTheme.bodyText2!
                                                              .copyWith(
                                                                  color: Colors.red,
                                                                  fontSize: 12),
                                                        ),
                                                      )
                                                    : Container(),
                                                Visibility(
                                                  visible: context
                                                      .read<SalesNewController>()
                                                      .statebool2,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: Screens.width(context) *
                                                            0.2),
                                                    child: Container(
                                                      alignment: Alignment.centerRight,
                                                      width:
                                                          Screens.width(context) * 0.5,
                                                      height: Screens.bodyheight(context)*0.2,
                                                      color: Colors.white,
                                                      child: ListView.builder(
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: context
                                                              .read<
                                                                  SalesNewController>()
                                                              .filterstateData
                                                              .length,
                                                          itemBuilder:
                                                              (BuildContext context,
                                                                  int i) {
                                                            return InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  context
                                                                      .read<
                                                                          SalesNewController>()
                                                                      .stateontap2(i);
                                                                });
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.all(
                                                                        Screens.bodyheight(
                                                                                context) *
                                                                            0.008),
                                                                    alignment: Alignment
                                                                        .centerLeft,
                                                                    // color: Colors.red,
                                                                    // height: Screens
                                                                    //         .bodyheight(
                                                                    //             context) *
                                                                    //     0.05,
                                                                    width:
                                                                        Screens.width(
                                                                            context),
                                                                    child: Text(
                                                                      "${context.watch<SalesNewController>().filterstateData[i].stateName}",
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyText1
                                                                          ?.copyWith(
                                                                              color: theme
                                                                                  .primaryColor),
                                                                    ),
                                                                  ),
                                                                  const Divider()
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              
                                                SizedBox(
                                                  height: Screens.bodyheight(context) *
                                                      0.01,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: context
                                            .read<SalesNewController>()
                                            .statebool,
                                        child: Positioned(
                                            top: Screens.bodyheight(context) * 0.4,
                                            left: Screens.width(context) * 0.25,
                                            child: Container(
                                              width: Screens.width(context) * 0.8,
                                              // height: Screens.bodyheight(context)*0.05,
                                              color: Colors.white,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: context
                                                      .read<SalesNewController>()
                                                      .filterstateData
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context, int i) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SalesNewController>()
                                                              .stateontap(i);
                                                        });
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.all(
                                                                Screens.bodyheight(
                                                                        context) *
                                                                    0.008),
                                                            alignment:
                                                                Alignment.centerLeft,
                                                            // color: Colors.red,
                                                            // height: Screens
                                                            //         .bodyheight(
                                                            //             context) *
                                                            //     0.05,
                                                            width:
                                                                Screens.width(context),
                                                            child: Text(
                                                              "${context.watch<SalesNewController>().filterstateData[i].stateName}",
                                                              style: theme
                                                                  .textTheme.bodyText1
                                                                  ?.copyWith(
                                                                      color: theme
                                                                          .primaryColor),
                                                            ),
                                                          ),
                                                          const Divider()
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            )),
                                      ),
                                    ],
                                                                  ),
                                              
                                    ],),
                                  ),
                                ),
                                                                  
                             
            ],),
          ),
        ],
      ),
    ),
  );


  }
  List<Widget> listContainersCustomertags(
    ThemeData theme,
  ) {
    return List.generate(
      context.watch<SalesNewController>().customerTagTypeData.length,
      (index) => InkWell(
        onTap: () {
          // context.read<NewEnqController>(). isSelectedenquirytype = context.read<NewEnqController>()
          // .getenqReffList[index].Name.toString();
          context.read<SalesNewController>().selectCustomerTag(
              context
                  .read<SalesNewController>()
                  .customerTagTypeData[index]
                  .Name
                  .toString(),
              context
                  .read<SalesNewController>()
                  .customerTagTypeData[index]
                  .Name!,
              context
                  .read<SalesNewController>()
                  .customerTagTypeData[index]
                  .Code!);
        },
        child: Container(
          width: Screens.width(context) * 0.1,
          height: Screens.bodyheight(context) * 0.05,
          alignment: Alignment.center,
          //  padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: context.watch<SalesNewController>().isSelectedCusTagcode ==
                      context
                          .read<SalesNewController>()
                          .customerTagTypeData[index]
                          .Code
                          .toString()
                  ? const Color(0xffB299A5) //theme.primaryColor.withOpacity(0.5)
                  : Colors.white,
              border: Border.all(color: theme.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
              context
                  .watch<SalesNewController>()
                  .customerTagTypeData[index]
                  .Name
                  .toString(),
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color:
                    context.watch<SalesNewController>().isSelectedCusTagcode ==
                            context
                                .read<SalesNewController>()
                                .customerTagTypeData[index]
                                .Code
                                .toString()
                        ? theme.primaryColor //,Colors.white
                        : theme.primaryColor,
              )),
        ),
      ),
    );
  }
}