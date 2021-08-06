import 'package:flutter/cupertino.dart';

class FeedbackModel {
  dynamic type = "";
  String? status = "";
  String? buyer = "";
  String? seller = " ";
  // String? seller =  Element['seller'].toString();

  String? broker = "";
  String? variety = "";
  String? qnty = "";
  String? qtyunit = "";
  String? conID = "";
  String? orlprice = "";
  String? apdprice = "";
  String? priceunit = "";
  String? createdat = "";
  String? confirmedat = "";
  String? dhara = "";

  FeedbackModel(
      {required this.apdprice,
      required this.type,
      required this.status,
      required this.buyer,
      required this.seller,
      required this.broker,
      required this.variety,
      required this.qnty,
      required this.qtyunit,
      required this.conID,
      required this.orlprice,
      required this.priceunit,
      required this.createdat,
      required this.confirmedat,
      required this.dhara});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      type: "${json['type']}",
      apdprice: "${json['apdprice']}",
      status: "${json['status']}",
      buyer: "${json['buyer']}",
      seller: "${json['seller']}",
      broker: "${json['broker']}",
      variety: "${json['variety']}",
      qnty: "${json['qnty']}",
      qtyunit: "${json['qtyunit']}",
      conID: "${json['conID']}",
      orlprice: "${json['orlprice']}",
      priceunit: "${json['priceunit']}",
      createdat: "${json['createdat']}",
      confirmedat: "${json['confirmedat']}",
      dhara: "${json['dhara']}",
    );
  }
  Map toJson() => {
        "type": type,
        "apdprice": apdprice,
        "status": status,
        "buyer": buyer,
        "seller": seller,
        "broker": broker,
        "variety": variety,
        "qnty": qnty,
        "qtyunit": qtyunit,
        "conID": conID,
        "orlprice": orlprice,
        "priceunit": priceunit,
        "createdat": createdat,
        "confirmedat": confirmedat,
        "dhara": dhara,
      };
}
