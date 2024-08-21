import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/firebase_options.dart';
import 'package:agricstock/providers/language_provider.dart';
import 'package:agricstock/screens/anony_screen.dart';
import 'package:agricstock/screens/chat_screen.dart';
import 'package:agricstock/screens/market_price_screen.dart';
import 'package:agricstock/screens/news_feed_screen.dart';
import 'package:agricstock/screens/splash_screen.dart';
import 'package:agricstock/screens/weather_screen.dart';
import 'package:agricstock/shared/widgets/custom_navigation_item.dart';
import 'package:agricstock/util/extension/translate_extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'NotoSans',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: AnonymousSignInScreen(),
            home: const SplashScreen(),
          );
        });
  }
}

class AgriStock extends ConsumerStatefulWidget {
  const AgriStock({super.key});

  @override
  ConsumerState<AgriStock> createState() => _AgriStockState();
}

class _AgriStockState extends ConsumerState<AgriStock> {
  final List<Widget> screens = [
    const MarketPriceScreen(),
    const WeatherScreen(),
    const NewsFeedScreen(),
    const ChatScreen()
  ];

  int _selectedIndex = 0;
  List<CustomBottomNavigationItem> items = [
    const CustomBottomNavigationItem(
        icon: AppImages.market, navName: "Market Price"),
    const CustomBottomNavigationItem(
        icon: AppImages.weather, navName: "Weather"),
    const CustomBottomNavigationItem(
        icon: AppImages.news, navName: "News Feed"),
    const CustomBottomNavigationItem(
        icon: AppImages.chat, navName: "Chat Forum"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/images/playstore.png',
              height: 40.h,
            ),
            Text(
              "AgriStock",
              style: TextStyle(fontSize: 20.sp),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(currentLanguage.notifier).state = value;
            },
            itemBuilder: (BuildContext context) {
              return TranslateString.supportedLanguages.entries.map((entry) {
                return PopupMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
          color: AppColors.whiteColor,
          height: 75.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              return items[index].copyWith(
                isNavSelected: index == _selectedIndex,
                onTap: () => setState(() => _selectedIndex = index),
              );
            }),
          )),
    );
  }
}
