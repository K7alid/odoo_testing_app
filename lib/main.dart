import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/home_layout.dart';
import 'package:odoo_testing_app/login/login_screen.dart';
import 'package:odoo_testing_app/shared/constants.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';
import 'package:odoo_testing_app/shared/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/cubit/cubit.dart';
import 'login/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  token = CacheHelper.getData(key: 'token') ?? '';
  print('the token from main is $token');
  print('the token from main is ${await CacheHelper.getData(key: 'token')}');
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
            home: startWidget,
          );
        },
      ),
    );
  }
}
