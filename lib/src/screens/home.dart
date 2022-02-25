import 'package:flutter/material.dart';
import '../widgets/home_page.dart';

final darkNotifier = ValueNotifier<bool>(true);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            // a theme that toggles the color and text of the cards and icons based on isDark
            theme: ThemeData(
              brightness: isDark ? Brightness.dark : Brightness.light,
              cardColor: isDark
                  ? const Color.fromARGB(255, 61, 61, 61).withOpacity(0.9)
                  : const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
