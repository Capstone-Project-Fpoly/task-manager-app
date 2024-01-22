import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'user_fragment.graphql.dart';

class Fragment$ListFragment {
  Fragment$ListFragment({
    required this.createdAt,
    required this.board,
    this.$__typename = 'List',
  });

  factory Fragment$ListFragment.fromJson(Map<String, dynamic> json) {
    final l$createdAt = json['createdAt'];
    final l$board = json['board'];
    final l$$__typename = json['__typename'];
    return Fragment$ListFragment(
      createdAt: (l$createdAt as String),
      board: Fragment$ListFragment$board.fromJson(
          (l$board as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String createdAt;

  final Fragment$ListFragment$board board;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$board = board;
    _resultData['board'] = l$board.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createdAt = createdAt;
    final l$board = board;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createdAt,
      l$board,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ListFragment) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$board = board;
    final lOther$board = other.board;
    if (l$board != lOther$board) {
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

extension UtilityExtension$Fragment$ListFragment on Fragment$ListFragment {
  CopyWith$Fragment$ListFragment<Fragment$ListFragment> get copyWith =>
      CopyWith$Fragment$ListFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ListFragment<TRes> {
  factory CopyWith$Fragment$ListFragment(
    Fragment$ListFragment instance,
    TRes Function(Fragment$ListFragment) then,
  ) = _CopyWithImpl$Fragment$ListFragment;

  factory CopyWith$Fragment$ListFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ListFragment;

  TRes call({
    String? createdAt,
    Fragment$ListFragment$board? board,
    String? $__typename,
  });
  CopyWith$Fragment$ListFragment$board<TRes> get board;
}

class _CopyWithImpl$Fragment$ListFragment<TRes>
    implements CopyWith$Fragment$ListFragment<TRes> {
  _CopyWithImpl$Fragment$ListFragment(
    this._instance,
    this._then,
  );

  final Fragment$ListFragment _instance;

  final TRes Function(Fragment$ListFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createdAt = _undefined,
    Object? board = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ListFragment(
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        board: board == _undefined || board == null
            ? _instance.board
            : (board as Fragment$ListFragment$board),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$ListFragment$board<TRes> get board {
    final local$board = _instance.board;
    return CopyWith$Fragment$ListFragment$board(
        local$board, (e) => call(board: e));
  }
}

class _CopyWithStubImpl$Fragment$ListFragment<TRes>
    implements CopyWith$Fragment$ListFragment<TRes> {
  _CopyWithStubImpl$Fragment$ListFragment(this._res);

  TRes _res;

  call({
    String? createdAt,
    Fragment$ListFragment$board? board,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$ListFragment$board<TRes> get board =>
      CopyWith$Fragment$ListFragment$board.stub(_res);
}

const fragmentDefinitionListFragment = FragmentDefinitionNode(
  name: NameNode(value: 'ListFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'List'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'board'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'createdAt'),
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
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'isPublic'),
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
          name: NameNode(value: 'title'),
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
const documentNodeFragmentListFragment = DocumentNode(definitions: [
  fragmentDefinitionListFragment,
  fragmentDefinitionUserFragment,
]);

extension ClientExtension$Fragment$ListFragment on graphql.GraphQLClient {
  void writeFragment$ListFragment({
    required Fragment$ListFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ListFragment',
            document: documentNodeFragmentListFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ListFragment? readFragment$ListFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ListFragment',
          document: documentNodeFragmentListFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ListFragment.fromJson(result);
  }
}

class Fragment$ListFragment$board {
  Fragment$ListFragment$board({
    required this.createdAt,
    this.color,
    required this.id,
    required this.isPublic,
    required this.ownerUser,
    this.title,
    this.users,
    this.$__typename = 'Board',
  });

  factory Fragment$ListFragment$board.fromJson(Map<String, dynamic> json) {
    final l$createdAt = json['createdAt'];
    final l$color = json['color'];
    final l$id = json['id'];
    final l$isPublic = json['isPublic'];
    final l$ownerUser = json['ownerUser'];
    final l$title = json['title'];
    final l$users = json['users'];
    final l$$__typename = json['__typename'];
    return Fragment$ListFragment$board(
      createdAt: (l$createdAt as String),
      color: (l$color as String?),
      id: (l$id as String),
      isPublic: (l$isPublic as bool),
      ownerUser:
          Fragment$UserFragment.fromJson((l$ownerUser as Map<String, dynamic>)),
      title: (l$title as String?),
      users: (l$users as List<dynamic>?)
          ?.map((e) =>
              Fragment$UserFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String createdAt;

  final String? color;

  final String id;

  final bool isPublic;

  final Fragment$UserFragment ownerUser;

  final String? title;

  final List<Fragment$UserFragment>? users;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$isPublic = isPublic;
    _resultData['isPublic'] = l$isPublic;
    final l$ownerUser = ownerUser;
    _resultData['ownerUser'] = l$ownerUser.toJson();
    final l$title = title;
    _resultData['title'] = l$title;
    final l$users = users;
    _resultData['users'] = l$users?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createdAt = createdAt;
    final l$color = color;
    final l$id = id;
    final l$isPublic = isPublic;
    final l$ownerUser = ownerUser;
    final l$title = title;
    final l$users = users;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createdAt,
      l$color,
      l$id,
      l$isPublic,
      l$ownerUser,
      l$title,
      l$users == null ? null : Object.hashAll(l$users.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ListFragment$board) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (l$isPublic != lOther$isPublic) {
      return false;
    }
    final l$ownerUser = ownerUser;
    final lOther$ownerUser = other.ownerUser;
    if (l$ownerUser != lOther$ownerUser) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ListFragment$board
    on Fragment$ListFragment$board {
  CopyWith$Fragment$ListFragment$board<Fragment$ListFragment$board>
      get copyWith => CopyWith$Fragment$ListFragment$board(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ListFragment$board<TRes> {
  factory CopyWith$Fragment$ListFragment$board(
    Fragment$ListFragment$board instance,
    TRes Function(Fragment$ListFragment$board) then,
  ) = _CopyWithImpl$Fragment$ListFragment$board;

  factory CopyWith$Fragment$ListFragment$board.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ListFragment$board;

  TRes call({
    String? createdAt,
    String? color,
    String? id,
    bool? isPublic,
    Fragment$UserFragment? ownerUser,
    String? title,
    List<Fragment$UserFragment>? users,
    String? $__typename,
  });
  CopyWith$Fragment$UserFragment<TRes> get ownerUser;
  TRes users(
      Iterable<Fragment$UserFragment>? Function(
              Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>>?)
          _fn);
}

class _CopyWithImpl$Fragment$ListFragment$board<TRes>
    implements CopyWith$Fragment$ListFragment$board<TRes> {
  _CopyWithImpl$Fragment$ListFragment$board(
    this._instance,
    this._then,
  );

  final Fragment$ListFragment$board _instance;

  final TRes Function(Fragment$ListFragment$board) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createdAt = _undefined,
    Object? color = _undefined,
    Object? id = _undefined,
    Object? isPublic = _undefined,
    Object? ownerUser = _undefined,
    Object? title = _undefined,
    Object? users = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ListFragment$board(
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        color: color == _undefined ? _instance.color : (color as String?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        isPublic: isPublic == _undefined || isPublic == null
            ? _instance.isPublic
            : (isPublic as bool),
        ownerUser: ownerUser == _undefined || ownerUser == null
            ? _instance.ownerUser
            : (ownerUser as Fragment$UserFragment),
        title: title == _undefined ? _instance.title : (title as String?),
        users: users == _undefined
            ? _instance.users
            : (users as List<Fragment$UserFragment>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserFragment<TRes> get ownerUser {
    final local$ownerUser = _instance.ownerUser;
    return CopyWith$Fragment$UserFragment(
        local$ownerUser, (e) => call(ownerUser: e));
  }

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
}

class _CopyWithStubImpl$Fragment$ListFragment$board<TRes>
    implements CopyWith$Fragment$ListFragment$board<TRes> {
  _CopyWithStubImpl$Fragment$ListFragment$board(this._res);

  TRes _res;

  call({
    String? createdAt,
    String? color,
    String? id,
    bool? isPublic,
    Fragment$UserFragment? ownerUser,
    String? title,
    List<Fragment$UserFragment>? users,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserFragment<TRes> get ownerUser =>
      CopyWith$Fragment$UserFragment.stub(_res);

  users(_fn) => _res;
}
