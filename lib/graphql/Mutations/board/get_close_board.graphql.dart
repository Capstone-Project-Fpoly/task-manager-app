import '../../Fragment/board_fragment.graphql.dart';
import '../../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$getBoardsClosed {
  Mutation$getBoardsClosed({
    this.getBoardsClosed,
    this.$__typename = 'Mutation',
  });

  factory Mutation$getBoardsClosed.fromJson(Map<String, dynamic> json) {
    final l$getBoardsClosed = json['getBoardsClosed'];
    final l$$__typename = json['__typename'];
    return Mutation$getBoardsClosed(
      getBoardsClosed: (l$getBoardsClosed as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$BoardFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$BoardFragment?>? getBoardsClosed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getBoardsClosed = getBoardsClosed;
    _resultData['getBoardsClosed'] =
        l$getBoardsClosed?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getBoardsClosed = getBoardsClosed;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getBoardsClosed == null
          ? null
          : Object.hashAll(l$getBoardsClosed.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$getBoardsClosed) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getBoardsClosed = getBoardsClosed;
    final lOther$getBoardsClosed = other.getBoardsClosed;
    if (l$getBoardsClosed != null && lOther$getBoardsClosed != null) {
      if (l$getBoardsClosed.length != lOther$getBoardsClosed.length) {
        return false;
      }
      for (int i = 0; i < l$getBoardsClosed.length; i++) {
        final l$getBoardsClosed$entry = l$getBoardsClosed[i];
        final lOther$getBoardsClosed$entry = lOther$getBoardsClosed[i];
        if (l$getBoardsClosed$entry != lOther$getBoardsClosed$entry) {
          return false;
        }
      }
    } else if (l$getBoardsClosed != lOther$getBoardsClosed) {
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

extension UtilityExtension$Mutation$getBoardsClosed
    on Mutation$getBoardsClosed {
  CopyWith$Mutation$getBoardsClosed<Mutation$getBoardsClosed> get copyWith =>
      CopyWith$Mutation$getBoardsClosed(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$getBoardsClosed<TRes> {
  factory CopyWith$Mutation$getBoardsClosed(
    Mutation$getBoardsClosed instance,
    TRes Function(Mutation$getBoardsClosed) then,
  ) = _CopyWithImpl$Mutation$getBoardsClosed;

  factory CopyWith$Mutation$getBoardsClosed.stub(TRes res) =
      _CopyWithStubImpl$Mutation$getBoardsClosed;

  TRes call({
    List<Fragment$BoardFragment?>? getBoardsClosed,
    String? $__typename,
  });
  TRes getBoardsClosed(
      Iterable<Fragment$BoardFragment?>? Function(
              Iterable<
                  CopyWith$Fragment$BoardFragment<Fragment$BoardFragment>?>?)
          _fn);
}

class _CopyWithImpl$Mutation$getBoardsClosed<TRes>
    implements CopyWith$Mutation$getBoardsClosed<TRes> {
  _CopyWithImpl$Mutation$getBoardsClosed(
    this._instance,
    this._then,
  );

  final Mutation$getBoardsClosed _instance;

  final TRes Function(Mutation$getBoardsClosed) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getBoardsClosed = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$getBoardsClosed(
        getBoardsClosed: getBoardsClosed == _undefined
            ? _instance.getBoardsClosed
            : (getBoardsClosed as List<Fragment$BoardFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getBoardsClosed(
          Iterable<Fragment$BoardFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$BoardFragment<
                          Fragment$BoardFragment>?>?)
              _fn) =>
      call(
          getBoardsClosed: _fn(_instance.getBoardsClosed?.map((e) => e == null
              ? null
              : CopyWith$Fragment$BoardFragment(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Mutation$getBoardsClosed<TRes>
    implements CopyWith$Mutation$getBoardsClosed<TRes> {
  _CopyWithStubImpl$Mutation$getBoardsClosed(this._res);

  TRes _res;

  call({
    List<Fragment$BoardFragment?>? getBoardsClosed,
    String? $__typename,
  }) =>
      _res;

  getBoardsClosed(_fn) => _res;
}

const documentNodeMutationgetBoardsClosed = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'getBoardsClosed'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getBoardsClosed'),
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
  fragmentDefinitionBoardFragment,
  fragmentDefinitionUserFragment,
]);
Mutation$getBoardsClosed _parserFn$Mutation$getBoardsClosed(
        Map<String, dynamic> data) =>
    Mutation$getBoardsClosed.fromJson(data);
typedef OnMutationCompleted$Mutation$getBoardsClosed = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$getBoardsClosed?,
);

class Options$Mutation$getBoardsClosed
    extends graphql.MutationOptions<Mutation$getBoardsClosed> {
  Options$Mutation$getBoardsClosed({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getBoardsClosed? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$getBoardsClosed? onCompleted,
    graphql.OnMutationUpdate<Mutation$getBoardsClosed>? update,
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
                        : _parserFn$Mutation$getBoardsClosed(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationgetBoardsClosed,
          parserFn: _parserFn$Mutation$getBoardsClosed,
        );

  final OnMutationCompleted$Mutation$getBoardsClosed? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$getBoardsClosed
    extends graphql.WatchQueryOptions<Mutation$getBoardsClosed> {
  WatchOptions$Mutation$getBoardsClosed({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getBoardsClosed? typedOptimisticResult,
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
          document: documentNodeMutationgetBoardsClosed,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$getBoardsClosed,
        );
}

extension ClientExtension$Mutation$getBoardsClosed on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$getBoardsClosed>> mutate$getBoardsClosed(
          [Options$Mutation$getBoardsClosed? options]) async =>
      await this.mutate(options ?? Options$Mutation$getBoardsClosed());
  graphql.ObservableQuery<
      Mutation$getBoardsClosed> watchMutation$getBoardsClosed(
          [WatchOptions$Mutation$getBoardsClosed? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$getBoardsClosed());
}

class Mutation$getBoardsClosed$HookResult {
  Mutation$getBoardsClosed$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$getBoardsClosed runMutation;

  final graphql.QueryResult<Mutation$getBoardsClosed> result;
}

Mutation$getBoardsClosed$HookResult useMutation$getBoardsClosed(
    [WidgetOptions$Mutation$getBoardsClosed? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$getBoardsClosed());
  return Mutation$getBoardsClosed$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$getBoardsClosed>
    useWatchMutation$getBoardsClosed(
            [WatchOptions$Mutation$getBoardsClosed? options]) =>
        graphql_flutter.useWatchMutation(
            options ?? WatchOptions$Mutation$getBoardsClosed());

class WidgetOptions$Mutation$getBoardsClosed
    extends graphql.MutationOptions<Mutation$getBoardsClosed> {
  WidgetOptions$Mutation$getBoardsClosed({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getBoardsClosed? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$getBoardsClosed? onCompleted,
    graphql.OnMutationUpdate<Mutation$getBoardsClosed>? update,
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
                        : _parserFn$Mutation$getBoardsClosed(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationgetBoardsClosed,
          parserFn: _parserFn$Mutation$getBoardsClosed,
        );

  final OnMutationCompleted$Mutation$getBoardsClosed? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$getBoardsClosed
    = graphql.MultiSourceResult<Mutation$getBoardsClosed> Function({
  Object? optimisticResult,
  Mutation$getBoardsClosed? typedOptimisticResult,
});
typedef Builder$Mutation$getBoardsClosed = widgets.Widget Function(
  RunMutation$Mutation$getBoardsClosed,
  graphql.QueryResult<Mutation$getBoardsClosed>?,
);

class Mutation$getBoardsClosed$Widget
    extends graphql_flutter.Mutation<Mutation$getBoardsClosed> {
  Mutation$getBoardsClosed$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$getBoardsClosed? options,
    required Builder$Mutation$getBoardsClosed builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$getBoardsClosed(),
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
