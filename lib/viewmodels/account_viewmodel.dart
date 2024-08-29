import '../models/user/address_model.dart';
import '../models/user/user_model.dart';
import '../shared/shared_prefs.dart';
import 'base_viewmodel.dart';

class AccountViewModel extends BaseViewModel {
  AccountViewModel();

  User _user = sharedPrefs.user;
  User get user => _user;
  set user(User user) {
    sharedPrefs.user = user;
    this
      .._user = user
      ..notify;
  }

  Address get address => user.address ?? const Address();
  set address(Address address) => user = _user.copyWith(address: address);
}
