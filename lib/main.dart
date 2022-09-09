import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/cubit/cubit.dart';
import 'package:odoo_testing_app/cubit/states.dart';
import 'package:odoo_testing_app/home_layout.dart';
import 'package:odoo_testing_app/login_screen.dart';
import 'package:odoo_testing_app/shared/constants.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';
import 'package:odoo_testing_app/shared/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  String tok = CacheHelper.getData(key: 'token');
  token = tok;
  if (token != '') {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }
  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.startWidget}) : super(key: key);

  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.grey,
            ),
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
