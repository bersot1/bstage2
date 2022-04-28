import '../../../data/data.dart';
import '../../../infra/infra.dart';

ICacheStorage makeCacheStorage() => LocalCacheStorageAdapter();
