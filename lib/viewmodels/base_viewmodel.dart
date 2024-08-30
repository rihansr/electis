import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/navigation_service.dart';

T provider<T>({listen = false, BuildContext? context}) =>
    Provider.of<T>(context ?? navigator.context, listen: listen);

class BaseViewModel extends ChangeNotifier {
  final HashMap<String, bool> _loading = HashMap();
  bool _busy = false;

  /// Indicates whether the viewmodel is currently busy.
  bool get busy => _busy;

  /// Sets the busy status of the view model.
  ///
  /// The [status] parameter indicates whether the view model is busy or not.
  /// The [key] parameter is an optional identifier for the loading status.
  /// The [afterBinding] parameter indicates whether to notify listeners after the next frame is rendered.
  void setBusy(bool status, {String? key, bool afterBinding = false}) {
    _busy = status;
    if (key != null) _loading[key] = status;
    afterBinding
        ? WidgetsBinding.instance
            .addPostFrameCallback((timeStamp) => notifyListeners())
        : notifyListeners();
    if (status == false && key != null && _loading.containsKey(key)) {
      _loading.remove(key);
    }
  }

  /// Checks if the view model is currently loading.
  ///
  /// The [key] parameter is an optional identifier for the loading status.
  /// The [orElse] parameter is an optional default value to return if the loading status is not found.
  /// Returns `true` if the view model is loading, otherwise returns the value of [orElse].
  bool isLoading({String? key, bool? orElse}) =>
      (key != null && _loading.containsKey(key) ? _loading[key] : orElse) ??
      busy;

  /// Notifies listeners of changes in the viewmodel.
   get notify => notifyListeners();

  @override
  void dispose() {
    _busy = false;
    _loading.clear();
    super.dispose();
  }
}
