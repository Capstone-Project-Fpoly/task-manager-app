import '../../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$MoveList {
  factory Variables$Mutation$MoveList({
    required String idBoard,
    required Input$InputMoveList input,
  }) =>
      Variables$Mutation$MoveList._({
        r'idBoard': idBoard,
        r'input': input,
      });

  Variables$Mutation$MoveList._(this._$data);

  factory Variables$Mutation$MoveList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$InputMoveList.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$MoveList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Input$InputMoveList get input => (_$data['input'] as Input$InputMoveList);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$MoveList<Variables$Mutation$MoveList>
      get copyWith => CopyWith$Variables$Mutation$MoveList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$MoveList) ||
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

abstract class CopyWith$Variables$Mutation$MoveList<TRes> {
  factory CopyWith$Variables$Mutation$MoveList(
    Variables$Mutation$MoveList instance,
    TRes Function(Variables$Mutation$MoveList) then,
  ) = _CopyWithImpl$Variables$Mutation$MoveList;

  factory CopyWith$Variables$Mutation$MoveList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$MoveList;

  TRes call({
    String? idBoard,
    Input$InputMoveList? input,
  });
}

class _CopyWithImpl$Variables$Mutation$MoveList<TRes>
    implements CopyWith$Variables$Mutation$MoveList<TRes> {
  _CopyWithImpl$Variables$Mutation$MoveList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$MoveList _instance;

  final TRes Function(Variables$Mutation$MoveList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? idBoard = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$MoveList._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
        if (input != _undefined && input != null)
          'input': (input as Input$InputMoveList),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$MoveList<TRes>
    implements CopyWith$Variables$Mutation$MoveList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$MoveList(this._res);

  TRes _res;

  call({
    String? idBoard,
    Input$InputMoveList? input,
  }) =>
      _res;
}

class Mutation$MoveList {
  Mutation$MoveList({
    this.moveList,
    this.$__typename = 'Mutation',
  });

  factory Mutation$MoveList.fromJson(Map<String, dynamic> json) {
    final l$moveList = json['moveList'];
    final l$$__typename = json['__typename'];
    return Mutation$MoveList(
      moveList: (l$moveList as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? moveList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$moveList = moveList;
    _resultData['moveList'] = l$moveList;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$moveList = moveList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$moveList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$MoveList) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$moveList = moveList;
    final lOther$moveList = other.moveList;
    if (l$moveList != lOther$moveList) {
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

extension UtilityExtension$Mutation$MoveList on Mutation$MoveList {
  CopyWith$Mutation$MoveList<Mutation$MoveList> get copyWith =>
      CopyWith$Mutation$MoveList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$MoveList<TRes> {
  factory CopyWith$Mutation$MoveList(
    Mutation$MoveList instance,
    TRes Function(Mutation$MoveList) then,
  ) = _CopyWithImpl$Mutation$MoveList;

  factory CopyWith$Mutation$MoveList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MoveList;

  TRes call({
    bool? moveList,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$MoveList<TRes>
    implements CopyWith$Mutation$MoveList<TRes> {
  _CopyWithImpl$Mutation$MoveList(
    this._instance,
    this._then,
  );

  final Mutation$MoveList _instance;

  final TRes Function(Mutation$MoveList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? moveList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$MoveList(
        moveList:
            moveList == _undefined ? _instance.moveList : (moveList as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$MoveList<TRes>
    implements CopyWith$Mutation$MoveList<TRes> {
  _CopyWithStubImpl$Mutation$MoveList(this._res);

  TRes _res;

  call({
    bool? moveList,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationMoveList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'MoveList'),
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
          name: NameNode(value: 'InputMoveList'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'moveList'),
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
        selectionSet: null,
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
]);
Mutation$MoveList _parserFn$Mutation$MoveList(Map<String, dynamic> data) =>
    Mutation$MoveList.fromJson(data);
typedef OnMutationCompleted$Mutation$MoveList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$MoveList?,
);

class Options$Mutation$MoveList
    extends graphql.MutationOptions<Mutation$MoveList> {
  Options$Mutation$MoveList({
    String? operationName,
    required Variables$Mutation$MoveList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MoveList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MoveList? onCompleted,
    graphql.OnMutationUpdate<Mutation$MoveList>? update,
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
                    data == null ? null : _parserFn$Mutation$MoveList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationMoveList,
          parserFn: _parserFn$Mutation$MoveList,
        );

  final OnMutationCompleted$Mutation$MoveList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$MoveList
    extends graphql.WatchQueryOptions<Mutation$MoveList> {
  WatchOptions$Mutation$MoveList({
    String? operationName,
    required Variables$Mutation$MoveList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MoveList? typedOptimisticResult,
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
          document: documentNodeMutationMoveList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$MoveList,
        );
}

extension ClientExtension$Mutation$MoveList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$MoveList>> mutate$MoveList(
          Options$Mutation$MoveList options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$MoveList> watchMutation$MoveList(
          WatchOptions$Mutation$MoveList options) =>
      this.watchMutation(options);
}

class Mutation$MoveList$HookResult {
  Mutation$MoveList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$MoveList runMutation;

  final graphql.QueryResult<Mutation$MoveList> result;
}

Mutation$MoveList$HookResult useMutation$MoveList(
    [WidgetOptions$Mutation$MoveList? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$MoveList());
  return Mutation$MoveList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$MoveList> useWatchMutation$MoveList(
        WatchOptions$Mutation$MoveList options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$MoveList
    extends graphql.MutationOptions<Mutation$MoveList> {
  WidgetOptions$Mutation$MoveList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MoveList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MoveList? onCompleted,
    graphql.OnMutationUpdate<Mutation$MoveList>? update,
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
                    data == null ? null : _parserFn$Mutation$MoveList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationMoveList,
          parserFn: _parserFn$Mutation$MoveList,
        );

  final OnMutationCompleted$Mutation$MoveList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$MoveList
    = graphql.MultiSourceResult<Mutation$MoveList> Function(
  Variables$Mutation$MoveList, {
  Object? optimisticResult,
  Mutation$MoveList? typedOptimisticResult,
});
typedef Builder$Mutation$MoveList = widgets.Widget Function(
  RunMutation$Mutation$MoveList,
  graphql.QueryResult<Mutation$MoveList>?,
);

class Mutation$MoveList$Widget
    extends graphql_flutter.Mutation<Mutation$MoveList> {
  Mutation$MoveList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$MoveList? options,
    required Builder$Mutation$MoveList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$MoveList(),
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
