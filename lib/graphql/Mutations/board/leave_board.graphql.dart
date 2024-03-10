import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$LeaveBoard {
  factory Variables$Mutation$LeaveBoard({required String idBoard}) =>
      Variables$Mutation$LeaveBoard._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$LeaveBoard._(this._$data);

  factory Variables$Mutation$LeaveBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$LeaveBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$LeaveBoard<Variables$Mutation$LeaveBoard>
      get copyWith => CopyWith$Variables$Mutation$LeaveBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$LeaveBoard ||
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

abstract class CopyWith$Variables$Mutation$LeaveBoard<TRes> {
  factory CopyWith$Variables$Mutation$LeaveBoard(
    Variables$Mutation$LeaveBoard instance,
    TRes Function(Variables$Mutation$LeaveBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$LeaveBoard;

  factory CopyWith$Variables$Mutation$LeaveBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$LeaveBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$LeaveBoard<TRes>
    implements CopyWith$Variables$Mutation$LeaveBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$LeaveBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$LeaveBoard _instance;

  final TRes Function(Variables$Mutation$LeaveBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$LeaveBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$LeaveBoard<TRes>
    implements CopyWith$Variables$Mutation$LeaveBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LeaveBoard(this._res);

  final TRes _res;

  @override
  call({String? idBoard}) => _res;
}

class Mutation$LeaveBoard {
  Mutation$LeaveBoard({
    this.leaveBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LeaveBoard.fromJson(Map<String, dynamic> json) {
    final l$leaveBoard = json['leaveBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$LeaveBoard(
      leaveBoard: (l$leaveBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? leaveBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$leaveBoard = leaveBoard;
    resultData['leaveBoard'] = l$leaveBoard;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$leaveBoard = leaveBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$leaveBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LeaveBoard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$leaveBoard = leaveBoard;
    final lOther$leaveBoard = other.leaveBoard;
    if (l$leaveBoard != lOther$leaveBoard) {
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

extension UtilityExtension$Mutation$LeaveBoard on Mutation$LeaveBoard {
  CopyWith$Mutation$LeaveBoard<Mutation$LeaveBoard> get copyWith =>
      CopyWith$Mutation$LeaveBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$LeaveBoard<TRes> {
  factory CopyWith$Mutation$LeaveBoard(
    Mutation$LeaveBoard instance,
    TRes Function(Mutation$LeaveBoard) then,
  ) = _CopyWithImpl$Mutation$LeaveBoard;

  factory CopyWith$Mutation$LeaveBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LeaveBoard;

  TRes call({
    bool? leaveBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LeaveBoard<TRes>
    implements CopyWith$Mutation$LeaveBoard<TRes> {
  _CopyWithImpl$Mutation$LeaveBoard(
    this._instance,
    this._then,
  );

  final Mutation$LeaveBoard _instance;

  final TRes Function(Mutation$LeaveBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? leaveBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LeaveBoard(
        leaveBoard: leaveBoard == _undefined
            ? _instance.leaveBoard
            : (leaveBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$LeaveBoard<TRes>
    implements CopyWith$Mutation$LeaveBoard<TRes> {
  _CopyWithStubImpl$Mutation$LeaveBoard(this._res);

  final TRes _res;

  @override
  call({
    bool? leaveBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationLeaveBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LeaveBoard'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'leaveBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          ),
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
    ],),
  ),
],);
Mutation$LeaveBoard _parserFn$Mutation$LeaveBoard(Map<String, dynamic> data) =>
    Mutation$LeaveBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$LeaveBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$LeaveBoard?,
);

class Options$Mutation$LeaveBoard
    extends graphql.MutationOptions<Mutation$LeaveBoard> {
  Options$Mutation$LeaveBoard({
    String? operationName,
    required Variables$Mutation$LeaveBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LeaveBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LeaveBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$LeaveBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$LeaveBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLeaveBoard,
          parserFn: _parserFn$Mutation$LeaveBoard,
        );

  final OnMutationCompleted$Mutation$LeaveBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LeaveBoard
    extends graphql.WatchQueryOptions<Mutation$LeaveBoard> {
  WatchOptions$Mutation$LeaveBoard({
    String? operationName,
    required Variables$Mutation$LeaveBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LeaveBoard? typedOptimisticResult,
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
          document: documentNodeMutationLeaveBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$LeaveBoard,
        );
}

extension ClientExtension$Mutation$LeaveBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LeaveBoard>> mutate$LeaveBoard(
          Options$Mutation$LeaveBoard options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$LeaveBoard> watchMutation$LeaveBoard(
          WatchOptions$Mutation$LeaveBoard options,) =>
      watchMutation(options);
}

class Mutation$LeaveBoard$HookResult {
  Mutation$LeaveBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LeaveBoard runMutation;

  final graphql.QueryResult<Mutation$LeaveBoard> result;
}

Mutation$LeaveBoard$HookResult useMutation$LeaveBoard(
    [WidgetOptions$Mutation$LeaveBoard? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LeaveBoard());
  return Mutation$LeaveBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LeaveBoard> useWatchMutation$LeaveBoard(
        WatchOptions$Mutation$LeaveBoard options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$LeaveBoard
    extends graphql.MutationOptions<Mutation$LeaveBoard> {
  WidgetOptions$Mutation$LeaveBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LeaveBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LeaveBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$LeaveBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$LeaveBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLeaveBoard,
          parserFn: _parserFn$Mutation$LeaveBoard,
        );

  final OnMutationCompleted$Mutation$LeaveBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LeaveBoard
    = graphql.MultiSourceResult<Mutation$LeaveBoard> Function(
  Variables$Mutation$LeaveBoard, {
  Object? optimisticResult,
  Mutation$LeaveBoard? typedOptimisticResult,
});
typedef Builder$Mutation$LeaveBoard = widgets.Widget Function(
  RunMutation$Mutation$LeaveBoard,
  graphql.QueryResult<Mutation$LeaveBoard>?,
);

class Mutation$LeaveBoard$Widget
    extends graphql_flutter.Mutation<Mutation$LeaveBoard> {
  Mutation$LeaveBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$LeaveBoard? options,
    required Builder$Mutation$LeaveBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$LeaveBoard(),
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
