// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_local_identifiers

part of 'collections.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSubtaskCollection on Isar {
  IsarCollection<Subtask> get subtasks => getCollection();
}

const SubtaskSchema = CollectionSchema(
  name: 'Subtask',
  schema:
      '{"name":"Subtask","idName":"id","properties":[{"name":"groupId","type":"Long"},{"name":"isChecked","type":"Bool"},{"name":"listId","type":"Long"},{"name":"taskId","type":"Long"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'groupId': 0,
    'isChecked': 1,
    'listId': 2,
    'taskId': 3,
    'title': 4
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _subtaskGetId,
  setId: _subtaskSetId,
  getLinks: _subtaskGetLinks,
  attachLinks: _subtaskAttachLinks,
  serializeNative: _subtaskSerializeNative,
  deserializeNative: _subtaskDeserializeNative,
  deserializePropNative: _subtaskDeserializePropNative,
  serializeWeb: _subtaskSerializeWeb,
  deserializeWeb: _subtaskDeserializeWeb,
  deserializePropWeb: _subtaskDeserializePropWeb,
  version: 3,
);

int? _subtaskGetId(Subtask object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _subtaskSetId(Subtask object, int id) {
  object.id = id;
}

List<IsarLinkBase> _subtaskGetLinks(Subtask object) {
  return [];
}

void _subtaskSerializeNative(
    IsarCollection<Subtask> collection,
    IsarRawObject rawObj,
    Subtask object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.groupId;
  final _groupId = value0;
  final value1 = object.isChecked;
  final _isChecked = value1;
  final value2 = object.listId;
  final _listId = value2;
  final value3 = object.taskId;
  final _taskId = value3;
  final value4 = object.title;
  IsarUint8List? _title;
  if (value4 != null) {
    _title = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_title?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _groupId);
  writer.writeBool(offsets[1], _isChecked);
  writer.writeLong(offsets[2], _listId);
  writer.writeLong(offsets[3], _taskId);
  writer.writeBytes(offsets[4], _title);
}

Subtask _subtaskDeserializeNative(IsarCollection<Subtask> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Subtask(
    groupId: reader.readLong(offsets[0]),
    id: id,
    isChecked: reader.readBool(offsets[1]),
    listId: reader.readLong(offsets[2]),
    taskId: reader.readLong(offsets[3]),
    title: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _subtaskDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _subtaskSerializeWeb(
    IsarCollection<Subtask> collection, Subtask object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isChecked', object.isChecked);
  IsarNative.jsObjectSet(jsObj, 'listId', object.listId);
  IsarNative.jsObjectSet(jsObj, 'taskId', object.taskId);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Subtask _subtaskDeserializeWeb(
    IsarCollection<Subtask> collection, dynamic jsObj) {
  final object = Subtask(
    groupId:
        IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity,
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    isChecked: IsarNative.jsObjectGet(jsObj, 'isChecked') ?? false,
    listId: IsarNative.jsObjectGet(jsObj, 'listId') ?? double.negativeInfinity,
    taskId: IsarNative.jsObjectGet(jsObj, 'taskId') ?? double.negativeInfinity,
    title: IsarNative.jsObjectGet(jsObj, 'title'),
  );
  return object;
}

P _subtaskDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'groupId':
      return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'isChecked':
      return (IsarNative.jsObjectGet(jsObj, 'isChecked') ?? false) as P;
    case 'listId':
      return (IsarNative.jsObjectGet(jsObj, 'listId') ??
          double.negativeInfinity) as P;
    case 'taskId':
      return (IsarNative.jsObjectGet(jsObj, 'taskId') ??
          double.negativeInfinity) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _subtaskAttachLinks(IsarCollection col, int id, Subtask object) {}

extension SubtaskQueryWhereSort on QueryBuilder<Subtask, Subtask, QWhere> {
  QueryBuilder<Subtask, Subtask, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SubtaskQueryWhere on QueryBuilder<Subtask, Subtask, QWhereClause> {
  QueryBuilder<Subtask, Subtask, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Subtask, Subtask, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Subtask, Subtask, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Subtask, Subtask, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension SubtaskQueryFilter
    on QueryBuilder<Subtask, Subtask, QFilterCondition> {
  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> groupIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> groupIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> groupIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> groupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'groupId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> isCheckedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isChecked',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> listIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> listIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> listIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> listIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'listId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> taskIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'taskId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> taskIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'taskId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> taskIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'taskId',
      value: value,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> taskIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'taskId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'title',
      value: null,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtask, Subtask, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SubtaskQueryLinks
    on QueryBuilder<Subtask, Subtask, QFilterCondition> {}

extension SubtaskQueryWhereSortBy on QueryBuilder<Subtask, Subtask, QSortBy> {
  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByTaskId() {
    return addSortByInternal('taskId', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByTaskIdDesc() {
    return addSortByInternal('taskId', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension SubtaskQueryWhereSortThenBy
    on QueryBuilder<Subtask, Subtask, QSortThenBy> {
  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByTaskId() {
    return addSortByInternal('taskId', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByTaskIdDesc() {
    return addSortByInternal('taskId', Sort.desc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Subtask, Subtask, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension SubtaskQueryWhereDistinct
    on QueryBuilder<Subtask, Subtask, QDistinct> {
  QueryBuilder<Subtask, Subtask, QDistinct> distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<Subtask, Subtask, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Subtask, Subtask, QDistinct> distinctByIsChecked() {
    return addDistinctByInternal('isChecked');
  }

  QueryBuilder<Subtask, Subtask, QDistinct> distinctByListId() {
    return addDistinctByInternal('listId');
  }

  QueryBuilder<Subtask, Subtask, QDistinct> distinctByTaskId() {
    return addDistinctByInternal('taskId');
  }

  QueryBuilder<Subtask, Subtask, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension SubtaskQueryProperty
    on QueryBuilder<Subtask, Subtask, QQueryProperty> {
  QueryBuilder<Subtask, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<Subtask, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Subtask, bool, QQueryOperations> isCheckedProperty() {
    return addPropertyNameInternal('isChecked');
  }

  QueryBuilder<Subtask, int, QQueryOperations> listIdProperty() {
    return addPropertyNameInternal('listId');
  }

  QueryBuilder<Subtask, int, QQueryOperations> taskIdProperty() {
    return addPropertyNameInternal('taskId');
  }

  QueryBuilder<Subtask, String?, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTaskCollection on Isar {
  IsarCollection<Task> get tasks => getCollection();
}

const TaskSchema = CollectionSchema(
  name: 'Task',
  schema:
      '{"name":"Task","idName":"id","properties":[{"name":"due","type":"Long"},{"name":"groupId","type":"Long"},{"name":"isChecked","type":"Bool"},{"name":"isStarred","type":"Bool"},{"name":"listId","type":"Long"},{"name":"note","type":"String"},{"name":"remainder","type":"Long"},{"name":"repeat","type":"Long"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'due': 0,
    'groupId': 1,
    'isChecked': 2,
    'isStarred': 3,
    'listId': 4,
    'note': 5,
    'remainder': 6,
    'repeat': 7,
    'title': 8
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _taskGetId,
  setId: _taskSetId,
  getLinks: _taskGetLinks,
  attachLinks: _taskAttachLinks,
  serializeNative: _taskSerializeNative,
  deserializeNative: _taskDeserializeNative,
  deserializePropNative: _taskDeserializePropNative,
  serializeWeb: _taskSerializeWeb,
  deserializeWeb: _taskDeserializeWeb,
  deserializePropWeb: _taskDeserializePropWeb,
  version: 3,
);

int? _taskGetId(Task object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _taskSetId(Task object, int id) {
  object.id = id;
}

List<IsarLinkBase> _taskGetLinks(Task object) {
  return [];
}

void _taskSerializeNative(IsarCollection<Task> collection, IsarRawObject rawObj,
    Task object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.due;
  final _due = value0;
  final value1 = object.groupId;
  final _groupId = value1;
  final value2 = object.isChecked;
  final _isChecked = value2;
  final value3 = object.isStarred;
  final _isStarred = value3;
  final value4 = object.listId;
  final _listId = value4;
  final value5 = object.note;
  IsarUint8List? _note;
  if (value5 != null) {
    _note = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_note?.length ?? 0) as int;
  final value6 = object.remainder;
  final _remainder = value6;
  final value7 = object.repeat;
  final _repeat = value7;
  final value8 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _due);
  writer.writeLong(offsets[1], _groupId);
  writer.writeBool(offsets[2], _isChecked);
  writer.writeBool(offsets[3], _isStarred);
  writer.writeLong(offsets[4], _listId);
  writer.writeBytes(offsets[5], _note);
  writer.writeDateTime(offsets[6], _remainder);
  writer.writeLong(offsets[7], _repeat);
  writer.writeBytes(offsets[8], _title);
}

Task _taskDeserializeNative(IsarCollection<Task> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Task(
    due: reader.readDateTimeOrNull(offsets[0]),
    groupId: reader.readLong(offsets[1]),
    id: id,
    isChecked: reader.readBool(offsets[2]),
    isStarred: reader.readBool(offsets[3]),
    listId: reader.readLong(offsets[4]),
    note: reader.readStringOrNull(offsets[5]),
    remainder: reader.readDateTimeOrNull(offsets[6]),
    repeat: reader.readLongOrNull(offsets[7]),
    title: reader.readString(offsets[8]),
  );
  return object;
}

P _taskDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _taskSerializeWeb(IsarCollection<Task> collection, Task object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'due', object.due?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isChecked', object.isChecked);
  IsarNative.jsObjectSet(jsObj, 'isStarred', object.isStarred);
  IsarNative.jsObjectSet(jsObj, 'listId', object.listId);
  IsarNative.jsObjectSet(jsObj, 'note', object.note);
  IsarNative.jsObjectSet(
      jsObj, 'remainder', object.remainder?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'repeat', object.repeat);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Task _taskDeserializeWeb(IsarCollection<Task> collection, dynamic jsObj) {
  final object = Task(
    due: IsarNative.jsObjectGet(jsObj, 'due') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'due'),
                isUtc: true)
            .toLocal()
        : null,
    groupId:
        IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity,
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    isChecked: IsarNative.jsObjectGet(jsObj, 'isChecked') ?? false,
    isStarred: IsarNative.jsObjectGet(jsObj, 'isStarred') ?? false,
    listId: IsarNative.jsObjectGet(jsObj, 'listId') ?? double.negativeInfinity,
    note: IsarNative.jsObjectGet(jsObj, 'note'),
    remainder: IsarNative.jsObjectGet(jsObj, 'remainder') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'remainder'),
                isUtc: true)
            .toLocal()
        : null,
    repeat: IsarNative.jsObjectGet(jsObj, 'repeat'),
    title: IsarNative.jsObjectGet(jsObj, 'title') ?? '',
  );
  return object;
}

P _taskDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'due':
      return (IsarNative.jsObjectGet(jsObj, 'due') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'due'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'groupId':
      return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'isChecked':
      return (IsarNative.jsObjectGet(jsObj, 'isChecked') ?? false) as P;
    case 'isStarred':
      return (IsarNative.jsObjectGet(jsObj, 'isStarred') ?? false) as P;
    case 'listId':
      return (IsarNative.jsObjectGet(jsObj, 'listId') ??
          double.negativeInfinity) as P;
    case 'note':
      return (IsarNative.jsObjectGet(jsObj, 'note')) as P;
    case 'remainder':
      return (IsarNative.jsObjectGet(jsObj, 'remainder') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'remainder'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'repeat':
      return (IsarNative.jsObjectGet(jsObj, 'repeat')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _taskAttachLinks(IsarCollection col, int id, Task object) {}

extension TaskQueryWhereSort on QueryBuilder<Task, Task, QWhere> {
  QueryBuilder<Task, Task, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TaskQueryWhere on QueryBuilder<Task, Task, QWhereClause> {
  QueryBuilder<Task, Task, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TaskQueryFilter on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> dueIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'due',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueEqualTo(DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'due',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'due',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'due',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'due',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> groupIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> groupIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> groupIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> groupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'groupId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isCheckedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isChecked',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isStarredEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isStarred',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> listIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> listIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> listIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> listIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'listId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'note',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'note',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> noteMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'note',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> remainderIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'remainder',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> remainderEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'remainder',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> remainderGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'remainder',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> remainderLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'remainder',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> remainderBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'remainder',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'repeat',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'repeat',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'repeat',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'repeat',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'repeat',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TaskQueryLinks on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQueryWhereSortBy on QueryBuilder<Task, Task, QSortBy> {
  QueryBuilder<Task, Task, QAfterSortBy> sortByDue() {
    return addSortByInternal('due', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDueDesc() {
    return addSortByInternal('due', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsStarred() {
    return addSortByInternal('isStarred', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsStarredDesc() {
    return addSortByInternal('isStarred', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByNote() {
    return addSortByInternal('note', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByNoteDesc() {
    return addSortByInternal('note', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRemainder() {
    return addSortByInternal('remainder', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRemainderDesc() {
    return addSortByInternal('remainder', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRepeat() {
    return addSortByInternal('repeat', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRepeatDesc() {
    return addSortByInternal('repeat', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension TaskQueryWhereSortThenBy on QueryBuilder<Task, Task, QSortThenBy> {
  QueryBuilder<Task, Task, QAfterSortBy> thenByDue() {
    return addSortByInternal('due', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDueDesc() {
    return addSortByInternal('due', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsStarred() {
    return addSortByInternal('isStarred', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsStarredDesc() {
    return addSortByInternal('isStarred', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByNote() {
    return addSortByInternal('note', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByNoteDesc() {
    return addSortByInternal('note', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRemainder() {
    return addSortByInternal('remainder', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRemainderDesc() {
    return addSortByInternal('remainder', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRepeat() {
    return addSortByInternal('repeat', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRepeatDesc() {
    return addSortByInternal('repeat', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension TaskQueryWhereDistinct on QueryBuilder<Task, Task, QDistinct> {
  QueryBuilder<Task, Task, QDistinct> distinctByDue() {
    return addDistinctByInternal('due');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<Task, Task, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsChecked() {
    return addDistinctByInternal('isChecked');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsStarred() {
    return addDistinctByInternal('isStarred');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByListId() {
    return addDistinctByInternal('listId');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('note', caseSensitive: caseSensitive);
  }

  QueryBuilder<Task, Task, QDistinct> distinctByRemainder() {
    return addDistinctByInternal('remainder');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByRepeat() {
    return addDistinctByInternal('repeat');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension TaskQueryProperty on QueryBuilder<Task, Task, QQueryProperty> {
  QueryBuilder<Task, DateTime?, QQueryOperations> dueProperty() {
    return addPropertyNameInternal('due');
  }

  QueryBuilder<Task, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<Task, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Task, bool, QQueryOperations> isCheckedProperty() {
    return addPropertyNameInternal('isChecked');
  }

  QueryBuilder<Task, bool, QQueryOperations> isStarredProperty() {
    return addPropertyNameInternal('isStarred');
  }

  QueryBuilder<Task, int, QQueryOperations> listIdProperty() {
    return addPropertyNameInternal('listId');
  }

  QueryBuilder<Task, String?, QQueryOperations> noteProperty() {
    return addPropertyNameInternal('note');
  }

  QueryBuilder<Task, DateTime?, QQueryOperations> remainderProperty() {
    return addPropertyNameInternal('remainder');
  }

  QueryBuilder<Task, int?, QQueryOperations> repeatProperty() {
    return addPropertyNameInternal('repeat');
  }

  QueryBuilder<Task, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTaskListCollection on Isar {
  IsarCollection<TaskList> get taskLists => getCollection();
}

const TaskListSchema = CollectionSchema(
  name: 'TaskList',
  schema:
      '{"name":"TaskList","idName":"id","properties":[{"name":"groupId","type":"Long"},{"name":"name","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'groupId': 0, 'name': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _taskListGetId,
  setId: _taskListSetId,
  getLinks: _taskListGetLinks,
  attachLinks: _taskListAttachLinks,
  serializeNative: _taskListSerializeNative,
  deserializeNative: _taskListDeserializeNative,
  deserializePropNative: _taskListDeserializePropNative,
  serializeWeb: _taskListSerializeWeb,
  deserializeWeb: _taskListDeserializeWeb,
  deserializePropWeb: _taskListDeserializePropWeb,
  version: 3,
);

int? _taskListGetId(TaskList object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _taskListSetId(TaskList object, int id) {
  object.id = id;
}

List<IsarLinkBase> _taskListGetLinks(TaskList object) {
  return [];
}

void _taskListSerializeNative(
    IsarCollection<TaskList> collection,
    IsarRawObject rawObj,
    TaskList object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.groupId;
  final _groupId = value0;
  final value1 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_name.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _groupId);
  writer.writeBytes(offsets[1], _name);
}

TaskList _taskListDeserializeNative(IsarCollection<TaskList> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = TaskList(
    groupId: reader.readLong(offsets[0]),
    id: id,
    name: reader.readString(offsets[1]),
  );
  return object;
}

P _taskListDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _taskListSerializeWeb(
    IsarCollection<TaskList> collection, TaskList object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

TaskList _taskListDeserializeWeb(
    IsarCollection<TaskList> collection, dynamic jsObj) {
  final object = TaskList(
    groupId:
        IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity,
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
  );
  return object;
}

P _taskListDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'groupId':
      return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _taskListAttachLinks(IsarCollection col, int id, TaskList object) {}

extension TaskListQueryWhereSort on QueryBuilder<TaskList, TaskList, QWhere> {
  QueryBuilder<TaskList, TaskList, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TaskListQueryWhere on QueryBuilder<TaskList, TaskList, QWhereClause> {
  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TaskListQueryFilter
    on QueryBuilder<TaskList, TaskList, QFilterCondition> {
  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> groupIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> groupIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> groupIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> groupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'groupId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TaskListQueryLinks
    on QueryBuilder<TaskList, TaskList, QFilterCondition> {}

extension TaskListQueryWhereSortBy
    on QueryBuilder<TaskList, TaskList, QSortBy> {
  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension TaskListQueryWhereSortThenBy
    on QueryBuilder<TaskList, TaskList, QSortThenBy> {
  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension TaskListQueryWhereDistinct
    on QueryBuilder<TaskList, TaskList, QDistinct> {
  QueryBuilder<TaskList, TaskList, QDistinct> distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<TaskList, TaskList, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TaskList, TaskList, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension TaskListQueryProperty
    on QueryBuilder<TaskList, TaskList, QQueryProperty> {
  QueryBuilder<TaskList, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<TaskList, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TaskList, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetGroupCollection on Isar {
  IsarCollection<Group> get groups => getCollection();
}

const GroupSchema = CollectionSchema(
  name: 'Group',
  schema:
      '{"name":"Group","idName":"id","properties":[{"name":"name","type":"String"}],"indexes":[{"name":"name","unique":true,"properties":[{"name":"name","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'name': 0},
  listProperties: {},
  indexIds: {'name': 0},
  indexValueTypes: {
    'name': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _groupGetId,
  setId: _groupSetId,
  getLinks: _groupGetLinks,
  attachLinks: _groupAttachLinks,
  serializeNative: _groupSerializeNative,
  deserializeNative: _groupDeserializeNative,
  deserializePropNative: _groupDeserializePropNative,
  serializeWeb: _groupSerializeWeb,
  deserializeWeb: _groupDeserializeWeb,
  deserializePropWeb: _groupDeserializePropWeb,
  version: 3,
);

int? _groupGetId(Group object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _groupSetId(Group object, int id) {
  object.id = id;
}

List<IsarLinkBase> _groupGetLinks(Group object) {
  return [];
}

void _groupSerializeNative(
    IsarCollection<Group> collection,
    IsarRawObject rawObj,
    Group object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_name.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _name);
}

Group _groupDeserializeNative(IsarCollection<Group> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Group(
    id: id,
    name: reader.readString(offsets[0]),
  );
  return object;
}

P _groupDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _groupSerializeWeb(IsarCollection<Group> collection, Group object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

Group _groupDeserializeWeb(IsarCollection<Group> collection, dynamic jsObj) {
  final object = Group(
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
  );
  return object;
}

P _groupDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _groupAttachLinks(IsarCollection col, int id, Group object) {}

extension GroupByIndex on IsarCollection<Group> {
  Future<Group?> getByName(String name) {
    return getByIndex('name', [name]);
  }

  Group? getByNameSync(String name) {
    return getByIndexSync('name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex('name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync('name', [name]);
  }

  Future<List<Group?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex('name', values);
  }

  List<Group?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync('name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex('name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('name', values);
  }
}

extension GroupQueryWhereSort on QueryBuilder<Group, Group, QWhere> {
  QueryBuilder<Group, Group, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Group, Group, QAfterWhere> anyName() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'name'));
  }
}

extension GroupQueryWhere on QueryBuilder<Group, Group, QWhereClause> {
  QueryBuilder<Group, Group, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Group, Group, QAfterWhereClause> nameEqualTo(String name) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'name',
      value: [name],
    ));
  }

  QueryBuilder<Group, Group, QAfterWhereClause> nameNotEqualTo(String name) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      ));
    }
  }
}

extension GroupQueryFilter on QueryBuilder<Group, Group, QFilterCondition> {
  QueryBuilder<Group, Group, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension GroupQueryLinks on QueryBuilder<Group, Group, QFilterCondition> {}

extension GroupQueryWhereSortBy on QueryBuilder<Group, Group, QSortBy> {
  QueryBuilder<Group, Group, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension GroupQueryWhereSortThenBy on QueryBuilder<Group, Group, QSortThenBy> {
  QueryBuilder<Group, Group, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension GroupQueryWhereDistinct on QueryBuilder<Group, Group, QDistinct> {
  QueryBuilder<Group, Group, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Group, Group, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension GroupQueryProperty on QueryBuilder<Group, Group, QQueryProperty> {
  QueryBuilder<Group, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Group, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}
