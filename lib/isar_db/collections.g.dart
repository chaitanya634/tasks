// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_local_identifiers

part of 'collections.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSubtasksCollection on Isar {
  IsarCollection<Subtasks> get subtaskss => getCollection();
}

const SubtasksSchema = CollectionSchema(
  name: 'Subtasks',
  schema:
      '{"name":"Subtasks","idName":"id","properties":[{"name":"groupId","type":"Long"},{"name":"isChecked","type":"Bool"},{"name":"listId","type":"Long"},{"name":"taskId","type":"Long"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
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
  getId: _subtasksGetId,
  setId: _subtasksSetId,
  getLinks: _subtasksGetLinks,
  attachLinks: _subtasksAttachLinks,
  serializeNative: _subtasksSerializeNative,
  deserializeNative: _subtasksDeserializeNative,
  deserializePropNative: _subtasksDeserializePropNative,
  serializeWeb: _subtasksSerializeWeb,
  deserializeWeb: _subtasksDeserializeWeb,
  deserializePropWeb: _subtasksDeserializePropWeb,
  version: 3,
);

int? _subtasksGetId(Subtasks object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _subtasksSetId(Subtasks object, int id) {
  object.id = id;
}

List<IsarLinkBase> _subtasksGetLinks(Subtasks object) {
  return [];
}

void _subtasksSerializeNative(
    IsarCollection<Subtasks> collection,
    IsarRawObject rawObj,
    Subtasks object,
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

Subtasks _subtasksDeserializeNative(IsarCollection<Subtasks> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Subtasks();
  object.groupId = reader.readLong(offsets[0]);
  object.id = id;
  object.isChecked = reader.readBool(offsets[1]);
  object.listId = reader.readLong(offsets[2]);
  object.taskId = reader.readLong(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  return object;
}

P _subtasksDeserializePropNative<P>(
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

dynamic _subtasksSerializeWeb(
    IsarCollection<Subtasks> collection, Subtasks object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isChecked', object.isChecked);
  IsarNative.jsObjectSet(jsObj, 'listId', object.listId);
  IsarNative.jsObjectSet(jsObj, 'taskId', object.taskId);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Subtasks _subtasksDeserializeWeb(
    IsarCollection<Subtasks> collection, dynamic jsObj) {
  final object = Subtasks();
  object.groupId =
      IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.isChecked = IsarNative.jsObjectGet(jsObj, 'isChecked') ?? false;
  object.listId =
      IsarNative.jsObjectGet(jsObj, 'listId') ?? double.negativeInfinity;
  object.taskId =
      IsarNative.jsObjectGet(jsObj, 'taskId') ?? double.negativeInfinity;
  object.title = IsarNative.jsObjectGet(jsObj, 'title');
  return object;
}

P _subtasksDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'groupId':
      return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
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

void _subtasksAttachLinks(IsarCollection col, int id, Subtasks object) {}

extension SubtasksQueryWhereSort on QueryBuilder<Subtasks, Subtasks, QWhere> {
  QueryBuilder<Subtasks, Subtasks, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SubtasksQueryWhere on QueryBuilder<Subtasks, Subtasks, QWhereClause> {
  QueryBuilder<Subtasks, Subtasks, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Subtasks, Subtasks, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Subtasks, Subtasks, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Subtasks, Subtasks, QAfterWhereClause> idBetween(
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

extension SubtasksQueryFilter
    on QueryBuilder<Subtasks, Subtasks, QFilterCondition> {
  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> groupIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> groupIdGreaterThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> groupIdLessThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> groupIdBetween(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> isCheckedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isChecked',
      value: value,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> listIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> listIdGreaterThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> listIdLessThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> listIdBetween(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> taskIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'taskId',
      value: value,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> taskIdGreaterThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> taskIdLessThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> taskIdBetween(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'title',
      value: null,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Subtasks, Subtasks, QAfterFilterCondition> titleMatches(
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

extension SubtasksQueryLinks
    on QueryBuilder<Subtasks, Subtasks, QFilterCondition> {}

extension SubtasksQueryWhereSortBy
    on QueryBuilder<Subtasks, Subtasks, QSortBy> {
  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByTaskId() {
    return addSortByInternal('taskId', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByTaskIdDesc() {
    return addSortByInternal('taskId', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension SubtasksQueryWhereSortThenBy
    on QueryBuilder<Subtasks, Subtasks, QSortThenBy> {
  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByTaskId() {
    return addSortByInternal('taskId', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByTaskIdDesc() {
    return addSortByInternal('taskId', Sort.desc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Subtasks, Subtasks, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension SubtasksQueryWhereDistinct
    on QueryBuilder<Subtasks, Subtasks, QDistinct> {
  QueryBuilder<Subtasks, Subtasks, QDistinct> distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<Subtasks, Subtasks, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Subtasks, Subtasks, QDistinct> distinctByIsChecked() {
    return addDistinctByInternal('isChecked');
  }

  QueryBuilder<Subtasks, Subtasks, QDistinct> distinctByListId() {
    return addDistinctByInternal('listId');
  }

  QueryBuilder<Subtasks, Subtasks, QDistinct> distinctByTaskId() {
    return addDistinctByInternal('taskId');
  }

  QueryBuilder<Subtasks, Subtasks, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension SubtasksQueryProperty
    on QueryBuilder<Subtasks, Subtasks, QQueryProperty> {
  QueryBuilder<Subtasks, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<Subtasks, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Subtasks, bool, QQueryOperations> isCheckedProperty() {
    return addPropertyNameInternal('isChecked');
  }

  QueryBuilder<Subtasks, int, QQueryOperations> listIdProperty() {
    return addPropertyNameInternal('listId');
  }

  QueryBuilder<Subtasks, int, QQueryOperations> taskIdProperty() {
    return addPropertyNameInternal('taskId');
  }

  QueryBuilder<Subtasks, String?, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTasksCollection on Isar {
  IsarCollection<Tasks> get taskss => getCollection();
}

const TasksSchema = CollectionSchema(
  name: 'Tasks',
  schema:
      '{"name":"Tasks","idName":"id","properties":[{"name":"due","type":"Long"},{"name":"groupId","type":"Long"},{"name":"isChecked","type":"Bool"},{"name":"isStarred","type":"Bool"},{"name":"listId","type":"Long"},{"name":"note","type":"String"},{"name":"remainder","type":"Long"},{"name":"repeat","type":"Long"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
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
  getId: _tasksGetId,
  setId: _tasksSetId,
  getLinks: _tasksGetLinks,
  attachLinks: _tasksAttachLinks,
  serializeNative: _tasksSerializeNative,
  deserializeNative: _tasksDeserializeNative,
  deserializePropNative: _tasksDeserializePropNative,
  serializeWeb: _tasksSerializeWeb,
  deserializeWeb: _tasksDeserializeWeb,
  deserializePropWeb: _tasksDeserializePropWeb,
  version: 3,
);

int? _tasksGetId(Tasks object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tasksSetId(Tasks object, int id) {
  object.id = id;
}

List<IsarLinkBase> _tasksGetLinks(Tasks object) {
  return [];
}

void _tasksSerializeNative(
    IsarCollection<Tasks> collection,
    IsarRawObject rawObj,
    Tasks object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
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
  IsarUint8List? _title;
  if (value8 != null) {
    _title = IsarBinaryWriter.utf8Encoder.convert(value8);
  }
  dynamicSize += (_title?.length ?? 0) as int;
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

Tasks _tasksDeserializeNative(IsarCollection<Tasks> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Tasks();
  object.due = reader.readDateTimeOrNull(offsets[0]);
  object.groupId = reader.readLong(offsets[1]);
  object.id = id;
  object.isChecked = reader.readBool(offsets[2]);
  object.isStarred = reader.readBool(offsets[3]);
  object.listId = reader.readLong(offsets[4]);
  object.note = reader.readStringOrNull(offsets[5]);
  object.remainder = reader.readDateTimeOrNull(offsets[6]);
  object.repeat = reader.readLongOrNull(offsets[7]);
  object.title = reader.readStringOrNull(offsets[8]);
  return object;
}

P _tasksDeserializePropNative<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _tasksSerializeWeb(IsarCollection<Tasks> collection, Tasks object) {
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

Tasks _tasksDeserializeWeb(IsarCollection<Tasks> collection, dynamic jsObj) {
  final object = Tasks();
  object.due = IsarNative.jsObjectGet(jsObj, 'due') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'due'),
              isUtc: true)
          .toLocal()
      : null;
  object.groupId =
      IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.isChecked = IsarNative.jsObjectGet(jsObj, 'isChecked') ?? false;
  object.isStarred = IsarNative.jsObjectGet(jsObj, 'isStarred') ?? false;
  object.listId =
      IsarNative.jsObjectGet(jsObj, 'listId') ?? double.negativeInfinity;
  object.note = IsarNative.jsObjectGet(jsObj, 'note');
  object.remainder = IsarNative.jsObjectGet(jsObj, 'remainder') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'remainder'),
              isUtc: true)
          .toLocal()
      : null;
  object.repeat = IsarNative.jsObjectGet(jsObj, 'repeat');
  object.title = IsarNative.jsObjectGet(jsObj, 'title');
  return object;
}

P _tasksDeserializePropWeb<P>(Object jsObj, String propertyName) {
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
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
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
      return (IsarNative.jsObjectGet(jsObj, 'title')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tasksAttachLinks(IsarCollection col, int id, Tasks object) {}

extension TasksQueryWhereSort on QueryBuilder<Tasks, Tasks, QWhere> {
  QueryBuilder<Tasks, Tasks, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TasksQueryWhere on QueryBuilder<Tasks, Tasks, QWhereClause> {
  QueryBuilder<Tasks, Tasks, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Tasks, Tasks, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Tasks, Tasks, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Tasks, Tasks, QAfterWhereClause> idBetween(
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

extension TasksQueryFilter on QueryBuilder<Tasks, Tasks, QFilterCondition> {
  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> dueIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'due',
      value: null,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> dueEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'due',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> dueGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> dueLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> dueBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> groupIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> groupIdGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> groupIdLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> groupIdBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> isCheckedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isChecked',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> isStarredEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isStarred',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> listIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'listId',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> listIdGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> listIdLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> listIdBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'note',
      value: null,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> noteMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'note',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> remainderIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'remainder',
      value: null,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> remainderEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'remainder',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> remainderGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> remainderLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> remainderBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> repeatIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'repeat',
      value: null,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> repeatEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'repeat',
      value: value,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> repeatGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> repeatLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> repeatBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'title',
      value: null,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tasks, Tasks, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TasksQueryLinks on QueryBuilder<Tasks, Tasks, QFilterCondition> {}

extension TasksQueryWhereSortBy on QueryBuilder<Tasks, Tasks, QSortBy> {
  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByDue() {
    return addSortByInternal('due', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByDueDesc() {
    return addSortByInternal('due', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByIsStarred() {
    return addSortByInternal('isStarred', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByIsStarredDesc() {
    return addSortByInternal('isStarred', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByNote() {
    return addSortByInternal('note', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByNoteDesc() {
    return addSortByInternal('note', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByRemainder() {
    return addSortByInternal('remainder', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByRemainderDesc() {
    return addSortByInternal('remainder', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByRepeat() {
    return addSortByInternal('repeat', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByRepeatDesc() {
    return addSortByInternal('repeat', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension TasksQueryWhereSortThenBy on QueryBuilder<Tasks, Tasks, QSortThenBy> {
  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByDue() {
    return addSortByInternal('due', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByDueDesc() {
    return addSortByInternal('due', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByIsChecked() {
    return addSortByInternal('isChecked', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByIsCheckedDesc() {
    return addSortByInternal('isChecked', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByIsStarred() {
    return addSortByInternal('isStarred', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByIsStarredDesc() {
    return addSortByInternal('isStarred', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByListId() {
    return addSortByInternal('listId', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByListIdDesc() {
    return addSortByInternal('listId', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByNote() {
    return addSortByInternal('note', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByNoteDesc() {
    return addSortByInternal('note', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByRemainder() {
    return addSortByInternal('remainder', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByRemainderDesc() {
    return addSortByInternal('remainder', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByRepeat() {
    return addSortByInternal('repeat', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByRepeatDesc() {
    return addSortByInternal('repeat', Sort.desc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Tasks, Tasks, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension TasksQueryWhereDistinct on QueryBuilder<Tasks, Tasks, QDistinct> {
  QueryBuilder<Tasks, Tasks, QDistinct> distinctByDue() {
    return addDistinctByInternal('due');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByIsChecked() {
    return addDistinctByInternal('isChecked');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByIsStarred() {
    return addDistinctByInternal('isStarred');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByListId() {
    return addDistinctByInternal('listId');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('note', caseSensitive: caseSensitive);
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByRemainder() {
    return addDistinctByInternal('remainder');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByRepeat() {
    return addDistinctByInternal('repeat');
  }

  QueryBuilder<Tasks, Tasks, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension TasksQueryProperty on QueryBuilder<Tasks, Tasks, QQueryProperty> {
  QueryBuilder<Tasks, DateTime?, QQueryOperations> dueProperty() {
    return addPropertyNameInternal('due');
  }

  QueryBuilder<Tasks, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<Tasks, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Tasks, bool, QQueryOperations> isCheckedProperty() {
    return addPropertyNameInternal('isChecked');
  }

  QueryBuilder<Tasks, bool, QQueryOperations> isStarredProperty() {
    return addPropertyNameInternal('isStarred');
  }

  QueryBuilder<Tasks, int, QQueryOperations> listIdProperty() {
    return addPropertyNameInternal('listId');
  }

  QueryBuilder<Tasks, String?, QQueryOperations> noteProperty() {
    return addPropertyNameInternal('note');
  }

  QueryBuilder<Tasks, DateTime?, QQueryOperations> remainderProperty() {
    return addPropertyNameInternal('remainder');
  }

  QueryBuilder<Tasks, int?, QQueryOperations> repeatProperty() {
    return addPropertyNameInternal('repeat');
  }

  QueryBuilder<Tasks, String?, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetListsCollection on Isar {
  IsarCollection<Lists> get listss => getCollection();
}

const ListsSchema = CollectionSchema(
  name: 'Lists',
  schema:
      '{"name":"Lists","idName":"id","properties":[{"name":"groupId","type":"Long"},{"name":"name","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'groupId': 0, 'name': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _listsGetId,
  setId: _listsSetId,
  getLinks: _listsGetLinks,
  attachLinks: _listsAttachLinks,
  serializeNative: _listsSerializeNative,
  deserializeNative: _listsDeserializeNative,
  deserializePropNative: _listsDeserializePropNative,
  serializeWeb: _listsSerializeWeb,
  deserializeWeb: _listsDeserializeWeb,
  deserializePropWeb: _listsDeserializePropWeb,
  version: 3,
);

int? _listsGetId(Lists object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _listsSetId(Lists object, int id) {
  object.id = id;
}

List<IsarLinkBase> _listsGetLinks(Lists object) {
  return [];
}

void _listsSerializeNative(
    IsarCollection<Lists> collection,
    IsarRawObject rawObj,
    Lists object,
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

Lists _listsDeserializeNative(IsarCollection<Lists> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Lists();
  object.groupId = reader.readLong(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  return object;
}

P _listsDeserializePropNative<P>(
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

dynamic _listsSerializeWeb(IsarCollection<Lists> collection, Lists object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

Lists _listsDeserializeWeb(IsarCollection<Lists> collection, dynamic jsObj) {
  final object = Lists();
  object.groupId =
      IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  return object;
}

P _listsDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'groupId':
      return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _listsAttachLinks(IsarCollection col, int id, Lists object) {}

extension ListsQueryWhereSort on QueryBuilder<Lists, Lists, QWhere> {
  QueryBuilder<Lists, Lists, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension ListsQueryWhere on QueryBuilder<Lists, Lists, QWhereClause> {
  QueryBuilder<Lists, Lists, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Lists, Lists, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Lists, Lists, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Lists, Lists, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Lists, Lists, QAfterWhereClause> idBetween(
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

extension ListsQueryFilter on QueryBuilder<Lists, Lists, QFilterCondition> {
  QueryBuilder<Lists, Lists, QAfterFilterCondition> groupIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<Lists, Lists, QAfterFilterCondition> groupIdGreaterThan(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> groupIdLessThan(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> groupIdBetween(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Lists, Lists, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Lists, Lists, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Lists, Lists, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ListsQueryLinks on QueryBuilder<Lists, Lists, QFilterCondition> {}

extension ListsQueryWhereSortBy on QueryBuilder<Lists, Lists, QSortBy> {
  QueryBuilder<Lists, Lists, QAfterSortBy> sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension ListsQueryWhereSortThenBy on QueryBuilder<Lists, Lists, QSortThenBy> {
  QueryBuilder<Lists, Lists, QAfterSortBy> thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Lists, Lists, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension ListsQueryWhereDistinct on QueryBuilder<Lists, Lists, QDistinct> {
  QueryBuilder<Lists, Lists, QDistinct> distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<Lists, Lists, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Lists, Lists, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension ListsQueryProperty on QueryBuilder<Lists, Lists, QQueryProperty> {
  QueryBuilder<Lists, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<Lists, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Lists, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetGroupsCollection on Isar {
  IsarCollection<Groups> get groupss => getCollection();
}

const GroupsSchema = CollectionSchema(
  name: 'Groups',
  schema:
      '{"name":"Groups","idName":"id","properties":[{"name":"name","type":"String"}],"indexes":[{"name":"name","unique":true,"properties":[{"name":"name","type":"Hash","caseSensitive":true}]}],"links":[]}',
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
  getId: _groupsGetId,
  setId: _groupsSetId,
  getLinks: _groupsGetLinks,
  attachLinks: _groupsAttachLinks,
  serializeNative: _groupsSerializeNative,
  deserializeNative: _groupsDeserializeNative,
  deserializePropNative: _groupsDeserializePropNative,
  serializeWeb: _groupsSerializeWeb,
  deserializeWeb: _groupsDeserializeWeb,
  deserializePropWeb: _groupsDeserializePropWeb,
  version: 3,
);

int? _groupsGetId(Groups object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _groupsSetId(Groups object, int id) {
  object.id = id;
}

List<IsarLinkBase> _groupsGetLinks(Groups object) {
  return [];
}

void _groupsSerializeNative(
    IsarCollection<Groups> collection,
    IsarRawObject rawObj,
    Groups object,
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

Groups _groupsDeserializeNative(IsarCollection<Groups> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Groups();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _groupsDeserializePropNative<P>(
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

dynamic _groupsSerializeWeb(IsarCollection<Groups> collection, Groups object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

Groups _groupsDeserializeWeb(IsarCollection<Groups> collection, dynamic jsObj) {
  final object = Groups();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  return object;
}

P _groupsDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _groupsAttachLinks(IsarCollection col, int id, Groups object) {}

extension GroupsByIndex on IsarCollection<Groups> {
  Future<Groups?> getByName(String name) {
    return getByIndex('name', [name]);
  }

  Groups? getByNameSync(String name) {
    return getByIndexSync('name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex('name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync('name', [name]);
  }

  Future<List<Groups?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex('name', values);
  }

  List<Groups?> getAllByNameSync(List<String> nameValues) {
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

extension GroupsQueryWhereSort on QueryBuilder<Groups, Groups, QWhere> {
  QueryBuilder<Groups, Groups, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Groups, Groups, QAfterWhere> anyName() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'name'));
  }
}

extension GroupsQueryWhere on QueryBuilder<Groups, Groups, QWhereClause> {
  QueryBuilder<Groups, Groups, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Groups, Groups, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> idBetween(
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

  QueryBuilder<Groups, Groups, QAfterWhereClause> nameEqualTo(String name) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'name',
      value: [name],
    ));
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> nameNotEqualTo(String name) {
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

extension GroupsQueryFilter on QueryBuilder<Groups, Groups, QFilterCondition> {
  QueryBuilder<Groups, Groups, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> nameMatches(
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

extension GroupsQueryLinks on QueryBuilder<Groups, Groups, QFilterCondition> {}

extension GroupsQueryWhereSortBy on QueryBuilder<Groups, Groups, QSortBy> {
  QueryBuilder<Groups, Groups, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension GroupsQueryWhereSortThenBy
    on QueryBuilder<Groups, Groups, QSortThenBy> {
  QueryBuilder<Groups, Groups, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension GroupsQueryWhereDistinct on QueryBuilder<Groups, Groups, QDistinct> {
  QueryBuilder<Groups, Groups, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Groups, Groups, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension GroupsQueryProperty on QueryBuilder<Groups, Groups, QQueryProperty> {
  QueryBuilder<Groups, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Groups, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}
