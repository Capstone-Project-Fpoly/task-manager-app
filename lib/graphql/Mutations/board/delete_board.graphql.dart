import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteBoard {
  factory Variables$Mutation$DeleteBoard({required String idBoard}) =>
      Variables$Mutation$DeleteBoard._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$DeleteBoard._(this._$data);

  factory Variables$Mutation$DeleteBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$DeleteBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteBoard<Variables$Mutation$DeleteBoard>
      get copyWith => CopyWith$Variables$Mutation$DeleteBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteBoard) ||
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

abstract class CopyWith$Variables$Mutation$DeleteBoard<TRes> {
  factory CopyWith$Variables$Mutation$DeleteBoard(
    Variables$Mutation$DeleteBoard instance,
    TRes Function(Variables$Mutation$DeleteBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteBoard;

  factory CopyWith$Variables$Mutation$DeleteBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$DeleteBoard<TRes>
    implements CopyWith$Variables$Mutation$DeleteBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteBoard _instance;

  final TRes Function(Variables$Mutation$DeleteBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$DeleteBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteBoard<TRes>
    implements CopyWith$Variables$Mutation$DeleteBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Mutation$DeleteBoard {
  Mutation$DeleteBoard({
    this.deleteBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteBoard.fromJson(Map<String, dynamic> json) {
    final l$deleteBoard = json['deleteBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteBoard(
      deleteBoard: (l$deleteBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteBoard = deleteBoard;
    _resultData['deleteBoard'] = l$deleteBoard;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteBoard = deleteBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteBoard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteBoard = deleteBoard;
    final lOther$deleteBoard = other.deleteBoard;
    if (l$deleteBoard != lOther$deleteBoard) {
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

extension UtilityExtension$Mutation$DeleteBoard on Mutation$DeleteBoard {
  CopyWith$Mutation$DeleteBoard<Mutation$DeleteBoard> get copyWith =>
      CopyWith$Mutation$DeleteBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteBoard<TRes> {
  factory CopyWith$Mutation$DeleteBoard(
    Mutation$DeleteBoard instance,
    TRes Function(Mutation$DeleteBoard) then,
  ) = _CopyWithImpl$Mutation$DeleteBoard;

  factory CopyWith$Mutation$DeleteBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteBoard;

  TRes call({
    bool? deleteBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteBoard<TRes>
    implements CopyWith$Mutation$DeleteBoard<TRes> {
  _CopyWithImpl$Mutation$DeleteBoard(
    this._instance,
    this._then,
  );

  final Mutation$DeleteBoard _instance;

  final TRes Function(Mutation$DeleteBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteBoard(
        deleteBoard: deleteBoard == _undefined
            ? _instance.deleteBoard
            : (deleteBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteBoard<TRes>
    implements CopyWith$Mutation$DeleteBoard<TRes> {
  _CopyWithStubImpl$Mutation$DeleteBoard(this._res);

  TRes _res;

  call({
    bool? deleteBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteBoard'),
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
        name: NameNode(value: 'deleteBoard'),
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
Mutation$DeleteBoard _parserFn$Mutation$DeleteBoard(
        Map<String, dynamic> data) =>
    Mutation$DeleteBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteBoard?,
);

class Options$Mutation$DeleteBoard
    extends graphql.MutationOptions<Mutation$DeleteBoard> {
  Options$Mutation$DeleteBoard({
    String? operationName,
    required Variables$Mutation$DeleteBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteBoard,
          parserFn: _parserFn$Mutation$DeleteBoard,
        );

  final OnMutationCompleted$Mutation$DeleteBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteBoard
    extends graphql.WatchQueryOptions<Mutation$DeleteBoard> {
  WatchOptions$Mutation$DeleteBoard({
    String? operationName,
    required Variables$Mutation$DeleteBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBoard? typedOptimisticResult,
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
          document: documentNodeMutationDeleteBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteBoard,
        );
}

extension ClientExtension$Mutation$DeleteBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteBoard>> mutate$DeleteBoard(
          Options$Mutation$DeleteBoard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteBoard> watchMutation$DeleteBoard(
          WatchOptions$Mutation$DeleteBoard options) =>
      this.watchMutation(options);
}

class Mutation$DeleteBoard$HookResult {
  Mutation$DeleteBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteBoard runMutation;

  final graphql.QueryResult<Mutation$DeleteBoard> result;
}

Mutation$DeleteBoard$HookResult useMutation$DeleteBoard(
    [WidgetOptions$Mutation$DeleteBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteBoard());
  return Mutation$DeleteBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteBoard> useWatchMutation$DeleteBoard(
        WatchOptions$Mutation$DeleteBoard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteBoard
    extends graphql.MutationOptions<Mutation$DeleteBoard> {
  WidgetOptions$Mutation$DeleteBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteBoard,
          parserFn: _parserFn$Mutation$DeleteBoard,
        );

  final OnMutationCompleted$Mutation$DeleteBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteBoard
    = graphql.MultiSourceResult<Mutation$DeleteBoard> Function(
  Variables$Mutation$DeleteBoard, {
  Object? optimisticResult,
  Mutation$DeleteBoard? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteBoard = widgets.Widget Function(
  RunMutation$Mutation$DeleteBoard,
  graphql.QueryResult<Mutation$DeleteBoard>?,
);

class Mutation$DeleteBoard$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteBoard> {
  Mutation$DeleteBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteBoard? options,
    required Builder$Mutation$DeleteBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteBoard(),
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
