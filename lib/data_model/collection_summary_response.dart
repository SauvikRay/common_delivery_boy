// To parse this JSON data, do
//
//     final CollectionSummaryResponse = CollectionSummaryResponseFromJson(jsonString);

import 'dart:convert';

CollectionSummaryResponse collectionSummaryResponseFromJson(String str) => CollectionSummaryResponse.fromJson(json.decode(str));

String collectionSummaryResponseToJson(CollectionSummaryResponse data) => json.encode(data.toJson());

class CollectionSummaryResponse {
  CollectionSummaryResponse({
   required this.today_date,
   required this.today_collection,
   required this.yesterday_date,
   required this.yesterday_collection,
  });

  String today_date;
  String today_collection;
  String yesterday_date;
  String yesterday_collection;

  factory CollectionSummaryResponse.fromJson(Map<String, dynamic> json) => CollectionSummaryResponse(
    today_date: json["today_date"],
    today_collection: json["today_collection"],
    yesterday_date: json["yesterday_date"],
    yesterday_collection: json["yesterday_collection"],
  );

  Map<String, dynamic> toJson() => {
    "today_date": today_date,
    "today_Collection": today_collection,
    "yesterday_date": yesterday_date,
    "yesterday_collection": yesterday_collection,
  };
}
