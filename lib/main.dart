import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:navigation_drawer/state/fragment_state.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _page1 = _page(Colors.brown,'Page 1');
  Widget _page2 = _page(Colors.teal,'Page 2');
  Widget _page3 = _page(Colors.deepPurple,'Page 3');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read(fragmentProvider)
          .state = _page1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Muhammad",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      "Tayyab",
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(color: Colors.black),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text("Page 1"),
              onTap: () {
                context
                    .read(fragmentProvider)
                    .state = _page1;
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              title: Text("Page 2"),
              onTap: () {
                context
                    .read(fragmentProvider)
                    .state = _page2;
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Colors.grey,
              ),
              title: Text("Page 3"),
              onTap: () {
                context
                    .read(fragmentProvider)
                    .state = _page3;
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Consumer(builder: (context,watch,_){
        final body = watch(fragmentProvider).state ;
        return body ;
      },),
    );
  }


}

_page(Color color, String title) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: color,
    child: Center(child: Text("$title", style: TextStyle(fontSize: 30,color: Colors.white),)),
  );
}
