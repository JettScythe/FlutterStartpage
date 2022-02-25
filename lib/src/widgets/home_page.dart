import 'dart:async';
import 'package:flutter/material.dart';
import 'date_time.dart';
import 'settings_modal.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'card.dart';

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
    'Brave',
    'DDG',
    'SearchX',
    'Bing',
    'Yahoo'
  ];

  String searchQuery = '';
  late Timer timer;
  late Timer dateTimer;
  final searchProviderNotifier = ValueNotifier<String>('');

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
    searchProviderNotifier.value = _searchProviders.first;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: searchProviderNotifier,
      builder: (BuildContext context, String searchProvider, Widget? child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              settingsModal(context, searchProvider, searchProviderNotifier,
                  _searchProviders),
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
                Row(
                  children: [
                    Expanded(child: Container(), flex: 1),
                    Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 150),
                            ),
                            dateTime(date, time),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 50.0, left: 100.0, right: 100.0),
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Form(
                                    key: _formKey,
                                    child: Expanded(
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          setState(() {
                                            searchQuery = value;
                                          });
                                        },
                                        onFieldSubmitted: (value) {
                                          setState(() {
                                            searchQuery = value;
                                          });
                                          js.context.callMethod('open', [
                                            'https://${searchProviderSuffix(searchProvider)}$searchQuery'
                                          ]);
                                          _formKey.currentState!.reset();
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          border: const OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.search),
                                            onPressed: () {
                                              js.context.callMethod('open', [
                                                'https://${searchProviderSuffix(searchProvider)}$searchQuery'
                                              ]);
                                              _formKey.currentState!.reset();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 50.0),
                              padding: const EdgeInsets.only(
                                  left: 100.0, right: 100.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: cards(),
                              ),
                            ),
                          ],
                        ),
                        flex: 8),
                    Expanded(child: Container(), flex: 1),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String searchProviderSuffix(String searchProvider) {
  // returns the search provider with the correct suffix
  if (searchProvider == 'Google') {
    return 'google.com/search?q=';
  } else if (searchProvider == 'Brave') {
    return 'search.brave.com/search?q=';
  } else if (searchProvider == 'DDG') {
    return 'duckduckgo.com/?q=';
  } else if (searchProvider == 'SearX') {
    return 'searx.jettscythe.xyz/search?q=';
  } else if (searchProvider == 'Bing') {
    return 'bing.com/search?q=';
  } else if (searchProvider == 'Yahoo') {
    return 'yahoo.com/search?p=';
  } else {
    throw Exception('Search provider not found');
  }
}
