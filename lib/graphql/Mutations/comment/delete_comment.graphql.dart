import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteComment {
  factory Variables$Mutation$DeleteComment({required String idComment}) =>
      Variables$Mutation$DeleteComment._({
        r'idComment': idComment,
      });

  Variables$Mutation$DeleteComment._(this._$data);

  factory Variables$Mutation$DeleteComment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idComment = data['idComment'];
    result$data['idComment'] = (l$idComment as String);
    return Variables$Mutation$DeleteComment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idComment => (_$data['idComment'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idComment = idComment;
    result$data['idComment'] = l$idComment;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteComment<Variables$Mutation$DeleteComment>
      get copyWith => CopyWith$Variables$Mutation$DeleteComment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteComment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idComment = idComment;
    final lOther$idComment = other.idComment;
    if (l$idComment != lOther$idComment) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idComment = idComment;
    return Object.hashAll([l$idComment]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteComment<TRes> {
  factory CopyWith$Variables$Mutation$DeleteComment(
    Variables$Mutation$DeleteComment instance,
    TRes Function(Variables$Mutation$DeleteComment) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteComment;

  factory CopyWith$Variables$Mutation$DeleteComment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteComment;

  TRes call({String? idComment});
}

class _CopyWithImpl$Variables$Mutation$DeleteComment<TRes>
    implements CopyWith$Variables$Mutation$DeleteComment<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteComment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteComment _instance;

  final TRes Function(Variables$Mutation$DeleteComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idComment = _undefined}) =>
      _then(Variables$Mutation$DeleteComment._({
        ..._instance._$data,
        if (idComment != _undefined && idComment != null)
          'idComment': (idComment as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteComment<TRes>
    implements CopyWith$Variables$Mutation$DeleteComment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteComment(this._res);

  TRes _res;

  call({String? idComment}) => _res;
}

class Mutation$DeleteComment {
  Mutation$DeleteComment({
    this.deleteComment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteComment.fromJson(Map<String, dynamic> json) {
    final l$deleteComment = json['deleteComment'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteComment(
      deleteComment: (l$deleteComment as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteComment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteComment = deleteComment;
    _resultData['deleteComment'] = l$deleteComment;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteComment = deleteComment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteComment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteComment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteComment = deleteComment;
    final lOther$deleteComment = other.deleteComment;
    if (l$deleteComment != lOther$deleteComment) {
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

extension UtilityExtension$Mutation$DeleteComment on Mutation$DeleteComment {
  CopyWith$Mutation$DeleteComment<Mutation$DeleteComment> get copyWith =>
      CopyWith$Mutation$DeleteComment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteComment<TRes> {
  factory CopyWith$Mutation$DeleteComment(
    Mutation$DeleteComment instance,
    TRes Function(Mutation$DeleteComment) then,
  ) = _CopyWithImpl$Mutation$DeleteComment;

  factory CopyWith$Mutation$DeleteComment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteComment;

  TRes call({
    bool? deleteComment,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteComment<TRes>
    implements CopyWith$Mutation$DeleteComment<TRes> {
  _CopyWithImpl$Mutation$DeleteComment(
    this._instance,
    this._then,
  );

  final Mutation$DeleteComment _instance;

  final TRes Function(Mutation$DeleteComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteComment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteComment(
        deleteComment: deleteComment == _undefined
            ? _instance.deleteComment
            : (deleteComment as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteComment<TRes>
    implements CopyWith$Mutation$DeleteComment<TRes> {
  _CopyWithStubImpl$Mutation$DeleteComment(this._res);

  TRes _res;

  call({
    bool? deleteComment,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteComment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteComment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idComment')),
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
        name: NameNode(value: 'deleteComment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idComment'),
            value: VariableNode(name: NameNode(value: 'idComment')),
          )
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
Mutation$DeleteComment _parserFn$Mutation$DeleteComment(
        Map<String, dynamic> data) =>
    Mutation$DeleteComment.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteComment = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteComment?,
);

class Options$Mutation$DeleteComment
    extends graphql.MutationOptions<Mutation$DeleteComment> {
  Options$Mutation$DeleteComment({
    String? operationName,
    required Variables$Mutation$DeleteComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteComment>? update,
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
                        : _parserFn$Mutation$DeleteComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteComment,
          parserFn: _parserFn$Mutation$DeleteComment,
        );

  final OnMutationCompleted$Mutation$DeleteComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteComment
    extends graphql.WatchQueryOptions<Mutation$DeleteComment> {
  WatchOptions$Mutation$DeleteComment({
    String? operationName,
    required Variables$Mutation$DeleteComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteComment? typedOptimisticResult,
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
          document: documentNodeMutationDeleteComment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteComment,
        );
}

extension ClientExtension$Mutation$DeleteComment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteComment>> mutate$DeleteComment(
          Options$Mutation$DeleteComment options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteComment> watchMutation$DeleteComment(
          WatchOptions$Mutation$DeleteComment options) =>
      this.watchMutation(options);
}

class Mutation$DeleteComment$HookResult {
  Mutation$DeleteComment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteComment runMutation;

  final graphql.QueryResult<Mutation$DeleteComment> result;
}

Mutation$DeleteComment$HookResult useMutation$DeleteComment(
    [WidgetOptions$Mutation$DeleteComment? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteComment());
  return Mutation$DeleteComment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteComment> useWatchMutation$DeleteComment(
        WatchOptions$Mutation$DeleteComment options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteComment
    extends graphql.MutationOptions<Mutation$DeleteComment> {
  WidgetOptions$Mutation$DeleteComment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteComment>? update,
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
                        : _parserFn$Mutation$DeleteComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteComment,
          parserFn: _parserFn$Mutation$DeleteComment,
        );

  final OnMutationCompleted$Mutation$DeleteComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteComment
    = graphql.MultiSourceResult<Mutation$DeleteComment> Function(
  Variables$Mutation$DeleteComment, {
  Object? optimisticResult,
  Mutation$DeleteComment? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteComment = widgets.Widget Function(
  RunMutation$Mutation$DeleteComment,
  graphql.QueryResult<Mutation$DeleteComment>?,
);

class Mutation$DeleteComment$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteComment> {
  Mutation$DeleteComment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteComment? options,
    required Builder$Mutation$DeleteComment builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteComment(),
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
