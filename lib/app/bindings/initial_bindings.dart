import 'package:get/get.dart';

import 'dao_bindings.dart';
import 'repository_bindings.dart';
import 'service_bindings.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    ServiceBindings().dependencies();
    RepositoryBindings().dependencies();
    DaoBindings().dependencies();
  }
}
