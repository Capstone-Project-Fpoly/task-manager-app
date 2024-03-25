import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$UserFragment {
  Fragment$UserFragment({
    required this.uid,
    this.updatedAt,
    this.email,
    required this.createdAt,
    this.avatar,
    this.fullName,
    this.$__typename = 'User',
  });

  factory Fragment$UserFragment.fromJson(Map<String, dynamic> json) {
    final l$uid = json['uid'];
    final l$updatedAt = json['updatedAt'];
    final l$email = json['email'];
    final l$createdAt = json['createdAt'];
    final l$avatar = json['avatar'];
    final l$fullName = json['fullName'];
    final l$$__typename = json['__typename'];
    return Fragment$UserFragment(
      uid: (l$uid as String),
      updatedAt: (l$updatedAt as String?),
      email: (l$email as String?),
      createdAt: (l$createdAt as String),
      avatar: (l$avatar as String?),
      fullName: (l$fullName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String uid;

  final String? updatedAt;

  final String? email;

  final String createdAt;

  final String? avatar;

  final String? fullName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$uid = uid;
    _resultData['uid'] = l$uid;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$avatar = avatar;
    _resultData['avatar'] = l$avatar;
    final l$fullName = fullName;
    _resultData['fullName'] = l$fullName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$uid = uid;
    final l$updatedAt = updatedAt;
    final l$email = email;
    final l$createdAt = createdAt;
    final l$avatar = avatar;
    final l$fullName = fullName;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$uid,
      l$updatedAt,
      l$email,
      l$createdAt,
      l$avatar,
      l$fullName,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$UserFragment) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$uid = uid;
    final lOther$uid = other.uid;
    if (l$uid != lOther$uid) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    final l$fullName = fullName;
    final lOther$fullName = other.fullName;
    if (l$fullName != lOther$fullName) {
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

extension UtilityExtension$Fragment$UserFragment on Fragment$UserFragment {
  CopyWith$Fragment$UserFragment<Fragment$UserFragment> get copyWith =>
      CopyWith$Fragment$UserFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserFragment<TRes> {
  factory CopyWith$Fragment$UserFragment(
    Fragment$UserFragment instance,
    TRes Function(Fragment$UserFragment) then,
  ) = _CopyWithImpl$Fragment$UserFragment;

  factory CopyWith$Fragment$UserFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserFragment;

  TRes call({
    String? uid,
    String? updatedAt,
    String? email,
    String? createdAt,
    String? avatar,
    String? fullName,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UserFragment<TRes>
    implements CopyWith$Fragment$UserFragment<TRes> {
  _CopyWithImpl$Fragment$UserFragment(
    this._instance,
    this._then,
  );

  final Fragment$UserFragment _instance;

  final TRes Function(Fragment$UserFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? uid = _undefined,
    Object? updatedAt = _undefined,
    Object? email = _undefined,
    Object? createdAt = _undefined,
    Object? avatar = _undefined,
    Object? fullName = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserFragment(
        uid: uid == _undefined || uid == null ? _instance.uid : (uid as String),
        updatedAt: updatedAt == _undefined
            ? _instance.updatedAt
            : (updatedAt as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        avatar: avatar == _undefined ? _instance.avatar : (avatar as String?),
        fullName:
            fullName == _undefined ? _instance.fullName : (fullName as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UserFragment<TRes>
    implements CopyWith$Fragment$UserFragment<TRes> {
  _CopyWithStubImpl$Fragment$UserFragment(this._res);

  TRes _res;

  call({
    String? uid,
    String? updatedAt,
    String? email,
    String? createdAt,
    String? avatar,
    String? fullName,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionUserFragment = FragmentDefinitionNode(
  name: NameNode(value: 'UserFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'uid'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'updatedAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'email'),
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
      name: NameNode(value: 'avatar'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'fullName'),
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
const documentNodeFragmentUserFragment = DocumentNode(definitions: [
  fragmentDefinitionUserFragment,
]);

extension ClientExtension$Fragment$UserFragment on graphql.GraphQLClient {
  void writeFragment$UserFragment({
    required Fragment$UserFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserFragment',
            document: documentNodeFragmentUserFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserFragment? readFragment$UserFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserFragment',
          document: documentNodeFragmentUserFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserFragment.fromJson(result);
  }
}
