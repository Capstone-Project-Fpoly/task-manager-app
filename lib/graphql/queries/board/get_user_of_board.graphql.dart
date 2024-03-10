import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetUserOfBoard {
  factory Variables$Query$GetUserOfBoard({
    String? query,
    required String idBoard,
  }) =>
      Variables$Query$GetUserOfBoard._({
        if (query != null) r'query': query,
        r'idBoard': idBoard,
      });

  Variables$Query$GetUserOfBoard._(this._$data);

  factory Variables$Query$GetUserOfBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('query')) {
      final l$query = data['query'];
      result$data['query'] = (l$query as String?);
    }
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Query$GetUserOfBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get query => (_$data['query'] as String?);

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('query')) {
      final l$query = query;
      result$data['query'] = l$query;
    }
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Query$GetUserOfBoard<Variables$Query$GetUserOfBoard>
      get copyWith => CopyWith$Variables$Query$GetUserOfBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUserOfBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$query = query;
    final lOther$query = other.query;
    if (_$data.containsKey('query') != other._$data.containsKey('query')) {
      return false;
    }
    if (l$query != lOther$query) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$query = query;
    final l$idBoard = idBoard;
    return Object.hashAll([
      _$data.containsKey('query') ? l$query : const {},
      l$idBoard,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetUserOfBoard<TRes> {
  factory CopyWith$Variables$Query$GetUserOfBoard(
    Variables$Query$GetUserOfBoard instance,
    TRes Function(Variables$Query$GetUserOfBoard) then,
  ) = _CopyWithImpl$Variables$Query$GetUserOfBoard;

  factory CopyWith$Variables$Query$GetUserOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUserOfBoard;

  TRes call({
    String? query,
    String? idBoard,
  });
}

class _CopyWithImpl$Variables$Query$GetUserOfBoard<TRes>
    implements CopyWith$Variables$Query$GetUserOfBoard<TRes> {
  _CopyWithImpl$Variables$Query$GetUserOfBoard(
    this._instance,
    this._then,
  );

  final Variables$Query$GetUserOfBoard _instance;

  final TRes Function(Variables$Query$GetUserOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? query = _undefined,
    Object? idBoard = _undefined,
  }) =>
      _then(
        Variables$Query$GetUserOfBoard._({
          ..._instance._$data,
          if (query != _undefined) 'query': (query as String?),
          if (idBoard != _undefined && idBoard != null)
            'idBoard': (idBoard as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$GetUserOfBoard<TRes>
    implements CopyWith$Variables$Query$GetUserOfBoard<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUserOfBoard(this._res);

  final TRes _res;

  @override
  call({
    String? query,
    String? idBoard,
  }) =>
      _res;
}

class Query$GetUserOfBoard {
  Query$GetUserOfBoard({
    this.getUsersOfBoard,
    this.$__typename = 'Query',
  });

  factory Query$GetUserOfBoard.fromJson(Map<String, dynamic> json) {
    final l$getUsersOfBoard = json['getUsersOfBoard'];
    final l$$__typename = json['__typename'];
    return Query$GetUserOfBoard(
      getUsersOfBoard: (l$getUsersOfBoard as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$UserFragment.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$UserFragment?>? getUsersOfBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$getUsersOfBoard = getUsersOfBoard;
    resultData['getUsersOfBoard'] =
        l$getUsersOfBoard?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$getUsersOfBoard = getUsersOfBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getUsersOfBoard == null
          ? null
          : Object.hashAll(l$getUsersOfBoard.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserOfBoard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUsersOfBoard = getUsersOfBoard;
    final lOther$getUsersOfBoard = other.getUsersOfBoard;
    if (l$getUsersOfBoard != null && lOther$getUsersOfBoard != null) {
      if (l$getUsersOfBoard.length != lOther$getUsersOfBoard.length) {
        return false;
      }
      for (int i = 0; i < l$getUsersOfBoard.length; i++) {
        final l$getUsersOfBoard$entry = l$getUsersOfBoard[i];
        final lOther$getUsersOfBoard$entry = lOther$getUsersOfBoard[i];
        if (l$getUsersOfBoard$entry != lOther$getUsersOfBoard$entry) {
          return false;
        }
      }
    } else if (l$getUsersOfBoard != lOther$getUsersOfBoard) {
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

extension UtilityExtension$Query$GetUserOfBoard on Query$GetUserOfBoard {
  CopyWith$Query$GetUserOfBoard<Query$GetUserOfBoard> get copyWith =>
      CopyWith$Query$GetUserOfBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUserOfBoard<TRes> {
  factory CopyWith$Query$GetUserOfBoard(
    Query$GetUserOfBoard instance,
    TRes Function(Query$GetUserOfBoard) then,
  ) = _CopyWithImpl$Query$GetUserOfBoard;

  factory CopyWith$Query$GetUserOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserOfBoard;

  TRes call({
    List<Fragment$UserFragment?>? getUsersOfBoard,
    String? $__typename,
  });
  TRes getUsersOfBoard(
    Iterable<Fragment$UserFragment?>? Function(
      Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>?>?,
    ) fn,
  );
}

class _CopyWithImpl$Query$GetUserOfBoard<TRes>
    implements CopyWith$Query$GetUserOfBoard<TRes> {
  _CopyWithImpl$Query$GetUserOfBoard(
    this._instance,
    this._then,
  );

  final Query$GetUserOfBoard _instance;

  final TRes Function(Query$GetUserOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? getUsersOfBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Query$GetUserOfBoard(
          getUsersOfBoard: getUsersOfBoard == _undefined
              ? _instance.getUsersOfBoard
              : (getUsersOfBoard as List<Fragment$UserFragment?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  @override
  TRes getUsersOfBoard(
    Iterable<Fragment$UserFragment?>? Function(
      Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>?>?,
    ) fn,
  ) =>
      call(
        getUsersOfBoard: fn(
          _instance.getUsersOfBoard?.map(
            (e) => e == null
                ? null
                : CopyWith$Fragment$UserFragment(
                    e,
                    (i) => i,
                  ),
          ),
        )?.toList(),
      );
}

class _CopyWithStubImpl$Query$GetUserOfBoard<TRes>
    implements CopyWith$Query$GetUserOfBoard<TRes> {
  _CopyWithStubImpl$Query$GetUserOfBoard(this._res);

  final TRes _res;

  @override
  call({
    List<Fragment$UserFragment?>? getUsersOfBoard,
    String? $__typename,
  }) =>
      _res;

  @override
  getUsersOfBoard(fn) => _res;
}

const documentNodeQueryGetUserOfBoard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUserOfBoard'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'query')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'idBoard')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getUsersOfBoard'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'idBoard'),
                value: VariableNode(name: NameNode(value: 'idBoard')),
              ),
              ArgumentNode(
                name: NameNode(value: 'query'),
                value: VariableNode(name: NameNode(value: 'query')),
              ),
            ],
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
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionUserFragment,
  ],
);
Query$GetUserOfBoard _parserFn$Query$GetUserOfBoard(
  Map<String, dynamic> data,
) =>
    Query$GetUserOfBoard.fromJson(data);
typedef OnQueryComplete$Query$GetUserOfBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUserOfBoard?,
);

class Options$Query$GetUserOfBoard
    extends graphql.QueryOptions<Query$GetUserOfBoard> {
  Options$Query$GetUserOfBoard({
    String? operationName,
    required Variables$Query$GetUserOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserOfBoard? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserOfBoard? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
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
                    data == null ? null : _parserFn$Query$GetUserOfBoard(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUserOfBoard,
          parserFn: _parserFn$Query$GetUserOfBoard,
        );

  final OnQueryComplete$Query$GetUserOfBoard? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUserOfBoard
    extends graphql.WatchQueryOptions<Query$GetUserOfBoard> {
  WatchOptions$Query$GetUserOfBoard({
    String? operationName,
    required Variables$Query$GetUserOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserOfBoard? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetUserOfBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUserOfBoard,
        );
}

class FetchMoreOptions$Query$GetUserOfBoard extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserOfBoard({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUserOfBoard variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetUserOfBoard,
        );
}

extension ClientExtension$Query$GetUserOfBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserOfBoard>> query$GetUserOfBoard(
    Options$Query$GetUserOfBoard options,
  ) async =>
      await query(options);
  graphql.ObservableQuery<Query$GetUserOfBoard> watchQuery$GetUserOfBoard(
    WatchOptions$Query$GetUserOfBoard options,
  ) =>
      watchQuery(options);
  void writeQuery$GetUserOfBoard({
    required Query$GetUserOfBoard data,
    required Variables$Query$GetUserOfBoard variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: const graphql.Operation(
            document: documentNodeQueryGetUserOfBoard,
          ),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetUserOfBoard? readQuery$GetUserOfBoard({
    required Variables$Query$GetUserOfBoard variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation:
            const graphql.Operation(document: documentNodeQueryGetUserOfBoard),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserOfBoard.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserOfBoard> useQuery$GetUserOfBoard(
  Options$Query$GetUserOfBoard options,
) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetUserOfBoard> useWatchQuery$GetUserOfBoard(
  WatchOptions$Query$GetUserOfBoard options,
) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetUserOfBoard$Widget
    extends graphql_flutter.Query<Query$GetUserOfBoard> {
  const Query$GetUserOfBoard$Widget({
    widgets.Key? key,
    required Options$Query$GetUserOfBoard options,
    required graphql_flutter.QueryBuilder<Query$GetUserOfBoard> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}
