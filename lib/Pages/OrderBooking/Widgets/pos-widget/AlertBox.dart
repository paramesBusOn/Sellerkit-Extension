// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sellerkit/Constant/Screen.dart';

class AlertBox extends StatefulWidget {
  AlertBox(
      {super.key,
      required this.payMent,
      required this.widget,
      required this.buttonName,
      this.errormsg,
      this.callback});
  String payMent;
  Widget widget;
  String? buttonName;
  VoidCallback? callback;
  bool? errormsg;

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
       color: Colors.white,
       
        child: Column(
           mainAxisSize: MainAxisSize.min,
          children: [
            Container(
               height: Screens.padingHeight(context)*0.8,
              //  color: Colors.amber,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    alignment: Alignment.center,
                    height: Screens.padingHeight(context) * 0.045,
                    decoration: BoxDecoration(
                        color:
                            widget.errormsg == true ? Colors.red : theme.primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: Screens.padingHeight(context) * 0.02,
                              right: Screens.padingHeight(context) * 0.02),
                          // color: Colors.red,
                          width: Screens.width(context) * 0.4,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.payMent,
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: Screens.padingHeight(context) * 0.025,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                
                  widget.widget,
                        SizedBox(height: Screens.padingHeight(context) * 0.02),
                   // : Container()
                ]),
              ),
            ),
            SizedBox(
              height: Screens.padingHeight(context)*0.02,
            ),
          AlertBtnSave(
                        theme: theme,
                        buttonName: "Save",
                        callback: widget.callback)
                  
          ],
        ));
  }
}

class AlertBtnSave extends StatelessWidget {
  AlertBtnSave(
      {Key? key,
      required this.theme,
      required this.buttonName,
      required this.callback})
      : super(key: key);

  final ThemeData theme;
  String? buttonName;
  VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: Screens.padingHeight(context) * 0.06,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(5), topRight: Radius.circular(5))
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              buttonName!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
