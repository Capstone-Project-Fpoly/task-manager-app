import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$me {
  Query$me({
    this.me,
    this.$__typename = 'Query',
  });

  factory Query$me.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$me(
      me: l$me == null
          ? null
          : Fragment$UserFragment.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserFragment? me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$me = me;
    resultData['me'] = l$me?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$me,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$me || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
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

extension UtilityExtension$Query$me on Query$me {
  CopyWith$Query$me<Query$me> get copyWith => CopyWith$Query$me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$me<TRes> {
  factory CopyWith$Query$me(
    Query$me instance,
    TRes Function(Query$me) then,
  ) = _CopyWithImpl$Query$me;

  factory CopyWith$Query$me.stub(TRes res) = _CopyWithStubImpl$Query$me;

  TRes call({
    Fragment$UserFragment? me,
    String? $__typename,
  });
  CopyWith$Fragment$UserFragment<TRes> get me;
}

class _CopyWithImpl$Query$me<TRes> implements CopyWith$Query$me<TRes> {
  _CopyWithImpl$Query$me(
    this._instance,
    this._then,
  );

  final Query$me _instance;

  final TRes Function(Query$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? me = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$me(
        me: me == _undefined ? _instance.me : (me as Fragment$UserFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  CopyWith$Fragment$UserFragment<TRes> get me {
    final local$me = _instance.me;
    return local$me == null
        ? CopyWith$Fragment$UserFragment.stub(_then(_instance))
        : CopyWith$Fragment$UserFragment(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$me<TRes> implements CopyWith$Query$me<TRes> {
  _CopyWithStubImpl$Query$me(this._res);

  final TRes _res;

  @override
  call({
    Fragment$UserFragment? me,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$UserFragment<TRes> get me =>
      CopyWith$Fragment$UserFragment.stub(_res);
}

const documentNodeQueryme = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'me'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'me'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserFragment'),
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
  fragmentDefinitionUserFragment,
],);
Query$me _parserFn$Query$me(Map<String, dynamic> data) =>
    Query$me.fromJson(data);
typedef OnQueryComplete$Query$me = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$me?,
);

class Options$Query$me extends graphql.QueryOptions<Query$me> {
  Options$Query$me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$me? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$me? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$me(data),
                  ),
          onError: onError,
          document: documentNodeQueryme,
          parserFn: _parserFn$Query$me,
        );

  final OnQueryComplete$Query$me? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$me extends graphql.WatchQueryOptions<Query$me> {
  WatchOptions$Query$me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$me? typedOptimisticResult,
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
          document: documentNodeQueryme,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$me,
        );
}

class FetchMoreOptions$Query$me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$me({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryme,
        );
}

extension ClientExtension$Query$me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$me>> query$me(
          [Options$Query$me? options,]) async =>
      await query(options ?? Options$Query$me());
  graphql.ObservableQuery<Query$me> watchQuery$me(
          [WatchOptions$Query$me? options,]) =>
      watchQuery(options ?? WatchOptions$Query$me());
  void writeQuery$me({
    required Query$me data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryme),),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$me? readQuery$me({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryme),),
      optimistic: optimistic,
    );
    return result == null ? null : Query$me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$me> useQuery$me(
        [Options$Query$me? options,]) =>
    graphql_flutter.useQuery(options ?? Options$Query$me());
graphql.ObservableQuery<Query$me> useWatchQuery$me(
        [WatchOptions$Query$me? options,]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$me());

class Query$me$Widget extends graphql_flutter.Query<Query$me> {
  Query$me$Widget({
    widgets.Key? key,
    Options$Query$me? options,
    required graphql_flutter.QueryBuilder<Query$me> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$me(),
          builder: builder,
        );
}
