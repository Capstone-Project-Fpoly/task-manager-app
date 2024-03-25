import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteLabelOfBoard {
  factory Variables$Mutation$DeleteLabelOfBoard({required String idLabel}) =>
      Variables$Mutation$DeleteLabelOfBoard._({
        r'idLabel': idLabel,
      });

  Variables$Mutation$DeleteLabelOfBoard._(this._$data);

  factory Variables$Mutation$DeleteLabelOfBoard.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idLabel = data['idLabel'];
    result$data['idLabel'] = (l$idLabel as String);
    return Variables$Mutation$DeleteLabelOfBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idLabel => (_$data['idLabel'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idLabel = idLabel;
    result$data['idLabel'] = l$idLabel;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteLabelOfBoard<
          Variables$Mutation$DeleteLabelOfBoard>
      get copyWith => CopyWith$Variables$Mutation$DeleteLabelOfBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteLabelOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idLabel = idLabel;
    final lOther$idLabel = other.idLabel;
    if (l$idLabel != lOther$idLabel) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idLabel = idLabel;
    return Object.hashAll([l$idLabel]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteLabelOfBoard<TRes> {
  factory CopyWith$Variables$Mutation$DeleteLabelOfBoard(
    Variables$Mutation$DeleteLabelOfBoard instance,
    TRes Function(Variables$Mutation$DeleteLabelOfBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteLabelOfBoard;

  factory CopyWith$Variables$Mutation$DeleteLabelOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteLabelOfBoard;

  TRes call({String? idLabel});
}

class _CopyWithImpl$Variables$Mutation$DeleteLabelOfBoard<TRes>
    implements CopyWith$Variables$Mutation$DeleteLabelOfBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteLabelOfBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteLabelOfBoard _instance;

  final TRes Function(Variables$Mutation$DeleteLabelOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idLabel = _undefined}) =>
      _then(Variables$Mutation$DeleteLabelOfBoard._({
        ..._instance._$data,
        if (idLabel != _undefined && idLabel != null)
          'idLabel': (idLabel as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteLabelOfBoard<TRes>
    implements CopyWith$Variables$Mutation$DeleteLabelOfBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteLabelOfBoard(this._res);

  TRes _res;

  call({String? idLabel}) => _res;
}

class Mutation$DeleteLabelOfBoard {
  Mutation$DeleteLabelOfBoard({
    this.deleteLabelOfBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteLabelOfBoard.fromJson(Map<String, dynamic> json) {
    final l$deleteLabelOfBoard = json['deleteLabelOfBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteLabelOfBoard(
      deleteLabelOfBoard: (l$deleteLabelOfBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteLabelOfBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteLabelOfBoard = deleteLabelOfBoard;
    _resultData['deleteLabelOfBoard'] = l$deleteLabelOfBoard;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteLabelOfBoard = deleteLabelOfBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteLabelOfBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteLabelOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteLabelOfBoard = deleteLabelOfBoard;
    final lOther$deleteLabelOfBoard = other.deleteLabelOfBoard;
    if (l$deleteLabelOfBoard != lOther$deleteLabelOfBoard) {
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

extension UtilityExtension$Mutation$DeleteLabelOfBoard
    on Mutation$DeleteLabelOfBoard {
  CopyWith$Mutation$DeleteLabelOfBoard<Mutation$DeleteLabelOfBoard>
      get copyWith => CopyWith$Mutation$DeleteLabelOfBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteLabelOfBoard<TRes> {
  factory CopyWith$Mutation$DeleteLabelOfBoard(
    Mutation$DeleteLabelOfBoard instance,
    TRes Function(Mutation$DeleteLabelOfBoard) then,
  ) = _CopyWithImpl$Mutation$DeleteLabelOfBoard;

  factory CopyWith$Mutation$DeleteLabelOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteLabelOfBoard;

  TRes call({
    bool? deleteLabelOfBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteLabelOfBoard<TRes>
    implements CopyWith$Mutation$DeleteLabelOfBoard<TRes> {
  _CopyWithImpl$Mutation$DeleteLabelOfBoard(
    this._instance,
    this._then,
  );

  final Mutation$DeleteLabelOfBoard _instance;

  final TRes Function(Mutation$DeleteLabelOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteLabelOfBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteLabelOfBoard(
        deleteLabelOfBoard: deleteLabelOfBoard == _undefined
            ? _instance.deleteLabelOfBoard
            : (deleteLabelOfBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteLabelOfBoard<TRes>
    implements CopyWith$Mutation$DeleteLabelOfBoard<TRes> {
  _CopyWithStubImpl$Mutation$DeleteLabelOfBoard(this._res);

  TRes _res;

  call({
    bool? deleteLabelOfBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteLabelOfBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteLabelOfBoard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idLabel')),
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
        name: NameNode(value: 'deleteLabelOfBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idLabel'),
            value: VariableNode(name: NameNode(value: 'idLabel')),
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
Mutation$DeleteLabelOfBoard _parserFn$Mutation$DeleteLabelOfBoard(
        Map<String, dynamic> data) =>
    Mutation$DeleteLabelOfBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteLabelOfBoard = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteLabelOfBoard?,
);

class Options$Mutation$DeleteLabelOfBoard
    extends graphql.MutationOptions<Mutation$DeleteLabelOfBoard> {
  Options$Mutation$DeleteLabelOfBoard({
    String? operationName,
    required Variables$Mutation$DeleteLabelOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteLabelOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteLabelOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteLabelOfBoard>? update,
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
                        : _parserFn$Mutation$DeleteLabelOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteLabelOfBoard,
          parserFn: _parserFn$Mutation$DeleteLabelOfBoard,
        );

  final OnMutationCompleted$Mutation$DeleteLabelOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteLabelOfBoard
    extends graphql.WatchQueryOptions<Mutation$DeleteLabelOfBoard> {
  WatchOptions$Mutation$DeleteLabelOfBoard({
    String? operationName,
    required Variables$Mutation$DeleteLabelOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteLabelOfBoard? typedOptimisticResult,
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
          document: documentNodeMutationDeleteLabelOfBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteLabelOfBoard,
        );
}

extension ClientExtension$Mutation$DeleteLabelOfBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteLabelOfBoard>>
      mutate$DeleteLabelOfBoard(
              Options$Mutation$DeleteLabelOfBoard options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteLabelOfBoard>
      watchMutation$DeleteLabelOfBoard(
              WatchOptions$Mutation$DeleteLabelOfBoard options) =>
          this.watchMutation(options);
}

class Mutation$DeleteLabelOfBoard$HookResult {
  Mutation$DeleteLabelOfBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteLabelOfBoard runMutation;

  final graphql.QueryResult<Mutation$DeleteLabelOfBoard> result;
}

Mutation$DeleteLabelOfBoard$HookResult useMutation$DeleteLabelOfBoard(
    [WidgetOptions$Mutation$DeleteLabelOfBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteLabelOfBoard());
  return Mutation$DeleteLabelOfBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteLabelOfBoard>
    useWatchMutation$DeleteLabelOfBoard(
            WatchOptions$Mutation$DeleteLabelOfBoard options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteLabelOfBoard
    extends graphql.MutationOptions<Mutation$DeleteLabelOfBoard> {
  WidgetOptions$Mutation$DeleteLabelOfBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteLabelOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteLabelOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteLabelOfBoard>? update,
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
                        : _parserFn$Mutation$DeleteLabelOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteLabelOfBoard,
          parserFn: _parserFn$Mutation$DeleteLabelOfBoard,
        );

  final OnMutationCompleted$Mutation$DeleteLabelOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteLabelOfBoard
    = graphql.MultiSourceResult<Mutation$DeleteLabelOfBoard> Function(
  Variables$Mutation$DeleteLabelOfBoard, {
  Object? optimisticResult,
  Mutation$DeleteLabelOfBoard? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteLabelOfBoard = widgets.Widget Function(
  RunMutation$Mutation$DeleteLabelOfBoard,
  graphql.QueryResult<Mutation$DeleteLabelOfBoard>?,
);

class Mutation$DeleteLabelOfBoard$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteLabelOfBoard> {
  Mutation$DeleteLabelOfBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteLabelOfBoard? options,
    required Builder$Mutation$DeleteLabelOfBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteLabelOfBoard(),
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
