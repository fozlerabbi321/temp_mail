import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:tm_mail/models/rp_domain_model.dart';
import 'package:tm_mail/services/repository/domain_repo.dart';
import '../services/api/api_checker.dart';
import '../utils/style.dart';


class DomainController extends GetxController {
  final DomainRepo domainRepo;
  DomainController({required this.domainRepo,});

  //Init model
  List<DomainList> _domainList = [];
  //Init
  bool _isLoading = false;
  bool _isShimmerLoading = true;
  bool _noDataAvailable = true;
  late int _popularPageSize;
  List<String> _offsetList = [];
  int _offset = 1;

  List<DomainList> get domainList => _domainList;

  bool get isLoading => _isLoading;

  bool get isShimmerLoading => _isShimmerLoading;

  bool get noDataAvailable => _noDataAvailable;

  int get popularPageSize => _popularPageSize;

  int get offset => _offset;

  void setOffset(int offset) {
    _offset = offset;
  }


  //get domain list
  Future<void> getDomainList(
    String offset,
    bool reload, {
    String? search,
  }) async {
    if (offset == '1' || reload) {
      _offsetList = [];
      _offset = 1;
      if (reload) {
        _domainList = [];
        _isShimmerLoading = true;
      }
      update();
    }
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      final response = await domainRepo.fetchDomain(_offset,);
      if (response.statusCode == 200) {
        var posts = RpDomainModel.fromJson(jsonDecode(response.body));
        //success
        if (offset == '1') {
          _domainList = [];
        }
        if (response.body.isEmpty) {
          _isLoading = false;
          _isShimmerLoading = false;
          update();
        } else {
          log('=================>> add log');
          _domainList.addAll(posts.domainList!);
          _popularPageSize = posts.totalItems!;
          _isLoading = false;
          _isShimmerLoading = false;
          update();
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } else {
      if (isLoading) {
        _isLoading = false;
        update();
      }
    }
  }

  void showBottomLoader() {
    _isLoading = true;
    update();
  }

  void showShimmerLoader() {
    _isShimmerLoading = true;
    update();
  }

  void noDataAvailableUpdate() {
    if (_noDataAvailable) {
      showCustomSnackBar('No more data available'.tr);
      _noDataAvailable = false;
      update();
    }
  }
}
