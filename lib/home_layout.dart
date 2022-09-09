import 'package:flutter/material.dart';
import 'package:odoo_testing_app/shared/components.dart';
import 'package:odoo_testing_app/shared/constants.dart';

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
        actions: [
          IconButton(
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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildThreeImagesWithTitle(
                  context,
                  title: 'BOOST YOUR SALES',
                  img1: 'CRM',
                  img2: 'POS',
                  img3: 'Sales',
                  onTap: () {},
                ),
                spaceInHeight(height: 35),
                buildThreeImagesWithTitle(
                  context,
                  title: 'INTEGRATE YOUR SERVICES',
                  img1: 'Project',
                  img2: 'Timesheet',
                  img3: 'Helpdesk',
                  onTap: () {},
                ),
                spaceInHeight(height: 35),
                buildThreeImagesWithTitle(
                  context,
                  title: 'STREAMLINE YOUR OPERATION',
                  img1: 'Inventory',
                  img2: 'MRP',
                  img3: 'Purchase',
                  onTap: () {},
                ),
                spaceInHeight(height: 35),
                buildTwoImagesWithTitle(
                  context,
                  title: 'BUILD STUNNING WEBSITES',
                  img1: 'WebsiteBuilder',
                  img2: 'ECommerce',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildThreeImagesWithTitle(
  context, {
  required String title,
  required String img1,
  required String img2,
  required String img3,
  required Function onTap,
}) =>
    Column(
      children: [
        Text(
          title,
          style: const TextStyle(
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
              buildImageAndTitle(func: onTap, text: img1),
              spaceInWidth(width: 35),
              buildImageAndTitle(func: onTap, text: img2),
              spaceInWidth(width: 35),
              buildImageAndTitle(func: onTap, text: img3),
            ],
          ),
        ),
      ],
    );

Widget buildTwoImagesWithTitle(
  context, {
  required String title,
  required String img1,
  required String img2,
  required Function onTap,
}) =>
    Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        spaceInHeight(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImageAndTitle(func: onTap, text: img1),
              spaceInWidth(width: 35),
              buildImageAndTitle(text: img2, func: onTap),
            ],
          ),
        ),
      ],
    );

Widget buildImageAndTitle({
  required String text,
  required Function func,
}) =>
    Column(
      children: [
        InkWell(
          onTap: () {
            func(text);
          },
          child: Image.asset(
            'assets/images/$text.png',
          ),
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
