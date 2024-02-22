import 'package:task_manager/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$MoveCard {
  factory Variables$Mutation$MoveCard({
    required String idBoard,
    required Input$InputMoveCard input,
  }) =>
      Variables$Mutation$MoveCard._({
        r'idBoard': idBoard,
        r'input': input,
      });

  Variables$Mutation$MoveCard._(this._$data);

  factory Variables$Mutation$MoveCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$InputMoveCard.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$MoveCard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Input$InputMoveCard get input => (_$data['input'] as Input$InputMoveCard);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$MoveCard<Variables$Mutation$MoveCard>
      get copyWith => CopyWith$Variables$Mutation$MoveCard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$MoveCard ||
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

abstract class CopyWith$Variables$Mutation$MoveCard<TRes> {
  factory CopyWith$Variables$Mutation$MoveCard(
    Variables$Mutation$MoveCard instance,
    TRes Function(Variables$Mutation$MoveCard) then,
  ) = _CopyWithImpl$Variables$Mutation$MoveCard;

  factory CopyWith$Variables$Mutation$MoveCard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$MoveCard;

  TRes call({
    String? idBoard,
    Input$InputMoveCard? input,
  });
}

class _CopyWithImpl$Variables$Mutation$MoveCard<TRes>
    implements CopyWith$Variables$Mutation$MoveCard<TRes> {
  _CopyWithImpl$Variables$Mutation$MoveCard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$MoveCard _instance;

  final TRes Function(Variables$Mutation$MoveCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idBoard = _undefined,
    Object? input = _undefined,
  }) =>
      _then(
        Variables$Mutation$MoveCard._({
          ..._instance._$data,
          if (idBoard != _undefined && idBoard != null)
            'idBoard': (idBoard as String),
          if (input != _undefined && input != null)
            'input': (input as Input$InputMoveCard),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$MoveCard<TRes>
    implements CopyWith$Variables$Mutation$MoveCard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$MoveCard(this._res);

  final TRes _res;

  @override
  call({
    String? idBoard,
    Input$InputMoveCard? input,
  }) =>
      _res;
}

class Mutation$MoveCard {
  Mutation$MoveCard({
    this.moveCard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$MoveCard.fromJson(Map<String, dynamic> json) {
    final l$moveCard = json['moveCard'];
    final l$$__typename = json['__typename'];
    return Mutation$MoveCard(
      moveCard: (l$moveCard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? moveCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$moveCard = moveCard;
    resultData['moveCard'] = l$moveCard;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$moveCard = moveCard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$moveCard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MoveCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$moveCard = moveCard;
    final lOther$moveCard = other.moveCard;
    if (l$moveCard != lOther$moveCard) {
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

extension UtilityExtension$Mutation$MoveCard on Mutation$MoveCard {
  CopyWith$Mutation$MoveCard<Mutation$MoveCard> get copyWith =>
      CopyWith$Mutation$MoveCard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$MoveCard<TRes> {
  factory CopyWith$Mutation$MoveCard(
    Mutation$MoveCard instance,
    TRes Function(Mutation$MoveCard) then,
  ) = _CopyWithImpl$Mutation$MoveCard;

  factory CopyWith$Mutation$MoveCard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MoveCard;

  TRes call({
    bool? moveCard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$MoveCard<TRes>
    implements CopyWith$Mutation$MoveCard<TRes> {
  _CopyWithImpl$Mutation$MoveCard(
    this._instance,
    this._then,
  );

  final Mutation$MoveCard _instance;

  final TRes Function(Mutation$MoveCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? moveCard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Mutation$MoveCard(
          moveCard:
              moveCard == _undefined ? _instance.moveCard : (moveCard as bool?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$MoveCard<TRes>
    implements CopyWith$Mutation$MoveCard<TRes> {
  _CopyWithStubImpl$Mutation$MoveCard(this._res);

  final TRes _res;

  @override
  call({
    bool? moveCard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationMoveCard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MoveCard'),
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
            name: NameNode(value: 'InputMoveCard'),
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
            name: NameNode(value: 'moveCard'),
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
        ],
      ),
    ),
  ],
);
Mutation$MoveCard _parserFn$Mutation$MoveCard(Map<String, dynamic> data) =>
    Mutation$MoveCard.fromJson(data);
typedef OnMutationCompleted$Mutation$MoveCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$MoveCard?,
);

class Options$Mutation$MoveCard
    extends graphql.MutationOptions<Mutation$MoveCard> {
  Options$Mutation$MoveCard({
    String? operationName,
    required Variables$Mutation$MoveCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MoveCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MoveCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$MoveCard>? update,
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
                    data == null ? null : _parserFn$Mutation$MoveCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationMoveCard,
          parserFn: _parserFn$Mutation$MoveCard,
        );

  final OnMutationCompleted$Mutation$MoveCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$MoveCard
    extends graphql.WatchQueryOptions<Mutation$MoveCard> {
  WatchOptions$Mutation$MoveCard({
    String? operationName,
    required Variables$Mutation$MoveCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MoveCard? typedOptimisticResult,
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
          document: documentNodeMutationMoveCard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$MoveCard,
        );
}

extension ClientExtension$Mutation$MoveCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$MoveCard>> mutate$MoveCard(
    Options$Mutation$MoveCard options,
  ) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$MoveCard> watchMutation$MoveCard(
    WatchOptions$Mutation$MoveCard options,
  ) =>
      watchMutation(options);
}

class Mutation$MoveCard$HookResult {
  Mutation$MoveCard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$MoveCard runMutation;

  final graphql.QueryResult<Mutation$MoveCard> result;
}

Mutation$MoveCard$HookResult useMutation$MoveCard([
  WidgetOptions$Mutation$MoveCard? options,
]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$MoveCard());
  return Mutation$MoveCard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$MoveCard> useWatchMutation$MoveCard(
  WatchOptions$Mutation$MoveCard options,
) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$MoveCard
    extends graphql.MutationOptions<Mutation$MoveCard> {
  WidgetOptions$Mutation$MoveCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MoveCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MoveCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$MoveCard>? update,
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
                    data == null ? null : _parserFn$Mutation$MoveCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationMoveCard,
          parserFn: _parserFn$Mutation$MoveCard,
        );

  final OnMutationCompleted$Mutation$MoveCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$MoveCard
    = graphql.MultiSourceResult<Mutation$MoveCard> Function(
  Variables$Mutation$MoveCard, {
  Object? optimisticResult,
  Mutation$MoveCard? typedOptimisticResult,
});
typedef Builder$Mutation$MoveCard = widgets.Widget Function(
  RunMutation$Mutation$MoveCard,
  graphql.QueryResult<Mutation$MoveCard>?,
);

class Mutation$MoveCard$Widget
    extends graphql_flutter.Mutation<Mutation$MoveCard> {
  Mutation$MoveCard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$MoveCard? options,
    required Builder$Mutation$MoveCard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$MoveCard(),
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
