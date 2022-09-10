import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_mail/helper/sqlite_db_helper.dart';
import 'package:tm_mail/services/repository/domain_repo.dart';
import 'package:tm_mail/services/repository/inbox_repo.dart';
import 'package:tm_mail/utils/constants.dart';
import '../controller/auth_controller.dart';
import '../controller/domain_controller.dart';
import '../controller/inbox_controller.dart';
import '../controller/theme_controller.dart';
import '../main.dart';
import '../services/api/api_client.dart';
import '../services/repository/auth_repo.dart';

Future<void> init() async {
  // Core
  prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs,);
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  Get.lazyPut(() => databaseHelper, fenix: true,);
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.baseUrl), fenix: true);

  // theme Controller
  Get.lazyPut(() => ThemeController(), fenix: true,);

  // Repositories
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),), fenix: true,);
  Get.lazyPut(() => DomainRepo(apiClient: Get.find(), databaseHelper: Get.find()), fenix: true,);
  Get.lazyPut(() => InboxRepo(apiClient: Get.find(),), fenix: true,);
  // Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find(),), fenix: true,);
  Get.lazyPut(() => DomainController(domainRepo: Get.find(),), fenix: true,);
  Get.lazyPut(() => InboxController(inboxRepo: Get.find(),), fenix: true,);
}
