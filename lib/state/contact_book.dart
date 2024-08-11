import '../model/contactModel.dart';

class ContactBook {
  ContactBook._sharedInstance(); // private constructor becuase of _ and is also a global
  static final ContactBook _shared =
      ContactBook._sharedInstance(); // single instance of the class (_shared)
  factory ContactBook() =>
      _shared; // factory returns this shared instance, effectively making the class a singleton.

  final List<Contact> _contacts =
      []; //<is the class contatct we created in our model>
  int get length => _contacts.length;

  void add(Contact contact) =>
      _contacts.add(contact); // fucntion to add to the list

  void remove({required Contact contact}) => _contacts.remove(contact);

  Contact? contact({required int atIndex}) =>
      _contacts.length > atIndex ? _contacts[atIndex] : null;
}

/* A singleton is a design pattern in software development that ensures a class has only one instance and provides a global point of access to that instance. This pattern is particularly useful when you need exactly one object to coordinate actions across a system.  Often, the singleton instance is created only when it is first requested, not at the start of the program. This is known as lazy initialization and can be beneficial in terms of resource management. */