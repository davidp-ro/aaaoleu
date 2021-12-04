import 'package:aaaoleu/models/embedded_res.dart';
import 'package:flutter/foundation.dart';

class ModuleProvider with ChangeNotifier, DiagnosticableTreeMixin {
  /// Contains mock data by default
  List<EmbeddedRes> _results = [
    EmbeddedRes(26.3, 0.64, "Potato", 0.45, false, 6.4),
    EmbeddedRes(27, 0.72, "Basil", 0.32, true, 7.1),
    EmbeddedRes(26.5, 0.49, "Cucumber", 0.79, true, 6.9),
  ];

  List<EmbeddedRes> get results => _results;

  set results(List<EmbeddedRes> res) {
    _results = res;
    notifyListeners();
  }

  void addModule(EmbeddedRes res) {
    _results.add(res);
    notifyListeners();
  }
}
