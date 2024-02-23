import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/check_list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/comment_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$CreateCard {
  factory Variables$Mutation$CreateCard({
    required String idList,
    required String title,
  }) =>
      Variables$Mutation$CreateCard._({
        r'idList': idList,
        r'title': title,
      });

  Variables$Mutation$CreateCard._(this._$data);

  factory Variables$Mutation$CreateCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idList = data['idList'];
    result$data['idList'] = (l$idList as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return Variables$Mutation$CreateCard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idList => (_$data['idList'] as String);

  String get title => (_$data['title'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idList = idList;
    result$data['idList'] = l$idList;
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateCard<Variables$Mutation$CreateCard>
      get copyWith => CopyWith$Variables$Mutation$CreateCard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateCard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idList = idList;
    final lOther$idList = other.idList;
    if (l$idList != lOther$idList) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idList = idList;
    final l$title = title;
    return Object.hashAll([
      l$idList,
      l$title,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateCard<TRes> {
  factory CopyWith$Variables$Mutation$CreateCard(
    Variables$Mutation$CreateCard instance,
    TRes Function(Variables$Mutation$CreateCard) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateCard;

  factory CopyWith$Variables$Mutation$CreateCard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateCard;

  TRes call({
    String? idList,
    String? title,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateCard<TRes>
    implements CopyWith$Variables$Mutation$CreateCard<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateCard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateCard _instance;

  final TRes Function(Variables$Mutation$CreateCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idList = _undefined,
    Object? title = _undefined,
  }) =>
      _then(Variables$Mutation$CreateCard._({
        ..._instance._$data,
        if (idList != _undefined && idList != null)
          'idList': (idList as String),
        if (title != _undefined && title != null) 'title': (title as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$CreateCard<TRes>
    implements CopyWith$Variables$Mutation$CreateCard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateCard(this._res);

  final TRes _res;

  @override
  call({
    String? idList,
    String? title,
  }) =>
      _res;
}

class Mutation$CreateCard {
  Mutation$CreateCard({
    this.createCard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateCard.fromJson(Map<String, dynamic> json) {
    final l$createCard = json['createCard'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCard(
      createCard: l$createCard == null
          ? null
          : Fragment$CardFragment.fromJson(
              (l$createCard as Map<String, dynamic>),),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CardFragment? createCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$createCard = createCard;
    resultData['createCard'] = l$createCard?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$createCard = createCard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createCard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createCard = createCard;
    final lOther$createCard = other.createCard;
    if (l$createCard != lOther$createCard) {
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

extension UtilityExtension$Mutation$CreateCard on Mutation$CreateCard {
  CopyWith$Mutation$CreateCard<Mutation$CreateCard> get copyWith =>
      CopyWith$Mutation$CreateCard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateCard<TRes> {
  factory CopyWith$Mutation$CreateCard(
    Mutation$CreateCard instance,
    TRes Function(Mutation$CreateCard) then,
  ) = _CopyWithImpl$Mutation$CreateCard;

  factory CopyWith$Mutation$CreateCard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCard;

  TRes call({
    Fragment$CardFragment? createCard,
    String? $__typename,
  });
  CopyWith$Fragment$CardFragment<TRes> get createCard;
}

class _CopyWithImpl$Mutation$CreateCard<TRes>
    implements CopyWith$Mutation$CreateCard<TRes> {
  _CopyWithImpl$Mutation$CreateCard(
    this._instance,
    this._then,
  );

  final Mutation$CreateCard _instance;

  final TRes Function(Mutation$CreateCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? createCard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCard(
        createCard: createCard == _undefined
            ? _instance.createCard
            : (createCard as Fragment$CardFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  CopyWith$Fragment$CardFragment<TRes> get createCard {
    final local$createCard = _instance.createCard;
    return local$createCard == null
        ? CopyWith$Fragment$CardFragment.stub(_then(_instance))
        : CopyWith$Fragment$CardFragment(
            local$createCard, (e) => call(createCard: e),);
  }
}

class _CopyWithStubImpl$Mutation$CreateCard<TRes>
    implements CopyWith$Mutation$CreateCard<TRes> {
  _CopyWithStubImpl$Mutation$CreateCard(this._res);

  final TRes _res;

  @override
  call({
    Fragment$CardFragment? createCard,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Fragment$CardFragment<TRes> get createCard =>
      CopyWith$Fragment$CardFragment.stub(_res);
}

const documentNodeMutationCreateCard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateCard'),
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
        variable: VariableNode(name: NameNode(value: 'title')),
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
        name: NameNode(value: 'createCard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idList'),
            value: VariableNode(name: NameNode(value: 'idList')),
          ),
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
          ),
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
        ],),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],),
  ),
  fragmentDefinitionCardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionCheckListFragment,
],);
Mutation$CreateCard _parserFn$Mutation$CreateCard(Map<String, dynamic> data) =>
    Mutation$CreateCard.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateCard?,
);

class Options$Mutation$CreateCard
    extends graphql.MutationOptions<Mutation$CreateCard> {
  Options$Mutation$CreateCard({
    String? operationName,
    required Variables$Mutation$CreateCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateCard>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateCard,
          parserFn: _parserFn$Mutation$CreateCard,
        );

  final OnMutationCompleted$Mutation$CreateCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateCard
    extends graphql.WatchQueryOptions<Mutation$CreateCard> {
  WatchOptions$Mutation$CreateCard({
    String? operationName,
    required Variables$Mutation$CreateCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCard? typedOptimisticResult,
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
          document: documentNodeMutationCreateCard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateCard,
        );
}

extension ClientExtension$Mutation$CreateCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateCard>> mutate$CreateCard(
          Options$Mutation$CreateCard options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$CreateCard> watchMutation$CreateCard(
          WatchOptions$Mutation$CreateCard options,) =>
      watchMutation(options);
}

class Mutation$CreateCard$HookResult {
  Mutation$CreateCard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateCard runMutation;

  final graphql.QueryResult<Mutation$CreateCard> result;
}

Mutation$CreateCard$HookResult useMutation$CreateCard(
    [WidgetOptions$Mutation$CreateCard? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateCard());
  return Mutation$CreateCard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateCard> useWatchMutation$CreateCard(
        WatchOptions$Mutation$CreateCard options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateCard
    extends graphql.MutationOptions<Mutation$CreateCard> {
  WidgetOptions$Mutation$CreateCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateCard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateCard>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateCard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateCard,
          parserFn: _parserFn$Mutation$CreateCard,
        );

  final OnMutationCompleted$Mutation$CreateCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateCard
    = graphql.MultiSourceResult<Mutation$CreateCard> Function(
  Variables$Mutation$CreateCard, {
  Object? optimisticResult,
  Mutation$CreateCard? typedOptimisticResult,
});
typedef Builder$Mutation$CreateCard = widgets.Widget Function(
  RunMutation$Mutation$CreateCard,
  graphql.QueryResult<Mutation$CreateCard>?,
);

class Mutation$CreateCard$Widget
    extends graphql_flutter.Mutation<Mutation$CreateCard> {
  Mutation$CreateCard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateCard? options,
    required Builder$Mutation$CreateCard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateCard(),
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
