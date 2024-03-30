import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$OpenBoard {
  factory Variables$Mutation$OpenBoard({required String idBoard}) =>
      Variables$Mutation$OpenBoard._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$OpenBoard._(this._$data);

  factory Variables$Mutation$OpenBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$OpenBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$OpenBoard<Variables$Mutation$OpenBoard>
      get copyWith => CopyWith$Variables$Mutation$OpenBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$OpenBoard) ||
        runtimeType != other.runtimeType) {
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
    final l$idBoard = idBoard;
    return Object.hashAll([l$idBoard]);
  }
}

abstract class CopyWith$Variables$Mutation$OpenBoard<TRes> {
  factory CopyWith$Variables$Mutation$OpenBoard(
    Variables$Mutation$OpenBoard instance,
    TRes Function(Variables$Mutation$OpenBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$OpenBoard;

  factory CopyWith$Variables$Mutation$OpenBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$OpenBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$OpenBoard<TRes>
    implements CopyWith$Variables$Mutation$OpenBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$OpenBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$OpenBoard _instance;

  final TRes Function(Variables$Mutation$OpenBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$OpenBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$OpenBoard<TRes>
    implements CopyWith$Variables$Mutation$OpenBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$OpenBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Mutation$OpenBoard {
  Mutation$OpenBoard({
    this.openBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$OpenBoard.fromJson(Map<String, dynamic> json) {
    final l$openBoard = json['openBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$OpenBoard(
      openBoard: (l$openBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? openBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$openBoard = openBoard;
    _resultData['openBoard'] = l$openBoard;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$openBoard = openBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$openBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$OpenBoard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$openBoard = openBoard;
    final lOther$openBoard = other.openBoard;
    if (l$openBoard != lOther$openBoard) {
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

extension UtilityExtension$Mutation$OpenBoard on Mutation$OpenBoard {
  CopyWith$Mutation$OpenBoard<Mutation$OpenBoard> get copyWith =>
      CopyWith$Mutation$OpenBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$OpenBoard<TRes> {
  factory CopyWith$Mutation$OpenBoard(
    Mutation$OpenBoard instance,
    TRes Function(Mutation$OpenBoard) then,
  ) = _CopyWithImpl$Mutation$OpenBoard;

  factory CopyWith$Mutation$OpenBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$OpenBoard;

  TRes call({
    bool? openBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$OpenBoard<TRes>
    implements CopyWith$Mutation$OpenBoard<TRes> {
  _CopyWithImpl$Mutation$OpenBoard(
    this._instance,
    this._then,
  );

  final Mutation$OpenBoard _instance;

  final TRes Function(Mutation$OpenBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? openBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$OpenBoard(
        openBoard: openBoard == _undefined
            ? _instance.openBoard
            : (openBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$OpenBoard<TRes>
    implements CopyWith$Mutation$OpenBoard<TRes> {
  _CopyWithStubImpl$Mutation$OpenBoard(this._res);

  TRes _res;

  call({
    bool? openBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationOpenBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'OpenBoard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idBoard')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'openBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          )
        ],
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
  ),
]);
Mutation$OpenBoard _parserFn$Mutation$OpenBoard(Map<String, dynamic> data) =>
    Mutation$OpenBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$OpenBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$OpenBoard?,
);

class Options$Mutation$OpenBoard
    extends graphql.MutationOptions<Mutation$OpenBoard> {
  Options$Mutation$OpenBoard({
    String? operationName,
    required Variables$Mutation$OpenBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$OpenBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$OpenBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$OpenBoard>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$OpenBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationOpenBoard,
          parserFn: _parserFn$Mutation$OpenBoard,
        );

  final OnMutationCompleted$Mutation$OpenBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$OpenBoard
    extends graphql.WatchQueryOptions<Mutation$OpenBoard> {
  WatchOptions$Mutation$OpenBoard({
    String? operationName,
    required Variables$Mutation$OpenBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$OpenBoard? typedOptimisticResult,
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
          document: documentNodeMutationOpenBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$OpenBoard,
        );
}

extension ClientExtension$Mutation$OpenBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$OpenBoard>> mutate$OpenBoard(
          Options$Mutation$OpenBoard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$OpenBoard> watchMutation$OpenBoard(
          WatchOptions$Mutation$OpenBoard options) =>
      this.watchMutation(options);
}

class Mutation$OpenBoard$HookResult {
  Mutation$OpenBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$OpenBoard runMutation;

  final graphql.QueryResult<Mutation$OpenBoard> result;
}

Mutation$OpenBoard$HookResult useMutation$OpenBoard(
    [WidgetOptions$Mutation$OpenBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$OpenBoard());
  return Mutation$OpenBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$OpenBoard> useWatchMutation$OpenBoard(
        WatchOptions$Mutation$OpenBoard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$OpenBoard
    extends graphql.MutationOptions<Mutation$OpenBoard> {
  WidgetOptions$Mutation$OpenBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$OpenBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$OpenBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$OpenBoard>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$OpenBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationOpenBoard,
          parserFn: _parserFn$Mutation$OpenBoard,
        );

  final OnMutationCompleted$Mutation$OpenBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$OpenBoard
    = graphql.MultiSourceResult<Mutation$OpenBoard> Function(
  Variables$Mutation$OpenBoard, {
  Object? optimisticResult,
  Mutation$OpenBoard? typedOptimisticResult,
});
typedef Builder$Mutation$OpenBoard = widgets.Widget Function(
  RunMutation$Mutation$OpenBoard,
  graphql.QueryResult<Mutation$OpenBoard>?,
);

class Mutation$OpenBoard$Widget
    extends graphql_flutter.Mutation<Mutation$OpenBoard> {
  Mutation$OpenBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$OpenBoard? options,
    required Builder$Mutation$OpenBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$OpenBoard(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}
