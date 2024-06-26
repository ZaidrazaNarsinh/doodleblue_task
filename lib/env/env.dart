import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
    varName: 'AUTHTOKEN',
  )
  static const String authToken = _Env.authToken;
}
