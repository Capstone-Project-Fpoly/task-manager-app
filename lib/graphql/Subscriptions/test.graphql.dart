import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Subscription$TestSub {
  factory Variables$Subscription$TestSub({required String id}) =>
      Variables$Subscription$TestSub._({
        r'id': id,
      });

  Variables$Subscription$TestSub._(this._$data);

  factory Variables$Subscription$TestSub.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Subscription$TestSub._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Subscription$TestSub<Variables$Subscription$TestSub>
      get copyWith => CopyWith$Variables$Subscription$TestSub(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$TestSub) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Subscription$TestSub<TRes> {
  factory CopyWith$Variables$Subscription$TestSub(
    Variables$Subscription$TestSub instance,
    TRes Function(Variables$Subscription$TestSub) then,
  ) = _CopyWithImpl$Variables$Subscription$TestSub;

  factory CopyWith$Variables$Subscription$TestSub.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$TestSub;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Subscription$TestSub<TRes>
    implements CopyWith$Variables$Subscription$TestSub<TRes> {
  _CopyWithImpl$Variables$Subscription$TestSub(
    this._instance,
    this._then,
  );

  final Variables$Subscription$TestSub _instance;

  final TRes Function(Variables$Subscription$TestSub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Subscription$TestSub._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$TestSub<TRes>
    implements CopyWith$Variables$Subscription$TestSub<TRes> {
  _CopyWithStubImpl$Variables$Subscription$TestSub(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Subscription$TestSub {
  Subscription$TestSub({this.test});

  factory Subscription$TestSub.fromJson(Map<String, dynamic> json) {
    final l$test = json['test'];
    return Subscription$TestSub(test: (l$test as String?));
  }

  final String? test;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$test = test;
    _resultData['test'] = l$test;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$test = test;
    return Object.hashAll([l$test]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$TestSub) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$test = test;
    final lOther$test = other.test;
    if (l$test != lOther$test) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$TestSub on Subscription$TestSub {
  CopyWith$Subscription$TestSub<Subscription$TestSub> get copyWith =>
      CopyWith$Subscription$TestSub(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$TestSub<TRes> {
  factory CopyWith$Subscription$TestSub(
    Subscription$TestSub instance,
    TRes Function(Subscription$TestSub) then,
  ) = _CopyWithImpl$Subscription$TestSub;

  factory CopyWith$Subscription$TestSub.stub(TRes res) =
      _CopyWithStubImpl$Subscription$TestSub;

  TRes call({String? test});
}

class _CopyWithImpl$Subscription$TestSub<TRes>
    implements CopyWith$Subscription$TestSub<TRes> {
  _CopyWithImpl$Subscription$TestSub(
    this._instance,
    this._then,
  );

  final Subscription$TestSub _instance;

  final TRes Function(Subscription$TestSub) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? test = _undefined}) => _then(Subscription$TestSub(
      test: test == _undefined ? _instance.test : (test as String?)));
}

class _CopyWithStubImpl$Subscription$TestSub<TRes>
    implements CopyWith$Subscription$TestSub<TRes> {
  _CopyWithStubImpl$Subscription$TestSub(this._res);

  TRes _res;

  call({String? test}) => _res;
}

const documentNodeSubscriptionTestSub = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'TestSub'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'test'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  ),
]);
Subscription$TestSub _parserFn$Subscription$TestSub(
        Map<String, dynamic> data) =>
    Subscription$TestSub.fromJson(data);

class Options$Subscription$TestSub
    extends graphql.SubscriptionOptions<Subscription$TestSub> {
  Options$Subscription$TestSub({
    String? operationName,
    required Variables$Subscription$TestSub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$TestSub? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionTestSub,
          parserFn: _parserFn$Subscription$TestSub,
        );
}

class WatchOptions$Subscription$TestSub
    extends graphql.WatchQueryOptions<Subscription$TestSub> {
  WatchOptions$Subscription$TestSub({
    String? operationName,
    required Variables$Subscription$TestSub variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$TestSub? typedOptimisticResult,
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
          document: documentNodeSubscriptionTestSub,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$TestSub,
        );
}

class FetchMoreOptions$Subscription$TestSub extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$TestSub({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$TestSub variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionTestSub,
        );
}

extension ClientExtension$Subscription$TestSub on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$TestSub>> subscribe$TestSub(
          Options$Subscription$TestSub options) =>
      this.subscribe(options);
  graphql.ObservableQuery<Subscription$TestSub> watchSubscription$TestSub(
          WatchOptions$Subscription$TestSub options) =>
      this.watchQuery(options);
}

graphql.QueryResult<Subscription$TestSub> useSubscription$TestSub(
        Options$Subscription$TestSub options) =>
    graphql_flutter.useSubscription(options);

class Subscription$TestSub$Widget
    extends graphql_flutter.Subscription<Subscription$TestSub> {
  Subscription$TestSub$Widget({
    widgets.Key? key,
    required Options$Subscription$TestSub options,
    required graphql_flutter.SubscriptionBuilder<Subscription$TestSub> builder,
    graphql_flutter.OnSubscriptionResult<Subscription$TestSub>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}
