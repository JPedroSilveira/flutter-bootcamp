class ContactsService {
  static final ContactsService _userService = ContactsService._internal();

  factory ContactsService() {
    return _userService;
  }

  ContactsService._internal();

  String getEmail() {
    return 'jpedross1999@gmail.com';
  }

  String getNumber() {
    return '+55 51 984401159';
  }
}
