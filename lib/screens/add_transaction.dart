import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final transactions;
  // ignore: prefer_typing_uninitialized_variables
  final addTx;
  const NewTransaction(this.transactions, this.addTx, {Key? key})
      : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var titleController = TextEditingController();
  var priceController = TextEditingController();
  DateTime date = DateTime.now();

  void _selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(03 - 05 - 2002),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        }
        date = value;
      },
    );
  }

  void _addTransaction() {
    var title = titleController.text;
    var price = (priceController.text.isEmpty)
        ? -1
        : double.parse(priceController.text);
    if (title.isEmpty || price < 0.0) {
      return;
    }
    widget.addTx(title, date, price);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: const Icon(Icons.date_range_outlined),
                    ),
                    const SizedBox(width: 5.0),
                    Text(DateFormat("dd MMM y").format(date)),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    _addTransaction();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add Transaction'),
                )
              ],
            )
          ],
        ),
      ),
      elevation: 2.0,
    );
  }
}
