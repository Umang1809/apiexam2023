import 'dart:convert';

import 'package:apiexam2023/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postapi extends StatefulWidget {
  const postapi({Key? key}) : super(key: key);

  @override
  State<postapi> createState() => _postapiState();
}

class _postapiState extends State<postapi> {
  final dio = Dio();
  resultt? rr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getApi();
  }

  Future<void> getApi() async {
    Map mm = {"mobile": "7276465975", "password": "123"};
    //
    //
    // var url = Uri.parse('https://parcel.cscodetech.com/de_api/dboy_login.php');
    // var response = await http.post(url, body:mm);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    Response response;
    response = await dio
        .post('https://parcel.cscodetech.com/de_api/dboy_login.php', data: mm);
    Map<String, dynamic> mapp = jsonDecode(response.data);
    setState(() {
      rr = resultt.fromJson(mapp);
    });

    print("response --${response}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ));
        },
        child: Icon(Icons.home_filled),
      ),
      appBar: AppBar(
        title: Center(child: Text("QUE 1 POST API ")),
      ),
      body: rr == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("ID : ${rr!.dboydata!.id}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("TITLE : ${rr!.dboydata!.title}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("STATUS : ${rr!.dboydata!.status}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("RATE : ${rr!.dboydata!.rate}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("ICODE : ${rr!.dboydata!.lcode}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("FULL ADDRESS : ${rr!.dboydata!.fullAddress}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("PINCODE  : ${rr!.dboydata!.pincode}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("LANDMARK : ${rr!.dboydata!.landmark}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("COMMISON : ${rr!.dboydata!.commission}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("BANKNAME : ${rr!.dboydata!.bankName}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("IFSC : ${rr!.dboydata!.ifsc}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("RECIEPT NAME : ${rr!.dboydata!.receiptName}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("ACCOUNT NUMBER : ${rr!.dboydata!.accNumber}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("PAYPAL ID : ${rr!.dboydata!.paypalId}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("UPI ID : ${rr!.dboydata!.upiId}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("EMAIL : ${rr!.dboydata!.email}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("PASSSWORD : ${rr!.dboydata!.password}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("RSTATUS : ${rr!.dboydata!.rstatus}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("MOBILE : ${rr!.dboydata!.mobile}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("ACCEPET : ${rr!.dboydata!.accept}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("REJECT : ${rr!.dboydata!.reject}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("COMPLET : ${rr!.dboydata!.complete}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("DZONE : ${rr!.dboydata!.dzone}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("VEHIID : ${rr!.dboydata!.vehiid}"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("RIMG : ${rr!.dboydata!.vehiid}"),
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                        image: NetworkImage(
                            "https://parcel.cscodetech.com/${rr!.dboydata!.rimg}")),
                    SizedBox(
                      height: 30,
                    ),
                    Text("VE_IMG : ${rr!.dboydata!.vehiid}"),
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                        image: NetworkImage(
                            "https://parcel.cscodetech.com/${rr!.dboydata!.veImg}")),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class resultt {
  Dboydata? dboydata;
  String? currency;
  String? responseCode;
  String? result;
  String? responseMsg;

  resultt(
      {this.dboydata,
      this.currency,
      this.responseCode,
      this.result,
      this.responseMsg});

  resultt.fromJson(Map<String, dynamic> json) {
    dboydata = json['dboydata'] != null
        ? new Dboydata.fromJson(json['dboydata'])
        : null;
    currency = json['currency'];
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dboydata != null) {
      data['dboydata'] = this.dboydata!.toJson();
    }
    data['currency'] = this.currency;
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }
}

class Dboydata {
  String? id;
  String? title;
  String? rimg;
  String? status;
  String? rate;
  String? lcode;
  String? fullAddress;
  String? pincode;
  String? landmark;
  String? commission;
  String? bankName;
  String? ifsc;
  String? receiptName;
  String? accNumber;
  String? paypalId;
  String? upiId;
  String? email;
  String? password;
  String? rstatus;
  String? mobile;
  String? accept;
  String? reject;
  String? complete;
  String? dzone;
  String? vehiid;
  String? veImg;

  Dboydata(
      {this.id,
      this.title,
      this.rimg,
      this.status,
      this.rate,
      this.lcode,
      this.fullAddress,
      this.pincode,
      this.landmark,
      this.commission,
      this.bankName,
      this.ifsc,
      this.receiptName,
      this.accNumber,
      this.paypalId,
      this.upiId,
      this.email,
      this.password,
      this.rstatus,
      this.mobile,
      this.accept,
      this.reject,
      this.complete,
      this.dzone,
      this.vehiid,
      this.veImg});

  Dboydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rimg = json['rimg'];
    status = json['status'];
    rate = json['rate'];
    lcode = json['lcode'];
    fullAddress = json['full_address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    commission = json['commission'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    receiptName = json['receipt_name'];
    accNumber = json['acc_number'];
    paypalId = json['paypal_id'];
    upiId = json['upi_id'];
    email = json['email'];
    password = json['password'];
    rstatus = json['rstatus'];
    mobile = json['mobile'];
    accept = json['accept'];
    reject = json['reject'];
    complete = json['complete'];
    dzone = json['dzone'];
    vehiid = json['vehiid'];
    veImg = json['ve_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rimg'] = this.rimg;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['lcode'] = this.lcode;
    data['full_address'] = this.fullAddress;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['commission'] = this.commission;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['receipt_name'] = this.receiptName;
    data['acc_number'] = this.accNumber;
    data['paypal_id'] = this.paypalId;
    data['upi_id'] = this.upiId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rstatus'] = this.rstatus;
    data['mobile'] = this.mobile;
    data['accept'] = this.accept;
    data['reject'] = this.reject;
    data['complete'] = this.complete;
    data['dzone'] = this.dzone;
    data['vehiid'] = this.vehiid;
    data['ve_img'] = this.veImg;
    return data;
  }
}
