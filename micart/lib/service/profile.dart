class ProfileService {
  static final ProfileService _userService = ProfileService._internal();

  factory ProfileService() {
    return _userService;
  }

  ProfileService._internal();

  String getAvatar() {
    return 'assets/images/avatar.jpg';
  }

  String getName() {
    return 'João Pedro Silveira e Silva';
  }

  String getProfession() {
    return 'FRONTEND DEVELOPER';
  }
}
