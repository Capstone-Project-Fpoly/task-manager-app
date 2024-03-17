import '../../schema.graphql.dart';
import 'check_list_fragment.graphql.dart';
import 'comment_fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'user_fragment.graphql.dart';

class Fragment$CardFragment {
  Fragment$CardFragment({
    required this.id,
    this.title,
    this.description,
    this.users,
    this.endDate,
    this.startedDate,
    required this.reminder,
    this.comments,
    this.checkLists,
    required this.createdAt,
    required this.createdBy,
    this.$__typename = 'Card',
  });

  factory Fragment$CardFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$users = json['users'];
    final l$endDate = json['endDate'];
    final l$startedDate = json['startedDate'];
    final l$reminder = json['reminder'];
    final l$comments = json['comments'];
    final l$checkLists = json['checkLists'];
    final l$createdAt = json['createdAt'];
    final l$createdBy = json['createdBy'];
    final l$$__typename = json['__typename'];
    return Fragment$CardFragment(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      users: (l$users as List<dynamic>?)
          ?.map((e) =>
              Fragment$UserFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      endDate: (l$endDate as String?),
      startedDate: (l$startedDate as String?),
      reminder: fromJson$Enum$Reminder((l$reminder as String)),
      comments: (l$comments as List<dynamic>?)
          ?.map((e) =>
              Fragment$CommentFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      checkLists: (l$checkLists as List<dynamic>?)
          ?.map(
            (e) => Fragment$CheckListFragment.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      createdAt: (l$createdAt as String),
      createdBy:
          Fragment$UserFragment.fromJson((l$createdBy as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final List<Fragment$UserFragment>? users;

  final String? endDate;

  final String? startedDate;

  final Enum$Reminder reminder;

  final List<Fragment$CommentFragment>? comments;

  final List<Fragment$CheckListFragment>? checkLists;

  final String createdAt;

  final Fragment$UserFragment createdBy;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$users = users;
    _resultData['users'] = l$users?.map((e) => e.toJson()).toList();
    final l$endDate = endDate;
    _resultData['endDate'] = l$endDate;
    final l$startedDate = startedDate;
    _resultData['startedDate'] = l$startedDate;
    final l$reminder = reminder;
    _resultData['reminder'] = toJson$Enum$Reminder(l$reminder);
    final l$comments = comments;
    _resultData['comments'] = l$comments?.map((e) => e.toJson()).toList();
    final l$checkLists = checkLists;
    _resultData['checkLists'] = l$checkLists?.map((e) => e.toJson()).toList();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$createdBy = createdBy;
    _resultData['createdBy'] = l$createdBy.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$users = users;
    final l$endDate = endDate;
    final l$startedDate = startedDate;
    final l$reminder = reminder;
    final l$comments = comments;
    final l$checkLists = checkLists;
    final l$createdAt = createdAt;
    final l$createdBy = createdBy;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$users == null ? null : Object.hashAll(l$users.map((v) => v)),
      l$endDate,
      l$startedDate,
      l$reminder,
      l$comments == null ? null : Object.hashAll(l$comments.map((v) => v)),
      l$checkLists == null ? null : Object.hashAll(l$checkLists.map((v) => v)),
      l$createdAt,
      l$createdBy,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CardFragment) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$users = users;
    final lOther$users = other.users;
    if (l$users != null && lOther$users != null) {
      if (l$users.length != lOther$users.length) {
        return false;
      }
      for (int i = 0; i < l$users.length; i++) {
        final l$users$entry = l$users[i];
        final lOther$users$entry = lOther$users[i];
        if (l$users$entry != lOther$users$entry) {
          return false;
        }
      }
    } else if (l$users != lOther$users) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$startedDate = startedDate;
    final lOther$startedDate = other.startedDate;
    if (l$startedDate != lOther$startedDate) {
      return false;
    }
    final l$reminder = reminder;
    final lOther$reminder = other.reminder;
    if (l$reminder != lOther$reminder) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments != null && lOther$comments != null) {
      if (l$comments.length != lOther$comments.length) {
        return false;
      }
      for (int i = 0; i < l$comments.length; i++) {
        final l$comments$entry = l$comments[i];
        final lOther$comments$entry = lOther$comments[i];
        if (l$comments$entry != lOther$comments$entry) {
          return false;
        }
      }
    } else if (l$comments != lOther$comments) {
      return false;
    }
    final l$checkLists = checkLists;
    final lOther$checkLists = other.checkLists;
    if (l$checkLists != null && lOther$checkLists != null) {
      if (l$checkLists.length != lOther$checkLists.length) {
        return false;
      }
      for (int i = 0; i < l$checkLists.length; i++) {
        final l$checkLists$entry = l$checkLists[i];
        final lOther$checkLists$entry = lOther$checkLists[i];
        if (l$checkLists$entry != lOther$checkLists$entry) {
          return false;
        }
      }
    } else if (l$checkLists != lOther$checkLists) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$createdBy = createdBy;
    final lOther$createdBy = other.createdBy;
    if (l$createdBy != lOther$createdBy) {
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

extension UtilityExtension$Fragment$CardFragment on Fragment$CardFragment {
  CopyWith$Fragment$CardFragment<Fragment$CardFragment> get copyWith =>
      CopyWith$Fragment$CardFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CardFragment<TRes> {
  factory CopyWith$Fragment$CardFragment(
    Fragment$CardFragment instance,
    TRes Function(Fragment$CardFragment) then,
  ) = _CopyWithImpl$Fragment$CardFragment;

  factory CopyWith$Fragment$CardFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CardFragment;

  TRes call({
    String? id,
    String? title,
    String? description,
    List<Fragment$UserFragment>? users,
    String? endDate,
    String? startedDate,
    Enum$Reminder? reminder,
    List<Fragment$CommentFragment>? comments,
    List<Fragment$CheckListFragment>? checkLists,
    String? createdAt,
    Fragment$UserFragment? createdBy,
    String? $__typename,
  });
  TRes users(
      Iterable<Fragment$UserFragment>? Function(
              Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>>?)
          _fn);
  TRes comments(
      Iterable<Fragment$CommentFragment>? Function(
              Iterable<
                  CopyWith$Fragment$CommentFragment<Fragment$CommentFragment>>?)
          _fn);
  TRes checkLists(
      Iterable<Fragment$CheckListFragment>? Function(
              Iterable<
                  CopyWith$Fragment$CheckListFragment<
                      Fragment$CheckListFragment>>?)
          _fn);
  CopyWith$Fragment$UserFragment<TRes> get createdBy;
}

class _CopyWithImpl$Fragment$CardFragment<TRes>
    implements CopyWith$Fragment$CardFragment<TRes> {
  _CopyWithImpl$Fragment$CardFragment(
    this._instance,
    this._then,
  );

  final Fragment$CardFragment _instance;

  final TRes Function(Fragment$CardFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? users = _undefined,
    Object? endDate = _undefined,
    Object? startedDate = _undefined,
    Object? reminder = _undefined,
    Object? comments = _undefined,
    Object? checkLists = _undefined,
    Object? createdAt = _undefined,
    Object? createdBy = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CardFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        users: users == _undefined
            ? _instance.users
            : (users as List<Fragment$UserFragment>?),
        endDate:
            endDate == _undefined ? _instance.endDate : (endDate as String?),
        startedDate: startedDate == _undefined
            ? _instance.startedDate
            : (startedDate as String?),
        reminder: reminder == _undefined || reminder == null
            ? _instance.reminder
            : (reminder as Enum$Reminder),
        comments: comments == _undefined
            ? _instance.comments
            : (comments as List<Fragment$CommentFragment>?),
        checkLists: checkLists == _undefined
            ? _instance.checkLists
            : (checkLists as List<Fragment$CheckListFragment>?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        createdBy: createdBy == _undefined || createdBy == null
            ? _instance.createdBy
            : (createdBy as Fragment$UserFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes users(
          Iterable<Fragment$UserFragment>? Function(
                  Iterable<
                      CopyWith$Fragment$UserFragment<Fragment$UserFragment>>?)
              _fn) =>
      call(
          users: _fn(_instance.users?.map((e) => CopyWith$Fragment$UserFragment(
                e,
                (i) => i,
              )))?.toList());

  TRes comments(
          Iterable<Fragment$CommentFragment>? Function(
                  Iterable<
                      CopyWith$Fragment$CommentFragment<
                          Fragment$CommentFragment>>?)
              _fn) =>
      call(
          comments: _fn(
              _instance.comments?.map((e) => CopyWith$Fragment$CommentFragment(
                    e,
                    (i) => i,
                  )))?.toList());

  TRes checkLists(
          Iterable<Fragment$CheckListFragment>? Function(
                  Iterable<
                      CopyWith$Fragment$CheckListFragment<
                          Fragment$CheckListFragment>>?)
              _fn) =>
      call(
          checkLists: _fn(_instance.checkLists
              ?.map((e) => CopyWith$Fragment$CheckListFragment(
                    e,
                    (i) => i,
                  )))?.toList());

  CopyWith$Fragment$UserFragment<TRes> get createdBy {
    final local$createdBy = _instance.createdBy;
    return CopyWith$Fragment$UserFragment(
        local$createdBy, (e) => call(createdBy: e));
  }
}

class _CopyWithStubImpl$Fragment$CardFragment<TRes>
    implements CopyWith$Fragment$CardFragment<TRes> {
  _CopyWithStubImpl$Fragment$CardFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    List<Fragment$UserFragment>? users,
    String? endDate,
    String? startedDate,
    Enum$Reminder? reminder,
    List<Fragment$CommentFragment>? comments,
    List<Fragment$CheckListFragment>? checkLists,
    String? createdAt,
    Fragment$UserFragment? createdBy,
    String? $__typename,
  }) =>
      _res;

  users(_fn) => _res;

  comments(_fn) => _res;

  checkLists(_fn) => _res;

  CopyWith$Fragment$UserFragment<TRes> get createdBy =>
      CopyWith$Fragment$UserFragment.stub(_res);
}

const fragmentDefinitionCardFragment = FragmentDefinitionNode(
  name: NameNode(value: 'CardFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Card'),
    isNonNull: false,
  )),
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
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'users'),
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
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'endDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'startedDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'reminder'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'comments'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'CommentFragment'),
          directives: [],
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'checkLists'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'CheckListFragment'),
          directives: [],
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdBy'),
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
      ]),
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentCardFragment = DocumentNode(definitions: [
  fragmentDefinitionCardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionCheckListFragment,
]);

extension ClientExtension$Fragment$CardFragment on graphql.GraphQLClient {
  void writeFragment$CardFragment({
    required Fragment$CardFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'CardFragment',
            document: documentNodeFragmentCardFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$CardFragment? readFragment$CardFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CardFragment',
          document: documentNodeFragmentCardFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$CardFragment.fromJson(result);
  }
}
