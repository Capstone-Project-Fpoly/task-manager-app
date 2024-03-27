import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$LabelFragment {
  Fragment$LabelFragment({
    required this.id,
    this.title,
    this.color,
    this.$__typename = 'LabelCard',
  });

  factory Fragment$LabelFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$color = json['color'];
    final l$$__typename = json['__typename'];
    return Fragment$LabelFragment(
      id: (l$id as String),
      title: (l$title as String?),
      color: (l$color as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? color;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$color = color;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$color,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$LabelFragment) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$LabelFragment on Fragment$LabelFragment {
  CopyWith$Fragment$LabelFragment<Fragment$LabelFragment> get copyWith =>
      CopyWith$Fragment$LabelFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$LabelFragment<TRes> {
  factory CopyWith$Fragment$LabelFragment(
    Fragment$LabelFragment instance,
    TRes Function(Fragment$LabelFragment) then,
  ) = _CopyWithImpl$Fragment$LabelFragment;

  factory CopyWith$Fragment$LabelFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$LabelFragment;

  TRes call({
    String? id,
    String? title,
    String? color,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$LabelFragment<TRes>
    implements CopyWith$Fragment$LabelFragment<TRes> {
  _CopyWithImpl$Fragment$LabelFragment(
    this._instance,
    this._then,
  );

  final Fragment$LabelFragment _instance;

  final TRes Function(Fragment$LabelFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? color = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$LabelFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        color: color == _undefined ? _instance.color : (color as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$LabelFragment<TRes>
    implements CopyWith$Fragment$LabelFragment<TRes> {
  _CopyWithStubImpl$Fragment$LabelFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? color,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionLabelFragment = FragmentDefinitionNode(
  name: NameNode(value: 'LabelFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'LabelCard'),
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
const documentNodeFragmentLabelFragment = DocumentNode(definitions: [
  fragmentDefinitionLabelFragment,
]);

extension ClientExtension$Fragment$LabelFragment on graphql.GraphQLClient {
  void writeFragment$LabelFragment({
    required Fragment$LabelFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'LabelFragment',
            document: documentNodeFragmentLabelFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$LabelFragment? readFragment$LabelFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'LabelFragment',
          document: documentNodeFragmentLabelFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$LabelFragment.fromJson(result);
  }
}
