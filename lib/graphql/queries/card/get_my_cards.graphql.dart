import '../../Fragment/board_fragment.graphql.dart';
import '../../Fragment/card_fragment.graphql.dart';
import '../../Fragment/check_list_fragment.graphql.dart';
import '../../Fragment/comment_fragment.graphql.dart';
import '../../Fragment/label_fragment.graphql.dart';
import '../../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$GetMyCards {
  Query$GetMyCards({
    this.getMyCards,
    this.$__typename = 'Query',
  });

  factory Query$GetMyCards.fromJson(Map<String, dynamic> json) {
    final l$getMyCards = json['getMyCards'];
    final l$$__typename = json['__typename'];
    return Query$GetMyCards(
      getMyCards: l$getMyCards == null
          ? null
          : Query$GetMyCards$getMyCards.fromJson(
              (l$getMyCards as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMyCards$getMyCards? getMyCards;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMyCards = getMyCards;
    _resultData['getMyCards'] = l$getMyCards?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMyCards = getMyCards;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMyCards,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMyCards) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMyCards = getMyCards;
    final lOther$getMyCards = other.getMyCards;
    if (l$getMyCards != lOther$getMyCards) {
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

extension UtilityExtension$Query$GetMyCards on Query$GetMyCards {
  CopyWith$Query$GetMyCards<Query$GetMyCards> get copyWith =>
      CopyWith$Query$GetMyCards(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMyCards<TRes> {
  factory CopyWith$Query$GetMyCards(
    Query$GetMyCards instance,
    TRes Function(Query$GetMyCards) then,
  ) = _CopyWithImpl$Query$GetMyCards;

  factory CopyWith$Query$GetMyCards.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyCards;

  TRes call({
    Query$GetMyCards$getMyCards? getMyCards,
    String? $__typename,
  });
  CopyWith$Query$GetMyCards$getMyCards<TRes> get getMyCards;
}

class _CopyWithImpl$Query$GetMyCards<TRes>
    implements CopyWith$Query$GetMyCards<TRes> {
  _CopyWithImpl$Query$GetMyCards(
    this._instance,
    this._then,
  );

  final Query$GetMyCards _instance;

  final TRes Function(Query$GetMyCards) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMyCards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyCards(
        getMyCards: getMyCards == _undefined
            ? _instance.getMyCards
            : (getMyCards as Query$GetMyCards$getMyCards?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMyCards$getMyCards<TRes> get getMyCards {
    final local$getMyCards = _instance.getMyCards;
    return local$getMyCards == null
        ? CopyWith$Query$GetMyCards$getMyCards.stub(_then(_instance))
        : CopyWith$Query$GetMyCards$getMyCards(
            local$getMyCards, (e) => call(getMyCards: e));
  }
}

class _CopyWithStubImpl$Query$GetMyCards<TRes>
    implements CopyWith$Query$GetMyCards<TRes> {
  _CopyWithStubImpl$Query$GetMyCards(this._res);

  TRes _res;

  call({
    Query$GetMyCards$getMyCards? getMyCards,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMyCards$getMyCards<TRes> get getMyCards =>
      CopyWith$Query$GetMyCards$getMyCards.stub(_res);
}

const documentNodeQueryGetMyCards = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMyCards'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getMyCards'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'boards'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'BoardFragment'),
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
  fragmentDefinitionBoardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCardFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionLabelFragment,
  fragmentDefinitionCheckListFragment,
]);
Query$GetMyCards _parserFn$Query$GetMyCards(Map<String, dynamic> data) =>
    Query$GetMyCards.fromJson(data);
typedef OnQueryComplete$Query$GetMyCards = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMyCards?,
);

class Options$Query$GetMyCards extends graphql.QueryOptions<Query$GetMyCards> {
  Options$Query$GetMyCards({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyCards? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMyCards? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetMyCards(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMyCards,
          parserFn: _parserFn$Query$GetMyCards,
        );

  final OnQueryComplete$Query$GetMyCards? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMyCards
    extends graphql.WatchQueryOptions<Query$GetMyCards> {
  WatchOptions$Query$GetMyCards({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyCards? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMyCards,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMyCards,
        );
}

class FetchMoreOptions$Query$GetMyCards extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMyCards({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMyCards,
        );
}

extension ClientExtension$Query$GetMyCards on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMyCards>> query$GetMyCards(
          [Options$Query$GetMyCards? options]) async =>
      await this.query(options ?? Options$Query$GetMyCards());
  graphql.ObservableQuery<Query$GetMyCards> watchQuery$GetMyCards(
          [WatchOptions$Query$GetMyCards? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMyCards());
  void writeQuery$GetMyCards({
    required Query$GetMyCards data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetMyCards)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMyCards? readQuery$GetMyCards({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetMyCards)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMyCards.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMyCards> useQuery$GetMyCards(
        [Options$Query$GetMyCards? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetMyCards());
graphql.ObservableQuery<Query$GetMyCards> useWatchQuery$GetMyCards(
        [WatchOptions$Query$GetMyCards? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetMyCards());

class Query$GetMyCards$Widget extends graphql_flutter.Query<Query$GetMyCards> {
  Query$GetMyCards$Widget({
    widgets.Key? key,
    Options$Query$GetMyCards? options,
    required graphql_flutter.QueryBuilder<Query$GetMyCards> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetMyCards(),
          builder: builder,
        );
}

class Query$GetMyCards$getMyCards {
  Query$GetMyCards$getMyCards({
    this.boards,
    this.cards,
    this.$__typename = 'ResultMyCards',
  });

  factory Query$GetMyCards$getMyCards.fromJson(Map<String, dynamic> json) {
    final l$boards = json['boards'];
    final l$cards = json['cards'];
    final l$$__typename = json['__typename'];
    return Query$GetMyCards$getMyCards(
      boards: (l$boards as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$BoardFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      cards: (l$cards as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$CardFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$BoardFragment?>? boards;

  final List<Fragment$CardFragment?>? cards;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$boards = boards;
    _resultData['boards'] = l$boards?.map((e) => e?.toJson()).toList();
    final l$cards = cards;
    _resultData['cards'] = l$cards?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$boards = boards;
    final l$cards = cards;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$boards == null ? null : Object.hashAll(l$boards.map((v) => v)),
      l$cards == null ? null : Object.hashAll(l$cards.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMyCards$getMyCards) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$boards = boards;
    final lOther$boards = other.boards;
    if (l$boards != null && lOther$boards != null) {
      if (l$boards.length != lOther$boards.length) {
        return false;
      }
      for (int i = 0; i < l$boards.length; i++) {
        final l$boards$entry = l$boards[i];
        final lOther$boards$entry = lOther$boards[i];
        if (l$boards$entry != lOther$boards$entry) {
          return false;
        }
      }
    } else if (l$boards != lOther$boards) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMyCards$getMyCards
    on Query$GetMyCards$getMyCards {
  CopyWith$Query$GetMyCards$getMyCards<Query$GetMyCards$getMyCards>
      get copyWith => CopyWith$Query$GetMyCards$getMyCards(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMyCards$getMyCards<TRes> {
  factory CopyWith$Query$GetMyCards$getMyCards(
    Query$GetMyCards$getMyCards instance,
    TRes Function(Query$GetMyCards$getMyCards) then,
  ) = _CopyWithImpl$Query$GetMyCards$getMyCards;

  factory CopyWith$Query$GetMyCards$getMyCards.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyCards$getMyCards;

  TRes call({
    List<Fragment$BoardFragment?>? boards,
    List<Fragment$CardFragment?>? cards,
    String? $__typename,
  });
  TRes boards(
      Iterable<Fragment$BoardFragment?>? Function(
              Iterable<
                  CopyWith$Fragment$BoardFragment<Fragment$BoardFragment>?>?)
          _fn);
  TRes cards(
      Iterable<Fragment$CardFragment?>? Function(
              Iterable<CopyWith$Fragment$CardFragment<Fragment$CardFragment>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetMyCards$getMyCards<TRes>
    implements CopyWith$Query$GetMyCards$getMyCards<TRes> {
  _CopyWithImpl$Query$GetMyCards$getMyCards(
    this._instance,
    this._then,
  );

  final Query$GetMyCards$getMyCards _instance;

  final TRes Function(Query$GetMyCards$getMyCards) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? boards = _undefined,
    Object? cards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyCards$getMyCards(
        boards: boards == _undefined
            ? _instance.boards
            : (boards as List<Fragment$BoardFragment?>?),
        cards: cards == _undefined
            ? _instance.cards
            : (cards as List<Fragment$CardFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes boards(
          Iterable<Fragment$BoardFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$BoardFragment<
                          Fragment$BoardFragment>?>?)
              _fn) =>
      call(
          boards: _fn(_instance.boards?.map((e) => e == null
              ? null
              : CopyWith$Fragment$BoardFragment(
                  e,
                  (i) => i,
                )))?.toList());

  TRes cards(
          Iterable<Fragment$CardFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$CardFragment<Fragment$CardFragment>?>?)
              _fn) =>
      call(
          cards: _fn(_instance.cards?.map((e) => e == null
              ? null
              : CopyWith$Fragment$CardFragment(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetMyCards$getMyCards<TRes>
    implements CopyWith$Query$GetMyCards$getMyCards<TRes> {
  _CopyWithStubImpl$Query$GetMyCards$getMyCards(this._res);

  TRes _res;

  call({
    List<Fragment$BoardFragment?>? boards,
    List<Fragment$CardFragment?>? cards,
    String? $__typename,
  }) =>
      _res;

  boards(_fn) => _res;

  cards(_fn) => _res;
}
