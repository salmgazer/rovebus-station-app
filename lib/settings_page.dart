import 'package:flutter/material.dart';
import 'package:gonow_bus_station/models/app_color.dart';
import 'components/my_drawer.dart';
import 'app_state_container.dart';

// Create a Form Widget
class SettingsPage extends StatefulWidget {
  static String tag = 'settings-page';

  @override
  _SettingsPageState createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {

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

    final _nullColor = inheritedWidget.appColors[0];
    final _colors = inheritedWidget.appColors;
    _color = inheritedWidget.currentAppColor;

    final colorsField = new FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            icon: const Icon(Icons.location_on),
            labelText: 'App colour',
          ),
          isEmpty: _color == _nullColor,
          child: new DropdownButtonHideUnderline(
            child: new DropdownButton(
              value: _color == null ? _nullColor: _color,
              isDense: true,
              onChanged: (AppColor newAppColor) {
                setState(() {
                  _color = newAppColor;
                  inheritedWidget.saveAppColor(newAppColor);
                  state.didChange(newAppColor);
                });
              },
              items: _colors.map((AppColor ac) {
                return new DropdownMenuItem(
                  value: ac,
                  child: new Text(ac.name, style: TextStyle(backgroundColor: ac.value, color: Colors.white),),
                );
              }).toList(),
            ),
          ),
        );
      },
    );

  final newPasswordField1 = TextFormField(
    keyboardType: TextInputType.text,
    decoration: new InputDecoration(
      hintText: 'Enter new password',
      labelStyle: TextStyle(color: Colors.brown),
      icon: const Icon(Icons.lock_outline),
      contentPadding: EdgeInsets.all(15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter new passowrd';
      }
    },
  );

  final newPasswordField2 = TextFormField(
    keyboardType: TextInputType.text,
    decoration: new InputDecoration(
      hintText: 'Confirm new password',
      labelStyle: TextStyle(color: Colors.brown),
      icon: const Icon(Icons.lock_outline),
      contentPadding: EdgeInsets.all(15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please confirm new passowrd';
      }
    },
  );

  final oldPasswordField = TextFormField(
    keyboardType: TextInputType.text,
    decoration: new InputDecoration(
      hintText: 'Enter current password',
      labelStyle: TextStyle(color: Colors.brown),
      icon: const Icon(Icons.lock_outline),
      contentPadding: EdgeInsets.all(15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter old password';
      }
    },
  );


  final savePasswordButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: _color.value.shade100,
      elevation: 5.0,
      color: _color.value,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: () {
          print('About to save password');
        },
        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
    ),
  );

  final saveOtherSettingsButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: _color.value.shade100,
      elevation: 5.0,
      color: _color.value,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: () {
          print('About to save color');
        },
        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
    ),
  );

  final otherSettingsTab = SingleChildScrollView(
    child: new Container(
    margin: new EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: boxHeight),
        new Text("Select preferred color", style: TextStyle(fontSize: 20.0, fontFamily: fontFamily),),
        SizedBox(height: boxHeight),
        colorsField,
        SizedBox(height: boxHeight),
        // saveOtherSettingsButton,
      ],
    ),)
  );

  final passwordTab = Center(
    child: new Container(
    margin: new EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        oldPasswordField,
        SizedBox(height: boxHeight),
        newPasswordField1,
        SizedBox(height: boxHeight),
        newPasswordField2,
        SizedBox(height: boxHeight),
        savePasswordButton
      ],),
    )
  );

  return DefaultTabController(
    length: 2,
    child: Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: _color.value,
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.settings), text: 'Others'),
            Tab(icon: Icon(Icons.supervised_user_circle), text: 'Password'),
          ],
        ),
        title: Text('Settings'),
      ),
      body: Form(
        key: _formKey,
        child: TabBarView(
          children: [
            otherSettingsTab,
            passwordTab,
          ],
        ),
      )
    ),
  );
  }
}
