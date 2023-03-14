
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../app_config.dart';
import '../data_model/order_detail_response.dart';
import '../data_model/order_item_response.dart';
import '../helpers/shared_value_helper.dart';


class OrderRepository {

  Future<OrderDetailResponse> getOrderDetails(
      { int id = 0}) async {
    var url = "${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/purchase-history-details/$id";


    final response = await http.get(Uri.parse(url),headers: {
      "Authorization": "Bearer ${access_token.$}"
    } );
    if (kDebugMode) {
      print("url:" +url.toString());
      print("getOrderDetails response :" +response.body.toString());
    }
    return orderDetailResponseFromJson(response.body);
  }

  Future<OrderItemResponse> getOrderItems(
      {int id = 0}) async {
    var url = "${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/purchase-history-items/$id";



    final response = await http.get(Uri.parse(url),headers: {
      "Authorization": "Bearer ${access_token.$}"
    });
    if (kDebugMode) {
    print("order details url:" +url.toString());
    print("token :" +access_token.$);
    print("order details url:" +url.toString());
    print("order details "+response.body.toString());
    print("Cuomo estas");
    }
    return orderItemlResponseFromJson(response.body);
  }
}
