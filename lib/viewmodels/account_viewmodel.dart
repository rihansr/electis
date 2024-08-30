import '../models/user/address_model.dart';
import '../models/user/user_model.dart';
import '../shared/shared_prefs.dart';
import 'base_viewmodel.dart';

class AccountViewModel extends BaseViewModel {
  AccountViewModel();

  /// The currently logged-in user.
  User _user = sharedPrefs.user;
  User get user => _user;

  /// Sets the currently logged-in user.
  set user(User user) {
    sharedPrefs.user = user;
    this
      .._user = user
      ..notify;
  }

  /// Retrieves the address of the currently logged-in user.
  Address get address => user.address ?? const Address();

  /// Sets the address of the currently logged-in user.
  set address(Address address) => user = _user.copyWith(address: address);
}
