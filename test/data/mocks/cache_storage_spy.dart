import 'package:bstage2/data/data.dart';
import 'package:mocktail/mocktail.dart';

class CacheStorageSpy extends Mock implements ICacheStorage {
  CacheStorageSpy() {
    mockDelete();
    mockSave();
  }

  When mockGetCall() => when(() => get(any()));
  void mockGet(dynamic json) => mockGetCall().thenAnswer((_) async => json);
  void mockGetError() => mockGetCall().thenThrow(Exception());

  When mockDeleteCall() => when(() => delete(any()));
  void mockDelete() => mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError() => mockDeleteCall().thenThrow(Exception());

  When mockSaveCall() => when(() => save(key: any(named: 'key'), value: any(named: 'value')));
  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => mockSaveCall().thenThrow(Exception());

  When mockClearCall() => when(() => clear());
  void mockClear() => mockClearCall().thenAnswer((_) async => _);
  void mockClearError() => mockClearCall().thenThrow(Exception());
}
