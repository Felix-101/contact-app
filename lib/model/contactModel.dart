import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  Contact({required this.name}) : id = const Uuid().v4();

  /* : then initializer instead of {then initializer} like tenary operator () ? a:b*/
}
