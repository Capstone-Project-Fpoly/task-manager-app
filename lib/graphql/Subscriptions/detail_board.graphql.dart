import '../Fragment/card_fragment.graphql.dart';
import '../Fragment/check_list_fragment.graphql.dart';
import '../Fragment/comment_fragment.graphql.dart';
import '../Fragment/label_fragment.graphql.dart';
import '../Fragment/list_fragment.graphql.dart';
import '../Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Subscription$DetailBoard {
  factory Variables$Subscription$DetailBoard({required String idBoard}) =>
      Variables$Subscription$DetailBoard._({
        r'idBoard': idBoard,
      });

  Variables$Subscription$DetailBoard._(this._$data);

  factory Variables$Subscription$DetailBoard.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    return Variables$Subscription$DetailBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    return result$data;
  }

  CopyWith$Variables$Subscription$DetailBoard<
          Variables$Subscription$DetailBoard>
      get copyWith => CopyWith$Variables$Subscription$DetailBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$DetailBoard) ||
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

abstract class CopyWith$Variables$Subscription$DetailBoard<TRes> {
  factory CopyWith$Variables$Subscription$DetailBoard(
    Variables$Subscription$DetailBoard instance,
    TRes Function(Variables$Subscription$DetailBoard) then,
  ) = _CopyWithImpl$Variables$Subscription$DetailBoard;

  factory CopyWith$Variables$Subscription$DetailBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$DetailBoard;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Subscription$DetailBoard<TRes>
    implements CopyWith$Variables$Subscription$DetailBoard<TRes> {
  _CopyWithImpl$Variables$Subscription$DetailBoard(
    this._instance,
    this._then,
  );

  final Variables$Subscription$DetailBoard _instance;

  final TRes Function(Variables$Subscription$DetailBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Subscription$DetailBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$DetailBoard<TRes>
    implements CopyWith$Variables$Subscription$DetailBoard<TRes> {
  _CopyWithStubImpl$Variables$Subscription$DetailBoard(this._res);

  TRes _res;

  call({String? idBoard}) => _res;
}

class Subscription$DetailBoard {
  Subscription$DetailBoard({this.detailBoard});

  factory Subscription$DetailBoard.fromJson(Map<String, dynamic> json) {
    final l$detailBoard = json['detailBoard'];
    return Subscription$DetailBoard(
        detailBoard: (l$detailBoard as List<dynamic>?)
            ?.map((e) => e == null
                ? null
                : Fragment$ListFragment.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  final List<Fragment$ListFragment?>? detailBoard;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$detailBoard = detailBoard;
    _resultData['detailBoard'] =
        l$detailBoard?.map((e) => e?.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$detailBoard = detailBoard;
    return Object.hashAll([
      l$detailBoard == null ? null : Object.hashAll(l$detailBoard.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$DetailBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$detailBoard = detailBoard;
    final lOther$detailBoard = other.detailBoard;
    if (l$detailBoard != null && lOther$detailBoard != null) {
      if (l$detailBoard.length != lOther$detailBoard.length) {
        return false;
      }
      for (int i = 0; i < l$detailBoard.length; i++) {
        final l$detailBoard$entry = l$detailBoard[i];
        final lOther$detailBoard$entry = lOther$detailBoard[i];
        if (l$detailBoard$entry != lOther$detailBoard$entry) {
          return false;
        }
      }
    } else if (l$detailBoard != lOther$detailBoard) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$DetailBoard
    on Subscription$DetailBoard {
  CopyWith$Subscription$DetailBoard<Subscription$DetailBoard> get copyWith =>
      CopyWith$Subscription$DetailBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$DetailBoard<TRes> {
  factory CopyWith$Subscription$DetailBoard(
    Subscription$DetailBoard instance,
    TRes Function(Subscription$DetailBoard) then,
  ) = _CopyWithImpl$Subscription$DetailBoard;

  factory CopyWith$Subscription$DetailBoard.stub(TRes res) =
      _CopyWithStubImpl$Subscription$DetailBoard;

  TRes call({List<Fragment$ListFragment?>? detailBoard});
  TRes detailBoard(
      Iterable<Fragment$ListFragment?>? Function(
              Iterable<CopyWith$Fragment$ListFragment<Fragment$ListFragment>?>?)
          _fn);
}

class _CopyWithImpl$Subscription$DetailBoard<TRes>
    implements CopyWith$Subscription$DetailBoard<TRes> {
  _CopyWithImpl$Subscription$DetailBoard(
    this._instance,
    this._then,
  );

  final Subscription$DetailBoard _instance;

  final TRes Function(Subscription$DetailBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? detailBoard = _undefined}) =>
      _then(Subscription$DetailBoard(
          detailBoard: detailBoard == _undefined
              ? _instance.detailBoard
              : (detailBoard as List<Fragment$ListFragment?>?)));

  TRes detailBoard(
          Iterable<Fragment$ListFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$ListFragment<Fragment$ListFragment>?>?)
              _fn) =>
      call(
          detailBoard: _fn(_instance.detailBoard?.map((e) => e == null
              ? null
              : CopyWith$Fragment$ListFragment(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Subscription$DetailBoard<TRes>
    implements CopyWith$Subscription$DetailBoard<TRes> {
  _CopyWithStubImpl$Subscription$DetailBoard(this._res);

  TRes _res;

  call({List<Fragment$ListFragment?>? detailBoard}) => _res;

  detailBoard(_fn) => _res;
}

const documentNodeSubscriptionDetailBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'DetailBoard'),
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
        name: NameNode(value: 'detailBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ListFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  fragmentDefinitionListFragment,
  fragmentDefinitionCardFragment,
  fragmentDefinitionUserFragment,
  fragmentDefinitionCommentFragment,
  fragmentDefinitionLabelFragment,
  fragmentDefinitionCheckListFragment,
]);
Subscription$DetailBoard _parserFn$Subscription$DetailBoard(
        Map<String, dynamic> data) =>
    Subscription$DetailBoard.fromJson(data);

class Options$Subscription$DetailBoard
    extends graphql.SubscriptionOptions<Subscription$DetailBoard> {
  Options$Subscription$DetailBoard({
    String? operationName,
    required Variables$Subscription$DetailBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$DetailBoard? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionDetailBoard,
          parserFn: _parserFn$Subscription$DetailBoard,
        );
}

class WatchOptions$Subscription$DetailBoard
    extends graphql.WatchQueryOptions<Subscription$DetailBoard> {
  WatchOptions$Subscription$DetailBoard({
    String? operationName,
    required Variables$Subscription$DetailBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$DetailBoard? typedOptimisticResult,
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
          document: documentNodeSubscriptionDetailBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$DetailBoard,
        );
}

class FetchMoreOptions$Subscription$DetailBoard
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$DetailBoard({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$DetailBoard variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionDetailBoard,
        );
}

extension ClientExtension$Subscription$DetailBoard on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$DetailBoard>> subscribe$DetailBoard(
          Options$Subscription$DetailBoard options) =>
      this.subscribe(options);
  graphql.ObservableQuery<Subscription$DetailBoard>
      watchSubscription$DetailBoard(
              WatchOptions$Subscription$DetailBoard options) =>
          this.watchQuery(options);
}

graphql.QueryResult<Subscription$DetailBoard> useSubscription$DetailBoard(
        Options$Subscription$DetailBoard options) =>
    graphql_flutter.useSubscription(options);

class Subscription$DetailBoard$Widget
    extends graphql_flutter.Subscription<Subscription$DetailBoard> {
  Subscription$DetailBoard$Widget({
    widgets.Key? key,
    required Options$Subscription$DetailBoard options,
    required graphql_flutter.SubscriptionBuilder<Subscription$DetailBoard>
        builder,
    graphql_flutter.OnSubscriptionResult<Subscription$DetailBoard>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}
