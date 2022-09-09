import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/cubit/cubit.dart';
import 'package:odoo_testing_app/cubit/states.dart';
import 'package:odoo_testing_app/home_layout.dart';
import 'package:odoo_testing_app/shared/components.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppLoginErrorState) {
          showToast(
            text: 'Make sure that ur data is right',
            state: ToastStates.ERROR,
          );
        }
        if (state is AppLoginSuccessState) {
          showToast(
            text: 'Done Successfully',
            state: ToastStates.SUCCESS,
          );
          CacheHelper.saveData(
            key: 'token',
            value: state.loginModel.accessToken,
          ).then((value) {
            navigateAndFinish(
              context,
              HomeLayout(),
            );
          });
          print(
              'the token from login screen is${CacheHelper.getData(key: 'token')}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.settings,
                ),
              ),
            ],
            elevation: 0.0,
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.elliptical(350, 75),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: double.infinity,
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              height: MediaQuery.of(context).size.height * 0.85,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome back!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  spaceInHeight(height: 20),
                                  Card(
                                    elevation: 3.0,
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.60,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 20, end: 20, top: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Login to continue',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.black,
                                              ),
                                            ),
                                            spaceInHeight(height: 30),
                                            defaultTextFormField(
                                                label: 'Username',
                                                prefix: Icons.person_outline,
                                                radius: 7,
                                                textInputType:
                                                    TextInputType.name,
                                                controller: usernameController,
                                                validate: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Username must not be empty';
                                                  }
                                                }),
                                            spaceInHeight(height: 30),
                                            defaultTextFormField(
                                                label: 'Password',
                                                prefix: Icons.lock_outline,
                                                radius: 7,
                                                isPassword:
                                                    AppCubit.get(context)
                                                        .isNotShown,
                                                onSuffixPressed: () {
                                                  AppCubit.get(context)
                                                      .changeIcon();
                                                },
                                                suffix: AppCubit.get(context)
                                                        .isNotShown
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                controller: passwordController,
                                                validate: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Password must not be empty';
                                                  }
                                                }),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                defaultTextButton(
                                                    text: 'English',
                                                    function: () {}),
                                                defaultTextButton(
                                                    text: 'العربية',
                                                    function: () {}),
                                              ],
                                            ),
                                            ConditionalBuilder(
                                              condition: state
                                                  is! AppLoginLoadingState,
                                              builder: (context) =>
                                                  defaultButton(
                                                function: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    AppCubit.get(context)
                                                        .userLogin(
                                                      username:
                                                          usernameController
                                                              .text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                    );
                                                  }
                                                },
                                                text: 'login',
                                              ),
                                              fallback: (context) => const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
