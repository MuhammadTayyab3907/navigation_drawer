import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      home: MyHomePage(title: 'Figma'),
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
  Widget _page1 = _page(Colors.white, "page 1");
  Widget _page2 = _page(Colors.teal, "page 1");
  Widget _page3 = _page(Colors.deepPurple, "page 1");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read(fragmentProvider).state = _page1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blueGrey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Messages",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page1;
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.trending_up,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Trending",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page2;
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                SizedBox(
                  height: 4,
                ),
                ListTile(
                  leading: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Bookmarks",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.insert_drive_file,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page2;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: Text(
                    "People",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                      ),
                      Container(
                        color: Colors.blueGrey,
                        child: DrawerHeader(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "https://www.gstatic.com/tv/thumb/persons/378/378_v9_bd.jpg"),
                              ),
                              Text(
                                "Tom",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Text(
                                "Cruise",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          //decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ),
        body: Consumer(
          builder: (context, watch, _) {
            final body = watch(fragmentProvider).state;
            return body;
          },
        ),
      ),
    );
  }
}

_page(Color color, String title) {
  return Container(
    height: 250,
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    width: double.infinity,
    color: color,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network("https://www.nationalgeographic.com/content/dam/travel/Guide-Pages/north-america/united"
                  "-states/newyork/newyork_NationalGeographic_2328428.adapt.1900.1.jpg",cacheWidth: 190,cacheHeight: 250,),
            ],
          ),
          margin: EdgeInsets.only(right: 5),
        ),
      ],
    ),
  );
}
