import 'dart:convert';

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:navigation_drawer/state/fragment_state.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  AnimationController animationController;
  Animation<dynamic> animation;

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
            color: Colors.blueGrey[900],
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
                    Navigator.pop(context);
                    context.read(fragmentProvider).state = _page1;
                    //Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.white30),
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
                    //context.read(fragmentProvider).state = _page2;
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.white30),
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
                    //context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.white30),
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
                    //context.read(fragmentProvider).state = _page2;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.white30),
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
                    //context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.white30),
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
                    //context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.white30),
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
                    //context.read(fragmentProvider).state = _page3;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.white30,),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                      ),
                      Container(
                        color: Colors.blueGrey[900],
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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                Text("Stories",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 25)),
                  Text("Show all",style: TextStyle(color: Colors.blueAccent,fontSize: 20))
              ],),
            ),
            Container(
              height: 220,
              child: FutureBuilder<List<Post>>(
                future: fetchPost(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Post> posts = snapshot.data;
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: posts
                          .map((post) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //height: 560,
                            width: 200,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F04%2Fgettyimages-951423786-2000.jpg&q=85",
                                    fit: BoxFit.fill,
                                    height: 200,
                                    width: 200,
                                  ),
                                  //],
                                  //),
                                  Positioned(
                                    bottom: 36,
                                    left: 8,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(32.0),
                                        ),
                                        onTap: () {},
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                            "userId : ${post.userId},id : ${post.id}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 17,
                                    left: 8,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(32.0),
                                        ),
                                        onTap: () {},
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                            "title: ${post.title}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(32.0),
                                        ),
                                        onTap: () {},
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                "https://pyxis.nymag.com/v1/imgs/1f2/bb7/8e9a16f9859e40810b21f34a2d26807821-30-selena-gomez.rsquare.w700.jpg"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                },
              ),
            ),
            SizedBox(
              height: 35,
            ),
        Container(
          height: 375,
          child: FutureBuilder<List<Post>>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data;
                return ListView(
                  children: posts
                      .map(
                        (post) => Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEpUUJVqlxCFXUdaSn7ieT0ucZkZGX1NlmBQ&usqp=CAU")),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Kristin Jones",
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "20 Minutes ago",
                                          style: TextStyle(color: Colors.black26),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Icon(Icons.more_horiz,
                                    //  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      offset: const Offset(4, 4),
                                      blurRadius: 16,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 1.5,
                                            child: Image.network(
                                              "https://www.24newshd.tv/uploads/facebook_post_images/2020-06-13/facebook_post_image_1591994165.jpg",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage(
                                            "https://cdn.lifehack.org/wp-content/uploads/2015/02/what-makes-people-happy.jpeg"),
                                      ),
                                      Expanded(
                                        child: Positioned(
                                            left: 14,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                  "https://images.squarespace-cdn.com/content/v1/562eb1a8e4b0cd8682c40651/1575483224032-8QDRU79RHGBUB5UDHT5P/ke17ZwdGBToddI8pDm48kDyYq4OpRDo2fk76bJ9O4l57gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmnhdptcuU1alwky_sWs380vROUzGxSR0prsBfut9UyNoq2LCFRTJdnfp8O8SwdqOU/caeron+boyce.jpg"),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Liked by 62572",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 95),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.notifications_none),
                                        Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Icon(Icons.message)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Icon(Icons.share))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Title , userID :${post.userId} id :${post.id}",

                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            },
          ),
        ),
      ]));
}

Future<List<Post>> fetchPost() async {
  final responce = await http.get("https://jsonplaceholder.typicode.com/posts");
  if (responce.statusCode == 200) {
    List posts = json.decode(responce.body);
    return posts.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

/*
*
*Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://pyxis.nymag.com/v1/imgs/1f2/bb7/8e9a16f9859e40810b21f34a2d26807821-30-selena-gomez.rsquare.w700.jpg")),
                  Column(
                    children: <Widget>[
                      Text(
                        "Kristin Jones",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "20 Minutes ago",
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz, textDirection: TextDirection.rtl)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1.5,
                            child: Image.network(
                              "https://www.24newshd.tv/uploads/facebook_post_images/2020-06-13/facebook_post_image_1591994165.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            "https://cdn.lifehack.org/wp-content/uploads/2015/02/what-makes-people-happy.jpeg"),
                      ),
                      Expanded(
                        child: Positioned(
                            left: 14,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  "https://images.squarespace-cdn.com/content/v1/562eb1a8e4b0cd8682c40651/1575483224032-8QDRU79RHGBUB5UDHT5P/ke17ZwdGBToddI8pDm48kDyYq4OpRDo2fk76bJ9O4l57gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmnhdptcuU1alwky_sWs380vROUzGxSR0prsBfut9UyNoq2LCFRTJdnfp8O8SwdqOU/caeron+boyce.jpg"),
                            )),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Liked by 62572",style: TextStyle(color: Colors.black38),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 95),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.notifications_none),
                        Padding(
                            padding:EdgeInsets.only(left: 15),child: Icon(Icons.message)),
                        Padding(padding:EdgeInsets.only(left: 15),child: Icon(Icons.share))
                      ],),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(children: <Widget>[
                Text("Title ",style: TextStyle(fontSize: 20),)
              ],),
              SizedBox(height: 20,),
              Divider()
            ],
          ),
          ),*/
/*
FutureBuilder<List<Post>>(
future: fetchPost(),
builder: (context, snapshot) {
if (snapshot.hasData) {
List<Post> posts = snapshot.data;
return ListView(
children: posts
    .map(
(post) =>,
)
    .toList(),
);
} else if (snapshot.hasError) {
return Text('${snapshot.error}');
}
},
)*/
