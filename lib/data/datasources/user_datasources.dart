import 'dart:convert';

import 'package:maha_test/data/config/api.dart';
import 'package:maha_test/data/exceptions/exceptions.dart';
import 'package:maha_test/data/model/user.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUserFromApi();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  const UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUserFromApi() async {
    final response = await client.get(Uri.parse(Api.baseUrl));
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = jsonDecode(response.body);
      List list = responseBody['data'];
      return list.map((e) => UserModel.fromJson(e)).toList();
    }
  }
}
