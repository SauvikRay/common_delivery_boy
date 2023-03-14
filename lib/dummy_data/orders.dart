class Order {
  int id;
  String code;
  String date;
  String payment_type_string;
  String payment_status;
  String payment_status_string;
  String delivery_status;
  String delivery_status_string;
  String grand_total;

  Order(
      {
     required this.id,
     required this.code,
     required this.date,
     required this.payment_type_string,
     required this.payment_status,
     required this.payment_status_string,
     required this.delivery_status,
     required this.delivery_status_string,
     required this.grand_total});
}

final List<Order> orderList = [
  Order(
      id: 1,
      code: "20201215-12034564",
      date: "15-12-2020",
      payment_type_string:"Cash On Delivery",
      payment_status: "paid",
      payment_status_string: "Paid",
      delivery_status: "pending",
      delivery_status_string: "Order Placed",
      grand_total: "\$8850.00"),
  Order(
      id: 2,
      code: "20201215-22366548",
      date: "17-11-2020",
      payment_type_string:"Cash On Delivery",
      payment_status: "unpaid",
      payment_status_string: "Unpaid",
      delivery_status: "pending",
      delivery_status_string: "Order Placed",
      grand_total: "\$250.00"),
  Order(
      id: 3,
      code: "20201215-22366548",
      date: "03-05-2020",
      payment_type_string:"Cash On Delivery",
      payment_status: "paid",
      payment_status_string: "Paid",
      delivery_status: "on_delivery",
      delivery_status_string: "On Delivery",
      grand_total: "\$33654410.00"),
  Order(
      id: 4,
      code: "20201215-12034564",
      date: "15-12-2020",
      payment_type_string:"Wallet",
      payment_status: "paid",
      payment_status_string: "Paid",
      delivery_status: "pending",
      delivery_status_string: "Order Placed",
      grand_total: "\$8850.00"),
  Order(
      id: 5,
      code: "20201215-22366548",
      date: "17-11-2020",
      payment_type_string:"Cash On Delivery",
      payment_status: "unpaid",
      payment_status_string: "Unpaid",
      delivery_status: "pending",
      delivery_status_string: "Order Placed",
      grand_total: "\$250.00"),
  Order(
      id: 6,
      code: "20201215-22366548",
      date: "03-05-2020",
      payment_type_string:"Razorpay",
      payment_status: "paid",
      payment_status_string: "Paid",
      delivery_status: "on_delivery",
      delivery_status_string: "On Delivery",
      grand_total: "\$33654410.00"),
  Order(
      id: 7,
      code: "20201215-12034564",
      date: "15-12-2020",
      payment_type_string:"Paypal",
      payment_status: "paid",
      payment_status_string: "Paid",
      delivery_status: "pending",
      delivery_status_string: "Order Placed",
      grand_total: "\$8850.00"),
  Order(
      id: 8,
      code: "20201215-22366548",
      date: "17-11-2020",
      payment_type_string:"Stripe",
      payment_status: "unpaid",
      payment_status_string: "Unpaid",
      delivery_status: "pending",
      delivery_status_string: "Order Placed",
      grand_total: "\$250.00"),
  Order(
      id: 9,
      code: "20201215-22366548",
      date: "03-05-2020",
      payment_type_string:"Wallet",
      payment_status: "paid",
      payment_status_string: "Paid",
      delivery_status: "on_delivery",
      delivery_status_string: "On Delivery",
      grand_total: "\$33654410.00"),
];
