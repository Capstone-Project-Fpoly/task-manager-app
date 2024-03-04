import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$getBoards {
  Mutation$getBoards({
    this.getBoards,
    this.$__typename = 'Mutation',
  });

  factory Mutation$getBoards.fromJson(Map<String, dynamic> json) {
    final l$getBoards = json['getBoards'];
    final l$$__typename = json['__typename'];
    return Mutation$getBoards(
      getBoards: (l$getBoards as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$BoardFragment.fromJson((e as Map<String, dynamic>)),)
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$BoardFragment?>? getBoards;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$getBoards = getBoards;
    resultData['getBoards'] = l$getBoards?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$getBoards = getBoards;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getBoards == null ? null : Object.hashAll(l$getBoards.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$getBoards || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getBoards = getBoards;
    final lOther$getBoards = other.getBoards;
    if (l$getBoards != null && lOther$getBoards != null) {
      if (l$getBoards.length != lOther$getBoards.length) {
        return false;
      }
      for (int i = 0; i < l$getBoards.length; i++) {
        final l$getBoards$entry = l$getBoards[i];
        final lOther$getBoards$entry = lOther$getBoards[i];
        if (l$getBoards$entry != lOther$getBoards$entry) {
          return false;
        }
      }
    } else if (l$getBoards != lOther$getBoards) {
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

extension UtilityExtension$Mutation$getBoards on Mutation$getBoards {
  CopyWith$Mutation$getBoards<Mutation$getBoards> get copyWith =>
      CopyWith$Mutation$getBoards(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$getBoards<TRes> {
  factory CopyWith$Mutation$getBoards(
    Mutation$getBoards instance,
    TRes Function(Mutation$getBoards) then,
  ) = _CopyWithImpl$Mutation$getBoards;

  factory CopyWith$Mutation$getBoards.stub(TRes res) =
      _CopyWithStubImpl$Mutation$getBoards;

  TRes call({
    List<Fragment$BoardFragment?>? getBoards,
    String? $__typename,
  });
  TRes getBoards(
      Iterable<Fragment$BoardFragment?>? Function(
              Iterable<
                  CopyWith$Fragment$BoardFragment<Fragment$BoardFragment>?>?,)
          fn,);
}

class _CopyWithImpl$Mutation$getBoards<TRes>
    implements CopyWith$Mutation$getBoards<TRes> {
  _CopyWithImpl$Mutation$getBoards(
    this._instance,
    this._then,
  );

  final Mutation$getBoards _instance;

  final TRes Function(Mutation$getBoards) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? getBoards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$getBoards(
        getBoards: getBoards == _undefined
            ? _instance.getBoards
            : (getBoards as List<Fragment$BoardFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  TRes getBoards(
          Iterable<Fragment$BoardFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$BoardFragment<
                          Fragment$BoardFragment>?>?,)
              fn,) =>
      call(
          getBoards: fn(_instance.getBoards?.map((e) => e == null
              ? null
              : CopyWith$Fragment$BoardFragment(
                  e,
                  (i) => i,
                ),),)?.toList(),);
}

class _CopyWithStubImpl$Mutation$getBoards<TRes>
    implements CopyWith$Mutation$getBoards<TRes> {
  _CopyWithStubImpl$Mutation$getBoards(this._res);

  final TRes _res;

  @override
  call({
    List<Fragment$BoardFragment?>? getBoards,
    String? $__typename,
  }) =>
      _res;

  @override
  getBoards(fn) => _res;
}

const documentNodeMutationgetBoards = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'getBoards'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getBoards'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
        ],),
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
  fragmentDefinitionBoardFragment,
  fragmentDefinitionUserFragment,
],);
Mutation$getBoards _parserFn$Mutation$getBoards(Map<String, dynamic> data) =>
    Mutation$getBoards.fromJson(data);
typedef OnMutationCompleted$Mutation$getBoards = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$getBoards?,
);

class Options$Mutation$getBoards
    extends graphql.MutationOptions<Mutation$getBoards> {
  Options$Mutation$getBoards({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getBoards? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$getBoards? onCompleted,
    graphql.OnMutationUpdate<Mutation$getBoards>? update,
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
                    data == null ? null : _parserFn$Mutation$getBoards(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationgetBoards,
          parserFn: _parserFn$Mutation$getBoards,
        );

  final OnMutationCompleted$Mutation$getBoards? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$getBoards
    extends graphql.WatchQueryOptions<Mutation$getBoards> {
  WatchOptions$Mutation$getBoards({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getBoards? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationgetBoards,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$getBoards,
        );
}

extension ClientExtension$Mutation$getBoards on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$getBoards>> mutate$getBoards(
          [Options$Mutation$getBoards? options,]) async =>
      await mutate(options ?? Options$Mutation$getBoards());
  graphql.ObservableQuery<Mutation$getBoards> watchMutation$getBoards(
          [WatchOptions$Mutation$getBoards? options,]) =>
      watchMutation(options ?? WatchOptions$Mutation$getBoards());
}

class Mutation$getBoards$HookResult {
  Mutation$getBoards$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$getBoards runMutation;

  final graphql.QueryResult<Mutation$getBoards> result;
}

Mutation$getBoards$HookResult useMutation$getBoards(
    [WidgetOptions$Mutation$getBoards? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$getBoards());
  return Mutation$getBoards$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$getBoards> useWatchMutation$getBoards(
        [WatchOptions$Mutation$getBoards? options,]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$getBoards());

class WidgetOptions$Mutation$getBoards
    extends graphql.MutationOptions<Mutation$getBoards> {
  WidgetOptions$Mutation$getBoards({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getBoards? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$getBoards? onCompleted,
    graphql.OnMutationUpdate<Mutation$getBoards>? update,
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
                    data == null ? null : _parserFn$Mutation$getBoards(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationgetBoards,
          parserFn: _parserFn$Mutation$getBoards,
        );

  final OnMutationCompleted$Mutation$getBoards? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$getBoards
    = graphql.MultiSourceResult<Mutation$getBoards> Function({
  Object? optimisticResult,
  Mutation$getBoards? typedOptimisticResult,
});
typedef Builder$Mutation$getBoards = widgets.Widget Function(
  RunMutation$Mutation$getBoards,
  graphql.QueryResult<Mutation$getBoards>?,
);

class Mutation$getBoards$Widget
    extends graphql_flutter.Mutation<Mutation$getBoards> {
  Mutation$getBoards$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$getBoards? options,
    required Builder$Mutation$getBoards builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$getBoards(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}
