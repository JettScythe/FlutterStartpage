import 'package:flutter/material.dart';

import '../screens/home.dart';

bool isDark = darkNotifier.value;
Widget settingsModal(
    BuildContext context,
    String searchProvider,
    ValueNotifier<String> searchProviderNotifier,
    List<String> searchProviders) {
  return IconButton(
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
                  DropdownButtonFormField<String>(
                    value: searchProvider,
                    onChanged: (String? newValue) {
                      searchProvider = newValue!;
                      searchProviderNotifier.value = searchProvider;
                    },
                    items: searchProviders.map<DropdownMenuItem<String>>(
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
  );
}
