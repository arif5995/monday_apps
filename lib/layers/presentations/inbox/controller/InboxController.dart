import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/commons/constant/name.dart';
import 'package:monday_app/commons/errors/failures.dart';
import 'package:monday_app/datas/models/catatan_model.dart';
import 'package:monday_app/domain/usecases/fetch_catatan_usecase.dart';
import 'package:monday_app/domain/usecases/insert_catatan_usecase.dart';

class InboxController extends GetxController {
  InboxController(this._fetchCatatanUseCase, this._insertCatatanUseCase);
  final FetchCatatanUseCase _fetchCatatanUseCase;
  final InsertCatatanUseCase _insertCatatanUseCase;

  var right = 0.obs;
  var left = "Gagal".obs;
  final switchTimer = false.obs;
  var setTimer = "".obs;

  /// CHANGE TIME
  changeTime(TimeOfDay timeOfDay, BuildContext context) {
    print("WAKTU $timeOfDay");
    // TimeOfDay _now = TimeOfDay.now();
    setTimer.value = timeOfDay.format(context);
    // if (GlobalMethodHelper.isEmpty(setTimer)) {
    //   setTimer = _now.format(context).obs;
    // } else {
    //
    // }
  }

  /// SWITCH TIMER
  void NotifTimer() {
    switchTimer.toggle();
  }

  insertCatatan(CatatanModel catatanModel) async {
    final dataRow = await _insertCatatanUseCase.insertCatatan(catatanModel);
    dataRow.fold((failure) => left.value = _mapFailureToMessage(failure),
        (data) => right.value = data);
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ConstantNameHelper.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return ConstantNameHelper.CACHE_FAILURE_MESSAGE;
      case LokalFailure:
        return ConstantNameHelper.DATABASE_LOKAL_FAILURE;
      default:
        return 'Unexpected error';
    }
  }

  @override
  void onInit() {
    super.onInit();
    DateTime nows = new DateTime.now();
  }
}
