// To parse this JSON data, do
//
//     final dashboardSummaryResponse = dashboardSummaryResponseFromJson(jsonString);

import 'dart:convert';

DashboardSummaryResponse dashboardSummaryResponseFromJson(String str) => DashboardSummaryResponse.fromJson(json.decode(str));

String dashboardSummaryResponseToJson(DashboardSummaryResponse data) => json.encode(data.toJson());

class DashboardSummaryResponse {
  DashboardSummaryResponse({
   required this.completed_delivery,
   required this.pending_delivery,
   required this.total_collection,
   required this.total_earning,
   required this.cancelled,
   required this.on_the_way,
   required this.picked,
   required this.assigned,
  });

  int completed_delivery;
  int pending_delivery;
  String total_collection;
  String total_earning;
  int cancelled;
  int on_the_way;
  int picked;
  int assigned;

  factory DashboardSummaryResponse.fromJson(Map<String, dynamic> json) => DashboardSummaryResponse(
    completed_delivery: json["completed_delivery"],
    pending_delivery: json["pending_delivery"],
    total_collection: json["total_collection"],
    total_earning: json["total_earning"],
    cancelled: json["cancelled"],
    on_the_way: json["on_the_way"],
    picked: json["picked"],
    assigned: json["assigned"],
  );

  Map<String, dynamic> toJson() => {
    "completed_delivery": completed_delivery,
    "pending_delivery": pending_delivery,
    "total_collection": total_collection,
    "total_earning": total_earning,
    "cancelled": cancelled,
    "on_the_way": on_the_way,
    "picked": picked,
    "assigned": assigned,
  };
}