import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:tm_mail/main.dart';
import 'package:tm_mail/models/domain_model.dart';
import 'package:tm_mail/services/repository/domain_repo.dart';
import '../models/rp_domain_list.dart';
import '../services/api/api_checker.dart';
import '../utils/constants.dart';


class DomainController extends GetxController {
  final DomainRepo domainRepo;
  DomainController({required this.domainRepo,});

  //Init model
  List<RpDomainList> _domainList = [];
  final List<DomainModel> _localDomainList = [];
  //Init
  bool _isLoading = false;
  bool _isShimmerLoading = false;
  List<RpDomainList> get domainList => _domainList;
  List<DomainModel> get localDomainList => _localDomainList;

  bool get isLoading => _isLoading;

  bool get isShimmerLoading => _isShimmerLoading;


  //get domain list
  Future<void> getDomainList(bool reload) async {
    if (reload) {
      _domainList = [];
      _isShimmerLoading = true;
      update();

      final response = await domainRepo.fetchDomain();
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<RpDomainList> posts = body
            .map(
              (dynamic item) => RpDomainList.fromJson(item),
        )
            .toList();
        if (response.body.isEmpty) {
          _isLoading = false;
          _isShimmerLoading = false;
          update();
        } else {
          log('=================>> add log');
          _domainList.addAll(posts);
          for(var domain in posts){
            insertDomains(domain);
          }
          _isLoading = false;
          _isShimmerLoading = false;
          //add check if exists local database domain data
          await prefs.setBool(Constants.domainExists, true);
          update();
        }
      } else {
        ApiChecker.checkApi(response);
      }
    }else{
      getLocalDomainsList();
    }


  }

  //add local database domain data
  void insertDomains(RpDomainList domain) async {
    var dataList = await domainRepo.getLocalDomainsList();
    _localDomainList.assignAll(dataList);
    //check if exists
    var contain = _localDomainList.where((element) => element.id == domain.id);
    if (contain.isEmpty) {
      //value not exists
      log('domain value not exists ${domain.id ?? 0}');
      //add model
      DomainModel model = DomainModel(
        id: domain.id,
        domain: domain.domain,
        isActive: (domain.isActive ?? false) ? 0 : 1,
        isPrivate: (domain.isPrivate ?? false) ? 0 : 1,
        createdAt: domain.createdAt,
        updatedAt: domain.updatedAt,
      );
      //insert domain domain 
      domainRepo.insertDomains(model);

      getLocalDomainsList();
    }
  }
  //Get  all local domain list
  void getLocalDomainsList() async {
    try {
      _isLoading = true;
      var domainList = await domainRepo.getLocalDomainsList();
      _localDomainList.assignAll(domainList);
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }

  void deleteAllDomains() async {
    try {
      _isLoading = false;
      await domainRepo.deleteAllDomains();
      getLocalDomainsList();
    } finally {
      _isLoading = false;
      update();
    }
  }
}
