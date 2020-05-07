import 'package:flutter/material.dart';
import 'package:gonow_bus_station/components/trip_list_item.dart';
import 'package:gonow_bus_station/components/trip_list_tile.dart';
import 'package:gonow_bus_station/models/trip.dart';
import 'package:gonow_bus_station/app_state_container.dart';
import 'components/my_drawer.dart';


class TripsPage extends StatefulWidget {
  static String tag = 'trips-page';

  @override
  _TripsPageState createState() {
    return _TripsPageState();
  }
}

class _TripsPageState extends State<TripsPage>{
  
  TextEditingController searchController = TextEditingController();
  String filter = '';

  List<Trip> trips = <Trip>[
    new Trip(1, 50, 'GS 341 16', 'Circle', 'Tamale', DateTime(2019), DateTime(2019), DateTime(2019), DateTime(2019)),
    new Trip(2, 50, 'GS 342 16', 'Circle', 'Kumasi', DateTime(2019), DateTime(2019), DateTime(2019), DateTime(2019)),
    new Trip(3, 50, 'GS 343 16', 'Circle', 'Wa', DateTime(2019), DateTime(2019), DateTime(2019), DateTime(2019)),
    new Trip(4, 50, 'GS 344 16', 'Circle', 'Cape Coast', DateTime(2019), DateTime(2019), DateTime(2019), DateTime(2019)),
    new Trip(5, 50, 'GS 345 16', 'Circle', 'Ho', DateTime(2019), DateTime(2019), DateTime(2019), DateTime(2019)),
    new Trip(6, 50, 'GS 346 16', 'Circle', 'Bolgatanga', DateTime(2019), DateTime(2019), DateTime(2019), DateTime(2019)),
  ];


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);

    final List<Trip> filteredTrips = this.trips.where((trip)
      => trip.busNumber.toLowerCase().contains(filter.toLowerCase())
      || trip.arrivalStationName.toLowerCase().contains(filter.toLowerCase())).toList();

    return new Scaffold(
      drawer: MyDrawer(),
      appBar: new AppBar(
        title: new Text('Trips', style: new TextStyle(color: Colors.white)),
        backgroundColor: inheritedWidget.currentAppColor.value,
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body: new Material(
        child:
          new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.search),
                  labelText: "Search trips by destination or bus number"
                ),
                onChanged: (text) {

                  filter = text;
                  print(filter);
                },
                controller: searchController,
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: filteredTrips == null? 0 : filteredTrips.length,//getSuppliers().length,
                  itemBuilder: (BuildContext context, int index) {
                    return tripCard(TripListItem(filteredTrips[index], context));
                  },
                ),
              ),
            ],
          ),
      )
    );
  }
}
