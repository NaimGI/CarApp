import 'package:car/Pages/Admin/AdminPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Pages/Admin/dashboard.dart';
import 'Pages/Client/Quiz/QuiyPage.dart';
import 'Pages/Client/mdpScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'Pages/Client/IconsPage.dart';
import 'Pages/Client/Mokatapage.dart';
import 'Pages/Client/SettingPage.dart';
import 'Pages/Client/UpdatedClient.dart';
import 'Service/UserProvider.dart';
import 'components/NavigationBarClient.dart';
import 'components/Onboardcontent.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
              create: (context) => UserProvider()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(),
              routes: {
                MyHomePage.routeName: (ctx) => MyHomePage(),
                NavigateBarPatient.routeName: (context) => NavigateBarPatient(),
                DetailsScreen.routeName: (context) => DetailsScreen(),
                SettingProfile.routName: (context) => SettingProfile(),
                Modifier_patient.routName: (context) => Modifier_patient(),
                mdpScreen.routeName: (context) => mdpScreen(),
                Dashboard.routeName: (context) => Dashboard(),
                AdminPage.routeName: (context) => AdminPage(),
                QuiyPage.routeName: (context) => QuiyPage()
              });
        }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  static const routeName = "/Home";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        builder: (_) => OnboardContent(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Image.asset(
        "assets/car.jpg",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
