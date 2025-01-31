import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dumlupinargazetesi/generals/constants/generated_translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// A class for checking internet connection status
class InternetConnectionChecker extends GetxController {
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool dialogIsOpen = false;

  Set<ConnectivityResult> acceptedConnections = {
    ConnectivityResult.wifi,
    ConnectivityResult.mobile,
    ConnectivityResult.vpn,
    ConnectivityResult.other,
  };

  @override
  void onInit() {
    super.onInit();

    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      if (acceptedConnections.intersection(event.toSet()).isEmpty) {
        showDialog();
      } else {
        if (dialogIsOpen) {
          Get.back();
        }
      }
    });
  }

  Future<void> showDialog() async {
    dialogIsOpen = true;
    Get.dialog(
      useSafeArea: true,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      FractionallySizedBox(
        widthFactor: 0.5,
        child: Center(
          child: GetSnackBar(
            message: tr(LocaleKeys.poor_connection),
            backgroundColor: Colors.black.withOpacity(0.7),
            dismissDirection: DismissDirection.vertical,
            borderRadius: 10,
            animationDuration: const Duration(seconds: 3),
            duration: const Duration(seconds: 3),
            isDismissible: true,
            snackStyle: SnackStyle.FLOATING,
          ),
        ),
      ),
    ).then((value) => dialogIsOpen = false);
  }

  Future<bool> checkInternet() async {
    Set<ConnectivityResult> result = (await _connectivity.checkConnectivity()).toSet();

    return result.intersection({ConnectivityResult.mobile, ConnectivityResult.wifi}).isNotEmpty;
  }

  @override
  void onClose() {
    if (_subscription != null) {
      _subscription!.cancel();
    }
  }
}
