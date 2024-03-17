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

class Variables$Mutation$UpdateList {
  factory Variables$Mutation$UpdateList({
    required String idList,
    required String label,
  }) =>
      Variables$Mutation$UpdateList._({
        r'idList': idList,
        r'label': label,
      });

  Variables$Mutation$UpdateList._(this._$data);

  factory Variables$Mutation$UpdateList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idList = data['idList'];
    result$data['idList'] = (l$idList as String);
    final l$label = data['label'];
    result$data['label'] = (l$label as String);
    return Variables$Mutation$UpdateList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idList => (_$data['idList'] as String);

  String get label => (_$data['label'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idList = idList;
    result$data['idList'] = l$idList;
    final l$label = label;
    result$data['label'] = l$label;
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateList<Variables$Mutation$UpdateList>
      get copyWith => CopyWith$Variables$Mutation$UpdateList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateList ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idList = idList;
    final lOther$idList = other.idList;
    if (l$idList != lOther$idList) {
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
    final l$idList = idList;
    final l$label = label;
    return Object.hashAll([
      l$idList,
      l$label,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateList<TRes> {
  factory CopyWith$Variables$Mutation$UpdateList(
    Variables$Mutation$UpdateList instance,
    TRes Function(Variables$Mutation$UpdateList) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateList;

  factory CopyWith$Variables$Mutation$UpdateList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateList;

  TRes call({
    String? idList,
    String? label,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateList<TRes>
    implements CopyWith$Variables$Mutation$UpdateList<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateList _instance;

  final TRes Function(Variables$Mutation$UpdateList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idList = _undefined,
    Object? label = _undefined,
  }) =>
      _then(
        Variables$Mutation$UpdateList._({
          ..._instance._$data,
          if (idList != _undefined && idList != null)
            'idList': (idList as String),
          if (label != _undefined && label != null) 'label': (label as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateList<TRes>
    implements CopyWith$Variables$Mutation$UpdateList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateList(this._res);

  final TRes _res;

  @override
  call({
    String? idList,
    String? label,
  }) =>
      _res;
}

class Mutation$UpdateList {
  Mutation$UpdateList({
    this.updateList,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateList.fromJson(Map<String, dynamic> json) {
    final l$updateList = json['updateList'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateList(
      updateList: l$updateList == null
          ? null
          : Fragment$ListFragment.fromJson(
              (l$updateList as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ListFragment? updateList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$updateList = updateList;
    resultData['updateList'] = l$updateList?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$updateList = updateList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateList || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateList = updateList;
    final lOther$updateList = other.updateList;
    if (l$updateList != lOther$updateList) {
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

extension UtilityExtension$Mutation$UpdateList on Mutation$UpdateList {
  CopyWith$Mutation$UpdateList<Mutation$UpdateList> get copyWith =>
      CopyWith$Mutation$UpdateList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateList<TRes> {
  factory CopyWith$Mutation$UpdateList(
    Mutation$UpdateList instance,
    TRes Function(Mutation$UpdateList) then,
  ) = _CopyWithImpl$Mutation$UpdateList;

  factory CopyWith$Mutation$UpdateList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateList;

  TRes call({
    Fragment$ListFragment? updateList,
    String? $__typename,
  });
  CopyWith$Fragment$ListFragment<TRes> get updateList;
}

class _CopyWithImpl$Mutation$UpdateList<TRes>
    implements CopyWith$Mutation$UpdateList<TRes> {
  _CopyWithImpl$Mutation$UpdateList(
    this._instance,
    this._then,
  );

  final Mutation$UpdateList _instance;

  final TRes Function(Mutation$UpdateList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? updateList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Mutation$UpdateList(
          updateList: updateList == _undefined
              ? _instance.updateList
              : (updateList as Fragment$ListFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  @override
  CopyWith$Fragment$ListFragment<TRes> get updateList {
    final local$updateList = _instance.updateList;
    return local$updateList == null
        ? CopyWith$Fragment$ListFragment.stub(_then(_instance))
        : CopyWith$Fragment$ListFragment(
            local$updateList,
            (e) => call(updateList: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateList<TRes>
    implements CopyWith$Mutation$UpdateList<TRes> {
  _CopyWithStubImpl$Mutation$UpdateList(this._res);

  final TRes _res;

  @override
  call({
    Fragment$ListFragment? updateList,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$ListFragment<TRes> get updateList =>
      CopyWith$Fragment$ListFragment.stub(_res);
}

const documentNodeMutationUpdateList = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateList'),
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
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateList'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'idList'),
                value: VariableNode(name: NameNode(value: 'idList')),
              ),
              ArgumentNode(
                name: NameNode(value: 'label'),
                value: VariableNode(name: NameNode(value: 'label')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
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
    fragmentDefinitionListFragment,
    fragmentDefinitionCardFragment,
    fragmentDefinitionUserFragment,
    fragmentDefinitionCommentFragment,
    fragmentDefinitionCheckListFragment,
  ],
);
Mutation$UpdateList _parserFn$Mutation$UpdateList(Map<String, dynamic> data) =>
    Mutation$UpdateList.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateList?,
);

class Options$Mutation$UpdateList
    extends graphql.MutationOptions<Mutation$UpdateList> {
  Options$Mutation$UpdateList({
    String? operationName,
    required Variables$Mutation$UpdateList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateList? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateList>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateList,
          parserFn: _parserFn$Mutation$UpdateList,
        );

  final OnMutationCompleted$Mutation$UpdateList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateList
    extends graphql.WatchQueryOptions<Mutation$UpdateList> {
  WatchOptions$Mutation$UpdateList({
    String? operationName,
    required Variables$Mutation$UpdateList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateList? typedOptimisticResult,
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
          document: documentNodeMutationUpdateList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateList,
        );
}

extension ClientExtension$Mutation$UpdateList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateList>> mutate$UpdateList(
    Options$Mutation$UpdateList options,
  ) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$UpdateList> watchMutation$UpdateList(
    WatchOptions$Mutation$UpdateList options,
  ) =>
      watchMutation(options);
}

class Mutation$UpdateList$HookResult {
  Mutation$UpdateList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateList runMutation;

  final graphql.QueryResult<Mutation$UpdateList> result;
}

Mutation$UpdateList$HookResult useMutation$UpdateList([
  WidgetOptions$Mutation$UpdateList? options,
]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateList());
  return Mutation$UpdateList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateList> useWatchMutation$UpdateList(
  WatchOptions$Mutation$UpdateList options,
) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateList
    extends graphql.MutationOptions<Mutation$UpdateList> {
  WidgetOptions$Mutation$UpdateList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateList? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateList>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateList,
          parserFn: _parserFn$Mutation$UpdateList,
        );

  final OnMutationCompleted$Mutation$UpdateList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateList
    = graphql.MultiSourceResult<Mutation$UpdateList> Function(
  Variables$Mutation$UpdateList, {
  Object? optimisticResult,
  Mutation$UpdateList? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateList = widgets.Widget Function(
  RunMutation$Mutation$UpdateList,
  graphql.QueryResult<Mutation$UpdateList>?,
);

class Mutation$UpdateList$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateList> {
  Mutation$UpdateList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateList? options,
    required Builder$Mutation$UpdateList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateList(),
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
