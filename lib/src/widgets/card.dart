import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

List<Widget> cards() {
  return <Widget>[
    // social card
    Expanded(
      child: Card(
        // make slightly opaque
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
                    Icon(Icons.tag),
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
                    Icon(Icons.forum),
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
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              contentPadding: EdgeInsets.all(0.0),
              // wrap title in transform template
              title: Text(
                'Dev',
                style: TextStyle(color: Colors.blueGrey),
                textAlign: TextAlign.center,
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
                  Icon(Icons.source),
                  Text('Github'),
                ],
              ),
              onTap: () {
                js.context.callMethod('open', ['https://github.com']);
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
                js.context.callMethod('open', ['https://gist.github.com']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.terminal),
                  Text('Compass'),
                ],
              ),
              onTap: () {
                js.context.callMethod(
                    'open', ['https://web.compass.lighthouselabs.ca/']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.school),
                  Text('Udemy'),
                ],
              ),
              onTap: () {
                js.context.callMethod('open', ['https://udemy.com']);
              },
            ),
          ],
        ),
      ),
    ),
    Expanded(
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              contentPadding: EdgeInsets.all(0.0),
              title: Text(
                'Media',
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
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
                  Icon(Icons.downloading),
                  Text('Torrents'),
                ],
              ),
              onTap: () {
                js.context
                    .callMethod('open', ['https://torrents.jettscythe.local']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.movie),
                  Text('Jellyfin'),
                ],
              ),
              onTap: () {
                js.context
                    .callMethod('open', ['https://jellyfin.jettscythe.xyz']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.subscriptions),
                  Text('Youtube'),
                ],
              ),
              onTap: () {
                js.context.callMethod('open', ['https://youtube.com']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.video_library),
                  Text('Prime Video'),
                ],
              ),
              onTap: () {
                js.context.callMethod('open', ['https://www.primevideo.com']);
              },
            ),
          ],
        ),
      ),
    ),
    Expanded(
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              contentPadding: EdgeInsets.all(0.0),
              title: Text(
                'Local',
                style: TextStyle(color: Colors.pink),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              height: 0,
              color: Colors.pink ,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.downloading),
                  Text('Sonarr'),
                ],
              ),
              onTap: () {
                js.context
                    .callMethod('open', ['https://sonarr.jettscythe.local']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.movie),
                  Text('Radarr'),
                ],
              ),
              onTap: () {
                js.context
                    .callMethod('open', ['https://radarr.jettscythe.local']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.subscriptions),
                  Text('Lidarr'),
                ],
              ),
              onTap: () {
                js.context.callMethod('open', ['https://lidarr.jettscythe.local']);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.video_library),
                  Text('Readarr'),
                ],
              ),
              onTap: () {
                js.context.callMethod('open', ['https://readarr.jettscythe.local']);
              },
            ),
          ],
        ),
      ),
    ),
  ];
}
