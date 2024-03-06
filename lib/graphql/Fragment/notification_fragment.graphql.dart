import 'package:task_manager/schema.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';

class Fragment$NotificationFragment {
  Fragment$NotificationFragment({
    required this.id,
    required this.content,
    required this.data,
    required this.is_seen,
    required this.title,
    required this.topic,
    required this.createdAt,
    required this.creater,
    this.$__typename = 'Notification',
  });

  factory Fragment$NotificationFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$content = json['content'];
    final l$data = json['data'];
    final l$isSeen = json['is_seen'];
    final l$title = json['title'];
    final l$topic = json['topic'];
    final l$createdAt = json['createdAt'];
    final l$creater = json['creater'];
    final l$$__typename = json['__typename'];
    return Fragment$NotificationFragment(
      id: (l$id as String),
      content: (l$content as String),
      data: (l$data as String),
      is_seen: (l$isSeen as bool),
      title: (l$title as String),
      topic: fromJson$Enum$TopicNotification((l$topic as String)),
      createdAt: (l$createdAt as String),
      creater:
          Fragment$UserFragment.fromJson((l$creater as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String content;

  final String data;

  final bool is_seen;

  final String title;

  final Enum$TopicNotification topic;

  final String createdAt;

  final Fragment$UserFragment creater;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$content = content;
    resultData['content'] = l$content;
    final l$data = data;
    resultData['data'] = l$data;
    final l$isSeen = is_seen;
    resultData['is_seen'] = l$isSeen;
    final l$title = title;
    resultData['title'] = l$title;
    final l$topic = topic;
    resultData['topic'] = toJson$Enum$TopicNotification(l$topic);
    final l$createdAt = createdAt;
    resultData['createdAt'] = l$createdAt;
    final l$creater = creater;
    resultData['creater'] = l$creater.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$data = data;
    final l$isSeen = is_seen;
    final l$title = title;
    final l$topic = topic;
    final l$createdAt = createdAt;
    final l$creater = creater;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$content,
      l$data,
      l$isSeen,
      l$title,
      l$topic,
      l$createdAt,
      l$creater,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$NotificationFragment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    final l$isSeen = is_seen;
    final lother$isSeen = other.is_seen;
    if (l$isSeen != lother$isSeen) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$topic = topic;
    final lOther$topic = other.topic;
    if (l$topic != lOther$topic) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$creater = creater;
    final lOther$creater = other.creater;
    if (l$creater != lOther$creater) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$NotificationFragment
    on Fragment$NotificationFragment {
  CopyWith$Fragment$NotificationFragment<Fragment$NotificationFragment>
      get copyWith => CopyWith$Fragment$NotificationFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$NotificationFragment<TRes> {
  factory CopyWith$Fragment$NotificationFragment(
    Fragment$NotificationFragment instance,
    TRes Function(Fragment$NotificationFragment) then,
  ) = _CopyWithImpl$Fragment$NotificationFragment;

  factory CopyWith$Fragment$NotificationFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$NotificationFragment;

  TRes call({
    String? id,
    String? content,
    String? data,
    bool? is_seen,
    String? title,
    Enum$TopicNotification? topic,
    String? createdAt,
    Fragment$UserFragment? creater,
    String? $__typename,
  });
  CopyWith$Fragment$UserFragment<TRes> get creater;
}

class _CopyWithImpl$Fragment$NotificationFragment<TRes>
    implements CopyWith$Fragment$NotificationFragment<TRes> {
  _CopyWithImpl$Fragment$NotificationFragment(
    this._instance,
    this._then,
  );

  final Fragment$NotificationFragment _instance;

  final TRes Function(Fragment$NotificationFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? content = _undefined,
    Object? data = _undefined,
    Object? is_seen = _undefined,
    Object? title = _undefined,
    Object? topic = _undefined,
    Object? createdAt = _undefined,
    Object? creater = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$NotificationFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        data: data == _undefined || data == null
            ? _instance.data
            : (data as String),
        is_seen: is_seen == _undefined || is_seen == null
            ? _instance.is_seen
            : (is_seen as bool),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        topic: topic == _undefined || topic == null
            ? _instance.topic
            : (topic as Enum$TopicNotification),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        creater: creater == _undefined || creater == null
            ? _instance.creater
            : (creater as Fragment$UserFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  CopyWith$Fragment$UserFragment<TRes> get creater {
    final local$creater = _instance.creater;
    return CopyWith$Fragment$UserFragment(
        local$creater, (e) => call(creater: e),);
  }
}

class _CopyWithStubImpl$Fragment$NotificationFragment<TRes>
    implements CopyWith$Fragment$NotificationFragment<TRes> {
  _CopyWithStubImpl$Fragment$NotificationFragment(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? content,
    String? data,
    bool? is_seen,
    String? title,
    Enum$TopicNotification? topic,
    String? createdAt,
    Fragment$UserFragment? creater,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$UserFragment<TRes> get creater =>
      CopyWith$Fragment$UserFragment.stub(_res);
}

const fragmentDefinitionNotificationFragment = FragmentDefinitionNode(
  name: NameNode(value: 'NotificationFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Notification'),
    isNonNull: false,
  ),),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'content'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'data'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'is_seen'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'topic'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'creater'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'UserFragment'),
          directives: [],
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ],),
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ],),
);
const documentNodeFragmentNotificationFragment = DocumentNode(definitions: [
  fragmentDefinitionNotificationFragment,
  fragmentDefinitionUserFragment,
],);

extension ClientExtension$Fragment$NotificationFragment
    on graphql.GraphQLClient {
  void writeFragment$NotificationFragment({
    required Fragment$NotificationFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'NotificationFragment',
            document: documentNodeFragmentNotificationFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$NotificationFragment? readFragment$NotificationFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'NotificationFragment',
          document: documentNodeFragmentNotificationFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$NotificationFragment.fromJson(result);
  }
}
