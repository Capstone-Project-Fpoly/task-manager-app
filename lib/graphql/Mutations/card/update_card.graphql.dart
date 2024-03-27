import '../../../schema.graphql.dart';
import '../../Fragment/card_fragment.graphql.dart';
import '../../Fragment/check_list_fragment.graphql.dart';
import '../../Fragment/comment_fragment.graphql.dart';
import '../../Fragment/label_fragment.graphql.dart';
import '../../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UpdateCard {
  factory Variables$Mutation$UpdateCard(
          {required Input$InputUpdateCard input}) =>
      Variables$Mutation$UpdateCard._({
        r'input': input,
      });

  Variables$Mutation$UpdateCard._(this._$data);

  factory Variables$Mutation$UpdateCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$InputUpdateCard.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateCard._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$InputUpdateCard get input => (_$data['input'] as Input$InputUpdateCard);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateCard<Variables$Mutation$UpdateCard>
      get copyWith => CopyWith$Variables$Mutation$UpdateCard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateCard) ||
        runtimeType != other.runtimeType) {
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
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateCard<TRes> {
  factory CopyWith$Variables$Mutation$UpdateCard(
    Variables$Mutation$UpdateCard instance,
    TRes Function(Variables$Mutation$UpdateCard) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateCard;

  factory CopyWith$Variables$Mutation$UpdateCard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateCard;

  TRes call({Input$InputUpdateCard? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateCard<TRes>
    implements CopyWith$Variables$Mutation$UpdateCard<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateCard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateCard _instance;

  final TRes Function(Variables$Mutation$UpdateCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$UpdateCard._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$InputUpdateCard),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateCard<TRes>
    implements CopyWith$Variables$Mutation$UpdateCard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateCard(this._res);

  TRes _res;

  call({Input$InputUpdateCard? input}) => _res;
}

class Mutation$UpdateCard {
  Mutation$UpdateCard({
    this.updateCard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateCard.fromJson(Map<String, dynamic> json) {
    final l$updateCard = json['updateCard'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCard(
      updateCard: l$updateCard == null
          ? null
          : Fragment$CardFragment.fromJson(
              (l$updateCard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CardFragment? updateCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCard = updateCard;
    _resultData['updateCard'] = l$updateCard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCard = updateCard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateCard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateCard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCard = updateCard;
    final lOther$updateCard = other.updateCard;
    if (l$updateCard != lOther$updateCard) {
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

extension UtilityExtension$Mutation$UpdateCard on Mutation$UpdateCard {
  CopyWith$Mutation$UpdateCard<Mutation$UpdateCard> get copyWith =>
      CopyWith$Mutation$UpdateCard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateCard<TRes> {
  factory CopyWith$Mutation$UpdateCard(
    Mutation$UpdateCard instance,
    TRes Function(Mutation$UpdateCard) then,
  ) = _CopyWithImpl$Mutation$UpdateCard;

  factory CopyWith$Mutation$UpdateCard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCard;

  TRes call({
    Fragment$CardFragment? updateCard,
    String? $__typename,
  });
  CopyWith$Fragment$CardFragment<TRes> get updateCard;
}

class _CopyWithImpl$Mutation$UpdateCard<TRes>
    implements CopyWith$Mutation$UpdateCard<TRes> {
  _CopyWithImpl$Mutation$UpdateCard(
    this._instance,
    this._then,
  );

  final Mutation$UpdateCard _instance;

  final TRes Function(Mutation$UpdateCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateCard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateCard(
        updateCard: updateCard == _undefined
            ? _instance.updateCard
            : (updateCard as Fragment$CardFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$CardFragment<TRes> get updateCard {
    final local$updateCard = _instance.updateCard;
    return local$updateCard == null
        ? CopyWith$Fragment$CardFragment.stub(_then(_instance))
        : CopyWith$Fragment$CardFragment(
            local$updateCard, (e) => call(updateCard: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateCard<TRes>
    implements CopyWith$Mutation$UpdateCard<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCard(this._res);

  TRes _res;

  call({
    Fragment$CardFragment? updateCard,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$CardFragment<TRes> get updateCard =>
      CopyWith$Fragment$CardFragment.stub(_res);
}

const documentNodeMutationUpdateCard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateCard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'InputUpdateCard'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateCard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CardFragment'),
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
  fragmentDefinitionCardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionLabelFragment,
  fragmentDefinitionCheckListFragment,
]);
Mutation$UpdateCard _parserFn$Mutation$UpdateCard(Map<String, dynamic> data) =>
    Mutation$UpdateCard.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateCard?,
);

class Options$Mutation$UpdateCard
    extends graphql.MutationOptions<Mutation$UpdateCard> {
  Options$Mutation$UpdateCard({
    String? operationName,
    required Variables$Mutation$UpdateCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateCard>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateCard,
          parserFn: _parserFn$Mutation$UpdateCard,
        );

  final OnMutationCompleted$Mutation$UpdateCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateCard
    extends graphql.WatchQueryOptions<Mutation$UpdateCard> {
  WatchOptions$Mutation$UpdateCard({
    String? operationName,
    required Variables$Mutation$UpdateCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCard? typedOptimisticResult,
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
          document: documentNodeMutationUpdateCard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateCard,
        );
}

extension ClientExtension$Mutation$UpdateCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateCard>> mutate$UpdateCard(
          Options$Mutation$UpdateCard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateCard> watchMutation$UpdateCard(
          WatchOptions$Mutation$UpdateCard options) =>
      this.watchMutation(options);
}

class Mutation$UpdateCard$HookResult {
  Mutation$UpdateCard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateCard runMutation;

  final graphql.QueryResult<Mutation$UpdateCard> result;
}

Mutation$UpdateCard$HookResult useMutation$UpdateCard(
    [WidgetOptions$Mutation$UpdateCard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateCard());
  return Mutation$UpdateCard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateCard> useWatchMutation$UpdateCard(
        WatchOptions$Mutation$UpdateCard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateCard
    extends graphql.MutationOptions<Mutation$UpdateCard> {
  WidgetOptions$Mutation$UpdateCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateCard>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateCard,
          parserFn: _parserFn$Mutation$UpdateCard,
        );

  final OnMutationCompleted$Mutation$UpdateCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateCard
    = graphql.MultiSourceResult<Mutation$UpdateCard> Function(
  Variables$Mutation$UpdateCard, {
  Object? optimisticResult,
  Mutation$UpdateCard? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateCard = widgets.Widget Function(
  RunMutation$Mutation$UpdateCard,
  graphql.QueryResult<Mutation$UpdateCard>?,
);

class Mutation$UpdateCard$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateCard> {
  Mutation$UpdateCard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateCard? options,
    required Builder$Mutation$UpdateCard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateCard(),
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
