import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/login/cubit/cubit.dart';
import 'package:odoo_testing_app/login/cubit/states.dart';
import 'package:odoo_testing_app/shared/components.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.text}) : super(key: key);

  final String text;
  String? tok = 'token';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              defaultTextButton(
                function: () {
                  AppCubit.get(context).showToken();
                  tok = CacheHelper.getData(key: 'tok');
                },
                text: 'get token',
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: buildImageIcon(text, context),
                ),
                spaceInHeight(height: 50),
                Text(
                  tok!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildImageIcon(String text, context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/$text.png',
        ),
        spaceInHeight(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
