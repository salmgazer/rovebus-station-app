import 'package:flutter/material.dart';
import 'package:gonow_bus_station/models/app_color.dart';
import 'components/my_drawer.dart';
import 'app_state_container.dart';

// Create a Form Widget
class WalletPage extends StatefulWidget {
  static String tag = 'wallet-page';

  @override
  _WalletPageState createState() {
    return _WalletPageState();
  }
}

class _WalletPageState extends State<WalletPage> {

  AppColor _color;

  final _formKey = GlobalKey<FormState>();
  final boxHeight = 20.0;
  final fontFamily = 'Montserrat';
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);

    final dateFromField = TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: new InputDecoration(
        hintText: '',
        labelStyle: TextStyle(color: Colors.brown),
        icon: const Icon(Icons.lock_outline),
        contentPadding: EdgeInsets.all(15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Date from';
        }
      },
    );


    final dateToField = TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: new InputDecoration(
        hintText: '',
        labelStyle: TextStyle(color: Colors.brown),
        icon: const Icon(Icons.lock_outline),
        contentPadding: EdgeInsets.all(15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Date from';
        }
      },
    );



  return new Scaffold(
      appBar: new AppBar(
        title: new Text('Wallet',
        style: new TextStyle(color: Colors.white)),
        backgroundColor: inheritedWidget.currentAppColor.value,
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child:
          ListView(
            children: <Widget>[
              dateFromField,
              dateToField,
              new Text('3500', style: TextStyle(fontSize: 25))
            ],
          )
      )
    );
  }
}
