import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';

class Fragment$BoardFragment {
  Fragment$BoardFragment({
    required this.id,
    this.users,
    required this.createdAt,
    this.color,
    required this.isPublic,
    required this.ownerUser,
    this.title,
    this.$__typename = 'Board',
  });

  factory Fragment$BoardFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$users = json['users'];
    final l$createdAt = json['createdAt'];
    final l$color = json['color'];
    final l$isPublic = json['isPublic'];
    final l$ownerUser = json['ownerUser'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$BoardFragment(
      id: (l$id as String),
      users: (l$users as List<dynamic>?)
          ?.map(
            (e) => Fragment$UserFragment.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      createdAt: (l$createdAt as String),
      color: (l$color as String?),
      isPublic: (l$isPublic as bool),
      ownerUser:
          Fragment$UserFragment.fromJson((l$ownerUser as Map<String, dynamic>)),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<Fragment$UserFragment>? users;

  final String createdAt;

  final String? color;

  final bool isPublic;

  final Fragment$UserFragment ownerUser;

  final String? title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$users = users;
    resultData['users'] = l$users?.map((e) => e.toJson()).toList();
    final l$createdAt = createdAt;
    resultData['createdAt'] = l$createdAt;
    final l$color = color;
    resultData['color'] = l$color;
    final l$isPublic = isPublic;
    resultData['isPublic'] = l$isPublic;
    final l$ownerUser = ownerUser;
    resultData['ownerUser'] = l$ownerUser.toJson();
    final l$title = title;
    resultData['title'] = l$title;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$users = users;
    final l$createdAt = createdAt;
    final l$color = color;
    final l$isPublic = isPublic;
    final l$ownerUser = ownerUser;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$users == null ? null : Object.hashAll(l$users.map((v) => v)),
      l$createdAt,
      l$color,
      l$isPublic,
      l$ownerUser,
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$BoardFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    String? id,
    List<Fragment$UserFragment>? users,
    String? createdAt,
    String? color,
    bool? isPublic,
    Fragment$UserFragment? ownerUser,
    String? title,
    String? $__typename,
  });
  TRes users(
    Iterable<Fragment$UserFragment>? Function(
      Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>>?,
    ) fn,
  );
  CopyWith$Fragment$UserFragment<TRes> get ownerUser;
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

  @override
  TRes call({
    Object? id = _undefined,
    Object? users = _undefined,
    Object? createdAt = _undefined,
    Object? color = _undefined,
    Object? isPublic = _undefined,
    Object? ownerUser = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Fragment$BoardFragment(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          users: users == _undefined
              ? _instance.users
              : (users as List<Fragment$UserFragment>?),
          createdAt: createdAt == _undefined || createdAt == null
              ? _instance.createdAt
              : (createdAt as String),
          color: color == _undefined ? _instance.color : (color as String?),
          isPublic: isPublic == _undefined || isPublic == null
              ? _instance.isPublic
              : (isPublic as bool),
          ownerUser: ownerUser == _undefined || ownerUser == null
              ? _instance.ownerUser
              : (ownerUser as Fragment$UserFragment),
          title: title == _undefined ? _instance.title : (title as String?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  @override
  TRes users(
    Iterable<Fragment$UserFragment>? Function(
      Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>>?,
    ) fn,
  ) =>
      call(
        users: fn(
          _instance.users?.map(
            (e) => CopyWith$Fragment$UserFragment(
              e,
              (i) => i,
            ),
          ),
        )?.toList(),
      );

  @override
  CopyWith$Fragment$UserFragment<TRes> get ownerUser {
    final local$ownerUser = _instance.ownerUser;
    return CopyWith$Fragment$UserFragment(
      local$ownerUser,
      (e) => call(ownerUser: e),
    );
  }
}

class _CopyWithStubImpl$Fragment$BoardFragment<TRes>
    implements CopyWith$Fragment$BoardFragment<TRes> {
  _CopyWithStubImpl$Fragment$BoardFragment(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    List<Fragment$UserFragment>? users,
    String? createdAt,
    String? color,
    bool? isPublic,
    Fragment$UserFragment? ownerUser,
    String? title,
    String? $__typename,
  }) =>
      _res;

  @override
  users(fn) => _res;

  @override
  CopyWith$Fragment$UserFragment<TRes> get ownerUser =>
      CopyWith$Fragment$UserFragment.stub(_res);
}

const fragmentDefinitionBoardFragment = FragmentDefinitionNode(
  name: NameNode(value: 'BoardFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(
      name: NameNode(value: 'Board'),
      isNonNull: false,
    ),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
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
        selectionSet: SelectionSetNode(
          selections: [
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
          ],
        ),
      ),
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
        selectionSet: SelectionSetNode(
          selections: [
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
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: 'title'),
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
    ],
  ),
);
const documentNodeFragmentBoardFragment = DocumentNode(
  definitions: [
    fragmentDefinitionBoardFragment,
    fragmentDefinitionUserFragment,
  ],
);

extension ClientExtension$Fragment$BoardFragment on graphql.GraphQLClient {
  void writeFragment$BoardFragment({
    required Fragment$BoardFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      writeFragment(
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
    final result = readFragment(
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
