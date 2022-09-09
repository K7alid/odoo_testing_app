import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_testing_app/cubit/states.dart';
import 'package:odoo_testing_app/login_model.dart';
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
      CacheHelper.saveData(
        key: 'token',
        value: loginModel?.accessToken,
      );
      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('the error in login cubit is $error');
      emit(AppLoginErrorState(error.toString()));
    });
  }
}
