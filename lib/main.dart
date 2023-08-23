import 'package:dental_workflow/providers/app_state_provider.dart';
import 'package:dental_workflow/providers/price_provider.dart';
import 'package:dental_workflow/providers/user_detail_provider.dart';
import 'package:dental_workflow/route/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/work_provider.dart';
import 'route/build_route_map.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future getInstance() async{
    SharedPreferences preferences = await  SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    if(token != null){
      splash = "/homePage";
    }
    else{
      splash = "/logOrReg";
    }
  }


  @override
  void initState(){
    getInstance();
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(create: (_) => AppStateProvider()),
        ChangeNotifierProvider<WorkProvider>(create: (_) => WorkProvider()),
        ChangeNotifierProvider<UserDetailProvider>(create: (_) => UserDetailProvider()),
        ChangeNotifierProvider<PriceProvider>(create: (_) => PriceProvider()),
      ],
      child: MaterialApp.router(
        routeInformationParser: const RoutemasterParser(),
        routerDelegate: RoutemasterDelegate(
          routesBuilder:  (_) => Routes
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: LoginOrRegister()
//       ),
//     );
//   }
// }
