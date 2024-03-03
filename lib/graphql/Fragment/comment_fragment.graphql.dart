import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';

class Fragment$CommentFragment {
  Fragment$CommentFragment({
    required this.id,
    required this.createdAt,
    required this.user,
    required this.comment,
    this.$__typename = 'Comment',
  });

  factory Fragment$CommentFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$user = json['user'];
    final l$comment = json['comment'];
    final l$$__typename = json['__typename'];
    return Fragment$CommentFragment(
      id: (l$id as String),
      createdAt: (l$createdAt as String),
      user: Fragment$UserFragment.fromJson((l$user as Map<String, dynamic>)),
      comment: (l$comment as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String createdAt;

  final Fragment$UserFragment user;

  final String comment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$createdAt = createdAt;
    resultData['createdAt'] = l$createdAt;
    final l$user = user;
    resultData['user'] = l$user.toJson();
    final l$comment = comment;
    resultData['comment'] = l$comment;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$user = user;
    final l$comment = comment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$user,
      l$comment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CommentFragment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
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

extension UtilityExtension$Fragment$CommentFragment
    on Fragment$CommentFragment {
  CopyWith$Fragment$CommentFragment<Fragment$CommentFragment> get copyWith =>
      CopyWith$Fragment$CommentFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CommentFragment<TRes> {
  factory CopyWith$Fragment$CommentFragment(
    Fragment$CommentFragment instance,
    TRes Function(Fragment$CommentFragment) then,
  ) = _CopyWithImpl$Fragment$CommentFragment;

  factory CopyWith$Fragment$CommentFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CommentFragment;

  TRes call({
    String? id,
    String? createdAt,
    Fragment$UserFragment? user,
    String? comment,
    String? $__typename,
  });
  CopyWith$Fragment$UserFragment<TRes> get user;
}

class _CopyWithImpl$Fragment$CommentFragment<TRes>
    implements CopyWith$Fragment$CommentFragment<TRes> {
  _CopyWithImpl$Fragment$CommentFragment(
    this._instance,
    this._then,
  );

  final Fragment$CommentFragment _instance;

  final TRes Function(Fragment$CommentFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? user = _undefined,
    Object? comment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CommentFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$UserFragment),
        comment: comment == _undefined || comment == null
            ? _instance.comment
            : (comment as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  CopyWith$Fragment$UserFragment<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$UserFragment(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Fragment$CommentFragment<TRes>
    implements CopyWith$Fragment$CommentFragment<TRes> {
  _CopyWithStubImpl$Fragment$CommentFragment(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? createdAt,
    Fragment$UserFragment? user,
    String? comment,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$UserFragment<TRes> get user =>
      CopyWith$Fragment$UserFragment.stub(_res);
}

const fragmentDefinitionCommentFragment = FragmentDefinitionNode(
  name: NameNode(value: 'CommentFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Comment'),
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
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'user'),
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
      name: NameNode(value: 'comment'),
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
  ],),
);
const documentNodeFragmentCommentFragment = DocumentNode(definitions: [
  fragmentDefinitionCommentFragment,
  fragmentDefinitionUserFragment,
],);

extension ClientExtension$Fragment$CommentFragment on graphql.GraphQLClient {
  void writeFragment$CommentFragment({
    required Fragment$CommentFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'CommentFragment',
            document: documentNodeFragmentCommentFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$CommentFragment? readFragment$CommentFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CommentFragment',
          document: documentNodeFragmentCommentFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$CommentFragment.fromJson(result);
  }
}
