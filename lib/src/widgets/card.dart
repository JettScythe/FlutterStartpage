import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

List<Widget> cards() {
  return <Widget>[
    // social card
    Expanded(
      child: Card(
        // make slightly opaque
        color: const Color.fromARGB(255, 61, 61, 61).withOpacity(0.9),
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
                  js.context.callMethod('open', ['https://twitter.com']);
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
                  js.context.callMethod('open', ['https://noise.cash']);
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
                  js.context.callMethod('open', ['https://memo.cash']);
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
                  js.context.callMethod('open', ['https://member.cash']);
                },
              ),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Card(
        color: const Color.fromARGB(255, 61, 61, 61).withOpacity(0.9),
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
                js.context.callMethod('open', ['https://bbc.com']);
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
                js.context.callMethod('open', ['https://bbc.com']);
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
                js.context.callMethod('open', ['https://bbc.com']);
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
                js.context.callMethod('open', ['https://bbc.com']);
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
        color: const Color.fromARGB(255, 61, 61, 61).withOpacity(0.9),
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
                js.context.callMethod('open', ['https://bbc.com']);
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
                js.context.callMethod('open', ['https://bbc.com']);
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
                js.context.callMethod('open', ['https://bbc.com']);
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
                js.context.callMethod('open', ['https://bbc.com']);
              },
            ),
            // dev card
            // media card
            // forums
          ],
        ),
      ),
    ),
  ];
}
