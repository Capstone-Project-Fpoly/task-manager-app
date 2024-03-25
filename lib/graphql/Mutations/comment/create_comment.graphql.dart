import '../../Fragment/comment_fragment.graphql.dart';
import '../../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$CreateComment {
  factory Variables$Mutation$CreateComment({
    required String idCard,
    required String content,
  }) =>
      Variables$Mutation$CreateComment._({
        r'idCard': idCard,
        r'content': content,
      });

  Variables$Mutation$CreateComment._(this._$data);

  factory Variables$Mutation$CreateComment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idCard = data['idCard'];
    result$data['idCard'] = (l$idCard as String);
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    return Variables$Mutation$CreateComment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idCard => (_$data['idCard'] as String);

  String get content => (_$data['content'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idCard = idCard;
    result$data['idCard'] = l$idCard;
    final l$content = content;
    result$data['content'] = l$content;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateComment<Variables$Mutation$CreateComment>
      get copyWith => CopyWith$Variables$Mutation$CreateComment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateComment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idCard = idCard;
    final lOther$idCard = other.idCard;
    if (l$idCard != lOther$idCard) {
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
    final l$idCard = idCard;
    final l$content = content;
    return Object.hashAll([
      l$idCard,
      l$content,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateComment<TRes> {
  factory CopyWith$Variables$Mutation$CreateComment(
    Variables$Mutation$CreateComment instance,
    TRes Function(Variables$Mutation$CreateComment) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateComment;

  factory CopyWith$Variables$Mutation$CreateComment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateComment;

  TRes call({
    String? idCard,
    String? content,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateComment<TRes>
    implements CopyWith$Variables$Mutation$CreateComment<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateComment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateComment _instance;

  final TRes Function(Variables$Mutation$CreateComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? idCard = _undefined,
    Object? content = _undefined,
  }) =>
      _then(Variables$Mutation$CreateComment._({
        ..._instance._$data,
        if (idCard != _undefined && idCard != null)
          'idCard': (idCard as String),
        if (content != _undefined && content != null)
          'content': (content as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateComment<TRes>
    implements CopyWith$Variables$Mutation$CreateComment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateComment(this._res);

  TRes _res;

  call({
    String? idCard,
    String? content,
  }) =>
      _res;
}

class Mutation$CreateComment {
  Mutation$CreateComment({
    this.createComment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateComment.fromJson(Map<String, dynamic> json) {
    final l$createComment = json['createComment'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateComment(
      createComment: l$createComment == null
          ? null
          : Fragment$CommentFragment.fromJson(
              (l$createComment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CommentFragment? createComment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createComment = createComment;
    _resultData['createComment'] = l$createComment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createComment = createComment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createComment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateComment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createComment = createComment;
    final lOther$createComment = other.createComment;
    if (l$createComment != lOther$createComment) {
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

extension UtilityExtension$Mutation$CreateComment on Mutation$CreateComment {
  CopyWith$Mutation$CreateComment<Mutation$CreateComment> get copyWith =>
      CopyWith$Mutation$CreateComment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateComment<TRes> {
  factory CopyWith$Mutation$CreateComment(
    Mutation$CreateComment instance,
    TRes Function(Mutation$CreateComment) then,
  ) = _CopyWithImpl$Mutation$CreateComment;

  factory CopyWith$Mutation$CreateComment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateComment;

  TRes call({
    Fragment$CommentFragment? createComment,
    String? $__typename,
  });
  CopyWith$Fragment$CommentFragment<TRes> get createComment;
}

class _CopyWithImpl$Mutation$CreateComment<TRes>
    implements CopyWith$Mutation$CreateComment<TRes> {
  _CopyWithImpl$Mutation$CreateComment(
    this._instance,
    this._then,
  );

  final Mutation$CreateComment _instance;

  final TRes Function(Mutation$CreateComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createComment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateComment(
        createComment: createComment == _undefined
            ? _instance.createComment
            : (createComment as Fragment$CommentFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$CommentFragment<TRes> get createComment {
    final local$createComment = _instance.createComment;
    return local$createComment == null
        ? CopyWith$Fragment$CommentFragment.stub(_then(_instance))
        : CopyWith$Fragment$CommentFragment(
            local$createComment, (e) => call(createComment: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateComment<TRes>
    implements CopyWith$Mutation$CreateComment<TRes> {
  _CopyWithStubImpl$Mutation$CreateComment(this._res);

  TRes _res;

  call({
    Fragment$CommentFragment? createComment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$CommentFragment<TRes> get createComment =>
      CopyWith$Fragment$CommentFragment.stub(_res);
}

const documentNodeMutationCreateComment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateComment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idCard')),
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
        name: NameNode(value: 'createComment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idCard'),
            value: VariableNode(name: NameNode(value: 'idCard')),
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
Mutation$CreateComment _parserFn$Mutation$CreateComment(
        Map<String, dynamic> data) =>
    Mutation$CreateComment.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateComment = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateComment?,
);

class Options$Mutation$CreateComment
    extends graphql.MutationOptions<Mutation$CreateComment> {
  Options$Mutation$CreateComment({
    String? operationName,
    required Variables$Mutation$CreateComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateComment>? update,
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
                        : _parserFn$Mutation$CreateComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateComment,
          parserFn: _parserFn$Mutation$CreateComment,
        );

  final OnMutationCompleted$Mutation$CreateComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateComment
    extends graphql.WatchQueryOptions<Mutation$CreateComment> {
  WatchOptions$Mutation$CreateComment({
    String? operationName,
    required Variables$Mutation$CreateComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateComment? typedOptimisticResult,
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
          document: documentNodeMutationCreateComment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateComment,
        );
}

extension ClientExtension$Mutation$CreateComment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateComment>> mutate$CreateComment(
          Options$Mutation$CreateComment options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateComment> watchMutation$CreateComment(
          WatchOptions$Mutation$CreateComment options) =>
      this.watchMutation(options);
}

class Mutation$CreateComment$HookResult {
  Mutation$CreateComment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateComment runMutation;

  final graphql.QueryResult<Mutation$CreateComment> result;
}

Mutation$CreateComment$HookResult useMutation$CreateComment(
    [WidgetOptions$Mutation$CreateComment? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateComment());
  return Mutation$CreateComment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateComment> useWatchMutation$CreateComment(
        WatchOptions$Mutation$CreateComment options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateComment
    extends graphql.MutationOptions<Mutation$CreateComment> {
  WidgetOptions$Mutation$CreateComment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateComment>? update,
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
                        : _parserFn$Mutation$CreateComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateComment,
          parserFn: _parserFn$Mutation$CreateComment,
        );

  final OnMutationCompleted$Mutation$CreateComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateComment
    = graphql.MultiSourceResult<Mutation$CreateComment> Function(
  Variables$Mutation$CreateComment, {
  Object? optimisticResult,
  Mutation$CreateComment? typedOptimisticResult,
});
typedef Builder$Mutation$CreateComment = widgets.Widget Function(
  RunMutation$Mutation$CreateComment,
  graphql.QueryResult<Mutation$CreateComment>?,
);

class Mutation$CreateComment$Widget
    extends graphql_flutter.Mutation<Mutation$CreateComment> {
  Mutation$CreateComment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateComment? options,
    required Builder$Mutation$CreateComment builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateComment(),
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
