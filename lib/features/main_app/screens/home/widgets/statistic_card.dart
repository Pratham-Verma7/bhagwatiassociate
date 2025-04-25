import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final Rx<dynamic> value;
  final IconData icon;
  final bool isMoney;

  const StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(() => Text(
                  isMoney ? '\$${value.value.toStringAsFixed(2)}' : '${value.value}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                )),
              ),
              SizedBox(width: 4),
              Icon(icon, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}