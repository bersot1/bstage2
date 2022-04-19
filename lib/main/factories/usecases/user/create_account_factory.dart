import '../../../../data/data.dart';
import '../../../../domain/domain.dart';
import '../../../factories/factories.dart';

ICreateAccountUsecase makeCreateAccount() => CreateAccountUsecase(
      httpClient: makeHttpAdapter(),
      url: makeApiUrl('perfil'),
    );
