import 'dart:convert';
import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tm_mail/services/api/api_client.dart';
import 'package:http/http.dart';
import 'package:tm_mail/utils/constants.dart';

import '../../helper/sqlite_db_helper.dart';
import '../../models/domain_model.dart';

class DomainRepo {
  final DatabaseHelper databaseHelper;
  final ApiClient apiClient;

  DomainRepo({required this.apiClient, required this.databaseHelper});

  //fetch domain list form server
  Future<Response> fetchDomain() async {
    return await apiClient.getData(Constants.kDomainListUrl);
  }

  //Get All all row
  Future<List<DomainModel>> getLocalDomainsList() async {
    List<DomainModel> dataList = [];
    Database? db = await databaseHelper.database;
    var results = await db!.query(Constants.tableNameDomains);
    for (var element in results) {
      var data = DomainModel.fromJson(element);
      dataList.add(data);
      log('Data : ${json.encode(data)}');
    }
    return dataList;
  }

  //Insert row
  Future insertDomains(DomainModel model) async {
    Database? db = await databaseHelper.database;
    var result = await db!.insert(
      Constants.tableNameDomains,
      model.toJson(),
    );
    return result;
  }

  //Delete
  Future<int> deleteAllDomains() async {
    Database? db = await databaseHelper.database;
    return await db!.delete(Constants.tableNameDomains);
  }

  final Map<String, String> header = {
    'Accept': 'application/ld+json',
  };
}
