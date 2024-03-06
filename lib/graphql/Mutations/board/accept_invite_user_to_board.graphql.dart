import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$AcceptInviteUserBoard {
  factory Variables$Mutation$AcceptInviteUserBoard({
    required String idNotification,
    required String idBoard,
  }) =>
      Variables$Mutation$AcceptInviteUserBoard._({
        r'idNotification': idNotification,
        r'idBoard': idBoard,
      });

  Variables$Mutation$AcceptInviteUserBoard._(this._$data);

  factory Variables$Mutation$AcceptInviteUserBoard.fromJson(
      Map<String, dynamic> data,) {
    final result$data = <String, dynamic>{};
    final l$idNotification = data['idNotification'];
    result$data['idNotification'] = (l$idNotification as String);
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$AcceptInviteUserBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idNotification => (_$data['idNotification'] as String);

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idNotification = idNotification;
    result$data['idNotification'] = l$idNotification;
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$AcceptInviteUserBoard<
          Variables$Mutation$AcceptInviteUserBoard>
      get copyWith => CopyWith$Variables$Mutation$AcceptInviteUserBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AcceptInviteUserBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idNotification = idNotification;
    final lOther$idNotification = other.idNotification;
    if (l$idNotification != lOther$idNotification) {
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
    final l$idNotification = idNotification;
    final l$idBoard = idBoard;
    return Object.hashAll([
      l$idNotification,
      l$idBoard,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AcceptInviteUserBoard<TRes> {
  factory CopyWith$Variables$Mutation$AcceptInviteUserBoard(
    Variables$Mutation$AcceptInviteUserBoard instance,
    TRes Function(Variables$Mutation$AcceptInviteUserBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$AcceptInviteUserBoard;

  factory CopyWith$Variables$Mutation$AcceptInviteUserBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AcceptInviteUserBoard;

  TRes call({
    String? idNotification,
    String? idBoard,
  });
}

class _CopyWithImpl$Variables$Mutation$AcceptInviteUserBoard<TRes>
    implements CopyWith$Variables$Mutation$AcceptInviteUserBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$AcceptInviteUserBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AcceptInviteUserBoard _instance;

  final TRes Function(Variables$Mutation$AcceptInviteUserBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idNotification = _undefined,
    Object? idBoard = _undefined,
  }) =>
      _then(Variables$Mutation$AcceptInviteUserBoard._({
        ..._instance._$data,
        if (idNotification != _undefined && idNotification != null)
          'idNotification': (idNotification as String),
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$AcceptInviteUserBoard<TRes>
    implements CopyWith$Variables$Mutation$AcceptInviteUserBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AcceptInviteUserBoard(this._res);

  final TRes _res;

  @override
  call({
    String? idNotification,
    String? idBoard,
  }) =>
      _res;
}

class Mutation$AcceptInviteUserBoard {
  Mutation$AcceptInviteUserBoard({
    this.acceptInviteToBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AcceptInviteUserBoard.fromJson(Map<String, dynamic> json) {
    final l$acceptInviteToBoard = json['acceptInviteToBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$AcceptInviteUserBoard(
      acceptInviteToBoard: (l$acceptInviteToBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? acceptInviteToBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$acceptInviteToBoard = acceptInviteToBoard;
    resultData['acceptInviteToBoard'] = l$acceptInviteToBoard;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$acceptInviteToBoard = acceptInviteToBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$acceptInviteToBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AcceptInviteUserBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$acceptInviteToBoard = acceptInviteToBoard;
    final lOther$acceptInviteToBoard = other.acceptInviteToBoard;
    if (l$acceptInviteToBoard != lOther$acceptInviteToBoard) {
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

extension UtilityExtension$Mutation$AcceptInviteUserBoard
    on Mutation$AcceptInviteUserBoard {
  CopyWith$Mutation$AcceptInviteUserBoard<Mutation$AcceptInviteUserBoard>
      get copyWith => CopyWith$Mutation$AcceptInviteUserBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AcceptInviteUserBoard<TRes> {
  factory CopyWith$Mutation$AcceptInviteUserBoard(
    Mutation$AcceptInviteUserBoard instance,
    TRes Function(Mutation$AcceptInviteUserBoard) then,
  ) = _CopyWithImpl$Mutation$AcceptInviteUserBoard;

  factory CopyWith$Mutation$AcceptInviteUserBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AcceptInviteUserBoard;

  TRes call({
    bool? acceptInviteToBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AcceptInviteUserBoard<TRes>
    implements CopyWith$Mutation$AcceptInviteUserBoard<TRes> {
  _CopyWithImpl$Mutation$AcceptInviteUserBoard(
    this._instance,
    this._then,
  );

  final Mutation$AcceptInviteUserBoard _instance;

  final TRes Function(Mutation$AcceptInviteUserBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? acceptInviteToBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AcceptInviteUserBoard(
        acceptInviteToBoard: acceptInviteToBoard == _undefined
            ? _instance.acceptInviteToBoard
            : (acceptInviteToBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$AcceptInviteUserBoard<TRes>
    implements CopyWith$Mutation$AcceptInviteUserBoard<TRes> {
  _CopyWithStubImpl$Mutation$AcceptInviteUserBoard(this._res);

  final TRes _res;

  @override
  call({
    bool? acceptInviteToBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationAcceptInviteUserBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AcceptInviteUserBoard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idNotification')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
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
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'acceptInviteToBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idNotification'),
            value: VariableNode(name: NameNode(value: 'idNotification')),
          ),
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
Mutation$AcceptInviteUserBoard _parserFn$Mutation$AcceptInviteUserBoard(
        Map<String, dynamic> data,) =>
    Mutation$AcceptInviteUserBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$AcceptInviteUserBoard = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$AcceptInviteUserBoard?,
);

class Options$Mutation$AcceptInviteUserBoard
    extends graphql.MutationOptions<Mutation$AcceptInviteUserBoard> {
  Options$Mutation$AcceptInviteUserBoard({
    String? operationName,
    required Variables$Mutation$AcceptInviteUserBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptInviteUserBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AcceptInviteUserBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$AcceptInviteUserBoard>? update,
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
                        : _parserFn$Mutation$AcceptInviteUserBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAcceptInviteUserBoard,
          parserFn: _parserFn$Mutation$AcceptInviteUserBoard,
        );

  final OnMutationCompleted$Mutation$AcceptInviteUserBoard?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AcceptInviteUserBoard
    extends graphql.WatchQueryOptions<Mutation$AcceptInviteUserBoard> {
  WatchOptions$Mutation$AcceptInviteUserBoard({
    String? operationName,
    required Variables$Mutation$AcceptInviteUserBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptInviteUserBoard? typedOptimisticResult,
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
          document: documentNodeMutationAcceptInviteUserBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AcceptInviteUserBoard,
        );
}

extension ClientExtension$Mutation$AcceptInviteUserBoard
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AcceptInviteUserBoard>>
      mutate$AcceptInviteUserBoard(
              Options$Mutation$AcceptInviteUserBoard options,) async =>
          await mutate(options);
  graphql.ObservableQuery<Mutation$AcceptInviteUserBoard>
      watchMutation$AcceptInviteUserBoard(
              WatchOptions$Mutation$AcceptInviteUserBoard options,) =>
          watchMutation(options);
}

class Mutation$AcceptInviteUserBoard$HookResult {
  Mutation$AcceptInviteUserBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AcceptInviteUserBoard runMutation;

  final graphql.QueryResult<Mutation$AcceptInviteUserBoard> result;
}

Mutation$AcceptInviteUserBoard$HookResult useMutation$AcceptInviteUserBoard(
    [WidgetOptions$Mutation$AcceptInviteUserBoard? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AcceptInviteUserBoard());
  return Mutation$AcceptInviteUserBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AcceptInviteUserBoard>
    useWatchMutation$AcceptInviteUserBoard(
            WatchOptions$Mutation$AcceptInviteUserBoard options,) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AcceptInviteUserBoard
    extends graphql.MutationOptions<Mutation$AcceptInviteUserBoard> {
  WidgetOptions$Mutation$AcceptInviteUserBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptInviteUserBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AcceptInviteUserBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$AcceptInviteUserBoard>? update,
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
                        : _parserFn$Mutation$AcceptInviteUserBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAcceptInviteUserBoard,
          parserFn: _parserFn$Mutation$AcceptInviteUserBoard,
        );

  final OnMutationCompleted$Mutation$AcceptInviteUserBoard?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AcceptInviteUserBoard
    = graphql.MultiSourceResult<Mutation$AcceptInviteUserBoard> Function(
  Variables$Mutation$AcceptInviteUserBoard, {
  Object? optimisticResult,
  Mutation$AcceptInviteUserBoard? typedOptimisticResult,
});
typedef Builder$Mutation$AcceptInviteUserBoard = widgets.Widget Function(
  RunMutation$Mutation$AcceptInviteUserBoard,
  graphql.QueryResult<Mutation$AcceptInviteUserBoard>?,
);

class Mutation$AcceptInviteUserBoard$Widget
    extends graphql_flutter.Mutation<Mutation$AcceptInviteUserBoard> {
  Mutation$AcceptInviteUserBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AcceptInviteUserBoard? options,
    required Builder$Mutation$AcceptInviteUserBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AcceptInviteUserBoard(),
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
