import 'package:hive/hive.dart';

abstract class BaseHiveDatabase<TableType, ModelType> {
  String _boxName;
  Future<Box<TableType>>? boxInstance;

  BaseHiveDatabase({required String boxName}) : _boxName = boxName;

  void _init() {
    boxInstance = Hive.openBox(_boxName);
  }

  Future<Box<TableType>> get getBoxInstance async => _openBox();

  Future<List<ModelType>> getFormatedData();

  Future<void> insertOrUpdateAll(List<ModelType> todos);

  Future<Box<TableType>> _openBox() async {
    final Box<TableType>? box = await boxInstance;
    if (box == null || !box.isOpen) {
      _init();
      return boxInstance!;
    }
    return box;
  }

  Future<TableType?> get(String key) async {
    final Box<TableType> box = await _openBox();
    return box.get(key);
  }

  Future<List<TableType>> getAll() async {
    final Box<TableType> box = await _openBox();
    return box.toMap().values.toList();
  }

  Future<void> put(String key, TableType values) async {
    final Box<TableType> box = await _openBox();
    await box.put(key, values);
  }

  Future<void> putAll(Map<String, TableType> items) async {
    final Box<TableType> box = await _openBox();
    await box.putAll(items);
  }

  Future<void> delete(String key) async {
    final Box<TableType> box = await _openBox();
    await box.delete(key);
  }

  Future<void> deleteAll() async {
    final Box<TableType> box = await _openBox();
    final List<String> boxKeys = await keys;
    await box.deleteAll(boxKeys);
  }

  Future<List<String>> get keys async {
    final Box<TableType> box = await _openBox();
    final List<String> result = box.keys.map((e) => e.toString()).toList();
    return result;
  }
}
