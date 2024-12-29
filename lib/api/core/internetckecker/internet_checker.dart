import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isconnected; 
}

class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker ConnectionChecker;
  NetworkInfoImpl(this.ConnectionChecker);
  @override
  
  Future<bool> get isconnected => ConnectionChecker.hasConnection;
}