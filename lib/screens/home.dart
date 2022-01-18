import 'package:flutter/material.dart';
import '../screens/add_transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    Transaction(
      title: 'Idly, Vada & Sambar',
      date: DateTime.now(),
      price: 50.0,
      id: DateTime.now().toString(),
    ),
  ];

 
  void _addTx(String title, DateTime date, double price) {
    var _addTr = Transaction(
      title: title,
      date: date,
      price: price,
      id: DateTime.now().toString(),
    );
    setState(() {
      _transactions.add(_addTr);
    });
  }

  void _removeTx(Transaction tx) {
    setState(() {
      _transactions.remove(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //CHART Placeholder
              // const Text('Chart'),
              //
              Expanded(
                child: ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        leading: Container(
                          width: 69.0,
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                              _transactions[index].price.toStringAsFixed(2)),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.5),
                          ),
                        ),
                        title: Text(
                          _transactions[index].title,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(DateFormat('E, dd MMM y')
                            .format(_transactions[index].date)),
                        dense: true,
                        trailing: IconButton(
                          onPressed: () {
                            _removeTx(_transactions[index]);
                          },
                          icon: const Icon(Icons.clear,
                              color: Colors.amberAccent),
                        ),
                      ),
                      elevation: 2.0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {},
                  child: NewTransaction(_transactions, _addTx),
                  behavior: HitTestBehavior.opaque,
                );
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
