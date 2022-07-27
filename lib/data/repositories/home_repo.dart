import 'package:dio/dio.dart';
import 'package:flutter_demo_bloc/data/constants/user_query.dart';
import 'package:flutter_demo_bloc/data/models/user_model.dart';
import 'package:flutter_demo_bloc/data/models/user_dto.dart';

class HomeRepo {
  final Dio _dio;
  HomeRepo(this._dio);

  Future<List<UserModel>?> getUsers({required int userCount}) async {
    try {
      String url = '${UserQuery.baseUrl}${UserQuery.apiPath}?size=$userCount';

      final Response<dynamic> response = await _dio.get<List<dynamic>>(url);

      final jsonList = response.data as List<dynamic>;

      final List<UserDTO> usersDTO =
          jsonList.map((e) => UserDTO.fromJson(e)).toList();

      final List<UserModel> usersCardModel =
          usersDTO.map((e) => e.toDomain()).toList();

      return usersCardModel;
    } on DioError catch (e) {
      print('Errror:$e');
      return null;
    }
  }
}
