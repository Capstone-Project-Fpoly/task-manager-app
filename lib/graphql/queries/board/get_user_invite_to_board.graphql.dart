import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$getUsersInviteToBoard {
  factory Variables$Query$getUsersInviteToBoard({
    required String idBoard,
    String? query,
  }) =>
      Variables$Query$getUsersInviteToBoard._({
        r'idBoard': idBoard,
        if (query != null) r'query': query,
      });

  Variables$Query$getUsersInviteToBoard._(this._$data);

  factory Variables$Query$getUsersInviteToBoard.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    if (data.containsKey('query')) {
      final l$query = data['query'];
      result$data['query'] = (l$query as String?);
    }
    return Variables$Query$getUsersInviteToBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  String? get query => (_$data['query'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    if (_$data.containsKey('query')) {
      final l$query = query;
      result$data['query'] = l$query;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getUsersInviteToBoard<
          Variables$Query$getUsersInviteToBoard>
      get copyWith => CopyWith$Variables$Query$getUsersInviteToBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$getUsersInviteToBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    final l$query = query;
    return Object.hashAll([
      l$idBoard,
      _$data.containsKey('query') ? l$query : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getUsersInviteToBoard<TRes> {
  factory CopyWith$Variables$Query$getUsersInviteToBoard(
    Variables$Query$getUsersInviteToBoard instance,
    TRes Function(Variables$Query$getUsersInviteToBoard) then,
  ) = _CopyWithImpl$Variables$Query$getUsersInviteToBoard;

  factory CopyWith$Variables$Query$getUsersInviteToBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getUsersInviteToBoard;

  TRes call({
    String? idBoard,
    String? query,
  });
}

class _CopyWithImpl$Variables$Query$getUsersInviteToBoard<TRes>
    implements CopyWith$Variables$Query$getUsersInviteToBoard<TRes> {
  _CopyWithImpl$Variables$Query$getUsersInviteToBoard(
    this._instance,
    this._then,
  );

  final Variables$Query$getUsersInviteToBoard _instance;

  final TRes Function(Variables$Query$getUsersInviteToBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idBoard = _undefined,
    Object? query = _undefined,
  }) =>
      _then(
        Variables$Query$getUsersInviteToBoard._({
          ..._instance._$data,
          if (idBoard != _undefined && idBoard != null)
            'idBoard': (idBoard as String),
          if (query != _undefined) 'query': (query as String?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$getUsersInviteToBoard<TRes>
    implements CopyWith$Variables$Query$getUsersInviteToBoard<TRes> {
  _CopyWithStubImpl$Variables$Query$getUsersInviteToBoard(this._res);

  final TRes _res;

  @override
  call({
    String? idBoard,
    String? query,
  }) =>
      _res;
}

class Query$getUsersInviteToBoard {
  Query$getUsersInviteToBoard({
    this.getUsersInviteToBoard,
    this.$__typename = 'Query',
  });

  factory Query$getUsersInviteToBoard.fromJson(Map<String, dynamic> json) {
    final l$getUsersInviteToBoard = json['getUsersInviteToBoard'];
    final l$$__typename = json['__typename'];
    return Query$getUsersInviteToBoard(
      getUsersInviteToBoard: (l$getUsersInviteToBoard as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$UserFragment.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$UserFragment?>? getUsersInviteToBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$getUsersInviteToBoard = getUsersInviteToBoard;
    resultData['getUsersInviteToBoard'] =
        l$getUsersInviteToBoard?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$getUsersInviteToBoard = getUsersInviteToBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getUsersInviteToBoard == null
          ? null
          : Object.hashAll(l$getUsersInviteToBoard.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$getUsersInviteToBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUsersInviteToBoard = getUsersInviteToBoard;
    final lOther$getUsersInviteToBoard = other.getUsersInviteToBoard;
    if (l$getUsersInviteToBoard != null &&
        lOther$getUsersInviteToBoard != null) {
      if (l$getUsersInviteToBoard.length !=
          lOther$getUsersInviteToBoard.length) {
        return false;
      }
      for (int i = 0; i < l$getUsersInviteToBoard.length; i++) {
        final l$getUsersInviteToBoard$entry = l$getUsersInviteToBoard[i];
        final lOther$getUsersInviteToBoard$entry =
            lOther$getUsersInviteToBoard[i];
        if (l$getUsersInviteToBoard$entry !=
            lOther$getUsersInviteToBoard$entry) {
          return false;
        }
      }
    } else if (l$getUsersInviteToBoard != lOther$getUsersInviteToBoard) {
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

extension UtilityExtension$Query$getUsersInviteToBoard
    on Query$getUsersInviteToBoard {
  CopyWith$Query$getUsersInviteToBoard<Query$getUsersInviteToBoard>
      get copyWith => CopyWith$Query$getUsersInviteToBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUsersInviteToBoard<TRes> {
  factory CopyWith$Query$getUsersInviteToBoard(
    Query$getUsersInviteToBoard instance,
    TRes Function(Query$getUsersInviteToBoard) then,
  ) = _CopyWithImpl$Query$getUsersInviteToBoard;

  factory CopyWith$Query$getUsersInviteToBoard.stub(TRes res) =
      _CopyWithStubImpl$Query$getUsersInviteToBoard;

  TRes call({
    List<Fragment$UserFragment?>? getUsersInviteToBoard,
    String? $__typename,
  });
  TRes getUsersInviteToBoard(
    Iterable<Fragment$UserFragment?>? Function(
      Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>?>?,
    ) fn,
  );
}

class _CopyWithImpl$Query$getUsersInviteToBoard<TRes>
    implements CopyWith$Query$getUsersInviteToBoard<TRes> {
  _CopyWithImpl$Query$getUsersInviteToBoard(
    this._instance,
    this._then,
  );

  final Query$getUsersInviteToBoard _instance;

  final TRes Function(Query$getUsersInviteToBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? getUsersInviteToBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Query$getUsersInviteToBoard(
          getUsersInviteToBoard: getUsersInviteToBoard == _undefined
              ? _instance.getUsersInviteToBoard
              : (getUsersInviteToBoard as List<Fragment$UserFragment?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  @override
  TRes getUsersInviteToBoard(
    Iterable<Fragment$UserFragment?>? Function(
      Iterable<CopyWith$Fragment$UserFragment<Fragment$UserFragment>?>?,
    ) fn,
  ) =>
      call(
        getUsersInviteToBoard: fn(
          _instance.getUsersInviteToBoard?.map(
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

class _CopyWithStubImpl$Query$getUsersInviteToBoard<TRes>
    implements CopyWith$Query$getUsersInviteToBoard<TRes> {
  _CopyWithStubImpl$Query$getUsersInviteToBoard(this._res);

  final TRes _res;

  @override
  call({
    List<Fragment$UserFragment?>? getUsersInviteToBoard,
    String? $__typename,
  }) =>
      _res;

  @override
  getUsersInviteToBoard(fn) => _res;
}

const documentNodeQuerygetUsersInviteToBoard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getUsersInviteToBoard'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'idBoard')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'query')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getUsersInviteToBoard'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'query'),
                value: VariableNode(name: NameNode(value: 'query')),
              ),
              ArgumentNode(
                name: NameNode(value: 'idBoard'),
                value: VariableNode(name: NameNode(value: 'idBoard')),
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
Query$getUsersInviteToBoard _parserFn$Query$getUsersInviteToBoard(
  Map<String, dynamic> data,
) =>
    Query$getUsersInviteToBoard.fromJson(data);
typedef OnQueryComplete$Query$getUsersInviteToBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getUsersInviteToBoard?,
);

class Options$Query$getUsersInviteToBoard
    extends graphql.QueryOptions<Query$getUsersInviteToBoard> {
  Options$Query$getUsersInviteToBoard({
    String? operationName,
    required Variables$Query$getUsersInviteToBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getUsersInviteToBoard? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getUsersInviteToBoard? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$getUsersInviteToBoard(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetUsersInviteToBoard,
          parserFn: _parserFn$Query$getUsersInviteToBoard,
        );

  final OnQueryComplete$Query$getUsersInviteToBoard? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getUsersInviteToBoard
    extends graphql.WatchQueryOptions<Query$getUsersInviteToBoard> {
  WatchOptions$Query$getUsersInviteToBoard({
    String? operationName,
    required Variables$Query$getUsersInviteToBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getUsersInviteToBoard? typedOptimisticResult,
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
          document: documentNodeQuerygetUsersInviteToBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getUsersInviteToBoard,
        );
}

class FetchMoreOptions$Query$getUsersInviteToBoard
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getUsersInviteToBoard({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getUsersInviteToBoard variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetUsersInviteToBoard,
        );
}

extension ClientExtension$Query$getUsersInviteToBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getUsersInviteToBoard>>
      query$getUsersInviteToBoard(
    Options$Query$getUsersInviteToBoard options,
  ) async =>
          await query(options);
  graphql.ObservableQuery<Query$getUsersInviteToBoard>
      watchQuery$getUsersInviteToBoard(
    WatchOptions$Query$getUsersInviteToBoard options,
  ) =>
          watchQuery(options);
  void writeQuery$getUsersInviteToBoard({
    required Query$getUsersInviteToBoard data,
    required Variables$Query$getUsersInviteToBoard variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: const graphql.Operation(
            document: documentNodeQuerygetUsersInviteToBoard,
          ),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getUsersInviteToBoard? readQuery$getUsersInviteToBoard({
    required Variables$Query$getUsersInviteToBoard variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation: const graphql.Operation(
            document: documentNodeQuerygetUsersInviteToBoard,),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getUsersInviteToBoard.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getUsersInviteToBoard>
    useQuery$getUsersInviteToBoard(
  Options$Query$getUsersInviteToBoard options,
) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getUsersInviteToBoard>
    useWatchQuery$getUsersInviteToBoard(
  WatchOptions$Query$getUsersInviteToBoard options,
) =>
        graphql_flutter.useWatchQuery(options);

class Query$getUsersInviteToBoard$Widget
    extends graphql_flutter.Query<Query$getUsersInviteToBoard> {
  const Query$getUsersInviteToBoard$Widget({
    widgets.Key? key,
    required Options$Query$getUsersInviteToBoard options,
    required graphql_flutter.QueryBuilder<Query$getUsersInviteToBoard> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}
