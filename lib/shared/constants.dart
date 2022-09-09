import 'package:odoo_testing_app/login_screen.dart';
import 'package:odoo_testing_app/shared/components.dart';

void signOut(context) {
  token = '';
  navigateAndFinish(context, LoginScreen());
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
