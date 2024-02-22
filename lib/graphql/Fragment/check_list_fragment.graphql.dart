import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$CheckListFragment {
  Fragment$CheckListFragment({
    required this.id,
    required this.content,
    required this.isChecked,
    this.$__typename = 'CheckList',
  });

  factory Fragment$CheckListFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$content = json['content'];
    final l$isChecked = json['isChecked'];
    final l$$__typename = json['__typename'];
    return Fragment$CheckListFragment(
      id: (l$id as String),
      content: (l$content as String),
      isChecked: (l$isChecked as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String content;

  final bool isChecked;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$isChecked = isChecked;
    _resultData['isChecked'] = l$isChecked;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$isChecked = isChecked;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$content,
      l$isChecked,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CheckListFragment) ||
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
    final l$isChecked = isChecked;
    final lOther$isChecked = other.isChecked;
    if (l$isChecked != lOther$isChecked) {
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

extension UtilityExtension$Fragment$CheckListFragment
    on Fragment$CheckListFragment {
  CopyWith$Fragment$CheckListFragment<Fragment$CheckListFragment>
      get copyWith => CopyWith$Fragment$CheckListFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CheckListFragment<TRes> {
  factory CopyWith$Fragment$CheckListFragment(
    Fragment$CheckListFragment instance,
    TRes Function(Fragment$CheckListFragment) then,
  ) = _CopyWithImpl$Fragment$CheckListFragment;

  factory CopyWith$Fragment$CheckListFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CheckListFragment;

  TRes call({
    String? id,
    String? content,
    bool? isChecked,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CheckListFragment<TRes>
    implements CopyWith$Fragment$CheckListFragment<TRes> {
  _CopyWithImpl$Fragment$CheckListFragment(
    this._instance,
    this._then,
  );

  final Fragment$CheckListFragment _instance;

  final TRes Function(Fragment$CheckListFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? content = _undefined,
    Object? isChecked = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CheckListFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        isChecked: isChecked == _undefined || isChecked == null
            ? _instance.isChecked
            : (isChecked as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$CheckListFragment<TRes>
    implements CopyWith$Fragment$CheckListFragment<TRes> {
  _CopyWithStubImpl$Fragment$CheckListFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? content,
    bool? isChecked,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionCheckListFragment = FragmentDefinitionNode(
  name: NameNode(value: 'CheckListFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'CheckList'),
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
      name: NameNode(value: 'content'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'isChecked'),
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
const documentNodeFragmentCheckListFragment = DocumentNode(definitions: [
  fragmentDefinitionCheckListFragment,
]);

extension ClientExtension$Fragment$CheckListFragment on graphql.GraphQLClient {
  void writeFragment$CheckListFragment({
    required Fragment$CheckListFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'CheckListFragment',
            document: documentNodeFragmentCheckListFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$CheckListFragment? readFragment$CheckListFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CheckListFragment',
          document: documentNodeFragmentCheckListFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$CheckListFragment.fromJson(result);
  }
}
