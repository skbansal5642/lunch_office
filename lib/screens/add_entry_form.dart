import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunch_office/single_textbox_field.dart';

class AddEntryForm extends StatefulWidget {
  const AddEntryForm({super.key});

  @override
  State<AddEntryForm> createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  String customDateTime = '';
  TextEditingController entryNameTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  FocusNode entryNameFocusNode = FocusNode();
  FocusNode priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.brown.shade500,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            SingleEditProfileField(
              icon: Icons.shopping_bag,
              fieldController: entryNameTextController,
              hintText: "What you bought?",
              title: "Product",
              focusNode: entryNameFocusNode,
            ),
            SingleEditProfileField(
              icon: Icons.currency_rupee,
              fieldController: priceTextController,
              hintText: "How much you paid?",
              title: "Price",
              focusNode: entryNameFocusNode,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  "Select Date",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).copyWith().size.height / 5,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newdate) {
                  customDateTime = "${newdate.day}/${newdate.month}/${newdate.year} ${newdate.hour}:${newdate.minute}";
                },
                use24hFormat: true,
                // maximumDate: new DateTime(2024, 12, 30),
                // minimumYear: 2010,
                // maximumYear: 2018,
                // minuteInterval: 1,
                mode: CupertinoDatePickerMode.dateAndTime,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  // homeProvider.addRecord(newDate: customDateTime);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
