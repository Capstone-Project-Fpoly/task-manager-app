import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$VerifyOTPEMail {
  factory Variables$Mutation$VerifyOTPEMail(
          {required Input$InputVerifyEmail input}) =>
      Variables$Mutation$VerifyOTPEMail._({
        r'input': input,
      });

  Variables$Mutation$VerifyOTPEMail._(this._$data);

  factory Variables$Mutation$VerifyOTPEMail.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$InputVerifyEmail.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$VerifyOTPEMail._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$InputVerifyEmail get input =>
      (_$data['input'] as Input$InputVerifyEmail);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$VerifyOTPEMail<Variables$Mutation$VerifyOTPEMail>
      get copyWith => CopyWith$Variables$Mutation$VerifyOTPEMail(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$VerifyOTPEMail) ||
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

abstract class CopyWith$Variables$Mutation$VerifyOTPEMail<TRes> {
  factory CopyWith$Variables$Mutation$VerifyOTPEMail(
    Variables$Mutation$VerifyOTPEMail instance,
    TRes Function(Variables$Mutation$VerifyOTPEMail) then,
  ) = _CopyWithImpl$Variables$Mutation$VerifyOTPEMail;

  factory CopyWith$Variables$Mutation$VerifyOTPEMail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$VerifyOTPEMail;

  TRes call({Input$InputVerifyEmail? input});
}

class _CopyWithImpl$Variables$Mutation$VerifyOTPEMail<TRes>
    implements CopyWith$Variables$Mutation$VerifyOTPEMail<TRes> {
  _CopyWithImpl$Variables$Mutation$VerifyOTPEMail(
    this._instance,
    this._then,
  );

  final Variables$Mutation$VerifyOTPEMail _instance;

  final TRes Function(Variables$Mutation$VerifyOTPEMail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$VerifyOTPEMail._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$InputVerifyEmail),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$VerifyOTPEMail<TRes>
    implements CopyWith$Variables$Mutation$VerifyOTPEMail<TRes> {
  _CopyWithStubImpl$Variables$Mutation$VerifyOTPEMail(this._res);

  TRes _res;

  call({Input$InputVerifyEmail? input}) => _res;
}

class Mutation$VerifyOTPEMail {
  Mutation$VerifyOTPEMail({
    this.verifyEmail,
    this.$__typename = 'Mutation',
  });

  factory Mutation$VerifyOTPEMail.fromJson(Map<String, dynamic> json) {
    final l$verifyEmail = json['verifyEmail'];
    final l$$__typename = json['__typename'];
    return Mutation$VerifyOTPEMail(
      verifyEmail: (l$verifyEmail as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? verifyEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$verifyEmail = verifyEmail;
    _resultData['verifyEmail'] = l$verifyEmail;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$verifyEmail = verifyEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$verifyEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$VerifyOTPEMail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$verifyEmail = verifyEmail;
    final lOther$verifyEmail = other.verifyEmail;
    if (l$verifyEmail != lOther$verifyEmail) {
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

extension UtilityExtension$Mutation$VerifyOTPEMail on Mutation$VerifyOTPEMail {
  CopyWith$Mutation$VerifyOTPEMail<Mutation$VerifyOTPEMail> get copyWith =>
      CopyWith$Mutation$VerifyOTPEMail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$VerifyOTPEMail<TRes> {
  factory CopyWith$Mutation$VerifyOTPEMail(
    Mutation$VerifyOTPEMail instance,
    TRes Function(Mutation$VerifyOTPEMail) then,
  ) = _CopyWithImpl$Mutation$VerifyOTPEMail;

  factory CopyWith$Mutation$VerifyOTPEMail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$VerifyOTPEMail;

  TRes call({
    bool? verifyEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$VerifyOTPEMail<TRes>
    implements CopyWith$Mutation$VerifyOTPEMail<TRes> {
  _CopyWithImpl$Mutation$VerifyOTPEMail(
    this._instance,
    this._then,
  );

  final Mutation$VerifyOTPEMail _instance;

  final TRes Function(Mutation$VerifyOTPEMail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? verifyEmail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$VerifyOTPEMail(
        verifyEmail: verifyEmail == _undefined
            ? _instance.verifyEmail
            : (verifyEmail as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$VerifyOTPEMail<TRes>
    implements CopyWith$Mutation$VerifyOTPEMail<TRes> {
  _CopyWithStubImpl$Mutation$VerifyOTPEMail(this._res);

  TRes _res;

  call({
    bool? verifyEmail,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationVerifyOTPEMail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'VerifyOTPEMail'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'InputVerifyEmail'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'verifyEmail'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
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
    ]),
  ),
]);
Mutation$VerifyOTPEMail _parserFn$Mutation$VerifyOTPEMail(
        Map<String, dynamic> data) =>
    Mutation$VerifyOTPEMail.fromJson(data);
typedef OnMutationCompleted$Mutation$VerifyOTPEMail = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$VerifyOTPEMail?,
);

class Options$Mutation$VerifyOTPEMail
    extends graphql.MutationOptions<Mutation$VerifyOTPEMail> {
  Options$Mutation$VerifyOTPEMail({
    String? operationName,
    required Variables$Mutation$VerifyOTPEMail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$VerifyOTPEMail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$VerifyOTPEMail? onCompleted,
    graphql.OnMutationUpdate<Mutation$VerifyOTPEMail>? update,
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
                        : _parserFn$Mutation$VerifyOTPEMail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationVerifyOTPEMail,
          parserFn: _parserFn$Mutation$VerifyOTPEMail,
        );

  final OnMutationCompleted$Mutation$VerifyOTPEMail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$VerifyOTPEMail
    extends graphql.WatchQueryOptions<Mutation$VerifyOTPEMail> {
  WatchOptions$Mutation$VerifyOTPEMail({
    String? operationName,
    required Variables$Mutation$VerifyOTPEMail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$VerifyOTPEMail? typedOptimisticResult,
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
          document: documentNodeMutationVerifyOTPEMail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$VerifyOTPEMail,
        );
}

extension ClientExtension$Mutation$VerifyOTPEMail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$VerifyOTPEMail>> mutate$VerifyOTPEMail(
          Options$Mutation$VerifyOTPEMail options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$VerifyOTPEMail> watchMutation$VerifyOTPEMail(
          WatchOptions$Mutation$VerifyOTPEMail options) =>
      this.watchMutation(options);
}

class Mutation$VerifyOTPEMail$HookResult {
  Mutation$VerifyOTPEMail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$VerifyOTPEMail runMutation;

  final graphql.QueryResult<Mutation$VerifyOTPEMail> result;
}

Mutation$VerifyOTPEMail$HookResult useMutation$VerifyOTPEMail(
    [WidgetOptions$Mutation$VerifyOTPEMail? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$VerifyOTPEMail());
  return Mutation$VerifyOTPEMail$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$VerifyOTPEMail>
    useWatchMutation$VerifyOTPEMail(
            WatchOptions$Mutation$VerifyOTPEMail options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$VerifyOTPEMail
    extends graphql.MutationOptions<Mutation$VerifyOTPEMail> {
  WidgetOptions$Mutation$VerifyOTPEMail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$VerifyOTPEMail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$VerifyOTPEMail? onCompleted,
    graphql.OnMutationUpdate<Mutation$VerifyOTPEMail>? update,
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
                        : _parserFn$Mutation$VerifyOTPEMail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationVerifyOTPEMail,
          parserFn: _parserFn$Mutation$VerifyOTPEMail,
        );

  final OnMutationCompleted$Mutation$VerifyOTPEMail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$VerifyOTPEMail
    = graphql.MultiSourceResult<Mutation$VerifyOTPEMail> Function(
  Variables$Mutation$VerifyOTPEMail, {
  Object? optimisticResult,
  Mutation$VerifyOTPEMail? typedOptimisticResult,
});
typedef Builder$Mutation$VerifyOTPEMail = widgets.Widget Function(
  RunMutation$Mutation$VerifyOTPEMail,
  graphql.QueryResult<Mutation$VerifyOTPEMail>?,
);

class Mutation$VerifyOTPEMail$Widget
    extends graphql_flutter.Mutation<Mutation$VerifyOTPEMail> {
  Mutation$VerifyOTPEMail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$VerifyOTPEMail? options,
    required Builder$Mutation$VerifyOTPEMail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$VerifyOTPEMail(),
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
