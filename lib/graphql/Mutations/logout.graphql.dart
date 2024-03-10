import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$Logout {
  Mutation$Logout({
    this.logout,
    this.$__typename = 'Mutation',
  });

  factory Mutation$Logout.fromJson(Map<String, dynamic> json) {
    final l$logout = json['logout'];
    final l$$__typename = json['__typename'];
    return Mutation$Logout(
      logout: (l$logout as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? logout;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$logout = logout;
    resultData['logout'] = l$logout;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$logout = logout;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$logout,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Logout || runtimeType != other.runtimeType) {
      return false;
    }
    final l$logout = logout;
    final lOther$logout = other.logout;
    if (l$logout != lOther$logout) {
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

extension UtilityExtension$Mutation$Logout on Mutation$Logout {
  CopyWith$Mutation$Logout<Mutation$Logout> get copyWith =>
      CopyWith$Mutation$Logout(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Logout<TRes> {
  factory CopyWith$Mutation$Logout(
    Mutation$Logout instance,
    TRes Function(Mutation$Logout) then,
  ) = _CopyWithImpl$Mutation$Logout;

  factory CopyWith$Mutation$Logout.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Logout;

  TRes call({
    bool? logout,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$Logout<TRes>
    implements CopyWith$Mutation$Logout<TRes> {
  _CopyWithImpl$Mutation$Logout(
    this._instance,
    this._then,
  );

  final Mutation$Logout _instance;

  final TRes Function(Mutation$Logout) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? logout = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Logout(
        logout: logout == _undefined ? _instance.logout : (logout as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$Logout<TRes>
    implements CopyWith$Mutation$Logout<TRes> {
  _CopyWithStubImpl$Mutation$Logout(this._res);

  final TRes _res;

  @override
  call({
    bool? logout,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationLogout = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Logout'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'logout'),
        alias: null,
        arguments: [],
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
Mutation$Logout _parserFn$Mutation$Logout(Map<String, dynamic> data) =>
    Mutation$Logout.fromJson(data);
typedef OnMutationCompleted$Mutation$Logout = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$Logout?,
);

class Options$Mutation$Logout extends graphql.MutationOptions<Mutation$Logout> {
  Options$Mutation$Logout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Logout? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Logout? onCompleted,
    graphql.OnMutationUpdate<Mutation$Logout>? update,
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
                    data == null ? null : _parserFn$Mutation$Logout(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogout,
          parserFn: _parserFn$Mutation$Logout,
        );

  final OnMutationCompleted$Mutation$Logout? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$Logout
    extends graphql.WatchQueryOptions<Mutation$Logout> {
  WatchOptions$Mutation$Logout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Logout? typedOptimisticResult,
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
          document: documentNodeMutationLogout,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$Logout,
        );
}

extension ClientExtension$Mutation$Logout on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Logout>> mutate$Logout(
          [Options$Mutation$Logout? options,]) async =>
      await mutate(options ?? Options$Mutation$Logout());
  graphql.ObservableQuery<Mutation$Logout> watchMutation$Logout(
          [WatchOptions$Mutation$Logout? options,]) =>
      watchMutation(options ?? WatchOptions$Mutation$Logout());
}

class Mutation$Logout$HookResult {
  Mutation$Logout$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$Logout runMutation;

  final graphql.QueryResult<Mutation$Logout> result;
}

Mutation$Logout$HookResult useMutation$Logout(
    [WidgetOptions$Mutation$Logout? options,]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$Logout());
  return Mutation$Logout$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Logout> useWatchMutation$Logout(
        [WatchOptions$Mutation$Logout? options,]) =>
    graphql_flutter.useWatchMutation(options ?? WatchOptions$Mutation$Logout());

class WidgetOptions$Mutation$Logout
    extends graphql.MutationOptions<Mutation$Logout> {
  WidgetOptions$Mutation$Logout({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Logout? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Logout? onCompleted,
    graphql.OnMutationUpdate<Mutation$Logout>? update,
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
                    data == null ? null : _parserFn$Mutation$Logout(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogout,
          parserFn: _parserFn$Mutation$Logout,
        );

  final OnMutationCompleted$Mutation$Logout? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$Logout = graphql.MultiSourceResult<Mutation$Logout>
    Function({
  Object? optimisticResult,
  Mutation$Logout? typedOptimisticResult,
});
typedef Builder$Mutation$Logout = widgets.Widget Function(
  RunMutation$Mutation$Logout,
  graphql.QueryResult<Mutation$Logout>?,
);

class Mutation$Logout$Widget extends graphql_flutter.Mutation<Mutation$Logout> {
  Mutation$Logout$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Logout? options,
    required Builder$Mutation$Logout builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$Logout(),
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
