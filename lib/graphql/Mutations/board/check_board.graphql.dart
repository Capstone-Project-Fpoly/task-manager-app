import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$CheckBoard {
  factory Variables$Mutation$CheckBoard({required String idBoard}) =>
      Variables$Mutation$CheckBoard._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$CheckBoard._(this._$data);

  factory Variables$Mutation$CheckBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$CheckBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$CheckBoard<Variables$Mutation$CheckBoard>
      get copyWith => CopyWith$Variables$Mutation$CheckBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CheckBoard) ||
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

abstract class CopyWith$Variables$Mutation$CheckBoard<TRes> {
  factory CopyWith$Variables$Mutation$CheckBoard(
    Variables$Mutation$CheckBoard instance,
    TRes Function(Variables$Mutation$CheckBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$CheckBoard;

  factory CopyWith$Variables$Mutation$CheckBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CheckBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$CheckBoard<TRes>
    implements CopyWith$Variables$Mutation$CheckBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$CheckBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CheckBoard _instance;

  final TRes Function(Variables$Mutation$CheckBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$CheckBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CheckBoard<TRes>
    implements CopyWith$Variables$Mutation$CheckBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CheckBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Mutation$CheckBoard {
  Mutation$CheckBoard({
    this.checkBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CheckBoard.fromJson(Map<String, dynamic> json) {
    final l$checkBoard = json['checkBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$CheckBoard(
      checkBoard: (l$checkBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? checkBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkBoard = checkBoard;
    _resultData['checkBoard'] = l$checkBoard;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkBoard = checkBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$checkBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CheckBoard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkBoard = checkBoard;
    final lOther$checkBoard = other.checkBoard;
    if (l$checkBoard != lOther$checkBoard) {
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

extension UtilityExtension$Mutation$CheckBoard on Mutation$CheckBoard {
  CopyWith$Mutation$CheckBoard<Mutation$CheckBoard> get copyWith =>
      CopyWith$Mutation$CheckBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CheckBoard<TRes> {
  factory CopyWith$Mutation$CheckBoard(
    Mutation$CheckBoard instance,
    TRes Function(Mutation$CheckBoard) then,
  ) = _CopyWithImpl$Mutation$CheckBoard;

  factory CopyWith$Mutation$CheckBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CheckBoard;

  TRes call({
    bool? checkBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CheckBoard<TRes>
    implements CopyWith$Mutation$CheckBoard<TRes> {
  _CopyWithImpl$Mutation$CheckBoard(
    this._instance,
    this._then,
  );

  final Mutation$CheckBoard _instance;

  final TRes Function(Mutation$CheckBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CheckBoard(
        checkBoard: checkBoard == _undefined
            ? _instance.checkBoard
            : (checkBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CheckBoard<TRes>
    implements CopyWith$Mutation$CheckBoard<TRes> {
  _CopyWithStubImpl$Mutation$CheckBoard(this._res);

  TRes _res;

  call({
    bool? checkBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationCheckBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CheckBoard'),
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
        name: NameNode(value: 'checkBoard'),
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
Mutation$CheckBoard _parserFn$Mutation$CheckBoard(Map<String, dynamic> data) =>
    Mutation$CheckBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$CheckBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CheckBoard?,
);

class Options$Mutation$CheckBoard
    extends graphql.MutationOptions<Mutation$CheckBoard> {
  Options$Mutation$CheckBoard({
    String? operationName,
    required Variables$Mutation$CheckBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CheckBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CheckBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$CheckBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCheckBoard,
          parserFn: _parserFn$Mutation$CheckBoard,
        );

  final OnMutationCompleted$Mutation$CheckBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CheckBoard
    extends graphql.WatchQueryOptions<Mutation$CheckBoard> {
  WatchOptions$Mutation$CheckBoard({
    String? operationName,
    required Variables$Mutation$CheckBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckBoard? typedOptimisticResult,
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
          document: documentNodeMutationCheckBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CheckBoard,
        );
}

extension ClientExtension$Mutation$CheckBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CheckBoard>> mutate$CheckBoard(
          Options$Mutation$CheckBoard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CheckBoard> watchMutation$CheckBoard(
          WatchOptions$Mutation$CheckBoard options) =>
      this.watchMutation(options);
}

class Mutation$CheckBoard$HookResult {
  Mutation$CheckBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CheckBoard runMutation;

  final graphql.QueryResult<Mutation$CheckBoard> result;
}

Mutation$CheckBoard$HookResult useMutation$CheckBoard(
    [WidgetOptions$Mutation$CheckBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CheckBoard());
  return Mutation$CheckBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CheckBoard> useWatchMutation$CheckBoard(
        WatchOptions$Mutation$CheckBoard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CheckBoard
    extends graphql.MutationOptions<Mutation$CheckBoard> {
  WidgetOptions$Mutation$CheckBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CheckBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CheckBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CheckBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$CheckBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCheckBoard,
          parserFn: _parserFn$Mutation$CheckBoard,
        );

  final OnMutationCompleted$Mutation$CheckBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CheckBoard
    = graphql.MultiSourceResult<Mutation$CheckBoard> Function(
  Variables$Mutation$CheckBoard, {
  Object? optimisticResult,
  Mutation$CheckBoard? typedOptimisticResult,
});
typedef Builder$Mutation$CheckBoard = widgets.Widget Function(
  RunMutation$Mutation$CheckBoard,
  graphql.QueryResult<Mutation$CheckBoard>?,
);

class Mutation$CheckBoard$Widget
    extends graphql_flutter.Mutation<Mutation$CheckBoard> {
  Mutation$CheckBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CheckBoard? options,
    required Builder$Mutation$CheckBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CheckBoard(),
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
