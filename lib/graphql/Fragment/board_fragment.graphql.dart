import 'list_fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'user_fragment.graphql.dart';

class Fragment$BoardFragment {
  Fragment$BoardFragment({
    this.users,
    this.title,
    required this.createdAt,
    required this.ownerUser,
    required this.id,
    this.lists,
    required this.isPublic,
    this.color,
    this.$__typename = 'Board',
  });

  factory Fragment$BoardFragment.fromJson(Map<String, dynamic> json) {
    final l$users = json['users'];
    final l$title = json['title'];
    final l$createdAt = json['createdAt'];
    final l$ownerUser = json['ownerUser'];
    final l$id = json['id'];
    final l$lists = json['lists'];
    final l$isPublic = json['isPublic'];
    final l$color = json['color'];
    final l$$__typename = json['__typename'];
    return Fragment$BoardFragment(
      users: (l$users as List<dynamic>?)
          ?.map((e) =>
              Fragment$UserFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      title: (l$title as String?),
      createdAt: (l$createdAt as String),
      ownerUser:
          Fragment$UserFragment.fromJson((l$ownerUser as Map<String, dynamic>)),
      id: (l$id as String),
      lists: (l$lists as List<dynamic>?)
          ?.map((e) =>
              Fragment$ListFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      isPublic: (l$isPublic as bool),
      color: (l$color as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$UserFragment>? users;

  final String? title;

  final String createdAt;

  final Fragment$UserFragment ownerUser;

  final String id;

  final List<Fragment$ListFragment>? lists;

  final bool isPublic;

  final String? color;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$users = users;
    _resultData['users'] = l$users?.map((e) => e.toJson()).toList();
    final l$title = title;
    _resultData['title'] = l$title;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$ownerUser = ownerUser;
    _resultData['ownerUser'] = l$ownerUser.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lists = lists;
    _resultData['lists'] = l$lists?.map((e) => e.toJson()).toList();
    final l$isPublic = isPublic;
    _resultData['isPublic'] = l$isPublic;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$users = users;
    final l$title = title;
    final l$createdAt = createdAt;
    final l$ownerUser = ownerUser;
    final l$id = id;
    final l$lists = lists;
    final l$isPublic = isPublic;
    final l$color = color;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$users == null ? null : Object.hashAll(l$users.map((v) => v)),
      l$title,
      l$createdAt,
      l$ownerUser,
      l$id,
      l$lists == null ? null : Object.hashAll(l$lists.map((v) => v)),
      l$isPublic,
      l$color,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$BoardFragment) ||
        runtimeType != other.runtimeType) {
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
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$ownerUser = ownerUser;
    final lOther$ownerUser = other.ownerUser;
    if (l$ownerUser != lOther$ownerUser) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$lists = lists;
    final lOther$lists = other.lists;
    if (l$lists != null && lOther$lists != null) {
      if (l$lists.length != lOther$lists.length) {
        return false;
      }
      for (int i = 0; i < l$lists.length; i++) {
        final l$lists$entry = l$lists[i];
        final lOther$lists$entry = lOther$lists[i];
        if (l$lists$entry != lOther$lists$entry) {
          return false;
        }
      }
    } else if (l$lists != lOther$lists) {
      return false;
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (l$isPublic != lOther$isPublic) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
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

extension UtilityExtension$Fragment$BoardFragment on Fragment$BoardFragment {
  CopyWith$Fragment$BoardFragment<Fragment$BoardFragment> get copyWith =>
      CopyWith$Fragment$BoardFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$BoardFragment<TRes> {
  factory CopyWith$Fragment$BoardFragment(
    Fragment$BoardFragment instance,
    TRes Function(Fragment$BoardFragment) then,
  ) = _CopyWithImpl$Fragment$BoardFragment;

  factory CopyWith$Fragment$BoardFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$BoardFragment;

  TRes call({
    List<Fragment$UserFragment>? users,
    String? title,
    String? createdAt,
    Fragment$UserFragment? ownerUser,
    String? id,
    List<Fragment$ListFragment>? lists,
    bool? isPublic,
    String? color,
    String? $__typename,
  });
  TRes users(
      Iterable<Fragment$UserFragment>? Function(
              Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>>?)
          _fn);
  CopyWith$Fragment$UserFragment<TRes> get ownerUser;
  TRes lists(
      Iterable<Fragment$ListFragment>? Function(
              Iterable<CopyWith$Fragment$ListFragment<Fragment$ListFragment>>?)
          _fn);
}

class _CopyWithImpl$Fragment$BoardFragment<TRes>
    implements CopyWith$Fragment$BoardFragment<TRes> {
  _CopyWithImpl$Fragment$BoardFragment(
    this._instance,
    this._then,
  );

  final Fragment$BoardFragment _instance;

  final TRes Function(Fragment$BoardFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? users = _undefined,
    Object? title = _undefined,
    Object? createdAt = _undefined,
    Object? ownerUser = _undefined,
    Object? id = _undefined,
    Object? lists = _undefined,
    Object? isPublic = _undefined,
    Object? color = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$BoardFragment(
        users: users == _undefined
            ? _instance.users
            : (users as List<Fragment$UserFragment>?),
        title: title == _undefined ? _instance.title : (title as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        ownerUser: ownerUser == _undefined || ownerUser == null
            ? _instance.ownerUser
            : (ownerUser as Fragment$UserFragment),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lists: lists == _undefined
            ? _instance.lists
            : (lists as List<Fragment$ListFragment>?),
        isPublic: isPublic == _undefined || isPublic == null
            ? _instance.isPublic
            : (isPublic as bool),
        color: color == _undefined ? _instance.color : (color as String?),
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

  CopyWith$Fragment$UserFragment<TRes> get ownerUser {
    final local$ownerUser = _instance.ownerUser;
    return CopyWith$Fragment$UserFragment(
        local$ownerUser, (e) => call(ownerUser: e));
  }

  TRes lists(
          Iterable<Fragment$ListFragment>? Function(
                  Iterable<
                      CopyWith$Fragment$ListFragment<Fragment$ListFragment>>?)
              _fn) =>
      call(
          lists: _fn(_instance.lists?.map((e) => CopyWith$Fragment$ListFragment(
                e,
                (i) => i,
              )))?.toList());
}

class _CopyWithStubImpl$Fragment$BoardFragment<TRes>
    implements CopyWith$Fragment$BoardFragment<TRes> {
  _CopyWithStubImpl$Fragment$BoardFragment(this._res);

  TRes _res;

  call({
    List<Fragment$UserFragment>? users,
    String? title,
    String? createdAt,
    Fragment$UserFragment? ownerUser,
    String? id,
    List<Fragment$ListFragment>? lists,
    bool? isPublic,
    String? color,
    String? $__typename,
  }) =>
      _res;

  users(_fn) => _res;

  CopyWith$Fragment$UserFragment<TRes> get ownerUser =>
      CopyWith$Fragment$UserFragment.stub(_res);

  lists(_fn) => _res;
}

const fragmentDefinitionBoardFragment = FragmentDefinitionNode(
  name: NameNode(value: 'BoardFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Board'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
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
      name: NameNode(value: 'title'),
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
      name: NameNode(value: 'ownerUser'),
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
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'lists'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'ListFragment'),
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
      name: NameNode(value: 'isPublic'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'color'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
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
const documentNodeFragmentBoardFragment = DocumentNode(definitions: [
  fragmentDefinitionBoardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionListFragment,
]);

extension ClientExtension$Fragment$BoardFragment on graphql.GraphQLClient {
  void writeFragment$BoardFragment({
    required Fragment$BoardFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'BoardFragment',
            document: documentNodeFragmentBoardFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$BoardFragment? readFragment$BoardFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'BoardFragment',
          document: documentNodeFragmentBoardFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$BoardFragment.fromJson(result);
  }
}
