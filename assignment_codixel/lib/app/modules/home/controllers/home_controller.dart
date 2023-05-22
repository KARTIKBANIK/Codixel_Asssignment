import 'package:assignment_codixel/app/model/models.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  Rx<Users> usersDetails = Users().obs;
  List<Map<String, dynamic>> map = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    viewall_experience = fetchUsers();
  }

  Future fetchUsers() async {
    var response = await http.get(
      Uri.parse("https://random-data-api.com/api/v2/users"),
    );
    if (response.statusCode == 200) {
      var response = await http.get(
        Uri.parse("https://random-data-api.com/api/v2/users"),
      );

      if (response != null) {
        usersDetails.value = usersFromJson(response.body);
      }
      print('Get post collected' + response.body);
      var userData1 = jsonDecode(response.body);

      userData1 = List<Map<String, dynamic>>.from(jsonDecode(response.body));

      return userData1;
    } else {
      print("post have no Data${response.body}");
    }
  }

  Future? viewall_experience;
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
