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

class Variables$Mutation$GetCard {
  factory Variables$Mutation$GetCard({required String idCard}) =>
      Variables$Mutation$GetCard._({
        r'idCard': idCard,
      });

  Variables$Mutation$GetCard._(this._$data);

  factory Variables$Mutation$GetCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idCard = data['idCard'];
    result$data['idCard'] = (l$idCard as String);
    return Variables$Mutation$GetCard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idCard => (_$data['idCard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idCard = idCard;
    result$data['idCard'] = l$idCard;
    return result$data;
  }

  CopyWith$Variables$Mutation$GetCard<Variables$Mutation$GetCard>
      get copyWith => CopyWith$Variables$Mutation$GetCard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$GetCard) ||
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

abstract class CopyWith$Variables$Mutation$GetCard<TRes> {
  factory CopyWith$Variables$Mutation$GetCard(
    Variables$Mutation$GetCard instance,
    TRes Function(Variables$Mutation$GetCard) then,
  ) = _CopyWithImpl$Variables$Mutation$GetCard;

  factory CopyWith$Variables$Mutation$GetCard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$GetCard;

  TRes call({String? idCard});
}

class _CopyWithImpl$Variables$Mutation$GetCard<TRes>
    implements CopyWith$Variables$Mutation$GetCard<TRes> {
  _CopyWithImpl$Variables$Mutation$GetCard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$GetCard _instance;

  final TRes Function(Variables$Mutation$GetCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idCard = _undefined}) =>
      _then(Variables$Mutation$GetCard._({
        ..._instance._$data,
        if (idCard != _undefined && idCard != null)
          'idCard': (idCard as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$GetCard<TRes>
    implements CopyWith$Variables$Mutation$GetCard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$GetCard(this._res);

  TRes _res;

  call({String? idCard}) => _res;
}

class Mutation$GetCard {
  Mutation$GetCard({
    this.getCard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$GetCard.fromJson(Map<String, dynamic> json) {
    final l$getCard = json['getCard'];
    final l$$__typename = json['__typename'];
    return Mutation$GetCard(
      getCard: l$getCard == null
          ? null
          : Fragment$CardFragment.fromJson((l$getCard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CardFragment? getCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getCard = getCard;
    _resultData['getCard'] = l$getCard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getCard = getCard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getCard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$GetCard) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getCard = getCard;
    final lOther$getCard = other.getCard;
    if (l$getCard != lOther$getCard) {
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

extension UtilityExtension$Mutation$GetCard on Mutation$GetCard {
  CopyWith$Mutation$GetCard<Mutation$GetCard> get copyWith =>
      CopyWith$Mutation$GetCard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$GetCard<TRes> {
  factory CopyWith$Mutation$GetCard(
    Mutation$GetCard instance,
    TRes Function(Mutation$GetCard) then,
  ) = _CopyWithImpl$Mutation$GetCard;

  factory CopyWith$Mutation$GetCard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$GetCard;

  TRes call({
    Fragment$CardFragment? getCard,
    String? $__typename,
  });
  CopyWith$Fragment$CardFragment<TRes> get getCard;
}

class _CopyWithImpl$Mutation$GetCard<TRes>
    implements CopyWith$Mutation$GetCard<TRes> {
  _CopyWithImpl$Mutation$GetCard(
    this._instance,
    this._then,
  );

  final Mutation$GetCard _instance;

  final TRes Function(Mutation$GetCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getCard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$GetCard(
        getCard: getCard == _undefined
            ? _instance.getCard
            : (getCard as Fragment$CardFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$CardFragment<TRes> get getCard {
    final local$getCard = _instance.getCard;
    return local$getCard == null
        ? CopyWith$Fragment$CardFragment.stub(_then(_instance))
        : CopyWith$Fragment$CardFragment(
            local$getCard, (e) => call(getCard: e));
  }
}

class _CopyWithStubImpl$Mutation$GetCard<TRes>
    implements CopyWith$Mutation$GetCard<TRes> {
  _CopyWithStubImpl$Mutation$GetCard(this._res);

  TRes _res;

  call({
    Fragment$CardFragment? getCard,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$CardFragment<TRes> get getCard =>
      CopyWith$Fragment$CardFragment.stub(_res);
}

const documentNodeMutationGetCard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'GetCard'),
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
        name: NameNode(value: 'getCard'),
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
Mutation$GetCard _parserFn$Mutation$GetCard(Map<String, dynamic> data) =>
    Mutation$GetCard.fromJson(data);
typedef OnMutationCompleted$Mutation$GetCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$GetCard?,
);

class Options$Mutation$GetCard
    extends graphql.MutationOptions<Mutation$GetCard> {
  Options$Mutation$GetCard({
    String? operationName,
    required Variables$Mutation$GetCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$GetCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$GetCard>? update,
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
                    data == null ? null : _parserFn$Mutation$GetCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationGetCard,
          parserFn: _parserFn$Mutation$GetCard,
        );

  final OnMutationCompleted$Mutation$GetCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$GetCard
    extends graphql.WatchQueryOptions<Mutation$GetCard> {
  WatchOptions$Mutation$GetCard({
    String? operationName,
    required Variables$Mutation$GetCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetCard? typedOptimisticResult,
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
          document: documentNodeMutationGetCard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$GetCard,
        );
}

extension ClientExtension$Mutation$GetCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$GetCard>> mutate$GetCard(
          Options$Mutation$GetCard options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$GetCard> watchMutation$GetCard(
          WatchOptions$Mutation$GetCard options) =>
      this.watchMutation(options);
}

class Mutation$GetCard$HookResult {
  Mutation$GetCard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$GetCard runMutation;

  final graphql.QueryResult<Mutation$GetCard> result;
}

Mutation$GetCard$HookResult useMutation$GetCard(
    [WidgetOptions$Mutation$GetCard? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$GetCard());
  return Mutation$GetCard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$GetCard> useWatchMutation$GetCard(
        WatchOptions$Mutation$GetCard options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$GetCard
    extends graphql.MutationOptions<Mutation$GetCard> {
  WidgetOptions$Mutation$GetCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$GetCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$GetCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$GetCard>? update,
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
                    data == null ? null : _parserFn$Mutation$GetCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationGetCard,
          parserFn: _parserFn$Mutation$GetCard,
        );

  final OnMutationCompleted$Mutation$GetCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$GetCard
    = graphql.MultiSourceResult<Mutation$GetCard> Function(
  Variables$Mutation$GetCard, {
  Object? optimisticResult,
  Mutation$GetCard? typedOptimisticResult,
});
typedef Builder$Mutation$GetCard = widgets.Widget Function(
  RunMutation$Mutation$GetCard,
  graphql.QueryResult<Mutation$GetCard>?,
);

class Mutation$GetCard$Widget
    extends graphql_flutter.Mutation<Mutation$GetCard> {
  Mutation$GetCard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$GetCard? options,
    required Builder$Mutation$GetCard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$GetCard(),
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
