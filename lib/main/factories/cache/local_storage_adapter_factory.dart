import 'package:bstage2/data/data.dart';
import 'package:bstage2/infra/cache/local_cache_adapter.dart';

ICacheStorage makeCacheStorage() => LocalCacheStorageAdapter();
