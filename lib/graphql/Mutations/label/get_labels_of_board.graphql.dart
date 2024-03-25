import '../../Fragment/label_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$GetLabelsOfBoard {
  factory Variables$Mutation$GetLabelsOfBoard({required String idBoard}) =>
      Variables$Mutation$GetLabelsOfBoard._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$GetLabelsOfBoard._(this._$data);

  factory Variables$Mutation$GetLabelsOfBoard.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$GetLabelsOfBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$GetLabelsOfBoard<
          Variables$Mutation$GetLabelsOfBoard>
      get copyWith => CopyWith$Variables$Mutation$GetLabelsOfBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$GetLabelsOfBoard) ||
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

abstract class CopyWith$Variables$Mutation$GetLabelsOfBoard<TRes> {
  factory CopyWith$Variables$Mutation$GetLabelsOfBoard(
    Variables$Mutation$GetLabelsOfBoard instance,
    TRes Function(Variables$Mutation$GetLabelsOfBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$GetLabelsOfBoard;

  factory CopyWith$Variables$Mutation$GetLabelsOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$GetLabelsOfBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$GetLabelsOfBoard<TRes>
    implements CopyWith$Variables$Mutation$GetLabelsOfBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$GetLabelsOfBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$GetLabelsOfBoard _instance;

  final TRes Function(Variables$Mutation$GetLabelsOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$GetLabelsOfBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$GetLabelsOfBoard<TRes>
    implements CopyWith$Variables$Mutation$GetLabelsOfBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$GetLabelsOfBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Mutation$GetLabelsOfBoard {
  Mutation$GetLabelsOfBoard({
    this.getLabelsOfBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$GetLabelsOfBoard.fromJson(Map<String, dynamic> json) {
    final l$getLabelsOfBoard = json['getLabelsOfBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$GetLabelsOfBoard(
      getLabelsOfBoard: (l$getLabelsOfBoard as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$LabelFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$LabelFragment?>? getLabelsOfBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getLabelsOfBoard = getLabelsOfBoard;
    _resultData['getLabelsOfBoard'] =
        l$getLabelsOfBoard?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getLabelsOfBoard = getLabelsOfBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getLabelsOfBoard == null
          ? null
          : Object.hashAll(l$getLabelsOfBoard.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$GetLabelsOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getLabelsOfBoard = getLabelsOfBoard;
    final lOther$getLabelsOfBoard = other.getLabelsOfBoard;
    if (l$getLabelsOfBoard != null && lOther$getLabelsOfBoard != null) {
      if (l$getLabelsOfBoard.length != lOther$getLabelsOfBoard.length) {
        return false;
      }
      for (int i = 0; i < l$getLabelsOfBoard.length; i++) {
        final l$getLabelsOfBoard$entry = l$getLabelsOfBoard[i];
        final lOther$getLabelsOfBoard$entry = lOther$getLabelsOfBoard[i];
        if (l$getLabelsOfBoard$entry != lOther$getLabelsOfBoard$entry) {
          return false;
        }
      }
    } else if (l$getLabelsOfBoard != lOther$getLabelsOfBoard) {
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

extension UtilityExtension$Mutation$GetLabelsOfBoard
    on Mutation$GetLabelsOfBoard {
  CopyWith$Mutation$GetLabelsOfBoard<Mutation$GetLabelsOfBoard> get copyWith =>
      CopyWith$Mutation$GetLabelsOfBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$GetLabelsOfBoard<TRes> {
  factory CopyWith$Mutation$GetLabelsOfBoard(
    Mutation$GetLabelsOfBoard instance,
    TRes Function(Mutation$GetLabelsOfBoard) then,
  ) = _CopyWithImpl$Mutation$GetLabelsOfBoard;

  factory CopyWith$Mutation$GetLabelsOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$GetLabelsOfBoard;

  TRes call({
    List<Fragment$LabelFragment?>? getLabelsOfBoard,
    String? $__typename,
  });
  TRes getLabelsOfBoard(
      Iterable<Fragment$LabelFragment?>? Function(
              Iterable<
                  CopyWith$Fragment$LabelFragment<Fragment$LabelFragment>?>?)
          _fn);
}

class _CopyWithImpl$Mutation$GetLabelsOfBoard<TRes>
    implements CopyWith$Mutation$GetLabelsOfBoard<TRes> {
  _CopyWithImpl$Mutation$GetLabelsOfBoard(
    this._instance,
    this._then,
  );

  final Mutation$GetLabelsOfBoard _instance;

  final TRes Function(Mutation$GetLabelsOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getLabelsOfBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$GetLabelsOfBoard(
        getLabelsOfBoard: getLabelsOfBoard == _undefined
            ? _instance.getLabelsOfBoard
            : (getLabelsOfBoard as List<Fragment$LabelFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getLabelsOfBoard(
          Iterable<Fragment$LabelFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$LabelFragment<
                          Fragment$LabelFragment>?>?)
              _fn) =>
      call(
          getLabelsOfBoard: _fn(_instance.getLabelsOfBoard?.map((e) => e == null
              ? null
              : CopyWith$Fragment$LabelFragment(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Mutation$GetLabelsOfBoard<TRes>
    implements CopyWith$Mutation$GetLabelsOfBoard<TRes> {
  _CopyWithStubImpl$Mutation$GetLabelsOfBoard(this._res);

  TRes _res;

  call({
    List<Fragment$LabelFragment?>? getLabelsOfBoard,
    String? $__typename,
  }) =>
      _res;

  getLabelsOfBoard(_fn) => _res;
}

const documentNodeMutationGetLabelsOfBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'GetLabelsOfBoard'),
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
        name: NameNode(value: 'getLabelsOfBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'LabelFragment'),
            directives: [],
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionLabelFragment,
]);
Mutation$GetLabelsOfBoard _parserFn$Mutation$GetLabelsOfBoard(
        Map<String, dynamic> data) =>
    Mutation$GetLabelsOfBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$GetLabelsOfBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$GetLabelsOfBoard?,
);

class Options$Mutation$GetLabelsOfBoard
    extends graphql.MutationOptions<Mutation$GetLabelsOfBoard> {
  Options$Mutation$GetLabelsOfBoard({
    String? operationName,
    required Variables$Mutation$GetLabelsOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetLabelsOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$GetLabelsOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$GetLabelsOfBoard>? update,
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
                        : _parserFn$Mutation$GetLabelsOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationGetLabelsOfBoard,
          parserFn: _parserFn$Mutation$GetLabelsOfBoard,
        );

  final OnMutationCompleted$Mutation$GetLabelsOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$GetLabelsOfBoard
    extends graphql.WatchQueryOptions<Mutation$GetLabelsOfBoard> {
  WatchOptions$Mutation$GetLabelsOfBoard({
    String? operationName,
    required Variables$Mutation$GetLabelsOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetLabelsOfBoard? typedOptimisticResult,
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
          document: documentNodeMutationGetLabelsOfBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$GetLabelsOfBoard,
        );
}

extension ClientExtension$Mutation$GetLabelsOfBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$GetLabelsOfBoard>>
      mutate$GetLabelsOfBoard(
              Options$Mutation$GetLabelsOfBoard options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$GetLabelsOfBoard>
      watchMutation$GetLabelsOfBoard(
              WatchOptions$Mutation$GetLabelsOfBoard options) =>
          this.watchMutation(options);
}

class Mutation$GetLabelsOfBoard$HookResult {
  Mutation$GetLabelsOfBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$GetLabelsOfBoard runMutation;

  final graphql.QueryResult<Mutation$GetLabelsOfBoard> result;
}

Mutation$GetLabelsOfBoard$HookResult useMutation$GetLabelsOfBoard(
    [WidgetOptions$Mutation$GetLabelsOfBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$GetLabelsOfBoard());
  return Mutation$GetLabelsOfBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$GetLabelsOfBoard>
    useWatchMutation$GetLabelsOfBoard(
            WatchOptions$Mutation$GetLabelsOfBoard options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$GetLabelsOfBoard
    extends graphql.MutationOptions<Mutation$GetLabelsOfBoard> {
  WidgetOptions$Mutation$GetLabelsOfBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetLabelsOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$GetLabelsOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$GetLabelsOfBoard>? update,
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
                        : _parserFn$Mutation$GetLabelsOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationGetLabelsOfBoard,
          parserFn: _parserFn$Mutation$GetLabelsOfBoard,
        );

  final OnMutationCompleted$Mutation$GetLabelsOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$GetLabelsOfBoard
    = graphql.MultiSourceResult<Mutation$GetLabelsOfBoard> Function(
  Variables$Mutation$GetLabelsOfBoard, {
  Object? optimisticResult,
  Mutation$GetLabelsOfBoard? typedOptimisticResult,
});
typedef Builder$Mutation$GetLabelsOfBoard = widgets.Widget Function(
  RunMutation$Mutation$GetLabelsOfBoard,
  graphql.QueryResult<Mutation$GetLabelsOfBoard>?,
);

class Mutation$GetLabelsOfBoard$Widget
    extends graphql_flutter.Mutation<Mutation$GetLabelsOfBoard> {
  Mutation$GetLabelsOfBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$GetLabelsOfBoard? options,
    required Builder$Mutation$GetLabelsOfBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$GetLabelsOfBoard(),
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
