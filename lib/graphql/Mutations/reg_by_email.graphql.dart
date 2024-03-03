import 'package:task_manager/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$regByEmail {
  factory Variables$Mutation$regByEmail({required Input$InputEmail input}) =>
      Variables$Mutation$regByEmail._({
        r'input': input,
      });

  Variables$Mutation$regByEmail._(this._$data);

  factory Variables$Mutation$regByEmail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$InputEmail.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$regByEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$InputEmail get input => (_$data['input'] as Input$InputEmail);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$regByEmail<Variables$Mutation$regByEmail>
      get copyWith => CopyWith$Variables$Mutation$regByEmail(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$regByEmail ||
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

abstract class CopyWith$Variables$Mutation$regByEmail<TRes> {
  factory CopyWith$Variables$Mutation$regByEmail(
    Variables$Mutation$regByEmail instance,
    TRes Function(Variables$Mutation$regByEmail) then,
  ) = _CopyWithImpl$Variables$Mutation$regByEmail;

  factory CopyWith$Variables$Mutation$regByEmail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$regByEmail;

  TRes call({Input$InputEmail? input});
}

class _CopyWithImpl$Variables$Mutation$regByEmail<TRes>
    implements CopyWith$Variables$Mutation$regByEmail<TRes> {
  _CopyWithImpl$Variables$Mutation$regByEmail(
    this._instance,
    this._then,
  );

  final Variables$Mutation$regByEmail _instance;

  final TRes Function(Variables$Mutation$regByEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$regByEmail._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$InputEmail),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$regByEmail<TRes>
    implements CopyWith$Variables$Mutation$regByEmail<TRes> {
  _CopyWithStubImpl$Variables$Mutation$regByEmail(this._res);

  final TRes _res;

  @override
  call({Input$InputEmail? input}) => _res;
}

class Mutation$regByEmail {
  Mutation$regByEmail({
    this.registerByEmail,
    this.$__typename = 'Mutation',
  });

  factory Mutation$regByEmail.fromJson(Map<String, dynamic> json) {
    final l$registerByEmail = json['registerByEmail'];
    final l$$__typename = json['__typename'];
    return Mutation$regByEmail(
      registerByEmail: (l$registerByEmail as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? registerByEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$registerByEmail = registerByEmail;
    resultData['registerByEmail'] = l$registerByEmail;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$registerByEmail = registerByEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$registerByEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$regByEmail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$registerByEmail = registerByEmail;
    final lOther$registerByEmail = other.registerByEmail;
    if (l$registerByEmail != lOther$registerByEmail) {
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

extension UtilityExtension$Mutation$regByEmail on Mutation$regByEmail {
  CopyWith$Mutation$regByEmail<Mutation$regByEmail> get copyWith =>
      CopyWith$Mutation$regByEmail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$regByEmail<TRes> {
  factory CopyWith$Mutation$regByEmail(
    Mutation$regByEmail instance,
    TRes Function(Mutation$regByEmail) then,
  ) = _CopyWithImpl$Mutation$regByEmail;

  factory CopyWith$Mutation$regByEmail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$regByEmail;

  TRes call({
    String? registerByEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$regByEmail<TRes>
    implements CopyWith$Mutation$regByEmail<TRes> {
  _CopyWithImpl$Mutation$regByEmail(
    this._instance,
    this._then,
  );

  final Mutation$regByEmail _instance;

  final TRes Function(Mutation$regByEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? registerByEmail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$regByEmail(
        registerByEmail: registerByEmail == _undefined
            ? _instance.registerByEmail
            : (registerByEmail as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$regByEmail<TRes>
    implements CopyWith$Mutation$regByEmail<TRes> {
  _CopyWithStubImpl$Mutation$regByEmail(this._res);

  final TRes _res;

  @override
  call({
    String? registerByEmail,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationregByEmail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'regByEmail'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'InputEmail'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'registerByEmail'),
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
Mutation$regByEmail _parserFn$Mutation$regByEmail(Map<String, dynamic> data) =>
    Mutation$regByEmail.fromJson(data);
typedef OnMutationCompleted$Mutation$regByEmail = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$regByEmail?,
);

class Options$Mutation$regByEmail
    extends graphql.MutationOptions<Mutation$regByEmail> {
  Options$Mutation$regByEmail({
    String? operationName,
    required Variables$Mutation$regByEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$regByEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$regByEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$regByEmail>? update,
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
                    data == null ? null : _parserFn$Mutation$regByEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregByEmail,
          parserFn: _parserFn$Mutation$regByEmail,
        );

  final OnMutationCompleted$Mutation$regByEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$regByEmail
    extends graphql.WatchQueryOptions<Mutation$regByEmail> {
  WatchOptions$Mutation$regByEmail({
    String? operationName,
    required Variables$Mutation$regByEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$regByEmail? typedOptimisticResult,
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
          document: documentNodeMutationregByEmail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$regByEmail,
        );
}

extension ClientExtension$Mutation$regByEmail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$regByEmail>> mutate$regByEmail(
          Options$Mutation$regByEmail options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$regByEmail> watchMutation$regByEmail(
          WatchOptions$Mutation$regByEmail options,) =>
      watchMutation(options);
}

class Mutation$regByEmail$HookResult {
  Mutation$regByEmail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$regByEmail runMutation;

  final graphql.QueryResult<Mutation$regByEmail> result;
}

Mutation$regByEmail$HookResult useMutation$regByEmail(
    [WidgetOptions$Mutation$regByEmail? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$regByEmail());
  return Mutation$regByEmail$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$regByEmail> useWatchMutation$regByEmail(
        WatchOptions$Mutation$regByEmail options,) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$regByEmail
    extends graphql.MutationOptions<Mutation$regByEmail> {
  WidgetOptions$Mutation$regByEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$regByEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$regByEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$regByEmail>? update,
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
                    data == null ? null : _parserFn$Mutation$regByEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregByEmail,
          parserFn: _parserFn$Mutation$regByEmail,
        );

  final OnMutationCompleted$Mutation$regByEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$regByEmail
    = graphql.MultiSourceResult<Mutation$regByEmail> Function(
  Variables$Mutation$regByEmail, {
  Object? optimisticResult,
  Mutation$regByEmail? typedOptimisticResult,
});
typedef Builder$Mutation$regByEmail = widgets.Widget Function(
  RunMutation$Mutation$regByEmail,
  graphql.QueryResult<Mutation$regByEmail>?,
);

class Mutation$regByEmail$Widget
    extends graphql_flutter.Mutation<Mutation$regByEmail> {
  Mutation$regByEmail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$regByEmail? options,
    required Builder$Mutation$regByEmail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$regByEmail(),
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
