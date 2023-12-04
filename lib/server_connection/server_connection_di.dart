import 'package:get_it/get_it.dart';
import 'package:unicar_maps/server_connection/group_service.dart';

class ServerConnectionDI{

  static config(){
    GetIt.I.registerSingleton<GroupService>(GroupService('localhost', 3000), instanceName: 'passageiro');

    GetIt.I.registerSingleton<GroupService>(GroupService('localhost', 3000), instanceName: 'motorista');
  }
}