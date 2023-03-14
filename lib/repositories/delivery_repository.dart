import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../app_config.dart';
import '../data_model/cancel_request_response.dart';
import '../data_model/collection_summary_response.dart';
import '../data_model/delivery_status_change_response.dart';
import '../data_model/earning_or_collection_response.dart';
import '../data_model/earning_summary_response.dart';
import '../data_model/order_mini_response.dart';
import '../helpers/shared_value_helper.dart';

class DeliveryRepository {
  Future<OrderMiniResponse> getDeliveryListResponse(
      { type = "completed",
      page = 1,
      date_range = "",
      payment_type}) async {
    final response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/deliveries/${type}/${user_id.$}?date_range=$date_range&payment_type=$payment_type&page=$page")
        ,
        headers: {"Authorization": "Bearer ${access_token.$}"});

    print("body\n");
    print(response.body.toString());
    return orderMiniResponseFromJson(response.body);
  }

  Future<EarningSummaryResponse> getEarningSummaryResponse() async {
    final response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/earning-summary/${user_id.$}")
        ,
        headers: {"Authorization": "Bearer ${access_token.$}"});

    /*print("body\n");
    print(response.body.toString());*/
    return earningSummaryResponseFromJson(response.body);
  }

  Future<CollectionSummaryResponse> getCollectionSummaryResponse() async {
    final response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/collection-summary/${user_id.$}")
        ,
        headers: {"Authorization": "Bearer ${access_token.$}"});

    /*print("body\n");
    print(response.body.toString());*/
    return collectionSummaryResponseFromJson(response.body);
  }

  Future<EarningOrCollectionResponse> getEarningResponse({page = 1}) async {
    final response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/earning/${user_id.$}?page=${page}")
        ,
        headers: {"Authorization": "Bearer ${access_token.$}"});

    /*print("body\n");
    print(response.body.toString());*/
    return earningOrCollectionResponseFromJson(response.body);
  }

  Future<EarningOrCollectionResponse> getCollectionResponse({page = 1}) async {
    final response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/collection/${user_id.$}?page=${page}")
        ,
        headers: {"Authorization": "Bearer ${access_token.$}"});

    /*print("body\n");
    print(response.body.toString());*/
    return earningOrCollectionResponseFromJson(response.body);
  }

  Future<CancelRequestResponse> getCancelRequestResponse(order_id) async {
    final response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/cancel-request/${order_id}")
        ,
        headers: {"Authorization": "Bearer ${access_token.$}"});

    /*print("body\n");
    print(response.body.toString());*/
    return cancelRequestResponseFromJson(response.body);
  }

  Future<DeliveryStatusChangeResponse> getDeliveryStatusChangeResponse({required status, required order_id}
      ) async {
    var post_body = jsonEncode({
      "delivery_boy_id": "${user_id.$}",
      "status": "${status}",
      "order_id": "$order_id"
    });

    final response = await http.post(
      Uri.parse("${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/change-delivery-status")
        ,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${access_token.$}"
        },
        body: post_body);

    /*print("body\n");
    print(response.body.toString());*/
    return deliveryStatusChangeResponseFromJson(response.body);
  }
}
