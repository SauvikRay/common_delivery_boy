import 'package:wholesale_delivery_boy/data_model/order_detail_response.dart';

import '../data_model/order_mini_response.dart';

OrderMiniResponse listResponse = OrderMiniResponse(
   success: true, 
  links: OrderMiniResponseLinks(
           first: "http://139.99.69.81:8085/api/v2/products?page=1",
        last: "http://139.99.69.81:8085/api/v2/products?page=484",
        prev: null,
        next: "http://139.99.69.81:8085/api/v2/products?page=2"
  
  ),
  status: 200,
  meta:Meta(from: 0,currentPage: 1,lastPage:3 ,path: "dsfd/sdfsdf/",perPage:5 ,to:2 ,total: 3) ,
  orders: [
    Order(
      id: 1,
      code: "AADF13",
      user_id:1254,
      payment_type: "bkash",
      payment_status: "loading",
      payment_status_string:"loading",
      delivery_status:"on Transit",
      delivery_status_string:"on Transit",
      grand_total:"1200",
      date:"12/12/12",
      location_available:true,
      store_location_available:true,
      lat:23.7511528,
      lang:90.3804922 ,
      delivery_pickup_latitude:23.7511528,
      delivery_pickup_longitude:90.3804922,
      links:OrderLinks(
        details: "sdfsdfsdfsdfs"
      ),
    ),
      Order(
      id: 2,
      code: "AAFF13",
      user_id:1254,
      payment_type: "bkash",
      payment_status: "paid",
      payment_status_string:"paid",
      delivery_status:"on Transit",
      delivery_status_string:"on Transit",
      grand_total:"1200",
      date:"12/12/12",
      location_available:true,
      store_location_available:true,
      lat:23.7511528,
      lang:90.3804922 ,
      delivery_pickup_latitude:23.7511528,
      delivery_pickup_longitude:90.3804922,
      links:OrderLinks(
        details: "sdfsdfsdfsdfs"
      ),
    ), 
    Order(
      id: 2,
      code: "AAFF13",
      user_id:1254,
      payment_type: "bkash",
      payment_status: "paid",
      payment_status_string:"paid",
      delivery_status:"on_the_way",
      delivery_status_string:"on_the_way",
      grand_total:"1200",
      date:"12/12/12",
      location_available:true,
      store_location_available:true,
      lat:23.7511528,
      lang:90.3804922 ,
      delivery_pickup_latitude:23.7511528,
      delivery_pickup_longitude:90.3804922,
      links:OrderLinks(
        details: "sdfsdfsdfsdfs"
      ),
    ),
  ], 
   );

   OrderDetailResponse orderDetailsResponse = OrderDetailResponse(detailed_orders: [
    DetailedOrder( id: 1,
      code: "AADF13",
      user_id:1253,
      shipping_address:ShippingAddress (address: "Lalbag Kella",city: "Dhaka",checkout_type: "bkash",country: "bangladesh",email: "s@gmail.com",name: 'Sauvik',phone: "+8801457587851",postal_code: "1229"),
      cancel_request: false,
      coupon_discount: "100",
      date: "12/13/2023",
      delivery_status:"on_delivery" ,//on_delivery//"confirmed",//pending
      delivery_status_string: "Delivered",
      grand_total: "1500",
      links: Links(details: "http://www.wholesale.com"),
      payment_status: "Cash on Deliver",
      payment_status_string: "Cash on Deliver",
      payment_type: "bkash",
      shipping_cost: "40",
      shipping_type: "cash",
      shipping_type_string: "Cash on Deliver",
      subtotal: "212",
      tax: "32"
      ),
    ], success: true, status: 200);