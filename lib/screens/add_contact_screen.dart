import 'package:flutter/material.dart';

import '../model/contactModel.dart';
import '../state/contact_book.dart';

class NewContatcView extends StatefulWidget {
  const NewContatcView({super.key});

  @override
  State<NewContatcView> createState() => _NewContatcViewState();
}

class _NewContatcViewState extends State<NewContatcView> {
  // Declare a late final variable _controller of type TextEditingController.
  // The 'late final' keyword means that the variable will be initialized at some point before it is used,
  // but the specific initialization will occur in the initState() method.
  // The 'final' keyword means that the variable cannot be reassigned once it is initialized.
  late final TextEditingController _controller;

  // The initState() method is a lifecycle method in Flutter that is called when this widget is inserted into the tree.
  // In this method, we initialize the _controller variable with a new instance of TextEditingController.
  // We then call the super.initState() method to ensure that any parent widgets are also initialized.
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  // The dispose() method is another lifecycle method in Flutter that is called when this widget is removed from the tree.
  // In this method, we call the dispose() method on the _controller to release any resources that it is using.
  // We then call the super.dispose() method to ensure that any parent widgets are also disposed of.

  @override
  Widget build(BuildContext context) {
    final contact = Contact(name: _controller.text);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Add a new contact"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              hintText: "Enter contact name here...",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              ContactBook().add(contact);
              Navigator.of(context).pop();
            },
            child: const Text("Add Contact"),
          ),
        ],
      ),
    );
  }
}
