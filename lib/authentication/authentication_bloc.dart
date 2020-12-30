import 'package:bloc/bloc.dart';
import 'package:smartshipapp/config/storage.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // app start
    if (event is AppStarted) {
      var token = await _getToken();
      if (token != '') {
        Storage().token = token;
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      Storage().token = event.token;
      Storage().userId = event.userId;
      await _saveToken(event.token);
      await _saveUserId(event.userId);
      yield Authenticated();
    }

    if (event is LoggedOut) {
      Storage().token = '';
      Storage().userId = '';
      await _deleteToken();
      await _deleteUserId();
      yield Unauthenticated();
    }
  }

  /// delete from keystore/keychain
  Future<void> _deleteToken() async {
    await Storage().secureStorage.delete(key: 'access_token');
  }

  /// write to keystore/keychain
  Future<void> _saveToken(String token) async {
    await Storage().secureStorage.write(key: 'access_token', value: token);
  }

  /// read to keystore/keychain
  Future<String> _getToken() async {
    return await Storage().secureStorage.read(key: 'access_token') ?? '';
  }

  /// delete from keystore/keychain
  Future<void> _deleteUserId() async {
    await Storage().secureStorage.delete(key: 'user_id');
  }

  /// write to keystore/keychain
  Future<void> _saveUserId(String userId) async {
    await Storage().secureStorage.write(key: 'user_id', value: userId);
  }

  /// read to keystore/keychain
  Future<String> _getUserId() async {
    return await Storage().secureStorage.read(key: 'user_id') ?? '';
  }
}
