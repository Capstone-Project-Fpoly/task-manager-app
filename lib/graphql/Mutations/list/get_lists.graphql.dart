import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/check_list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/comment_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$getList {
  factory Variables$Mutation$getList({required String idBoard}) =>
      Variables$Mutation$getList._({
        r'idBoard': idBoard,
      });

  Variables$Mutation$getList._(this._$data);

  factory Variables$Mutation$getList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Mutation$getList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Mutation$getList<Variables$Mutation$getList>
      get copyWith => CopyWith$Variables$Mutation$getList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$getList ||
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

abstract class CopyWith$Variables$Mutation$getList<TRes> {
  factory CopyWith$Variables$Mutation$getList(
    Variables$Mutation$getList instance,
    TRes Function(Variables$Mutation$getList) then,
  ) = _CopyWithImpl$Variables$Mutation$getList;

  factory CopyWith$Variables$Mutation$getList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$getList;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Mutation$getList<TRes>
    implements CopyWith$Variables$Mutation$getList<TRes> {
  _CopyWithImpl$Variables$Mutation$getList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$getList _instance;

  final TRes Function(Variables$Mutation$getList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Mutation$getList._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$getList<TRes>
    implements CopyWith$Variables$Mutation$getList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$getList(this._res);

  final TRes _res;

  @override
  call({String? idBoard}) => _res;
}

class Mutation$getList {
  Mutation$getList({
    this.getLists,
    this.$__typename = 'Mutation',
  });

  factory Mutation$getList.fromJson(Map<String, dynamic> json) {
    final l$getLists = json['getLists'];
    final l$$__typename = json['__typename'];
    return Mutation$getList(
      getLists: (l$getLists as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$ListFragment.fromJson((e as Map<String, dynamic>)),)
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ListFragment?>? getLists;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$getLists = getLists;
    resultData['getLists'] = l$getLists?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$getLists = getLists;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getLists == null ? null : Object.hashAll(l$getLists.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$getList || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getLists = getLists;
    final lOther$getLists = other.getLists;
    if (l$getLists != null && lOther$getLists != null) {
      if (l$getLists.length != lOther$getLists.length) {
        return false;
      }
      for (int i = 0; i < l$getLists.length; i++) {
        final l$getLists$entry = l$getLists[i];
        final lOther$getLists$entry = lOther$getLists[i];
        if (l$getLists$entry != lOther$getLists$entry) {
          return false;
        }
      }
    } else if (l$getLists != lOther$getLists) {
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

extension UtilityExtension$Mutation$getList on Mutation$getList {
  CopyWith$Mutation$getList<Mutation$getList> get copyWith =>
      CopyWith$Mutation$getList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$getList<TRes> {
  factory CopyWith$Mutation$getList(
    Mutation$getList instance,
    TRes Function(Mutation$getList) then,
  ) = _CopyWithImpl$Mutation$getList;

  factory CopyWith$Mutation$getList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$getList;

  TRes call({
    List<Fragment$ListFragment?>? getLists,
    String? $__typename,
  });
  TRes getLists(
      Iterable<Fragment$ListFragment?>? Function(
              Iterable<CopyWith$Fragment$ListFragment<Fragment$ListFragment>?>?,)
          fn,);
}

class _CopyWithImpl$Mutation$getList<TRes>
    implements CopyWith$Mutation$getList<TRes> {
  _CopyWithImpl$Mutation$getList(
    this._instance,
    this._then,
  );

  final Mutation$getList _instance;

  final TRes Function(Mutation$getList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? getLists = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$getList(
        getLists: getLists == _undefined
            ? _instance.getLists
            : (getLists as List<Fragment$ListFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  TRes getLists(
          Iterable<Fragment$ListFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$ListFragment<Fragment$ListFragment>?>?,)
              fn,) =>
      call(
          getLists: fn(_instance.getLists?.map((e) => e == null
              ? null
              : CopyWith$Fragment$ListFragment(
                  e,
                  (i) => i,
                ),),)?.toList(),);
}

class _CopyWithStubImpl$Mutation$getList<TRes>
    implements CopyWith$Mutation$getList<TRes> {
  _CopyWithStubImpl$Mutation$getList(this._res);

  final TRes _res;

  @override
  call({
    List<Fragment$ListFragment?>? getLists,
    String? $__typename,
  }) =>
      _res;

  @override
  getLists(fn) => _res;
}

const documentNodeMutationgetList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'getList'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getLists'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ListFragment'),
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
  fragmentDefinitionListFragment,
  fragmentDefinitionCardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionCheckListFragment,
],);
Mutation$getList _parserFn$Mutation$getList(Map<String, dynamic> data) =>
    Mutation$getList.fromJson(data);
typedef OnMutationCompleted$Mutation$getList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$getList?,
);

class Options$Mutation$getList
    extends graphql.MutationOptions<Mutation$getList> {
  Options$Mutation$getList({
    String? operationName,
    required Variables$Mutation$getList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$getList? onCompleted,
    graphql.OnMutationUpdate<Mutation$getList>? update,
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
                    data == null ? null : _parserFn$Mutation$getList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationgetList,
          parserFn: _parserFn$Mutation$getList,
        );

  final OnMutationCompleted$Mutation$getList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$getList
    extends graphql.WatchQueryOptions<Mutation$getList> {
  WatchOptions$Mutation$getList({
    String? operationName,
    required Variables$Mutation$getList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getList? typedOptimisticResult,
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
          document: documentNodeMutationgetList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$getList,
        );
}

extension ClientExtension$Mutation$getList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$getList>> mutate$getList(
          Options$Mutation$getList options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$getList> watchMutation$getList(
          WatchOptions$Mutation$getList options,) =>
      watchMutation(options);
}

class Mutation$getList$HookResult {
  Mutation$getList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$getList runMutation;

  final graphql.QueryResult<Mutation$getList> result;
}

Mutation$getList$HookResult useMutation$getList(
    [WidgetOptions$Mutation$getList? options,]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$getList());
  return Mutation$getList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$getList> useWatchMutation$getList(
        WatchOptions$Mutation$getList options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$getList
    extends graphql.MutationOptions<Mutation$getList> {
  WidgetOptions$Mutation$getList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$getList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$getList? onCompleted,
    graphql.OnMutationUpdate<Mutation$getList>? update,
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
                    data == null ? null : _parserFn$Mutation$getList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationgetList,
          parserFn: _parserFn$Mutation$getList,
        );

  final OnMutationCompleted$Mutation$getList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$getList
    = graphql.MultiSourceResult<Mutation$getList> Function(
  Variables$Mutation$getList, {
  Object? optimisticResult,
  Mutation$getList? typedOptimisticResult,
});
typedef Builder$Mutation$getList = widgets.Widget Function(
  RunMutation$Mutation$getList,
  graphql.QueryResult<Mutation$getList>?,
);

class Mutation$getList$Widget
    extends graphql_flutter.Mutation<Mutation$getList> {
  Mutation$getList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$getList? options,
    required Builder$Mutation$getList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$getList(),
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
