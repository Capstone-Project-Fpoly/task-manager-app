import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteList {
  factory Variables$Mutation$DeleteList({required String idList}) =>
      Variables$Mutation$DeleteList._({
        r'idList': idList,
      });

  Variables$Mutation$DeleteList._(this._$data);

  factory Variables$Mutation$DeleteList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idList = data['idList'];
    result$data['idList'] = (l$idList as String);
    return Variables$Mutation$DeleteList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idList => (_$data['idList'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idList = idList;
    result$data['idList'] = l$idList;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteList<Variables$Mutation$DeleteList>
      get copyWith => CopyWith$Variables$Mutation$DeleteList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteList ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idList = idList;
    final lOther$idList = other.idList;
    if (l$idList != lOther$idList) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idList = idList;
    return Object.hashAll([l$idList]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteList<TRes> {
  factory CopyWith$Variables$Mutation$DeleteList(
    Variables$Mutation$DeleteList instance,
    TRes Function(Variables$Mutation$DeleteList) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteList;

  factory CopyWith$Variables$Mutation$DeleteList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteList;

  TRes call({String? idList});
}

class _CopyWithImpl$Variables$Mutation$DeleteList<TRes>
    implements CopyWith$Variables$Mutation$DeleteList<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteList _instance;

  final TRes Function(Variables$Mutation$DeleteList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? idList = _undefined}) =>
      _then(Variables$Mutation$DeleteList._({
        ..._instance._$data,
        if (idList != _undefined && idList != null)
          'idList': (idList as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$DeleteList<TRes>
    implements CopyWith$Variables$Mutation$DeleteList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteList(this._res);

  final TRes _res;

  @override
  call({String? idList}) => _res;
}

class Mutation$DeleteList {
  Mutation$DeleteList({
    this.deleteList,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteList.fromJson(Map<String, dynamic> json) {
    final l$deleteList = json['deleteList'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteList(
      deleteList: (l$deleteList as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$deleteList = deleteList;
    resultData['deleteList'] = l$deleteList;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$deleteList = deleteList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteList || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteList = deleteList;
    final lOther$deleteList = other.deleteList;
    if (l$deleteList != lOther$deleteList) {
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

extension UtilityExtension$Mutation$DeleteList on Mutation$DeleteList {
  CopyWith$Mutation$DeleteList<Mutation$DeleteList> get copyWith =>
      CopyWith$Mutation$DeleteList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteList<TRes> {
  factory CopyWith$Mutation$DeleteList(
    Mutation$DeleteList instance,
    TRes Function(Mutation$DeleteList) then,
  ) = _CopyWithImpl$Mutation$DeleteList;

  factory CopyWith$Mutation$DeleteList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteList;

  TRes call({
    bool? deleteList,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteList<TRes>
    implements CopyWith$Mutation$DeleteList<TRes> {
  _CopyWithImpl$Mutation$DeleteList(
    this._instance,
    this._then,
  );

  final Mutation$DeleteList _instance;

  final TRes Function(Mutation$DeleteList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? deleteList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteList(
        deleteList: deleteList == _undefined
            ? _instance.deleteList
            : (deleteList as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$DeleteList<TRes>
    implements CopyWith$Mutation$DeleteList<TRes> {
  _CopyWithStubImpl$Mutation$DeleteList(this._res);

  final TRes _res;

  @override
  call({
    bool? deleteList,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idList')),
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
        name: NameNode(value: 'deleteList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idList'),
            value: VariableNode(name: NameNode(value: 'idList')),
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
Mutation$DeleteList _parserFn$Mutation$DeleteList(Map<String, dynamic> data) =>
    Mutation$DeleteList.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteList?,
);

class Options$Mutation$DeleteList
    extends graphql.MutationOptions<Mutation$DeleteList> {
  Options$Mutation$DeleteList({
    String? operationName,
    required Variables$Mutation$DeleteList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteList? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteList>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteList,
          parserFn: _parserFn$Mutation$DeleteList,
        );

  final OnMutationCompleted$Mutation$DeleteList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteList
    extends graphql.WatchQueryOptions<Mutation$DeleteList> {
  WatchOptions$Mutation$DeleteList({
    String? operationName,
    required Variables$Mutation$DeleteList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteList? typedOptimisticResult,
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
          document: documentNodeMutationDeleteList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteList,
        );
}

extension ClientExtension$Mutation$DeleteList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteList>> mutate$DeleteList(
          Options$Mutation$DeleteList options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$DeleteList> watchMutation$DeleteList(
          WatchOptions$Mutation$DeleteList options,) =>
      watchMutation(options);
}

class Mutation$DeleteList$HookResult {
  Mutation$DeleteList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteList runMutation;

  final graphql.QueryResult<Mutation$DeleteList> result;
}

Mutation$DeleteList$HookResult useMutation$DeleteList(
    [WidgetOptions$Mutation$DeleteList? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteList());
  return Mutation$DeleteList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteList> useWatchMutation$DeleteList(
        WatchOptions$Mutation$DeleteList options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteList
    extends graphql.MutationOptions<Mutation$DeleteList> {
  WidgetOptions$Mutation$DeleteList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteList? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteList>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteList,
          parserFn: _parserFn$Mutation$DeleteList,
        );

  final OnMutationCompleted$Mutation$DeleteList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteList
    = graphql.MultiSourceResult<Mutation$DeleteList> Function(
  Variables$Mutation$DeleteList, {
  Object? optimisticResult,
  Mutation$DeleteList? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteList = widgets.Widget Function(
  RunMutation$Mutation$DeleteList,
  graphql.QueryResult<Mutation$DeleteList>?,
);

class Mutation$DeleteList$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteList> {
  Mutation$DeleteList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteList? options,
    required Builder$Mutation$DeleteList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteList(),
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
