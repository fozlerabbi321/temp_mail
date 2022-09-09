import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_mail/utils/constants.dart';
import '../controller/auth_controller.dart';
import '../controller/theme_controller.dart';
import '../main.dart';
import '../services/api/api_client.dart';
import '../services/repository/auth_repo.dart';

Future<void> init() async {
  // Core
  prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs,);
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.baseUrl), fenix: true);

  // theme Controller
  Get.lazyPut(() => ThemeController(), fenix: true,);

  // Repositories
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),), fenix: true,);
  // Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find(),), fenix: true,);
}
