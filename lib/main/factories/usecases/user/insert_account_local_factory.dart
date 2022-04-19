import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';

import '../../factories.dart';

IInsertAccountLocalUsecase makeInsertAccountLocal() => InsertAccountLocalUsecase(makeCacheStorage());
