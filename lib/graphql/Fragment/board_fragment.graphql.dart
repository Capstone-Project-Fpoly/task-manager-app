import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';

class Fragment$BoardFragment {
  Fragment$BoardFragment({
    this.title,
    required this.createdAt,
    required this.ownerUser,
    required this.id,
    required this.isPublic,
    this.color,
    this.$__typename = 'Board',
  });

  factory Fragment$BoardFragment.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$createdAt = json['createdAt'];
    final l$ownerUser = json['ownerUser'];
    final l$id = json['id'];
    final l$isPublic = json['isPublic'];
    final l$color = json['color'];
    final l$$__typename = json['__typename'];
    return Fragment$BoardFragment(
      title: (l$title as String?),
      createdAt: (l$createdAt as String),
      ownerUser:
          Fragment$UserFragment.fromJson((l$ownerUser as Map<String, dynamic>)),
      id: (l$id as String),
      isPublic: (l$isPublic as bool),
      color: (l$color as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? title;

  final String createdAt;

  final Fragment$UserFragment ownerUser;

  final String id;

  final bool isPublic;

  final String? color;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$title = title;
    resultData['title'] = l$title;
    final l$createdAt = createdAt;
    resultData['createdAt'] = l$createdAt;
    final l$ownerUser = ownerUser;
    resultData['ownerUser'] = l$ownerUser.toJson();
    final l$id = id;
    resultData['id'] = l$id;
    final l$isPublic = isPublic;
    resultData['isPublic'] = l$isPublic;
    final l$color = color;
    resultData['color'] = l$color;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$createdAt = createdAt;
    final l$ownerUser = ownerUser;
    final l$id = id;
    final l$isPublic = isPublic;
    final l$color = color;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$createdAt,
      l$ownerUser,
      l$id,
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
    if (other is! Fragment$BoardFragment || runtimeType != other.runtimeType) {
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
    String? title,
    String? createdAt,
    Fragment$UserFragment? ownerUser,
    String? id,
    bool? isPublic,
    String? color,
    String? $__typename,
  });
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
    Object? title = _undefined,
    Object? createdAt = _undefined,
    Object? ownerUser = _undefined,
    Object? id = _undefined,
    Object? isPublic = _undefined,
    Object? color = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Fragment$BoardFragment(
          title: title == _undefined ? _instance.title : (title as String?),
          createdAt: createdAt == _undefined || createdAt == null
              ? _instance.createdAt
              : (createdAt as String),
          ownerUser: ownerUser == _undefined || ownerUser == null
              ? _instance.ownerUser
              : (ownerUser as Fragment$UserFragment),
          id: id == _undefined || id == null ? _instance.id : (id as String),
          isPublic: isPublic == _undefined || isPublic == null
              ? _instance.isPublic
              : (isPublic as bool),
          color: color == _undefined ? _instance.color : (color as String?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
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
    String? title,
    String? createdAt,
    Fragment$UserFragment? ownerUser,
    String? id,
    bool? isPublic,
    String? color,
    String? $__typename,
  }) =>
      _res;

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
