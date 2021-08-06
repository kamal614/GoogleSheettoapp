import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sheetsapp/feedback_model.dart';
import 'dart:convert' as convert;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  // List<FeedbackModel> feebacks = List<FeedbackModel>();
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  // List<FeedbackModel> feedbacks = List<FeedbackModel>.empty();
  //we can remove this growable:

  getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbw9XenbAarJPiIhKXGzPnKpl2ttS0GhYDZaxfWEo5HFEHSKWvbZDQmXekYDQG70yTxy/exec'));

    var jsonFeedback = convert.jsonDecode(raw.body);
    // var jsonFeedback =
    //     convert.jsonDecode(raw.body.toString().replaceAll('\n', ' '));

    print('This is a JSON Feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT <<<<<<<<');
      FeedbackModel feedbackModel = new FeedbackModel(
          apdprice: element['${element['apdprice']}'],
          type: element['${element['type']}'],
          status: element['${element['status']}'],
          buyer: element['${element['buyer']}'],
          //seller: element['seller'],
          seller: element['${element['seller']}'],
          broker: element['${element['broker']}'],
          variety: element['${element['variety']}'],
          qnty: element['${element['qnty']}'],
          qtyunit: element['${element['qntyunit']}'],
          conID: element['${element['conID']}'],
          orlprice: element['${element['orlprice']}'],
          priceunit: element['${element['priceunit']}'],
          createdat: element['${element['createdat']}'],
          confirmedat: element['${element['confirmedat']}'],
          dhara: element['${element['dhara']}']);

      feedbacks.add(feedbackModel);
      // print('Length of FEEDBACK : ${feedbacks.length}');
    });

    // print('${feedbacks[0]}');
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sheets App"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: feedbacks.length,
          itemBuilder: (context, index) {
            return FeedbackTile(
              type: feedbacks[index].type,
              status: feedbacks[index].status,
              buyer: feedbacks[index].buyer,
              broker: feedbacks[index].broker,
              variety: feedbacks[index].variety,
              qtyunit: feedbacks[index].qtyunit,
              conID: feedbacks[index].conID,
              orlprice: feedbacks[index].orlprice,
              apdprice: feedbacks[index].apdprice,
              priceunit: feedbacks[index].priceunit,
              createdat: feedbacks[index].createdat,
              confirmedat: feedbacks[index].confirmedat,
              dhara: feedbacks[index].dhara,
              qnty: feedbacks[index].qnty,
            );
          },
        ),
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String type = "";
  final String status = "";
  final String buyer = "";
  final String seller = "";
  final String broker = "";
  final String variety = "";
  final String qnty = "";
  final String qtyunit = "";
  final String conID = "";
  final String orlprice = "";
  final String apdprice = "";
  final String priceunit = "";
  final String createdat = "";
  final String confirmedat = "";
  final String dhara = "";

  FeedbackTile(
      {dynamic apdprice,
      dynamic type,
      dynamic status,
      dynamic buyer,
      dynamic seller,
      dynamic broker,
      dynamic variety,
      dynamic qnty,
      dynamic qtyunit,
      dynamic conID,
      dynamic orlprice,
      dynamic priceunit,
      dynamic createdat,
      dynamic confirmedat,
      dynamic dhara});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text('$type'), Text(status)],
      ),
    );
  }
}
