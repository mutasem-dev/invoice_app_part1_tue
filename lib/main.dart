import 'package:flutter/material.dart';
import 'package:invoice_app/product.dart';

void main() {
  runApp(const MyApp());
}

List<Product> products = [
  Product(name: 'Mouse', quantity: 10, price: 10.5),
  Product(name: 'Ram', quantity: 100, price: 100),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InvoiceApp(),
    );
  }
}

class InvoiceApp extends StatefulWidget {
  const InvoiceApp({super.key});

  @override
  State<InvoiceApp> createState() => _InvoiceAppState();
}

TextEditingController cNameController = TextEditingController();

class _InvoiceAppState extends State<InvoiceApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice#1'),
      ),
      body: Column(
        children: [
          TextField(
            controller: cNameController,
            decoration: InputDecoration(
              labelText: 'Customer Name',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Products: ',
                style: TextStyle(fontSize: 22),
              ),
              ElevatedButton(onPressed: () {}, child: Text('add product')),
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.blue[200],
                  leading: Text(products[index].name),
                  title: Text('price: ${products[index].price}'),
                  subtitle: Text('quantity: ${products[index].quantity}'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever),
                  ),
                ),
              );
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('add invoice')),
              ElevatedButton(
                  onPressed: () {}, child: Text('show all invoices')),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
