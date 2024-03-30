import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Subscription$CheckCloseBoard {
  factory Variables$Subscription$CheckCloseBoard({required String idBoard}) =>
      Variables$Subscription$CheckCloseBoard._({
        r'idBoard': idBoard,
      });

  Variables$Subscription$CheckCloseBoard._(this._$data);

  factory Variables$Subscription$CheckCloseBoard.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Subscription$CheckCloseBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Subscription$CheckCloseBoard<
          Variables$Subscription$CheckCloseBoard>
      get copyWith => CopyWith$Variables$Subscription$CheckCloseBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$CheckCloseBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    return Object.hashAll([l$idBoard]);
  }
}

abstract class CopyWith$Variables$Subscription$CheckCloseBoard<TRes> {
  factory CopyWith$Variables$Subscription$CheckCloseBoard(
    Variables$Subscription$CheckCloseBoard instance,
    TRes Function(Variables$Subscription$CheckCloseBoard) then,
  ) = _CopyWithImpl$Variables$Subscription$CheckCloseBoard;

  factory CopyWith$Variables$Subscription$CheckCloseBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$CheckCloseBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Subscription$CheckCloseBoard<TRes>
    implements CopyWith$Variables$Subscription$CheckCloseBoard<TRes> {
  _CopyWithImpl$Variables$Subscription$CheckCloseBoard(
    this._instance,
    this._then,
  );

  final Variables$Subscription$CheckCloseBoard _instance;

  final TRes Function(Variables$Subscription$CheckCloseBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Subscription$CheckCloseBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$CheckCloseBoard<TRes>
    implements CopyWith$Variables$Subscription$CheckCloseBoard<TRes> {
  _CopyWithStubImpl$Variables$Subscription$CheckCloseBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Subscription$CheckCloseBoard {
  Subscription$CheckCloseBoard({this.checkCloseBoard});

  factory Subscription$CheckCloseBoard.fromJson(Map<String, dynamic> json) {
    final l$checkCloseBoard = json['checkCloseBoard'];
    return Subscription$CheckCloseBoard(
        checkCloseBoard: (l$checkCloseBoard as bool?));
  }

  final bool? checkCloseBoard;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkCloseBoard = checkCloseBoard;
    _resultData['checkCloseBoard'] = l$checkCloseBoard;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkCloseBoard = checkCloseBoard;
    return Object.hashAll([l$checkCloseBoard]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$CheckCloseBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkCloseBoard = checkCloseBoard;
    final lOther$checkCloseBoard = other.checkCloseBoard;
    if (l$checkCloseBoard != lOther$checkCloseBoard) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$CheckCloseBoard
    on Subscription$CheckCloseBoard {
  CopyWith$Subscription$CheckCloseBoard<Subscription$CheckCloseBoard>
      get copyWith => CopyWith$Subscription$CheckCloseBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$CheckCloseBoard<TRes> {
  factory CopyWith$Subscription$CheckCloseBoard(
    Subscription$CheckCloseBoard instance,
    TRes Function(Subscription$CheckCloseBoard) then,
  ) = _CopyWithImpl$Subscription$CheckCloseBoard;

  factory CopyWith$Subscription$CheckCloseBoard.stub(TRes res) =
      _CopyWithStubImpl$Subscription$CheckCloseBoard;

  TRes call({bool? checkCloseBoard});
}

class _CopyWithImpl$Subscription$CheckCloseBoard<TRes>
    implements CopyWith$Subscription$CheckCloseBoard<TRes> {
  _CopyWithImpl$Subscription$CheckCloseBoard(
    this._instance,
    this._then,
  );

  final Subscription$CheckCloseBoard _instance;

  final TRes Function(Subscription$CheckCloseBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? checkCloseBoard = _undefined}) =>
      _then(Subscription$CheckCloseBoard(
          checkCloseBoard: checkCloseBoard == _undefined
              ? _instance.checkCloseBoard
              : (checkCloseBoard as bool?)));
}

class _CopyWithStubImpl$Subscription$CheckCloseBoard<TRes>
    implements CopyWith$Subscription$CheckCloseBoard<TRes> {
  _CopyWithStubImpl$Subscription$CheckCloseBoard(this._res);

  TRes _res;

  call({bool? checkCloseBoard}) => _res;
}

const documentNodeSubscriptionCheckCloseBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'CheckCloseBoard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idBoard')),
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
        name: NameNode(value: 'checkCloseBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  ),
]);
Subscription$CheckCloseBoard _parserFn$Subscription$CheckCloseBoard(
        Map<String, dynamic> data) =>
    Subscription$CheckCloseBoard.fromJson(data);

class Options$Subscription$CheckCloseBoard
    extends graphql.SubscriptionOptions<Subscription$CheckCloseBoard> {
  Options$Subscription$CheckCloseBoard({
    String? operationName,
    required Variables$Subscription$CheckCloseBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$CheckCloseBoard? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionCheckCloseBoard,
          parserFn: _parserFn$Subscription$CheckCloseBoard,
        );
}

class WatchOptions$Subscription$CheckCloseBoard
    extends graphql.WatchQueryOptions<Subscription$CheckCloseBoard> {
  WatchOptions$Subscription$CheckCloseBoard({
    String? operationName,
    required Variables$Subscription$CheckCloseBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$CheckCloseBoard? typedOptimisticResult,
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
          document: documentNodeSubscriptionCheckCloseBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$CheckCloseBoard,
        );
}

class FetchMoreOptions$Subscription$CheckCloseBoard
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$CheckCloseBoard({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$CheckCloseBoard variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionCheckCloseBoard,
        );
}

extension ClientExtension$Subscription$CheckCloseBoard
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$CheckCloseBoard>>
      subscribe$CheckCloseBoard(Options$Subscription$CheckCloseBoard options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$CheckCloseBoard>
      watchSubscription$CheckCloseBoard(
              WatchOptions$Subscription$CheckCloseBoard options) =>
          this.watchQuery(options);
}

graphql.QueryResult<Subscription$CheckCloseBoard>
    useSubscription$CheckCloseBoard(
            Options$Subscription$CheckCloseBoard options) =>
        graphql_flutter.useSubscription(options);

class Subscription$CheckCloseBoard$Widget
    extends graphql_flutter.Subscription<Subscription$CheckCloseBoard> {
  Subscription$CheckCloseBoard$Widget({
    widgets.Key? key,
    required Options$Subscription$CheckCloseBoard options,
    required graphql_flutter.SubscriptionBuilder<Subscription$CheckCloseBoard>
        builder,
    graphql_flutter.OnSubscriptionResult<Subscription$CheckCloseBoard>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}
