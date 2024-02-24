import 'package:task_manager/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$LoginByGoogle {
  factory Variables$Mutation$LoginByGoogle({required Input$InputLogin input}) =>
      Variables$Mutation$LoginByGoogle._({
        r'input': input,
      });

  Variables$Mutation$LoginByGoogle._(this._$data);

  factory Variables$Mutation$LoginByGoogle.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$InputLogin.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$LoginByGoogle._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$InputLogin get input => (_$data['input'] as Input$InputLogin);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$LoginByGoogle<Variables$Mutation$LoginByGoogle>
      get copyWith => CopyWith$Variables$Mutation$LoginByGoogle(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$LoginByGoogle ||
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

abstract class CopyWith$Variables$Mutation$LoginByGoogle<TRes> {
  factory CopyWith$Variables$Mutation$LoginByGoogle(
    Variables$Mutation$LoginByGoogle instance,
    TRes Function(Variables$Mutation$LoginByGoogle) then,
  ) = _CopyWithImpl$Variables$Mutation$LoginByGoogle;

  factory CopyWith$Variables$Mutation$LoginByGoogle.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$LoginByGoogle;

  TRes call({Input$InputLogin? input});
}

class _CopyWithImpl$Variables$Mutation$LoginByGoogle<TRes>
    implements CopyWith$Variables$Mutation$LoginByGoogle<TRes> {
  _CopyWithImpl$Variables$Mutation$LoginByGoogle(
    this._instance,
    this._then,
  );

  final Variables$Mutation$LoginByGoogle _instance;

  final TRes Function(Variables$Mutation$LoginByGoogle) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$LoginByGoogle._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$InputLogin),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$LoginByGoogle<TRes>
    implements CopyWith$Variables$Mutation$LoginByGoogle<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LoginByGoogle(this._res);

  final TRes _res;

  @override
  call({Input$InputLogin? input}) => _res;
}

class Mutation$LoginByGoogle {
  Mutation$LoginByGoogle({
    this.loginByGoogle,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LoginByGoogle.fromJson(Map<String, dynamic> json) {
    final l$loginByGoogle = json['loginByGoogle'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginByGoogle(
      loginByGoogle: (l$loginByGoogle as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? loginByGoogle;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$loginByGoogle = loginByGoogle;
    resultData['loginByGoogle'] = l$loginByGoogle;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$loginByGoogle = loginByGoogle;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$loginByGoogle,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginByGoogle ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$loginByGoogle = loginByGoogle;
    final lOther$loginByGoogle = other.loginByGoogle;
    if (l$loginByGoogle != lOther$loginByGoogle) {
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

extension UtilityExtension$Mutation$LoginByGoogle on Mutation$LoginByGoogle {
  CopyWith$Mutation$LoginByGoogle<Mutation$LoginByGoogle> get copyWith =>
      CopyWith$Mutation$LoginByGoogle(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$LoginByGoogle<TRes> {
  factory CopyWith$Mutation$LoginByGoogle(
    Mutation$LoginByGoogle instance,
    TRes Function(Mutation$LoginByGoogle) then,
  ) = _CopyWithImpl$Mutation$LoginByGoogle;

  factory CopyWith$Mutation$LoginByGoogle.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginByGoogle;

  TRes call({
    String? loginByGoogle,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LoginByGoogle<TRes>
    implements CopyWith$Mutation$LoginByGoogle<TRes> {
  _CopyWithImpl$Mutation$LoginByGoogle(
    this._instance,
    this._then,
  );

  final Mutation$LoginByGoogle _instance;

  final TRes Function(Mutation$LoginByGoogle) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? loginByGoogle = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginByGoogle(
        loginByGoogle: loginByGoogle == _undefined
            ? _instance.loginByGoogle
            : (loginByGoogle as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$LoginByGoogle<TRes>
    implements CopyWith$Mutation$LoginByGoogle<TRes> {
  _CopyWithStubImpl$Mutation$LoginByGoogle(this._res);

  final TRes _res;

  @override
  call({
    String? loginByGoogle,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationLoginByGoogle = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LoginByGoogle'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'InputLogin'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'loginByGoogle'),
        alias: null,
        arguments: [
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
    ],),
  ),
],);
Mutation$LoginByGoogle _parserFn$Mutation$LoginByGoogle(
        Map<String, dynamic> data,) =>
    Mutation$LoginByGoogle.fromJson(data);
typedef OnMutationCompleted$Mutation$LoginByGoogle = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$LoginByGoogle?,
);

class Options$Mutation$LoginByGoogle
    extends graphql.MutationOptions<Mutation$LoginByGoogle> {
  Options$Mutation$LoginByGoogle({
    String? operationName,
    required Variables$Mutation$LoginByGoogle variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginByGoogle? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginByGoogle? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginByGoogle>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$LoginByGoogle(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginByGoogle,
          parserFn: _parserFn$Mutation$LoginByGoogle,
        );

  final OnMutationCompleted$Mutation$LoginByGoogle? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LoginByGoogle
    extends graphql.WatchQueryOptions<Mutation$LoginByGoogle> {
  WatchOptions$Mutation$LoginByGoogle({
    String? operationName,
    required Variables$Mutation$LoginByGoogle variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginByGoogle? typedOptimisticResult,
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
          document: documentNodeMutationLoginByGoogle,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$LoginByGoogle,
        );
}

extension ClientExtension$Mutation$LoginByGoogle on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LoginByGoogle>> mutate$LoginByGoogle(
          Options$Mutation$LoginByGoogle options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$LoginByGoogle> watchMutation$LoginByGoogle(
          WatchOptions$Mutation$LoginByGoogle options,) =>
      watchMutation(options);
}

class Mutation$LoginByGoogle$HookResult {
  Mutation$LoginByGoogle$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LoginByGoogle runMutation;

  final graphql.QueryResult<Mutation$LoginByGoogle> result;
}

Mutation$LoginByGoogle$HookResult useMutation$LoginByGoogle(
    [WidgetOptions$Mutation$LoginByGoogle? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LoginByGoogle());
  return Mutation$LoginByGoogle$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LoginByGoogle> useWatchMutation$LoginByGoogle(
        WatchOptions$Mutation$LoginByGoogle options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$LoginByGoogle
    extends graphql.MutationOptions<Mutation$LoginByGoogle> {
  WidgetOptions$Mutation$LoginByGoogle({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginByGoogle? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginByGoogle? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginByGoogle>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$LoginByGoogle(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginByGoogle,
          parserFn: _parserFn$Mutation$LoginByGoogle,
        );

  final OnMutationCompleted$Mutation$LoginByGoogle? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LoginByGoogle
    = graphql.MultiSourceResult<Mutation$LoginByGoogle> Function(
  Variables$Mutation$LoginByGoogle, {
  Object? optimisticResult,
  Mutation$LoginByGoogle? typedOptimisticResult,
});
typedef Builder$Mutation$LoginByGoogle = widgets.Widget Function(
  RunMutation$Mutation$LoginByGoogle,
  graphql.QueryResult<Mutation$LoginByGoogle>?,
);

class Mutation$LoginByGoogle$Widget
    extends graphql_flutter.Mutation<Mutation$LoginByGoogle> {
  Mutation$LoginByGoogle$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$LoginByGoogle? options,
    required Builder$Mutation$LoginByGoogle builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$LoginByGoogle(),
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
