import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Subscription$Test {
  factory Variables$Subscription$Test({required String id}) =>
      Variables$Subscription$Test._({
        r'id': id,
      });

  Variables$Subscription$Test._(this._$data);

  factory Variables$Subscription$Test.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Subscription$Test._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Subscription$Test<Variables$Subscription$Test>
      get copyWith => CopyWith$Variables$Subscription$Test(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$Test ||
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

abstract class CopyWith$Variables$Subscription$Test<TRes> {
  factory CopyWith$Variables$Subscription$Test(
    Variables$Subscription$Test instance,
    TRes Function(Variables$Subscription$Test) then,
  ) = _CopyWithImpl$Variables$Subscription$Test;

  factory CopyWith$Variables$Subscription$Test.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$Test;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Subscription$Test<TRes>
    implements CopyWith$Variables$Subscription$Test<TRes> {
  _CopyWithImpl$Variables$Subscription$Test(
    this._instance,
    this._then,
  );

  final Variables$Subscription$Test _instance;

  final TRes Function(Variables$Subscription$Test) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? id = _undefined}) => _then(
        Variables$Subscription$Test._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Subscription$Test<TRes>
    implements CopyWith$Variables$Subscription$Test<TRes> {
  _CopyWithStubImpl$Variables$Subscription$Test(this._res);

  final TRes _res;

  @override
  call({String? id}) => _res;
}

class Subscription$Test {
  Subscription$Test({
    this.test,
    this.$__typename = 'Subscription',
  });

  factory Subscription$Test.fromJson(Map<String, dynamic> json) {
    final l$test = json['test'];
    final l$$__typename = json['__typename'];
    return Subscription$Test(
      test: (l$test as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? test;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$test = test;
    resultData['test'] = l$test;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$test = test;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$test,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$Test || runtimeType != other.runtimeType) {
      return false;
    }
    final l$test = test;
    final lOther$test = other.test;
    if (l$test != lOther$test) {
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

extension UtilityExtension$Subscription$Test on Subscription$Test {
  CopyWith$Subscription$Test<Subscription$Test> get copyWith =>
      CopyWith$Subscription$Test(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$Test<TRes> {
  factory CopyWith$Subscription$Test(
    Subscription$Test instance,
    TRes Function(Subscription$Test) then,
  ) = _CopyWithImpl$Subscription$Test;

  factory CopyWith$Subscription$Test.stub(TRes res) =
      _CopyWithStubImpl$Subscription$Test;

  TRes call({
    String? test,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$Test<TRes>
    implements CopyWith$Subscription$Test<TRes> {
  _CopyWithImpl$Subscription$Test(
    this._instance,
    this._then,
  );

  final Subscription$Test _instance;

  final TRes Function(Subscription$Test) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? test = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
        Subscription$Test(
          test: test == _undefined ? _instance.test : (test as String?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Subscription$Test<TRes>
    implements CopyWith$Subscription$Test<TRes> {
  _CopyWithStubImpl$Subscription$Test(this._res);

  final TRes _res;

  @override
  call({
    String? test,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeSubscriptionTest = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'Test'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
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
            name: NameNode(value: 'test'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
Subscription$Test _parserFn$Subscription$Test(Map<String, dynamic> data) =>
    Subscription$Test.fromJson(data);

class Options$Subscription$Test
    extends graphql.SubscriptionOptions<Subscription$Test> {
  Options$Subscription$Test({
    String? operationName,
    required Variables$Subscription$Test variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$Test? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionTest,
          parserFn: _parserFn$Subscription$Test,
        );
}

class WatchOptions$Subscription$Test
    extends graphql.WatchQueryOptions<Subscription$Test> {
  WatchOptions$Subscription$Test({
    String? operationName,
    required Variables$Subscription$Test variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$Test? typedOptimisticResult,
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
          document: documentNodeSubscriptionTest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$Test,
        );
}

class FetchMoreOptions$Subscription$Test extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$Test({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$Test variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionTest,
        );
}

extension ClientExtension$Subscription$Test on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$Test>> subscribe$Test(
    Options$Subscription$Test options,
  ) =>
      subscribe(options);
  graphql.ObservableQuery<Subscription$Test> watchSubscription$Test(
    WatchOptions$Subscription$Test options,
  ) =>
      watchQuery(options);
}

graphql.QueryResult<Subscription$Test> useSubscription$Test(
  Options$Subscription$Test options,
) =>
    graphql_flutter.useSubscription(options);

class Subscription$Test$Widget
    extends graphql_flutter.Subscription<Subscription$Test> {
  const Subscription$Test$Widget({
    widgets.Key? key,
    required Options$Subscription$Test options,
    required graphql_flutter.SubscriptionBuilder<Subscription$Test> builder,
    graphql_flutter.OnSubscriptionResult<Subscription$Test>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}
