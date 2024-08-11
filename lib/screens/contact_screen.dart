import 'package:flutter/material.dart';
import '../state/contact_book.dart';
/* import 'add_contact_screen.dart';
import '../model/contactModel.dart'; */

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming ContactBook is a singleton or similar that manages contacts
    final contactBook = ContactBook();

    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(134, 66, 212, 0.5),
          title: const Center(
            child: Text(
              "Contacts",
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contactBook.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = contactBook.contact(atIndex: index);
                if (contact != null) {
                  return ListTile(
                    title: Text(contact.name),
                  );
                } else {
                  return const SizedBox.shrink(); // Handle null contact
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        /* shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ), */
        onPressed: () async {
          await Navigator.pushNamed(context,
              "/new-contact"); // this is because we are using named routes in our main.dart file

/*           Navigator.push(context, MaterialPageRoute(builder: (context) => const NewContatcView()));
          contactBook.add(const Contact(name: "New Contact"));
          contactBook.remove(contact: contactBook.contact(atIndex: 0)!);
 */
        },
      ),
    );
  }
}
