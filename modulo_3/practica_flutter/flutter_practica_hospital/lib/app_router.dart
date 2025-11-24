import 'package:go_router/go_router.dart';

import 'pages/hospital_home_page.dart';
import 'pages/bmi_page.dart';
import 'pages/dose_page.dart';
import 'pages/appointment_cost_page.dart';
import 'pages/hospitalization_cost_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HospitalHomePage(),
    ),
    GoRoute(
      path: '/bmi',
      builder: (_, __) => const BmiPage(),
    ),
    GoRoute(
      path: '/dose',
      builder: (_, __) => const DosePage(),
    ),
    GoRoute(
      path: '/appointment',
      builder: (_, __) => const AppointmentCostPage(),
    ),
    GoRoute(
      path: '/hospitalization',
      builder: (_, __) => const HospitalizationCostPage(),
    ),
  ],
);
