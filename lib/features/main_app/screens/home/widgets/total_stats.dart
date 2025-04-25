import 'package:flutter/material.dart';
import '../../../controllers/home_controller.dart';
import 'statistic_card.dart';

class TotalStats extends StatelessWidget {
  final HomeController controller;

  const TotalStats({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatisticCard(
            title: 'Total Appointments',
            value: controller.totalAppointments,
            icon: Icons.calendar_today,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: StatisticCard(
            title: 'Total Earnings',
            value: controller.totalEarnings,
            icon: Icons.attach_money,
            isMoney: true,
          ),
        ),
      ],
    );
  }
}