import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:smartshipapp/data/network/network_status.dart';

import 'data/repositories/abstract/user_repository.dart';
import 'data/repositories/remote_user_repository.dart';
import 'data/repositories/user_repository_impl.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImpl(DataConnectionChecker()));

  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<RemoteUserRepository>(
    () => RemoteUserRepository(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteUserRepository: sl()),
  );
}
