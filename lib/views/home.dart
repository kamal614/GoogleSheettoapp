import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sheetsapp/feedback_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

    //print('This is a JSON Feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      //print('$element THIS IS NEXT <<<<<<<<');
      FeedbackModel feedbackModel = new FeedbackModel(
          apdprice: element['apdprice'].toString(),
          type: element['type'].toString(),
          status: element['status'].toString(),
          buyer: element['buyer'].toString(),
          seller: element['seller'].toString(),
          broker: element['broker'].toString(),
          variety: element['variety'].toString(),
          qnty: element['qnty'].toString(),
          qtyunit: element['qntyunit'].toString(),
          conID: element['conID'].toString(),
          orlprice: element['orlprice'].toString(),
          priceunit: element['priceunit'].toString(),
          createdat: element['createdat'].toString(),
          confirmedat: element['confirmedat'].toString(),
          dhara: element['dhara'].toString());

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
        elevation: 0,
        title: Text("Sheets App"),
      ),
      body: Container(
        child: ListView.builder(
          //todo
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
  String? type;
  String? status;
  String? buyer;
  String? seller;
  String? broker;
  String? variety;
  String? qnty;
  String? qtyunit;
  String? conID;
  String? orlprice;
  String? apdprice;
  String? priceunit;
  String? createdat;
  String? confirmedat;
  String? dhara;

  FeedbackTile(
      {this.apdprice,
      this.type,
      this.status,
      this.buyer,
      this.seller,
      this.broker,
      this.variety,
      this.qnty,
      this.qtyunit,
      this.conID,
      this.orlprice,
      this.priceunit,
      this.createdat,
      this.confirmedat,
      this.dhara});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(0),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'TYPE: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$type',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'BUYER: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$buyer',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'SELLER: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$seller',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'BROKER: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$broker',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'VARIETY: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$variety',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'QUANTITY: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$qnty',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'QUANTITY UNIT: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$qtyunit',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'CONFIRMATION ID: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$conID',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'ORIGINAL PRICE: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$conID',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'ACCEPTED PRICE: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$apdprice',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'PRICE UNIT: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$priceunit',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'CREATED AT: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$createdat',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'CONFIRMED AT: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$confirmedat',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'DHARA: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$dhara',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'STATUS: ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$status',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                // Text(
                //   'TYPE: $type',
                //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                // ),
                // Text('STATUS: $status'),
                // Text('BUYER: $buyer'),
                // Text('SELLER: $seller'),
                // Text('BROKER: $broker'),
                // Text('VARIETY: $variety'),
                // Text('QUANTITY: $qnty'),
                // Text('QUANTITY UNIT: $qtyunit'),
                // Text('CONFIRMATION ID: $conID'),
                // Text('ORIGINAL PRICE: $orlprice'),
                // Text('ACCEPTED PRICE: $apdprice'),
                // Text('PRICE UNIT: $priceunit'),
                // Text('CREATED AT: $createdat'),
                // Text('CONFIRMEED AT: $confirmedat'),
                // Text('DHARA: $dhara'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
