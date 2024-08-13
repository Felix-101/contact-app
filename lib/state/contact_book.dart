import 'package:flutter/material.dart';

import '../model/contactModel.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);
  /*we are calling super because we are extening another class
   private constructor becuase of _ and is also a global*/

  static final ContactBook _shared = ContactBook
      ._sharedInstance(); // single instance of the class (_shared) is equals to the private constructor
  factory ContactBook() => _shared;
  // factory returns this shared instance, effectively making the class a singleton.

  //final List<Contact> _contacts = []; <is the class contatct we created in our model>

  /* we don't need the list anymore since we have added it to our valuenotifier  then _contacts will change to value*/

  int get length => value.length;

  void add({required Contact contact}) {
    final contacts =
        value; // in here value has no data we're just assigning contacts a vlaue of 'value'
    contacts.add(contact); // it has data because of the add function
    value = contacts; //it is reassigned after the list has be updated
    notifyListeners(); //notify any listeners that the value has changed.
  }

  // fucntion to add to the list

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      value = contacts;
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
} 



/* A singleton is a design pattern in software development that ensures a class has only one instance and provides a global point of access to that instance. This pattern is particularly useful when you need exactly one object to coordinate actions across a system.  Often, the singleton instance is created only when it is first requested, not at the start of the program. This is known as lazy initialization and can be beneficial in terms of resource management. */
