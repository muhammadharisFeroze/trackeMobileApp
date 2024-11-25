import 'helper/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(HomeController());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: ((context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
              alwaysUse24HourFormat: true), //set desired text scale factor here
          child: child ?? Container(),
        );
      }),
      // initialRoute: AppRoute.initial,
      initialRoute: AppRoute.initial,
      getPages: AppRoute.getPages,
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}
