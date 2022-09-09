import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/login/cubit/states.dart';
import 'package:odoo_testing_app/login/login_screen.dart';
import 'package:odoo_testing_app/model/login_model.dart';
import 'package:odoo_testing_app/shared/components.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';
import 'package:odoo_testing_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  bool isNotShown = true;

  void changeIcon() {
    isNotShown = !isNotShown;
    emit(ChangeIconState());
  }

  void userLogin({
    required String username,
    required String password,
  }) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: '',
      data: {
        'username': username,
        'password': password,
        'grant_type': 'password',
      },
    ).then((value) {
      print(value.headers);
      loginModel = LoginModel.fromJson(value.data);
      print('the token is ${loginModel?.accessToken}');
      CacheHelper.saveData(
        key: 'token',
        value: loginModel!.accessToken,
      );
      print('the token in the shared is ${CacheHelper.getData(key: 'token')}');
      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('the error in login cubit is $error');
      emit(AppLoginErrorState(error.toString()));
    });
  }

  String? tok = 'token';

  void showToken() {
    tok = loginModel!.accessToken;
    emit(ShowTokenState());
  }

  void signOut(context) {
    CacheHelper.removeData(
      key: 'token',
    ).then((value) {
      navigateAndFinish(context, LoginScreen());
    });
  }
}
