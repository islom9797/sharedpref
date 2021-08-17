import 'package:flutter/material.dart';
import 'package:sharedpref/model/http-request.dart';
class NetdemoMainPage extends StatefulWidget {
  const NetdemoMainPage({Key? key}) : super(key: key);

  @override
  _NetdemoMainPageState createState() => _NetdemoMainPageState();
}

class _NetdemoMainPageState extends State<NetdemoMainPage> {
  String data="";
  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramEmpty()).then((response) => {
      showresponse(response!),
      print(response)

    });
  }
  showresponse(String response){
    setState(() {
      data=response;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data.length>1?data:"No data"),
      ),
    );
  }
}
