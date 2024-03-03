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

class Variables$Mutation$CreateList {
  factory Variables$Mutation$CreateList({
    required String idBoard,
    required String label,
  }) =>
      Variables$Mutation$CreateList._({
        r'idBoard': idBoard,
        r'label': label,
      });

  Variables$Mutation$CreateList._(this._$data);

  factory Variables$Mutation$CreateList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    final l$label = data['label'];
    result$data['label'] = (l$label as String);
    return Variables$Mutation$CreateList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  String get label => (_$data['label'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    final l$label = label;
    result$data['label'] = l$label;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateList<Variables$Mutation$CreateList>
      get copyWith => CopyWith$Variables$Mutation$CreateList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateList ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    final l$label = label;
    return Object.hashAll([
      l$idBoard,
      l$label,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateList<TRes> {
  factory CopyWith$Variables$Mutation$CreateList(
    Variables$Mutation$CreateList instance,
    TRes Function(Variables$Mutation$CreateList) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateList;

  factory CopyWith$Variables$Mutation$CreateList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateList;

  TRes call({
    String? idBoard,
    String? label,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateList<TRes>
    implements CopyWith$Variables$Mutation$CreateList<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateList _instance;

  final TRes Function(Variables$Mutation$CreateList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idBoard = _undefined,
    Object? label = _undefined,
  }) =>
      _then(Variables$Mutation$CreateList._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
        if (label != _undefined && label != null) 'label': (label as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$CreateList<TRes>
    implements CopyWith$Variables$Mutation$CreateList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateList(this._res);

  final TRes _res;

  @override
  call({
    String? idBoard,
    String? label,
  }) =>
      _res;
}

class Mutation$CreateList {
  Mutation$CreateList({
    this.createList,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateList.fromJson(Map<String, dynamic> json) {
    final l$createList = json['createList'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateList(
      createList: l$createList == null
          ? null
          : Fragment$ListFragment.fromJson(
              (l$createList as Map<String, dynamic>),),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ListFragment? createList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$createList = createList;
    resultData['createList'] = l$createList?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$createList = createList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateList || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createList = createList;
    final lOther$createList = other.createList;
    if (l$createList != lOther$createList) {
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

extension UtilityExtension$Mutation$CreateList on Mutation$CreateList {
  CopyWith$Mutation$CreateList<Mutation$CreateList> get copyWith =>
      CopyWith$Mutation$CreateList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateList<TRes> {
  factory CopyWith$Mutation$CreateList(
    Mutation$CreateList instance,
    TRes Function(Mutation$CreateList) then,
  ) = _CopyWithImpl$Mutation$CreateList;

  factory CopyWith$Mutation$CreateList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateList;

  TRes call({
    Fragment$ListFragment? createList,
    String? $__typename,
  });
  CopyWith$Fragment$ListFragment<TRes> get createList;
}

class _CopyWithImpl$Mutation$CreateList<TRes>
    implements CopyWith$Mutation$CreateList<TRes> {
  _CopyWithImpl$Mutation$CreateList(
    this._instance,
    this._then,
  );

  final Mutation$CreateList _instance;

  final TRes Function(Mutation$CreateList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? createList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateList(
        createList: createList == _undefined
            ? _instance.createList
            : (createList as Fragment$ListFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  CopyWith$Fragment$ListFragment<TRes> get createList {
    final local$createList = _instance.createList;
    return local$createList == null
        ? CopyWith$Fragment$ListFragment.stub(_then(_instance))
        : CopyWith$Fragment$ListFragment(
            local$createList, (e) => call(createList: e),);
  }
}

class _CopyWithStubImpl$Mutation$CreateList<TRes>
    implements CopyWith$Mutation$CreateList<TRes> {
  _CopyWithStubImpl$Mutation$CreateList(this._res);

  final TRes _res;

  @override
  call({
    Fragment$ListFragment? createList,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$ListFragment<TRes> get createList =>
      CopyWith$Fragment$ListFragment.stub(_res);
}

const documentNodeMutationCreateList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateList'),
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
        variable: VariableNode(name: NameNode(value: 'label')),
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
        name: NameNode(value: 'createList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          ),
          ArgumentNode(
            name: NameNode(value: 'label'),
            value: VariableNode(name: NameNode(value: 'label')),
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
Mutation$CreateList _parserFn$Mutation$CreateList(Map<String, dynamic> data) =>
    Mutation$CreateList.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateList?,
);

class Options$Mutation$CreateList
    extends graphql.MutationOptions<Mutation$CreateList> {
  Options$Mutation$CreateList({
    String? operationName,
    required Variables$Mutation$CreateList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateList? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateList>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateList,
          parserFn: _parserFn$Mutation$CreateList,
        );

  final OnMutationCompleted$Mutation$CreateList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateList
    extends graphql.WatchQueryOptions<Mutation$CreateList> {
  WatchOptions$Mutation$CreateList({
    String? operationName,
    required Variables$Mutation$CreateList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateList? typedOptimisticResult,
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
          document: documentNodeMutationCreateList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateList,
        );
}

extension ClientExtension$Mutation$CreateList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateList>> mutate$CreateList(
          Options$Mutation$CreateList options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$CreateList> watchMutation$CreateList(
          WatchOptions$Mutation$CreateList options,) =>
      watchMutation(options);
}

class Mutation$CreateList$HookResult {
  Mutation$CreateList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateList runMutation;

  final graphql.QueryResult<Mutation$CreateList> result;
}

Mutation$CreateList$HookResult useMutation$CreateList(
    [WidgetOptions$Mutation$CreateList? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateList());
  return Mutation$CreateList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateList> useWatchMutation$CreateList(
        WatchOptions$Mutation$CreateList options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateList
    extends graphql.MutationOptions<Mutation$CreateList> {
  WidgetOptions$Mutation$CreateList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateList? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateList>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateList,
          parserFn: _parserFn$Mutation$CreateList,
        );

  final OnMutationCompleted$Mutation$CreateList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateList
    = graphql.MultiSourceResult<Mutation$CreateList> Function(
  Variables$Mutation$CreateList, {
  Object? optimisticResult,
  Mutation$CreateList? typedOptimisticResult,
});
typedef Builder$Mutation$CreateList = widgets.Widget Function(
  RunMutation$Mutation$CreateList,
  graphql.QueryResult<Mutation$CreateList>?,
);

class Mutation$CreateList$Widget
    extends graphql_flutter.Mutation<Mutation$CreateList> {
  Mutation$CreateList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateList? options,
    required Builder$Mutation$CreateList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateList(),
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
