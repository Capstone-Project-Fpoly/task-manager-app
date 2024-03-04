import 'package:task_manager/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$LoginByEmail {
  factory Variables$Mutation$LoginByEmail({required Input$InputLogin input}) =>
      Variables$Mutation$LoginByEmail._({
        r'input': input,
      });

  Variables$Mutation$LoginByEmail._(this._$data);

  factory Variables$Mutation$LoginByEmail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$InputLogin.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$LoginByEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$InputLogin get input => (_$data['input'] as Input$InputLogin);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$LoginByEmail<Variables$Mutation$LoginByEmail>
      get copyWith => CopyWith$Variables$Mutation$LoginByEmail(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$LoginByEmail ||
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

abstract class CopyWith$Variables$Mutation$LoginByEmail<TRes> {
  factory CopyWith$Variables$Mutation$LoginByEmail(
    Variables$Mutation$LoginByEmail instance,
    TRes Function(Variables$Mutation$LoginByEmail) then,
  ) = _CopyWithImpl$Variables$Mutation$LoginByEmail;

  factory CopyWith$Variables$Mutation$LoginByEmail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$LoginByEmail;

  TRes call({Input$InputLogin? input});
}

class _CopyWithImpl$Variables$Mutation$LoginByEmail<TRes>
    implements CopyWith$Variables$Mutation$LoginByEmail<TRes> {
  _CopyWithImpl$Variables$Mutation$LoginByEmail(
    this._instance,
    this._then,
  );

  final Variables$Mutation$LoginByEmail _instance;

  final TRes Function(Variables$Mutation$LoginByEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$LoginByEmail._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$InputLogin),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$LoginByEmail<TRes>
    implements CopyWith$Variables$Mutation$LoginByEmail<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LoginByEmail(this._res);

  final TRes _res;

  @override
  call({Input$InputLogin? input}) => _res;
}

class Mutation$LoginByEmail {
  Mutation$LoginByEmail({
    this.loginByEmail,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LoginByEmail.fromJson(Map<String, dynamic> json) {
    final l$loginByEmail = json['loginByEmail'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginByEmail(
      loginByEmail: (l$loginByEmail as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? loginByEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$loginByEmail = loginByEmail;
    resultData['loginByEmail'] = l$loginByEmail;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$loginByEmail = loginByEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$loginByEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginByEmail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$loginByEmail = loginByEmail;
    final lOther$loginByEmail = other.loginByEmail;
    if (l$loginByEmail != lOther$loginByEmail) {
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

extension UtilityExtension$Mutation$LoginByEmail on Mutation$LoginByEmail {
  CopyWith$Mutation$LoginByEmail<Mutation$LoginByEmail> get copyWith =>
      CopyWith$Mutation$LoginByEmail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$LoginByEmail<TRes> {
  factory CopyWith$Mutation$LoginByEmail(
    Mutation$LoginByEmail instance,
    TRes Function(Mutation$LoginByEmail) then,
  ) = _CopyWithImpl$Mutation$LoginByEmail;

  factory CopyWith$Mutation$LoginByEmail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginByEmail;

  TRes call({
    String? loginByEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LoginByEmail<TRes>
    implements CopyWith$Mutation$LoginByEmail<TRes> {
  _CopyWithImpl$Mutation$LoginByEmail(
    this._instance,
    this._then,
  );

  final Mutation$LoginByEmail _instance;

  final TRes Function(Mutation$LoginByEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? loginByEmail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginByEmail(
        loginByEmail: loginByEmail == _undefined
            ? _instance.loginByEmail
            : (loginByEmail as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$LoginByEmail<TRes>
    implements CopyWith$Mutation$LoginByEmail<TRes> {
  _CopyWithStubImpl$Mutation$LoginByEmail(this._res);

  final TRes _res;

  @override
  call({
    String? loginByEmail,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationLoginByEmail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LoginByEmail'),
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
        name: NameNode(value: 'loginByEmail'),
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
Mutation$LoginByEmail _parserFn$Mutation$LoginByEmail(
        Map<String, dynamic> data,) =>
    Mutation$LoginByEmail.fromJson(data);
typedef OnMutationCompleted$Mutation$LoginByEmail = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$LoginByEmail?,
);

class Options$Mutation$LoginByEmail
    extends graphql.MutationOptions<Mutation$LoginByEmail> {
  Options$Mutation$LoginByEmail({
    String? operationName,
    required Variables$Mutation$LoginByEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginByEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginByEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginByEmail>? update,
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
                    data == null ? null : _parserFn$Mutation$LoginByEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginByEmail,
          parserFn: _parserFn$Mutation$LoginByEmail,
        );

  final OnMutationCompleted$Mutation$LoginByEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LoginByEmail
    extends graphql.WatchQueryOptions<Mutation$LoginByEmail> {
  WatchOptions$Mutation$LoginByEmail({
    String? operationName,
    required Variables$Mutation$LoginByEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginByEmail? typedOptimisticResult,
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
          document: documentNodeMutationLoginByEmail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$LoginByEmail,
        );
}

extension ClientExtension$Mutation$LoginByEmail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LoginByEmail>> mutate$LoginByEmail(
          Options$Mutation$LoginByEmail options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$LoginByEmail> watchMutation$LoginByEmail(
          WatchOptions$Mutation$LoginByEmail options,) =>
      watchMutation(options);
}

class Mutation$LoginByEmail$HookResult {
  Mutation$LoginByEmail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LoginByEmail runMutation;

  final graphql.QueryResult<Mutation$LoginByEmail> result;
}

Mutation$LoginByEmail$HookResult useMutation$LoginByEmail(
    [WidgetOptions$Mutation$LoginByEmail? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LoginByEmail());
  return Mutation$LoginByEmail$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LoginByEmail> useWatchMutation$LoginByEmail(
        WatchOptions$Mutation$LoginByEmail options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$LoginByEmail
    extends graphql.MutationOptions<Mutation$LoginByEmail> {
  WidgetOptions$Mutation$LoginByEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginByEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginByEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginByEmail>? update,
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
                    data == null ? null : _parserFn$Mutation$LoginByEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginByEmail,
          parserFn: _parserFn$Mutation$LoginByEmail,
        );

  final OnMutationCompleted$Mutation$LoginByEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LoginByEmail
    = graphql.MultiSourceResult<Mutation$LoginByEmail> Function(
  Variables$Mutation$LoginByEmail, {
  Object? optimisticResult,
  Mutation$LoginByEmail? typedOptimisticResult,
});
typedef Builder$Mutation$LoginByEmail = widgets.Widget Function(
  RunMutation$Mutation$LoginByEmail,
  graphql.QueryResult<Mutation$LoginByEmail>?,
);

class Mutation$LoginByEmail$Widget
    extends graphql_flutter.Mutation<Mutation$LoginByEmail> {
  Mutation$LoginByEmail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$LoginByEmail? options,
    required Builder$Mutation$LoginByEmail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$LoginByEmail(),
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
