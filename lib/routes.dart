import 'package:get/get.dart';
import 'package:words_wisely/bindings/quote_bindings.dart';
import 'package:words_wisely/views/explore_screen.dart';
import 'package:words_wisely/views/home_screen.dart';
import 'package:words_wisely/views/splash_screen.dart';

approutes() => [
  GetPage(name: '/splash', page: () => SplashScreen()),
  GetPage(name: '/home', page: () => HomeScreen(), binding: QuoteBindings()),
  GetPage(name: '/explore', page: () => ExploreScreen()),
];
