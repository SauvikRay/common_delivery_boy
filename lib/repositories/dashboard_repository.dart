import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';


import '../app_config.dart';
import '../data_model/dashboard_summary_response.dart';
import '../helpers/shared_value_helper.dart';

class DashboardRepository {
  Future<DashboardSummaryResponse> getDashboardSummaryResponse() async {

    final response = await http.get(Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/dashboard-summary/${user_id.$}"),headers: { "Authorization": "Bearer ${access_token.$}"});

    /*print("body\n");
    print(response.body.toString());*/
    return dashboardSummaryResponseFromJson(response.body);
  }


}
