import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class UnicarMapsAuthUser {
  UnicarMapsAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<UnicarMapsAuthUser> unicarMapsAuthUserSubject =
    BehaviorSubject.seeded(UnicarMapsAuthUser(loggedIn: false));
Stream<UnicarMapsAuthUser> unicarMapsAuthUserStream() =>
    unicarMapsAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
