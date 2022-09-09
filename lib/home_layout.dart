import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/detail_screen.dart';
import 'package:odoo_testing_app/shared/components.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';

import 'login/cubit/cubit.dart';
import 'login/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Image.asset(
            'assets/images/Logo.png',
            fit: BoxFit.fill,
          ),
        ),

        /*
        actions: [
          BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              AppCubit cubit = BlocProvider.of(context);
              return IconButton(
                  onPressed: () {
                    cubit.signOut(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ));
            },
          ),
        */
        actions: [
          BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              AppCubit cubit = BlocProvider.of(context);
              return IconButton(
                  onPressed: () {
                    cubit.signOut(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ));
            },
          ),
          /*IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              )),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),*/
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildThreeIconWithTitle(
                context,
                title: 'BOOST YOUR SALES',
                image1: 'CRM',
                image2: 'POS',
                image3: 'Sales',
              ),
              spaceInHeight(height: 35),
              buildThreeIconWithTitle(
                context,
                title: 'INTEGRATE YOUR SERVICES',
                image1: 'Project',
                image2: 'Timesheet',
                image3: 'Helpdesk',
              ),
              spaceInHeight(height: 35),
              buildThreeIconWithTitle(
                context,
                title: 'STREAMLINE YOUR OPERATIONS',
                image1: 'Inventory',
                image2: 'MRP',
                image3: 'Purchase',
              ),
              spaceInHeight(height: 35),
              buildThreeIconWithTitle(
                context,
                title: 'BUILD STUNNING WEBSITES',
                image1: 'WebsiteBuilder',
                image2: '',
                image3: 'ECommerce',
                isThree: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImageIcon(String text, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          DetailScreen(text: text),
        );
        print('helper from home ${CacheHelper.getData(key: 'token')}');
      },
      child: Column(
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
      ),
    );
Widget buildThreeIconWithTitle(
  context, {
  required String title,
  required String image1,
  required String image2,
  required String image3,
  bool isThree = true,
}) =>
    Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        spaceInHeight(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImageIcon(image1, context),
              spaceInWidth(width: 35),
              isThree ? buildImageIcon(image2, context) : Container(),
              isThree ? spaceInWidth(width: 35) : Container(),
              buildImageIcon(image3, context),
            ],
          ),
        ),
      ],
    );
