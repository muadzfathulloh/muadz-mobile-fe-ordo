import 'package:get/get.dart';

import '../presentation/main/main_view.dart';
import '../../presentation/main/home_view.dart';
import '../../presentation/main/commision_view.dart';
import '../../presentation/main/lead_view.dart';
import '../../presentation/main/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.main;

  static final routes = [
    GetPage(
      name: _Paths.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.lead,
      page: () => const LeadView(),
    ),
    GetPage(
      name: _Paths.commision,
      page: () => const CommisionView(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
    ),
  ];
}
