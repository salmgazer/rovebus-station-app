import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gonow_bus_station/models/app_color.dart';
import 'models/user.dart';


// Inherited Widget
class AppStateContainer extends StatefulWidget {
  // Your apps state is managed by the container
  // final AppState state;
  // This widget is simply the root of the tree,
  // so it has to have a child!
  final Widget child;

  AppStateContainer({
    @required this.child,
    // this.state,
  });

  // This creates a method on the AppState that's just like 'of'
  // On MediaQueries, Theme, etc
  // This is the secret to accessing your AppState all over your app
  static AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedStateContainer)
    as InheritedStateContainer)
        .data;
  }

  @override
  AppStateContainerState createState() => new AppStateContainerState();
}

// Inherited Widget state
class AppStateContainerState extends State<AppStateContainer> {
  // Just padding the state through so we don't have to
  // manipulate it with widget.state.
  // AppState state;

  User user;
  List<AppColor> appColors = <AppColor>[
    new AppColor(1, 'Red', Colors.red),
    new AppColor(2, 'Green', Colors.green),
    new AppColor(3, 'Blue', Colors.blue)
  ];

  AppColor currentAppColor;

  @override
  void initState() {
    // You'll almost certainly want to do some logic
    // in InitState of your AppStateContainer. In this example, we'll eventually
    // write the methods to check the local state
    // for existing users and all that.
    initializeAppColor();
    super.initState();
  }

  User getUser() => this.user;

  AppColor getCurrentAppColor() => this.currentAppColor;

  void saveUser(User user) {
    setState(() {
      this.user = user;
    });
  }

  void saveAppColor(AppColor appColor) {
    setState(() {
      this.currentAppColor = appColor;
    });
  }

  void initializeAppColor() {
    if (currentAppColor == null) {
      this.saveAppColor(this.appColors[0]);
    }
  }

  void removeUser() {
    setState(() {
      this.user = null;
    });
  }

  // So the WidgetTree is actually
  // AppStateContainer --> InheritedStateContainer --> The rest of your app.
  @override
  Widget build(BuildContext context) {
    return new InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

// This is likely all your InheritedWidget will ever need.
class InheritedStateContainer extends InheritedWidget {
  // The data is whatever this widget is passing down.
  final AppStateContainerState data;

  // InheritedWidgets are always just wrappers.
  // So there has to be a child,
  // Although Flutter just knows to build the Widget thats passed to it
  // So you don't have have a build method or anything.
  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // This is a better way to do this, which you'll see later.
  // But basically, Flutter automatically calls this method when any data
  // in this widget is changed.
  // You can use this method to make sure that flutter actually should
  // repaint the tree, or do nothing.
  // It helps with performance.
  @override
  bool updateShouldNotify(InheritedStateContainer old) => true;
}
