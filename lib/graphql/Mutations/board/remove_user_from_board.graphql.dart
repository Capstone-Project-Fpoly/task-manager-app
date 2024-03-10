import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$RemoveUserFromBoard {
  factory Variables$Mutation$RemoveUserFromBoard({
    required String idBoard,
    required String uid,
  }) =>
      Variables$Mutation$RemoveUserFromBoard._({
        r'idBoard': idBoard,
        r'uid': uid,
      });

  Variables$Mutation$RemoveUserFromBoard._(this._$data);

  factory Variables$Mutation$RemoveUserFromBoard.fromJson(
      Map<String, dynamic> data,) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    final l$uid = data['uid'];
    result$data['uid'] = (l$uid as String);
    return Variables$Mutation$RemoveUserFromBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  String get uid => (_$data['uid'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    final l$uid = uid;
    result$data['uid'] = l$uid;
    return result$data;
  }

  CopyWith$Variables$Mutation$RemoveUserFromBoard<
          Variables$Mutation$RemoveUserFromBoard>
      get copyWith => CopyWith$Variables$Mutation$RemoveUserFromBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RemoveUserFromBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    final l$uid = uid;
    final lOther$uid = other.uid;
    if (l$uid != lOther$uid) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    final l$uid = uid;
    return Object.hashAll([
      l$idBoard,
      l$uid,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$RemoveUserFromBoard<TRes> {
  factory CopyWith$Variables$Mutation$RemoveUserFromBoard(
    Variables$Mutation$RemoveUserFromBoard instance,
    TRes Function(Variables$Mutation$RemoveUserFromBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$RemoveUserFromBoard;

  factory CopyWith$Variables$Mutation$RemoveUserFromBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RemoveUserFromBoard;

  TRes call({
    String? idBoard,
    String? uid,
  });
}

class _CopyWithImpl$Variables$Mutation$RemoveUserFromBoard<TRes>
    implements CopyWith$Variables$Mutation$RemoveUserFromBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$RemoveUserFromBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RemoveUserFromBoard _instance;

  final TRes Function(Variables$Mutation$RemoveUserFromBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idBoard = _undefined,
    Object? uid = _undefined,
  }) =>
      _then(Variables$Mutation$RemoveUserFromBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
        if (uid != _undefined && uid != null) 'uid': (uid as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$RemoveUserFromBoard<TRes>
    implements CopyWith$Variables$Mutation$RemoveUserFromBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RemoveUserFromBoard(this._res);

  final TRes _res;

  @override
  call({
    String? idBoard,
    String? uid,
  }) =>
      _res;
}

class Mutation$RemoveUserFromBoard {
  Mutation$RemoveUserFromBoard({
    this.removeUserFromBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RemoveUserFromBoard.fromJson(Map<String, dynamic> json) {
    final l$removeUserFromBoard = json['removeUserFromBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$RemoveUserFromBoard(
      removeUserFromBoard: (l$removeUserFromBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? removeUserFromBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$removeUserFromBoard = removeUserFromBoard;
    resultData['removeUserFromBoard'] = l$removeUserFromBoard;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$removeUserFromBoard = removeUserFromBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$removeUserFromBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RemoveUserFromBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$removeUserFromBoard = removeUserFromBoard;
    final lOther$removeUserFromBoard = other.removeUserFromBoard;
    if (l$removeUserFromBoard != lOther$removeUserFromBoard) {
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

extension UtilityExtension$Mutation$RemoveUserFromBoard
    on Mutation$RemoveUserFromBoard {
  CopyWith$Mutation$RemoveUserFromBoard<Mutation$RemoveUserFromBoard>
      get copyWith => CopyWith$Mutation$RemoveUserFromBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RemoveUserFromBoard<TRes> {
  factory CopyWith$Mutation$RemoveUserFromBoard(
    Mutation$RemoveUserFromBoard instance,
    TRes Function(Mutation$RemoveUserFromBoard) then,
  ) = _CopyWithImpl$Mutation$RemoveUserFromBoard;

  factory CopyWith$Mutation$RemoveUserFromBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RemoveUserFromBoard;

  TRes call({
    bool? removeUserFromBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RemoveUserFromBoard<TRes>
    implements CopyWith$Mutation$RemoveUserFromBoard<TRes> {
  _CopyWithImpl$Mutation$RemoveUserFromBoard(
    this._instance,
    this._then,
  );

  final Mutation$RemoveUserFromBoard _instance;

  final TRes Function(Mutation$RemoveUserFromBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? removeUserFromBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RemoveUserFromBoard(
        removeUserFromBoard: removeUserFromBoard == _undefined
            ? _instance.removeUserFromBoard
            : (removeUserFromBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$RemoveUserFromBoard<TRes>
    implements CopyWith$Mutation$RemoveUserFromBoard<TRes> {
  _CopyWithStubImpl$Mutation$RemoveUserFromBoard(this._res);

  final TRes _res;

  @override
  call({
    bool? removeUserFromBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationRemoveUserFromBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RemoveUserFromBoard'),
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
        variable: VariableNode(name: NameNode(value: 'uid')),
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
        name: NameNode(value: 'removeUserFromBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          ),
          ArgumentNode(
            name: NameNode(value: 'uid'),
            value: VariableNode(name: NameNode(value: 'uid')),
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
Mutation$RemoveUserFromBoard _parserFn$Mutation$RemoveUserFromBoard(
        Map<String, dynamic> data,) =>
    Mutation$RemoveUserFromBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$RemoveUserFromBoard = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$RemoveUserFromBoard?,
);

class Options$Mutation$RemoveUserFromBoard
    extends graphql.MutationOptions<Mutation$RemoveUserFromBoard> {
  Options$Mutation$RemoveUserFromBoard({
    String? operationName,
    required Variables$Mutation$RemoveUserFromBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveUserFromBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RemoveUserFromBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$RemoveUserFromBoard>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$RemoveUserFromBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRemoveUserFromBoard,
          parserFn: _parserFn$Mutation$RemoveUserFromBoard,
        );

  final OnMutationCompleted$Mutation$RemoveUserFromBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RemoveUserFromBoard
    extends graphql.WatchQueryOptions<Mutation$RemoveUserFromBoard> {
  WatchOptions$Mutation$RemoveUserFromBoard({
    String? operationName,
    required Variables$Mutation$RemoveUserFromBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveUserFromBoard? typedOptimisticResult,
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
          document: documentNodeMutationRemoveUserFromBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RemoveUserFromBoard,
        );
}

extension ClientExtension$Mutation$RemoveUserFromBoard
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RemoveUserFromBoard>>
      mutate$RemoveUserFromBoard(
              Options$Mutation$RemoveUserFromBoard options,) async =>
          await mutate(options);
  graphql.ObservableQuery<Mutation$RemoveUserFromBoard>
      watchMutation$RemoveUserFromBoard(
              WatchOptions$Mutation$RemoveUserFromBoard options,) =>
          watchMutation(options);
}

class Mutation$RemoveUserFromBoard$HookResult {
  Mutation$RemoveUserFromBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$RemoveUserFromBoard runMutation;

  final graphql.QueryResult<Mutation$RemoveUserFromBoard> result;
}

Mutation$RemoveUserFromBoard$HookResult useMutation$RemoveUserFromBoard(
    [WidgetOptions$Mutation$RemoveUserFromBoard? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$RemoveUserFromBoard());
  return Mutation$RemoveUserFromBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RemoveUserFromBoard>
    useWatchMutation$RemoveUserFromBoard(
            WatchOptions$Mutation$RemoveUserFromBoard options,) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RemoveUserFromBoard
    extends graphql.MutationOptions<Mutation$RemoveUserFromBoard> {
  WidgetOptions$Mutation$RemoveUserFromBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveUserFromBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RemoveUserFromBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$RemoveUserFromBoard>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$RemoveUserFromBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRemoveUserFromBoard,
          parserFn: _parserFn$Mutation$RemoveUserFromBoard,
        );

  final OnMutationCompleted$Mutation$RemoveUserFromBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$RemoveUserFromBoard
    = graphql.MultiSourceResult<Mutation$RemoveUserFromBoard> Function(
  Variables$Mutation$RemoveUserFromBoard, {
  Object? optimisticResult,
  Mutation$RemoveUserFromBoard? typedOptimisticResult,
});
typedef Builder$Mutation$RemoveUserFromBoard = widgets.Widget Function(
  RunMutation$Mutation$RemoveUserFromBoard,
  graphql.QueryResult<Mutation$RemoveUserFromBoard>?,
);

class Mutation$RemoveUserFromBoard$Widget
    extends graphql_flutter.Mutation<Mutation$RemoveUserFromBoard> {
  Mutation$RemoveUserFromBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RemoveUserFromBoard? options,
    required Builder$Mutation$RemoveUserFromBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$RemoveUserFromBoard(),
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
