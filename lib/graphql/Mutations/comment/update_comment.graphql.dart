import '../../Fragment/comment_fragment.graphql.dart';
import '../../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UpdateComment {
  factory Variables$Mutation$UpdateComment({
    required String idComment,
    required String content,
  }) =>
      Variables$Mutation$UpdateComment._({
        r'idComment': idComment,
        r'content': content,
      });

  Variables$Mutation$UpdateComment._(this._$data);

  factory Variables$Mutation$UpdateComment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idComment = data['idComment'];
    result$data['idComment'] = (l$idComment as String);
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    return Variables$Mutation$UpdateComment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idComment => (_$data['idComment'] as String);

  String get content => (_$data['content'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idComment = idComment;
    result$data['idComment'] = l$idComment;
    final l$content = content;
    result$data['content'] = l$content;
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateComment<Variables$Mutation$UpdateComment>
      get copyWith => CopyWith$Variables$Mutation$UpdateComment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateComment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idComment = idComment;
    final lOther$idComment = other.idComment;
    if (l$idComment != lOther$idComment) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idComment = idComment;
    final l$content = content;
    return Object.hashAll([
      l$idComment,
      l$content,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateComment<TRes> {
  factory CopyWith$Variables$Mutation$UpdateComment(
    Variables$Mutation$UpdateComment instance,
    TRes Function(Variables$Mutation$UpdateComment) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateComment;

  factory CopyWith$Variables$Mutation$UpdateComment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateComment;

  TRes call({
    String? idComment,
    String? content,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateComment<TRes>
    implements CopyWith$Variables$Mutation$UpdateComment<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateComment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateComment _instance;

  final TRes Function(Variables$Mutation$UpdateComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? idComment = _undefined,
    Object? content = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateComment._({
        ..._instance._$data,
        if (idComment != _undefined && idComment != null)
          'idComment': (idComment as String),
        if (content != _undefined && content != null)
          'content': (content as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateComment<TRes>
    implements CopyWith$Variables$Mutation$UpdateComment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateComment(this._res);

  TRes _res;

  call({
    String? idComment,
    String? content,
  }) =>
      _res;
}

class Mutation$UpdateComment {
  Mutation$UpdateComment({
    this.updateComment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateComment.fromJson(Map<String, dynamic> json) {
    final l$updateComment = json['updateComment'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateComment(
      updateComment: l$updateComment == null
          ? null
          : Fragment$CommentFragment.fromJson(
              (l$updateComment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CommentFragment? updateComment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateComment = updateComment;
    _resultData['updateComment'] = l$updateComment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateComment = updateComment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateComment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateComment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateComment = updateComment;
    final lOther$updateComment = other.updateComment;
    if (l$updateComment != lOther$updateComment) {
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

extension UtilityExtension$Mutation$UpdateComment on Mutation$UpdateComment {
  CopyWith$Mutation$UpdateComment<Mutation$UpdateComment> get copyWith =>
      CopyWith$Mutation$UpdateComment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateComment<TRes> {
  factory CopyWith$Mutation$UpdateComment(
    Mutation$UpdateComment instance,
    TRes Function(Mutation$UpdateComment) then,
  ) = _CopyWithImpl$Mutation$UpdateComment;

  factory CopyWith$Mutation$UpdateComment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateComment;

  TRes call({
    Fragment$CommentFragment? updateComment,
    String? $__typename,
  });
  CopyWith$Fragment$CommentFragment<TRes> get updateComment;
}

class _CopyWithImpl$Mutation$UpdateComment<TRes>
    implements CopyWith$Mutation$UpdateComment<TRes> {
  _CopyWithImpl$Mutation$UpdateComment(
    this._instance,
    this._then,
  );

  final Mutation$UpdateComment _instance;

  final TRes Function(Mutation$UpdateComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateComment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateComment(
        updateComment: updateComment == _undefined
            ? _instance.updateComment
            : (updateComment as Fragment$CommentFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$CommentFragment<TRes> get updateComment {
    final local$updateComment = _instance.updateComment;
    return local$updateComment == null
        ? CopyWith$Fragment$CommentFragment.stub(_then(_instance))
        : CopyWith$Fragment$CommentFragment(
            local$updateComment, (e) => call(updateComment: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateComment<TRes>
    implements CopyWith$Mutation$UpdateComment<TRes> {
  _CopyWithStubImpl$Mutation$UpdateComment(this._res);

  TRes _res;

  call({
    Fragment$CommentFragment? updateComment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$CommentFragment<TRes> get updateComment =>
      CopyWith$Fragment$CommentFragment.stub(_res);
}

const documentNodeMutationUpdateComment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateComment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idComment')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
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
        name: NameNode(value: 'updateComment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idComment'),
            value: VariableNode(name: NameNode(value: 'idComment')),
          ),
          ArgumentNode(
            name: NameNode(value: 'content'),
            value: VariableNode(name: NameNode(value: 'content')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CommentFragment'),
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
  fragmentDefinitionCommentFragment,
  fragmentDefinitionUserFragment,
]);
Mutation$UpdateComment _parserFn$Mutation$UpdateComment(
        Map<String, dynamic> data) =>
    Mutation$UpdateComment.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateComment = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateComment?,
);

class Options$Mutation$UpdateComment
    extends graphql.MutationOptions<Mutation$UpdateComment> {
  Options$Mutation$UpdateComment({
    String? operationName,
    required Variables$Mutation$UpdateComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateComment>? update,
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
                        : _parserFn$Mutation$UpdateComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateComment,
          parserFn: _parserFn$Mutation$UpdateComment,
        );

  final OnMutationCompleted$Mutation$UpdateComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateComment
    extends graphql.WatchQueryOptions<Mutation$UpdateComment> {
  WatchOptions$Mutation$UpdateComment({
    String? operationName,
    required Variables$Mutation$UpdateComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateComment? typedOptimisticResult,
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
          document: documentNodeMutationUpdateComment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateComment,
        );
}

extension ClientExtension$Mutation$UpdateComment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateComment>> mutate$UpdateComment(
          Options$Mutation$UpdateComment options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateComment> watchMutation$UpdateComment(
          WatchOptions$Mutation$UpdateComment options) =>
      this.watchMutation(options);
}

class Mutation$UpdateComment$HookResult {
  Mutation$UpdateComment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateComment runMutation;

  final graphql.QueryResult<Mutation$UpdateComment> result;
}

Mutation$UpdateComment$HookResult useMutation$UpdateComment(
    [WidgetOptions$Mutation$UpdateComment? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateComment());
  return Mutation$UpdateComment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateComment> useWatchMutation$UpdateComment(
        WatchOptions$Mutation$UpdateComment options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateComment
    extends graphql.MutationOptions<Mutation$UpdateComment> {
  WidgetOptions$Mutation$UpdateComment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateComment>? update,
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
                        : _parserFn$Mutation$UpdateComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateComment,
          parserFn: _parserFn$Mutation$UpdateComment,
        );

  final OnMutationCompleted$Mutation$UpdateComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateComment
    = graphql.MultiSourceResult<Mutation$UpdateComment> Function(
  Variables$Mutation$UpdateComment, {
  Object? optimisticResult,
  Mutation$UpdateComment? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateComment = widgets.Widget Function(
  RunMutation$Mutation$UpdateComment,
  graphql.QueryResult<Mutation$UpdateComment>?,
);

class Mutation$UpdateComment$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateComment> {
  Mutation$UpdateComment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateComment? options,
    required Builder$Mutation$UpdateComment builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateComment(),
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
