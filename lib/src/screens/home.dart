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
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
