import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UpdateBoard {
  factory Variables$Mutation$UpdateBoard({
    required String idBoard,
    required Input$InputUpdateBoard input,
  }) =>
      Variables$Mutation$UpdateBoard._({
        r'idBoard': idBoard,
        r'input': input,
      });

  Variables$Mutation$UpdateBoard._(this._$data);

  factory Variables$Mutation$UpdateBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$InputUpdateBoard.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Input$InputUpdateBoard get input =>
      (_$data['input'] as Input$InputUpdateBoard);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateBoard<Variables$Mutation$UpdateBoard>
      get copyWith => CopyWith$Variables$Mutation$UpdateBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    final l$input = input;
    return Object.hashAll([
      l$idBoard,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateBoard<TRes> {
  factory CopyWith$Variables$Mutation$UpdateBoard(
    Variables$Mutation$UpdateBoard instance,
    TRes Function(Variables$Mutation$UpdateBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateBoard;

  factory CopyWith$Variables$Mutation$UpdateBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateBoard;

  TRes call({
    String? idBoard,
    Input$InputUpdateBoard? input,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateBoard<TRes>
    implements CopyWith$Variables$Mutation$UpdateBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateBoard _instance;

  final TRes Function(Variables$Mutation$UpdateBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idBoard = _undefined,
    Object? input = _undefined,
  }) =>
      _then(
        Variables$Mutation$UpdateBoard._({
          ..._instance._$data,
          if (idBoard != _undefined && idBoard != null)
            'idBoard': (idBoard as String),
          if (input != _undefined && input != null)
            'input': (input as Input$InputUpdateBoard),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateBoard<TRes>
    implements CopyWith$Variables$Mutation$UpdateBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateBoard(this._res);

  final TRes _res;

  @override
  call({
    String? idBoard,
    Input$InputUpdateBoard? input,
  }) =>
      _res;
}

class Mutation$UpdateBoard {
  Mutation$UpdateBoard({
    this.updateBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateBoard.fromJson(Map<String, dynamic> json) {
    final l$updateBoard = json['updateBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBoard(
      updateBoard: l$updateBoard == null
          ? null
          : Fragment$BoardFragment.fromJson(
              (l$updateBoard as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$BoardFragment? updateBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$updateBoard = updateBoard;
    resultData['updateBoard'] = l$updateBoard?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$updateBoard = updateBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateBoard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateBoard = updateBoard;
    final lOther$updateBoard = other.updateBoard;
    if (l$updateBoard != lOther$updateBoard) {
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

extension UtilityExtension$Mutation$UpdateBoard on Mutation$UpdateBoard {
  CopyWith$Mutation$UpdateBoard<Mutation$UpdateBoard> get copyWith =>
      CopyWith$Mutation$UpdateBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateBoard<TRes> {
  factory CopyWith$Mutation$UpdateBoard(
    Mutation$UpdateBoard instance,
    TRes Function(Mutation$UpdateBoard) then,
  ) = _CopyWithImpl$Mutation$UpdateBoard;

  factory CopyWith$Mutation$UpdateBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBoard;

  TRes call({
    Fragment$BoardFragment? updateBoard,
    String? $__typename,
  });
  CopyWith$Fragment$BoardFragment<TRes> get updateBoard;
}

class _CopyWithImpl$Mutation$UpdateBoard<TRes>
    implements CopyWith$Mutation$UpdateBoard<TRes> {
  _CopyWithImpl$Mutation$UpdateBoard(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBoard _instance;

  final TRes Function(Mutation$UpdateBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? updateBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Mutation$UpdateBoard(
          updateBoard: updateBoard == _undefined
              ? _instance.updateBoard
              : (updateBoard as Fragment$BoardFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  @override
  CopyWith$Fragment$BoardFragment<TRes> get updateBoard {
    final local$updateBoard = _instance.updateBoard;
    return local$updateBoard == null
        ? CopyWith$Fragment$BoardFragment.stub(_then(_instance))
        : CopyWith$Fragment$BoardFragment(
            local$updateBoard,
            (e) => call(updateBoard: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateBoard<TRes>
    implements CopyWith$Mutation$UpdateBoard<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBoard(this._res);

  final TRes _res;

  @override
  call({
    Fragment$BoardFragment? updateBoard,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$BoardFragment<TRes> get updateBoard =>
      CopyWith$Fragment$BoardFragment.stub(_res);
}

const documentNodeMutationUpdateBoard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateBoard'),
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
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'InputUpdateBoard'),
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
            name: NameNode(value: 'updateBoard'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'idBoard'),
                value: VariableNode(name: NameNode(value: 'idBoard')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'BoardFragment'),
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
    fragmentDefinitionBoardFragment,
    fragmentDefinitionUserFragment,
  ],
);
Mutation$UpdateBoard _parserFn$Mutation$UpdateBoard(
  Map<String, dynamic> data,
) =>
    Mutation$UpdateBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateBoard?,
);

class Options$Mutation$UpdateBoard
    extends graphql.MutationOptions<Mutation$UpdateBoard> {
  Options$Mutation$UpdateBoard({
    String? operationName,
    required Variables$Mutation$UpdateBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBoard,
          parserFn: _parserFn$Mutation$UpdateBoard,
        );

  final OnMutationCompleted$Mutation$UpdateBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateBoard
    extends graphql.WatchQueryOptions<Mutation$UpdateBoard> {
  WatchOptions$Mutation$UpdateBoard({
    String? operationName,
    required Variables$Mutation$UpdateBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBoard? typedOptimisticResult,
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
          document: documentNodeMutationUpdateBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateBoard,
        );
}

extension ClientExtension$Mutation$UpdateBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateBoard>> mutate$UpdateBoard(
    Options$Mutation$UpdateBoard options,
  ) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$UpdateBoard> watchMutation$UpdateBoard(
    WatchOptions$Mutation$UpdateBoard options,
  ) =>
      watchMutation(options);
}

class Mutation$UpdateBoard$HookResult {
  Mutation$UpdateBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateBoard runMutation;

  final graphql.QueryResult<Mutation$UpdateBoard> result;
}

Mutation$UpdateBoard$HookResult useMutation$UpdateBoard([
  WidgetOptions$Mutation$UpdateBoard? options,
]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateBoard());
  return Mutation$UpdateBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateBoard> useWatchMutation$UpdateBoard(
  WatchOptions$Mutation$UpdateBoard options,
) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateBoard
    extends graphql.MutationOptions<Mutation$UpdateBoard> {
  WidgetOptions$Mutation$UpdateBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBoard>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBoard,
          parserFn: _parserFn$Mutation$UpdateBoard,
        );

  final OnMutationCompleted$Mutation$UpdateBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateBoard
    = graphql.MultiSourceResult<Mutation$UpdateBoard> Function(
  Variables$Mutation$UpdateBoard, {
  Object? optimisticResult,
  Mutation$UpdateBoard? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateBoard = widgets.Widget Function(
  RunMutation$Mutation$UpdateBoard,
  graphql.QueryResult<Mutation$UpdateBoard>?,
);

class Mutation$UpdateBoard$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateBoard> {
  Mutation$UpdateBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateBoard? options,
    required Builder$Mutation$UpdateBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateBoard(),
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
