import 'card_fragment.graphql.dart';
import 'check_list_fragment.graphql.dart';
import 'comment_fragment.graphql.dart';
import 'label_fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'user_fragment.graphql.dart';

class Fragment$ListFragment {
  Fragment$ListFragment({
    required this.id,
    this.cards,
    required this.label,
    required this.createdAt,
    this.createdBy,
    this.$__typename = 'List',
  });

  factory Fragment$ListFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$cards = json['cards'];
    final l$label = json['label'];
    final l$createdAt = json['createdAt'];
    final l$createdBy = json['createdBy'];
    final l$$__typename = json['__typename'];
    return Fragment$ListFragment(
      id: (l$id as String),
      cards: (l$cards as List<dynamic>?)
          ?.map((e) =>
              Fragment$CardFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      label: (l$label as String),
      createdAt: (l$createdAt as String),
      createdBy: l$createdBy == null
          ? null
          : Fragment$UserFragment.fromJson(
              (l$createdBy as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<Fragment$CardFragment>? cards;

  final String label;

  final String createdAt;

  final Fragment$UserFragment? createdBy;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$cards = cards;
    _resultData['cards'] = l$cards?.map((e) => e.toJson()).toList();
    final l$label = label;
    _resultData['label'] = l$label;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$createdBy = createdBy;
    _resultData['createdBy'] = l$createdBy?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$cards = cards;
    final l$label = label;
    final l$createdAt = createdAt;
    final l$createdBy = createdBy;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$cards == null ? null : Object.hashAll(l$cards.map((v) => v)),
      l$label,
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
    if (!(other is Fragment$ListFragment) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$cards = cards;
    final lOther$cards = other.cards;
    if (l$cards != null && lOther$cards != null) {
      if (l$cards.length != lOther$cards.length) {
        return false;
      }
      for (int i = 0; i < l$cards.length; i++) {
        final l$cards$entry = l$cards[i];
        final lOther$cards$entry = lOther$cards[i];
        if (l$cards$entry != lOther$cards$entry) {
          return false;
        }
      }
    } else if (l$cards != lOther$cards) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
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
    String? id,
    List<Fragment$CardFragment>? cards,
    String? label,
    String? createdAt,
    Fragment$UserFragment? createdBy,
    String? $__typename,
  });
  TRes cards(
      Iterable<Fragment$CardFragment>? Function(
              Iterable<CopyWith$Fragment$CardFragment<Fragment$CardFragment>>?)
          _fn);
  CopyWith$Fragment$UserFragment<TRes> get createdBy;
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
    Object? id = _undefined,
    Object? cards = _undefined,
    Object? label = _undefined,
    Object? createdAt = _undefined,
    Object? createdBy = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ListFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        cards: cards == _undefined
            ? _instance.cards
            : (cards as List<Fragment$CardFragment>?),
        label: label == _undefined || label == null
            ? _instance.label
            : (label as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        createdBy: createdBy == _undefined
            ? _instance.createdBy
            : (createdBy as Fragment$UserFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes cards(
          Iterable<Fragment$CardFragment>? Function(
                  Iterable<
                      CopyWith$Fragment$CardFragment<Fragment$CardFragment>>?)
              _fn) =>
      call(
          cards: _fn(_instance.cards?.map((e) => CopyWith$Fragment$CardFragment(
                e,
                (i) => i,
              )))?.toList());

  CopyWith$Fragment$UserFragment<TRes> get createdBy {
    final local$createdBy = _instance.createdBy;
    return local$createdBy == null
        ? CopyWith$Fragment$UserFragment.stub(_then(_instance))
        : CopyWith$Fragment$UserFragment(
            local$createdBy, (e) => call(createdBy: e));
  }
}

class _CopyWithStubImpl$Fragment$ListFragment<TRes>
    implements CopyWith$Fragment$ListFragment<TRes> {
  _CopyWithStubImpl$Fragment$ListFragment(this._res);

  TRes _res;

  call({
    String? id,
    List<Fragment$CardFragment>? cards,
    String? label,
    String? createdAt,
    Fragment$UserFragment? createdBy,
    String? $__typename,
  }) =>
      _res;

  cards(_fn) => _res;

  CopyWith$Fragment$UserFragment<TRes> get createdBy =>
      CopyWith$Fragment$UserFragment.stub(_res);
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
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'cards'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'CardFragment'),
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
      name: NameNode(value: 'label'),
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
const documentNodeFragmentListFragment = DocumentNode(definitions: [
  fragmentDefinitionListFragment,
  fragmentDefinitionCardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionLabelFragment,
  fragmentDefinitionCheckListFragment,
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
