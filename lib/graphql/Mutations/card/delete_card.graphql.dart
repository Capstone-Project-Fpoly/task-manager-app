import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteCard {
  factory Variables$Mutation$DeleteCard({required String idCard}) =>
      Variables$Mutation$DeleteCard._({
        r'idCard': idCard,
      });

  Variables$Mutation$DeleteCard._(this._$data);

  factory Variables$Mutation$DeleteCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idCard = data['idCard'];
    result$data['idCard'] = (l$idCard as String);
    return Variables$Mutation$DeleteCard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idCard => (_$data['idCard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idCard = idCard;
    result$data['idCard'] = l$idCard;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteCard<Variables$Mutation$DeleteCard>
      get copyWith => CopyWith$Variables$Mutation$DeleteCard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteCard) ||
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

abstract class CopyWith$Variables$Mutation$DeleteCard<TRes> {
  factory CopyWith$Variables$Mutation$DeleteCard(
    Variables$Mutation$DeleteCard instance,
    TRes Function(Variables$Mutation$DeleteCard) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteCard;

  factory CopyWith$Variables$Mutation$DeleteCard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteCard;

  TRes call({String? idCard});
}

class _CopyWithImpl$Variables$Mutation$DeleteCard<TRes>
    implements CopyWith$Variables$Mutation$DeleteCard<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteCard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteCard _instance;

  final TRes Function(Variables$Mutation$DeleteCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idCard = _undefined}) =>
      _then(Variables$Mutation$DeleteCard._({
        ..._instance._$data,
        if (idCard != _undefined && idCard != null)
          'idCard': (idCard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteCard<TRes>
    implements CopyWith$Variables$Mutation$DeleteCard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteCard(this._res);

  TRes _res;

  call({String? idCard}) => _res;
}

class Mutation$DeleteCard {
  Mutation$DeleteCard({
    this.deleteCard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteCard.fromJson(Map<String, dynamic> json) {
    final l$deleteCard = json['deleteCard'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCard(
      deleteCard: (l$deleteCard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteCard = deleteCard;
    _resultData['deleteCard'] = l$deleteCard;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteCard = deleteCard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteCard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteCard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteCard = deleteCard;
    final lOther$deleteCard = other.deleteCard;
    if (l$deleteCard != lOther$deleteCard) {
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

extension UtilityExtension$Mutation$DeleteCard on Mutation$DeleteCard {
  CopyWith$Mutation$DeleteCard<Mutation$DeleteCard> get copyWith =>
      CopyWith$Mutation$DeleteCard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteCard<TRes> {
  factory CopyWith$Mutation$DeleteCard(
    Mutation$DeleteCard instance,
    TRes Function(Mutation$DeleteCard) then,
  ) = _CopyWithImpl$Mutation$DeleteCard;

  factory CopyWith$Mutation$DeleteCard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteCard;

  TRes call({
    bool? deleteCard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteCard<TRes>
    implements CopyWith$Mutation$DeleteCard<TRes> {
  _CopyWithImpl$Mutation$DeleteCard(
    this._instance,
    this._then,
  );

  final Mutation$DeleteCard _instance;

  final TRes Function(Mutation$DeleteCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteCard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteCard(
        deleteCard: deleteCard == _undefined
            ? _instance.deleteCard
            : (deleteCard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteCard<TRes>
    implements CopyWith$Mutation$DeleteCard<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCard(this._res);

  TRes _res;

  call({
    bool? deleteCard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteCard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteCard'),
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
        name: NameNode(value: 'deleteCard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idCard'),
            value: VariableNode(name: NameNode(value: 'idCard')),
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
Mutation$DeleteCard _parserFn$Mutation$DeleteCard(Map<String, dynamic> data) =>
    Mutation$DeleteCard.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteCard?,
);

class Options$Mutation$DeleteCard
    extends graphql.MutationOptions<Mutation$DeleteCard> {
  Options$Mutation$DeleteCard({
    String? operationName,
    required Variables$Mutation$DeleteCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteCard>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteCard,
          parserFn: _parserFn$Mutation$DeleteCard,
        );

  final OnMutationCompleted$Mutation$DeleteCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteCard
    extends graphql.WatchQueryOptions<Mutation$DeleteCard> {
  WatchOptions$Mutation$DeleteCard({
    String? operationName,
    required Variables$Mutation$DeleteCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCard? typedOptimisticResult,
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
          document: documentNodeMutationDeleteCard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteCard,
        );
}

extension ClientExtension$Mutation$DeleteCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteCard>> mutate$DeleteCard(
          Options$Mutation$DeleteCard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteCard> watchMutation$DeleteCard(
          WatchOptions$Mutation$DeleteCard options) =>
      this.watchMutation(options);
}

class Mutation$DeleteCard$HookResult {
  Mutation$DeleteCard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteCard runMutation;

  final graphql.QueryResult<Mutation$DeleteCard> result;
}

Mutation$DeleteCard$HookResult useMutation$DeleteCard(
    [WidgetOptions$Mutation$DeleteCard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteCard());
  return Mutation$DeleteCard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteCard> useWatchMutation$DeleteCard(
        WatchOptions$Mutation$DeleteCard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteCard
    extends graphql.MutationOptions<Mutation$DeleteCard> {
  WidgetOptions$Mutation$DeleteCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteCard>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteCard,
          parserFn: _parserFn$Mutation$DeleteCard,
        );

  final OnMutationCompleted$Mutation$DeleteCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteCard
    = graphql.MultiSourceResult<Mutation$DeleteCard> Function(
  Variables$Mutation$DeleteCard, {
  Object? optimisticResult,
  Mutation$DeleteCard? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteCard = widgets.Widget Function(
  RunMutation$Mutation$DeleteCard,
  graphql.QueryResult<Mutation$DeleteCard>?,
);

class Mutation$DeleteCard$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteCard> {
  Mutation$DeleteCard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteCard? options,
    required Builder$Mutation$DeleteCard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteCard(),
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
