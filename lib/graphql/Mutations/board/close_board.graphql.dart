import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$CloseBoard {
  factory Variables$Mutation$CloseBoard({required String idBoard}) =>
      Variables$Mutation$CloseBoard._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$CloseBoard._(this._$data);

  factory Variables$Mutation$CloseBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$CloseBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$CloseBoard<Variables$Mutation$CloseBoard>
      get copyWith => CopyWith$Variables$Mutation$CloseBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CloseBoard) ||
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

abstract class CopyWith$Variables$Mutation$CloseBoard<TRes> {
  factory CopyWith$Variables$Mutation$CloseBoard(
    Variables$Mutation$CloseBoard instance,
    TRes Function(Variables$Mutation$CloseBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$CloseBoard;

  factory CopyWith$Variables$Mutation$CloseBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CloseBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$CloseBoard<TRes>
    implements CopyWith$Variables$Mutation$CloseBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$CloseBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CloseBoard _instance;

  final TRes Function(Variables$Mutation$CloseBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$CloseBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CloseBoard<TRes>
    implements CopyWith$Variables$Mutation$CloseBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CloseBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Mutation$CloseBoard {
  Mutation$CloseBoard({
    this.closeBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CloseBoard.fromJson(Map<String, dynamic> json) {
    final l$closeBoard = json['closeBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$CloseBoard(
      closeBoard: (l$closeBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? closeBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$closeBoard = closeBoard;
    _resultData['closeBoard'] = l$closeBoard;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$closeBoard = closeBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$closeBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CloseBoard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$closeBoard = closeBoard;
    final lOther$closeBoard = other.closeBoard;
    if (l$closeBoard != lOther$closeBoard) {
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

extension UtilityExtension$Mutation$CloseBoard on Mutation$CloseBoard {
  CopyWith$Mutation$CloseBoard<Mutation$CloseBoard> get copyWith =>
      CopyWith$Mutation$CloseBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CloseBoard<TRes> {
  factory CopyWith$Mutation$CloseBoard(
    Mutation$CloseBoard instance,
    TRes Function(Mutation$CloseBoard) then,
  ) = _CopyWithImpl$Mutation$CloseBoard;

  factory CopyWith$Mutation$CloseBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CloseBoard;

  TRes call({
    bool? closeBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CloseBoard<TRes>
    implements CopyWith$Mutation$CloseBoard<TRes> {
  _CopyWithImpl$Mutation$CloseBoard(
    this._instance,
    this._then,
  );

  final Mutation$CloseBoard _instance;

  final TRes Function(Mutation$CloseBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? closeBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CloseBoard(
        closeBoard: closeBoard == _undefined
            ? _instance.closeBoard
            : (closeBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CloseBoard<TRes>
    implements CopyWith$Mutation$CloseBoard<TRes> {
  _CopyWithStubImpl$Mutation$CloseBoard(this._res);

  TRes _res;

  call({
    bool? closeBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationCloseBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CloseBoard'),
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
        name: NameNode(value: 'closeBoard'),
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
Mutation$CloseBoard _parserFn$Mutation$CloseBoard(Map<String, dynamic> data) =>
    Mutation$CloseBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$CloseBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CloseBoard?,
);

class Options$Mutation$CloseBoard
    extends graphql.MutationOptions<Mutation$CloseBoard> {
  Options$Mutation$CloseBoard({
    String? operationName,
    required Variables$Mutation$CloseBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CloseBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CloseBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CloseBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$CloseBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCloseBoard,
          parserFn: _parserFn$Mutation$CloseBoard,
        );

  final OnMutationCompleted$Mutation$CloseBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CloseBoard
    extends graphql.WatchQueryOptions<Mutation$CloseBoard> {
  WatchOptions$Mutation$CloseBoard({
    String? operationName,
    required Variables$Mutation$CloseBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CloseBoard? typedOptimisticResult,
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
          document: documentNodeMutationCloseBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CloseBoard,
        );
}

extension ClientExtension$Mutation$CloseBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CloseBoard>> mutate$CloseBoard(
          Options$Mutation$CloseBoard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CloseBoard> watchMutation$CloseBoard(
          WatchOptions$Mutation$CloseBoard options) =>
      this.watchMutation(options);
}

class Mutation$CloseBoard$HookResult {
  Mutation$CloseBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CloseBoard runMutation;

  final graphql.QueryResult<Mutation$CloseBoard> result;
}

Mutation$CloseBoard$HookResult useMutation$CloseBoard(
    [WidgetOptions$Mutation$CloseBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CloseBoard());
  return Mutation$CloseBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CloseBoard> useWatchMutation$CloseBoard(
        WatchOptions$Mutation$CloseBoard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CloseBoard
    extends graphql.MutationOptions<Mutation$CloseBoard> {
  WidgetOptions$Mutation$CloseBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CloseBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CloseBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CloseBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$CloseBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCloseBoard,
          parserFn: _parserFn$Mutation$CloseBoard,
        );

  final OnMutationCompleted$Mutation$CloseBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CloseBoard
    = graphql.MultiSourceResult<Mutation$CloseBoard> Function(
  Variables$Mutation$CloseBoard, {
  Object? optimisticResult,
  Mutation$CloseBoard? typedOptimisticResult,
});
typedef Builder$Mutation$CloseBoard = widgets.Widget Function(
  RunMutation$Mutation$CloseBoard,
  graphql.QueryResult<Mutation$CloseBoard>?,
);

class Mutation$CloseBoard$Widget
    extends graphql_flutter.Mutation<Mutation$CloseBoard> {
  Mutation$CloseBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CloseBoard? options,
    required Builder$Mutation$CloseBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CloseBoard(),
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
