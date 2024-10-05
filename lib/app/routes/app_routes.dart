part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._(); // Private constructor to prevent instantiation

  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const HOME_LOGGED_IN =
      _Paths.HOME_LOGGED_IN; // Route for logged-in home
  static const HOME_GUEST = _Paths.HOME_GUEST; // Route for guest home
  static const RIWAYAT_LOGGED_IN =
      _Paths.RIWAYAT_LOGGED_IN; // Route for logged-in riwayat
  static const RIWAYAT_GUEST = _Paths.RIWAYAT_GUEST; // Route for guest riwayat
}

abstract class _Paths {
  _Paths._(); // Private constructor to prevent instantiation

  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const HOME_LOGGED_IN =
      '/homeLoggedIn'; // Define path for logged-in home
  static const HOME_GUEST = '/homeGuest'; // Define path for guest home
  static const RIWAYAT_LOGGED_IN =
      '/riwayatLoggedIn'; // Define path for logged-in riwayat
  static const RIWAYAT_GUEST = '/riwayatGuest'; // Define path for guest riwayat
}
