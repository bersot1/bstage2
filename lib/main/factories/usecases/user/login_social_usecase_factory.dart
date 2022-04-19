import '../../../../data/data.dart';
import '../../../../domain/domain.dart';
import '../../factories.dart';

ILoginSocial makeLoginSocial() => LoginWithFacebookUsecase(makeFbPackage());
