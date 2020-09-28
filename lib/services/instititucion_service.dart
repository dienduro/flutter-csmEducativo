import 'package:dio/dio.dart';
import 'package:flutter_csm_tecnologia/src/models/school_model.dart';
import 'package:get/state_manager.dart';

class InstituteServices extends GetxController {
  final _dio = Dio();
  final String _url = 'http://193123dde057.ngrok.io';

  Future getSchoolByName(String name) async {
    try {
      final url = '$_url/api/institutes';
      final Response resp = await _dio.get(url);

      final List<dynamic> schoolList = resp.data;
      print(name);
      return schoolList.map(
        (obj) {
          name.obs;
          print(name);
          School.fromJson(obj);
        },
      ).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
