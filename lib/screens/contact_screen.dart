import 'package:contact_app/model/contactModel.dart';
import 'package:flutter/material.dart';
import '../state/contact_book.dart';
/* import 'add_contact_screen.dart';*/

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming ContactBook is a singleton or similar that manages contacts
    // final contactBook = ContactBook();

    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(134, 66, 212, 0.5),
          title: const Center(
            child: Text(
              "Contacts",
            ),
          )),
      body:
          // helps us to rebuild a widget whenever the value in it chnages
          ValueListenableBuilder(
        valueListenable:
            ContactBook(), //this is what we are listening to(value notifier in our contact_book)
        builder: (contact, value, child) {
          final List<Contact> contacts = value;

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];

              return Dismissible(
                onDismissed: (direction) {
                  ContactBook().remove(contact: contact);
                },
                key: ValueKey(contact.id),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(
                      contact.name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              // Handle null contact
            },
          );
        },
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
