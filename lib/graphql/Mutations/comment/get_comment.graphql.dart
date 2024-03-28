import '../../Fragment/comment_fragment.graphql.dart';
import '../../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$GetComments {
  factory Variables$Mutation$GetComments({required String idCard}) =>
      Variables$Mutation$GetComments._({
        r'idCard': idCard,
      });

  Variables$Mutation$GetComments._(this._$data);

  factory Variables$Mutation$GetComments.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idCard = data['idCard'];
    result$data['idCard'] = (l$idCard as String);
    return Variables$Mutation$GetComments._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idCard => (_$data['idCard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idCard = idCard;
    result$data['idCard'] = l$idCard;
    return result$data;
  }

  CopyWith$Variables$Mutation$GetComments<Variables$Mutation$GetComments>
      get copyWith => CopyWith$Variables$Mutation$GetComments(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$GetComments) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idCard = idCard;
    final lOther$idCard = other.idCard;
    if (l$idCard != lOther$idCard) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idCard = idCard;
    return Object.hashAll([l$idCard]);
  }
}

abstract class CopyWith$Variables$Mutation$GetComments<TRes> {
  factory CopyWith$Variables$Mutation$GetComments(
    Variables$Mutation$GetComments instance,
    TRes Function(Variables$Mutation$GetComments) then,
  ) = _CopyWithImpl$Variables$Mutation$GetComments;

  factory CopyWith$Variables$Mutation$GetComments.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$GetComments;

  TRes call({String? idCard});
}

class _CopyWithImpl$Variables$Mutation$GetComments<TRes>
    implements CopyWith$Variables$Mutation$GetComments<TRes> {
  _CopyWithImpl$Variables$Mutation$GetComments(
    this._instance,
    this._then,
  );

  final Variables$Mutation$GetComments _instance;

  final TRes Function(Variables$Mutation$GetComments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idCard = _undefined}) =>
      _then(Variables$Mutation$GetComments._({
        ..._instance._$data,
        if (idCard != _undefined && idCard != null)
          'idCard': (idCard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$GetComments<TRes>
    implements CopyWith$Variables$Mutation$GetComments<TRes> {
  _CopyWithStubImpl$Variables$Mutation$GetComments(this._res);

  TRes _res;

  call({String? idCard}) => _res;
}

class Mutation$GetComments {
  Mutation$GetComments({
    this.getComments,
    this.$__typename = 'Mutation',
  });

  factory Mutation$GetComments.fromJson(Map<String, dynamic> json) {
    final l$getComments = json['getComments'];
    final l$$__typename = json['__typename'];
    return Mutation$GetComments(
      getComments: (l$getComments as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$CommentFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$CommentFragment?>? getComments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getComments = getComments;
    _resultData['getComments'] =
        l$getComments?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getComments = getComments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getComments == null
          ? null
          : Object.hashAll(l$getComments.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$GetComments) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getComments = getComments;
    final lOther$getComments = other.getComments;
    if (l$getComments != null && lOther$getComments != null) {
      if (l$getComments.length != lOther$getComments.length) {
        return false;
      }
      for (int i = 0; i < l$getComments.length; i++) {
        final l$getComments$entry = l$getComments[i];
        final lOther$getComments$entry = lOther$getComments[i];
        if (l$getComments$entry != lOther$getComments$entry) {
          return false;
        }
      }
    } else if (l$getComments != lOther$getComments) {
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

extension UtilityExtension$Mutation$GetComments on Mutation$GetComments {
  CopyWith$Mutation$GetComments<Mutation$GetComments> get copyWith =>
      CopyWith$Mutation$GetComments(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$GetComments<TRes> {
  factory CopyWith$Mutation$GetComments(
    Mutation$GetComments instance,
    TRes Function(Mutation$GetComments) then,
  ) = _CopyWithImpl$Mutation$GetComments;

  factory CopyWith$Mutation$GetComments.stub(TRes res) =
      _CopyWithStubImpl$Mutation$GetComments;

  TRes call({
    List<Fragment$CommentFragment?>? getComments,
    String? $__typename,
  });
  TRes getComments(
      Iterable<Fragment$CommentFragment?>? Function(
              Iterable<
                  CopyWith$Fragment$CommentFragment<
                      Fragment$CommentFragment>?>?)
          _fn);
}

class _CopyWithImpl$Mutation$GetComments<TRes>
    implements CopyWith$Mutation$GetComments<TRes> {
  _CopyWithImpl$Mutation$GetComments(
    this._instance,
    this._then,
  );

  final Mutation$GetComments _instance;

  final TRes Function(Mutation$GetComments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getComments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$GetComments(
        getComments: getComments == _undefined
            ? _instance.getComments
            : (getComments as List<Fragment$CommentFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getComments(
          Iterable<Fragment$CommentFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$CommentFragment<
                          Fragment$CommentFragment>?>?)
              _fn) =>
      call(
          getComments: _fn(_instance.getComments?.map((e) => e == null
              ? null
              : CopyWith$Fragment$CommentFragment(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Mutation$GetComments<TRes>
    implements CopyWith$Mutation$GetComments<TRes> {
  _CopyWithStubImpl$Mutation$GetComments(this._res);

  TRes _res;

  call({
    List<Fragment$CommentFragment?>? getComments,
    String? $__typename,
  }) =>
      _res;

  getComments(_fn) => _res;
}

const documentNodeMutationGetComments = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'GetComments'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idCard')),
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
        name: NameNode(value: 'getComments'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idCard'),
            value: VariableNode(name: NameNode(value: 'idCard')),
          )
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
Mutation$GetComments _parserFn$Mutation$GetComments(
        Map<String, dynamic> data) =>
    Mutation$GetComments.fromJson(data);
typedef OnMutationCompleted$Mutation$GetComments = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$GetComments?,
);

class Options$Mutation$GetComments
    extends graphql.MutationOptions<Mutation$GetComments> {
  Options$Mutation$GetComments({
    String? operationName,
    required Variables$Mutation$GetComments variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetComments? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$GetComments? onCompleted,
    graphql.OnMutationUpdate<Mutation$GetComments>? update,
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
                    data == null ? null : _parserFn$Mutation$GetComments(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationGetComments,
          parserFn: _parserFn$Mutation$GetComments,
        );

  final OnMutationCompleted$Mutation$GetComments? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$GetComments
    extends graphql.WatchQueryOptions<Mutation$GetComments> {
  WatchOptions$Mutation$GetComments({
    String? operationName,
    required Variables$Mutation$GetComments variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetComments? typedOptimisticResult,
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
          document: documentNodeMutationGetComments,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$GetComments,
        );
}

extension ClientExtension$Mutation$GetComments on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$GetComments>> mutate$GetComments(
          Options$Mutation$GetComments options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$GetComments> watchMutation$GetComments(
          WatchOptions$Mutation$GetComments options) =>
      this.watchMutation(options);
}

class Mutation$GetComments$HookResult {
  Mutation$GetComments$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$GetComments runMutation;

  final graphql.QueryResult<Mutation$GetComments> result;
}

Mutation$GetComments$HookResult useMutation$GetComments(
    [WidgetOptions$Mutation$GetComments? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$GetComments());
  return Mutation$GetComments$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$GetComments> useWatchMutation$GetComments(
        WatchOptions$Mutation$GetComments options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$GetComments
    extends graphql.MutationOptions<Mutation$GetComments> {
  WidgetOptions$Mutation$GetComments({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetComments? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$GetComments? onCompleted,
    graphql.OnMutationUpdate<Mutation$GetComments>? update,
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
                    data == null ? null : _parserFn$Mutation$GetComments(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationGetComments,
          parserFn: _parserFn$Mutation$GetComments,
        );

  final OnMutationCompleted$Mutation$GetComments? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$GetComments
    = graphql.MultiSourceResult<Mutation$GetComments> Function(
  Variables$Mutation$GetComments, {
  Object? optimisticResult,
  Mutation$GetComments? typedOptimisticResult,
});
typedef Builder$Mutation$GetComments = widgets.Widget Function(
  RunMutation$Mutation$GetComments,
  graphql.QueryResult<Mutation$GetComments>?,
);

class Mutation$GetComments$Widget
    extends graphql_flutter.Mutation<Mutation$GetComments> {
  Mutation$GetComments$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$GetComments? options,
    required Builder$Mutation$GetComments builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$GetComments(),
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
