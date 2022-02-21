import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/home.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String date =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  String time =
      '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';

  final List<String> _searchProviders = [
    'Google',
    'DDG',
    'SearchX',
    'Bing',
    'Yahoo'
  ];

  String _searchProvider = '';
  String searchQuery = '';
  late Timer timer;
  late Timer dateTimer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        time =
            '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
      });
    });
    dateTimer = Timer.periodic(const Duration(days: 1), (_) {
      setState(() {
        date =
            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
      });
    });
    _searchProvider = _searchProviders.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            // when pressed, open settings dialog
            // settings dialog has a toggle for dark mode and a dropdown menu containing a list of search proviiders
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Settings'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Dark Mode'),
                          Switch(
                            value: isDark,
                            onChanged: (bool value) {
                              isDark = value;
                              darkNotifier.value = isDark;
                            },
                          ),
                          const Text('Search Providers'),
                          DropdownButton<String>(
                            value: _searchProvider,
                            onChanged: (String? newValue) {
                              setState(() {
                                _searchProvider = newValue!;
                              });
                            },
                            items:
                                _searchProviders.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1531278520962-fcf47a2faea2'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            // search bar
            Container(
              margin: const EdgeInsets.only(top: 150),
            ),
            Text(date),
            Text(time),
            Container(
              margin:
                  const EdgeInsets.only(top: 50.0, left: 100.0, right: 100.0),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                        js.context.callMethod('open', [
                          'https://$_searchProvider.com/search?q=$searchQuery'
                        ]);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // open crafted url in a new tab
                            js.context.callMethod('open', [
                              'https://$_searchProvider.com/search?q=$searchQuery'
                            ]);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // social card
                  Expanded(
                    child: Card(
                      // make slightly opaque
                      color: const Color.fromARGB(255, 61, 61, 61)
                          .withOpacity(0.9),
                      margin: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              contentPadding: EdgeInsets.all(0.0),
                              title: Text(
                                'Social',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Divider(
                              height: 0,
                              color: Colors.deepOrange,
                            ),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.person),
                                  Text(
                                    'Twitter',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              onTap: () {
                                js.context.callMethod(
                                    'open', ['https://twitter.com']);
                              },
                            ),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.group),
                                  Text('Noise', textAlign: TextAlign.center),
                                ],
                              ),
                              onTap: () {
                                js.context
                                    .callMethod('open', ['https://noise.cash']);
                              },
                            ),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.chat),
                                  Text('Memo'),
                                ],
                              ),
                              onTap: () {
                                js.context
                                    .callMethod('open', ['https://memo.cash']);
                              },
                            ),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.chat),
                                  Text('Member'),
                                ],
                              ),
                              onTap: () {
                                js.context.callMethod(
                                    'open', ['https://member.cash']);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // news card
                  Expanded(
                    child: Card(
                      color: const Color.fromARGB(255, 61, 61, 61)
                          .withOpacity(0.9),
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            contentPadding: const EdgeInsets.all(0.0),
                            // wrap title in transform template
                            title: Transform.translate(
                              offset: const Offset(0, -5),
                              child: const Text(
                                'Dev',
                                style: TextStyle(color: Colors.blueGrey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                            color: Colors.blueGrey,
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.code),
                                Text('Github'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.code),
                                Text('Gist'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.code),
                                Text('Compass'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.code),
                                Text('Udemy'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          // dev card
                          // media card
                          // forums
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: const Color.fromARGB(255, 61, 61, 61)
                          .withOpacity(0.9),
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Transform.translate(
                              offset: const Offset(0.0, -5.0),
                              child: const Text(
                                'Media',
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                            color: Colors.green,
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.camera),
                                Text('Torrents'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.camera),
                                Text('Jellyfin'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.video_library),
                                Text('Youtube'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.featured_video),
                                Text('Prime Video'),
                              ],
                            ),
                            onTap: () {
                              js.context
                                  .callMethod('open', ['https://bbc.com']);
                            },
                          ),
                          // dev card
                          // media card
                          // forums
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
