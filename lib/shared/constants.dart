import 'package:odoo_testing_app/login/login_screen.dart';
import 'package:odoo_testing_app/shared/components.dart';
import 'package:odoo_testing_app/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    navigateAndFinish(context, LoginScreen());
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
