import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';

abstract class ILoginSocial {
  Future<ResultLoginSocial?> call();
}
