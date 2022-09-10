import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:tm_mail/models/rp_message_model.dart';
import 'package:tm_mail/services/repository/inbox_repo.dart';
import '../services/api/api_checker.dart';
import '../utils/style.dart';

class InboxController extends GetxController {
  final InboxRepo inboxRepo;

  InboxController({
    required this.inboxRepo,
  });

  //Init model
  List<MessageList> _messageList = [];

  //Init
  bool _isLoading = false;
  bool _isShimmerLoading = true;
  bool _noDataAvailable = true;
  late int _popularPageSize;
  List<String> _offsetList = [];
  int _offset = 1;

  List<MessageList> get messageList => _messageList;

  bool get isLoading => _isLoading;

  bool get isShimmerLoading => _isShimmerLoading;

  bool get noDataAvailable => _noDataAvailable;

  int get popularPageSize => _popularPageSize;

  int get offset => _offset;

  void setOffset(int offset) {
    _offset = offset;
  }

  //get message list
  Future<void> getMessageList(
    String offset,
    bool reload, {
    String? search,
  }) async {
    if (offset == '1' || reload) {
      _offsetList = [];
      _offset = 1;
      if (reload) {
        _messageList = [];
        _isShimmerLoading = true;
      }
      update();
    }
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      final response = await inboxRepo.fetchMessageList(
        _offset,
      );
      if (response.statusCode == 200) {
        var posts = RpMessageModel.fromJson(jsonDecode(response.body));
        //success
        if (offset == '1') {
          _messageList = [];
        }
        if (response.body.isEmpty) {
          _isLoading = false;
          _isShimmerLoading = false;
          update();
        } else {
          log('=================>> add log');
          _messageList.addAll(posts.messageList!);
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
