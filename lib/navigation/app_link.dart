class AppLink {
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kCustomerSignUpPath = '/customerSignUp';
  static const String kTechnicianSignUpPath = '/technicianSignUp';
  static const String kChooseRolePath = '/chooseRole';
  static const String kWelcomePath = '/welcome';

  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';

  String? location;
  int? currentTab;

  AppLink({
    this.location,
    this.currentTab,
  });

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');

    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
    );

    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';

    switch (location) {
      case kLoginPath:
        return kLoginPath;

      case kOnboardingPath:
        return kOnboardingPath;

      case kProfilePath:
        return kProfilePath;

      case kCustomerSignUpPath:
        return kCustomerSignUpPath;

      case kTechnicianSignUpPath:
        return kTechnicianSignUpPath;

      case kChooseRolePath:
        return kChooseRolePath;

      case kWelcomePath:
        return kWelcomePath;

      default:
        var loc = '$kHomePath?';
        loc += addKeyValPair(
          key: kTabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}
