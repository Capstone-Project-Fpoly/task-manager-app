import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SendOTPEmail {
  factory Variables$Mutation$SendOTPEmail({required String email}) =>
      Variables$Mutation$SendOTPEmail._({
        r'email': email,
      });

  Variables$Mutation$SendOTPEmail._(this._$data);

  factory Variables$Mutation$SendOTPEmail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Variables$Mutation$SendOTPEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Variables$Mutation$SendOTPEmail<Variables$Mutation$SendOTPEmail>
      get copyWith => CopyWith$Variables$Mutation$SendOTPEmail(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SendOTPEmail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    return Object.hashAll([l$email]);
  }
}

abstract class CopyWith$Variables$Mutation$SendOTPEmail<TRes> {
  factory CopyWith$Variables$Mutation$SendOTPEmail(
    Variables$Mutation$SendOTPEmail instance,
    TRes Function(Variables$Mutation$SendOTPEmail) then,
  ) = _CopyWithImpl$Variables$Mutation$SendOTPEmail;

  factory CopyWith$Variables$Mutation$SendOTPEmail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SendOTPEmail;

  TRes call({String? email});
}

class _CopyWithImpl$Variables$Mutation$SendOTPEmail<TRes>
    implements CopyWith$Variables$Mutation$SendOTPEmail<TRes> {
  _CopyWithImpl$Variables$Mutation$SendOTPEmail(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SendOTPEmail _instance;

  final TRes Function(Variables$Mutation$SendOTPEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined}) =>
      _then(Variables$Mutation$SendOTPEmail._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SendOTPEmail<TRes>
    implements CopyWith$Variables$Mutation$SendOTPEmail<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SendOTPEmail(this._res);

  TRes _res;

  call({String? email}) => _res;
}

class Mutation$SendOTPEmail {
  Mutation$SendOTPEmail({
    this.sendOTPEmail,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SendOTPEmail.fromJson(Map<String, dynamic> json) {
    final l$sendOTPEmail = json['sendOTPEmail'];
    final l$$__typename = json['__typename'];
    return Mutation$SendOTPEmail(
      sendOTPEmail: (l$sendOTPEmail as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? sendOTPEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendOTPEmail = sendOTPEmail;
    _resultData['sendOTPEmail'] = l$sendOTPEmail;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendOTPEmail = sendOTPEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sendOTPEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SendOTPEmail) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendOTPEmail = sendOTPEmail;
    final lOther$sendOTPEmail = other.sendOTPEmail;
    if (l$sendOTPEmail != lOther$sendOTPEmail) {
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

extension UtilityExtension$Mutation$SendOTPEmail on Mutation$SendOTPEmail {
  CopyWith$Mutation$SendOTPEmail<Mutation$SendOTPEmail> get copyWith =>
      CopyWith$Mutation$SendOTPEmail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SendOTPEmail<TRes> {
  factory CopyWith$Mutation$SendOTPEmail(
    Mutation$SendOTPEmail instance,
    TRes Function(Mutation$SendOTPEmail) then,
  ) = _CopyWithImpl$Mutation$SendOTPEmail;

  factory CopyWith$Mutation$SendOTPEmail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SendOTPEmail;

  TRes call({
    bool? sendOTPEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SendOTPEmail<TRes>
    implements CopyWith$Mutation$SendOTPEmail<TRes> {
  _CopyWithImpl$Mutation$SendOTPEmail(
    this._instance,
    this._then,
  );

  final Mutation$SendOTPEmail _instance;

  final TRes Function(Mutation$SendOTPEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendOTPEmail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SendOTPEmail(
        sendOTPEmail: sendOTPEmail == _undefined
            ? _instance.sendOTPEmail
            : (sendOTPEmail as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SendOTPEmail<TRes>
    implements CopyWith$Mutation$SendOTPEmail<TRes> {
  _CopyWithStubImpl$Mutation$SendOTPEmail(this._res);

  TRes _res;

  call({
    bool? sendOTPEmail,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationSendOTPEmail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SendOTPEmail'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
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
        name: NameNode(value: 'sendOTPEmail'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
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
Mutation$SendOTPEmail _parserFn$Mutation$SendOTPEmail(
        Map<String, dynamic> data) =>
    Mutation$SendOTPEmail.fromJson(data);
typedef OnMutationCompleted$Mutation$SendOTPEmail = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SendOTPEmail?,
);

class Options$Mutation$SendOTPEmail
    extends graphql.MutationOptions<Mutation$SendOTPEmail> {
  Options$Mutation$SendOTPEmail({
    String? operationName,
    required Variables$Mutation$SendOTPEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SendOTPEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SendOTPEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$SendOTPEmail>? update,
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
                    data == null ? null : _parserFn$Mutation$SendOTPEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSendOTPEmail,
          parserFn: _parserFn$Mutation$SendOTPEmail,
        );

  final OnMutationCompleted$Mutation$SendOTPEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SendOTPEmail
    extends graphql.WatchQueryOptions<Mutation$SendOTPEmail> {
  WatchOptions$Mutation$SendOTPEmail({
    String? operationName,
    required Variables$Mutation$SendOTPEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SendOTPEmail? typedOptimisticResult,
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
          document: documentNodeMutationSendOTPEmail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SendOTPEmail,
        );
}

extension ClientExtension$Mutation$SendOTPEmail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SendOTPEmail>> mutate$SendOTPEmail(
          Options$Mutation$SendOTPEmail options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SendOTPEmail> watchMutation$SendOTPEmail(
          WatchOptions$Mutation$SendOTPEmail options) =>
      this.watchMutation(options);
}

class Mutation$SendOTPEmail$HookResult {
  Mutation$SendOTPEmail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SendOTPEmail runMutation;

  final graphql.QueryResult<Mutation$SendOTPEmail> result;
}

Mutation$SendOTPEmail$HookResult useMutation$SendOTPEmail(
    [WidgetOptions$Mutation$SendOTPEmail? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SendOTPEmail());
  return Mutation$SendOTPEmail$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SendOTPEmail> useWatchMutation$SendOTPEmail(
        WatchOptions$Mutation$SendOTPEmail options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SendOTPEmail
    extends graphql.MutationOptions<Mutation$SendOTPEmail> {
  WidgetOptions$Mutation$SendOTPEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SendOTPEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SendOTPEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$SendOTPEmail>? update,
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
                    data == null ? null : _parserFn$Mutation$SendOTPEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSendOTPEmail,
          parserFn: _parserFn$Mutation$SendOTPEmail,
        );

  final OnMutationCompleted$Mutation$SendOTPEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SendOTPEmail
    = graphql.MultiSourceResult<Mutation$SendOTPEmail> Function(
  Variables$Mutation$SendOTPEmail, {
  Object? optimisticResult,
  Mutation$SendOTPEmail? typedOptimisticResult,
});
typedef Builder$Mutation$SendOTPEmail = widgets.Widget Function(
  RunMutation$Mutation$SendOTPEmail,
  graphql.QueryResult<Mutation$SendOTPEmail>?,
);

class Mutation$SendOTPEmail$Widget
    extends graphql_flutter.Mutation<Mutation$SendOTPEmail> {
  Mutation$SendOTPEmail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SendOTPEmail? options,
    required Builder$Mutation$SendOTPEmail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SendOTPEmail(),
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
