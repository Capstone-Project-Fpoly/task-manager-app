import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SeenNotification {
  factory Variables$Mutation$SeenNotification(
          {required String idNotification,}) =>
      Variables$Mutation$SeenNotification._({
        r'idNotification': idNotification,
      });

  Variables$Mutation$SeenNotification._(this._$data);

  factory Variables$Mutation$SeenNotification.fromJson(
      Map<String, dynamic> data,) {
    final result$data = <String, dynamic>{};
    final l$idNotification = data['idNotification'];
    result$data['idNotification'] = (l$idNotification as String);
    return Variables$Mutation$SeenNotification._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idNotification => (_$data['idNotification'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idNotification = idNotification;
    result$data['idNotification'] = l$idNotification;
    return result$data;
  }

  CopyWith$Variables$Mutation$SeenNotification<
          Variables$Mutation$SeenNotification>
      get copyWith => CopyWith$Variables$Mutation$SeenNotification(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SeenNotification ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idNotification = idNotification;
    final lOther$idNotification = other.idNotification;
    if (l$idNotification != lOther$idNotification) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idNotification = idNotification;
    return Object.hashAll([l$idNotification]);
  }
}

abstract class CopyWith$Variables$Mutation$SeenNotification<TRes> {
  factory CopyWith$Variables$Mutation$SeenNotification(
    Variables$Mutation$SeenNotification instance,
    TRes Function(Variables$Mutation$SeenNotification) then,
  ) = _CopyWithImpl$Variables$Mutation$SeenNotification;

  factory CopyWith$Variables$Mutation$SeenNotification.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SeenNotification;

  TRes call({String? idNotification});
}

class _CopyWithImpl$Variables$Mutation$SeenNotification<TRes>
    implements CopyWith$Variables$Mutation$SeenNotification<TRes> {
  _CopyWithImpl$Variables$Mutation$SeenNotification(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SeenNotification _instance;

  final TRes Function(Variables$Mutation$SeenNotification) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? idNotification = _undefined}) =>
      _then(Variables$Mutation$SeenNotification._({
        ..._instance._$data,
        if (idNotification != _undefined && idNotification != null)
          'idNotification': (idNotification as String),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$SeenNotification<TRes>
    implements CopyWith$Variables$Mutation$SeenNotification<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SeenNotification(this._res);

  final TRes _res;

  @override
  call({String? idNotification}) => _res;
}

class Mutation$SeenNotification {
  Mutation$SeenNotification({
    this.seenNotification,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SeenNotification.fromJson(Map<String, dynamic> json) {
    final l$seenNotification = json['seenNotification'];
    final l$$__typename = json['__typename'];
    return Mutation$SeenNotification(
      seenNotification: (l$seenNotification as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? seenNotification;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$seenNotification = seenNotification;
    resultData['seenNotification'] = l$seenNotification;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$seenNotification = seenNotification;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$seenNotification,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SeenNotification ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$seenNotification = seenNotification;
    final lOther$seenNotification = other.seenNotification;
    if (l$seenNotification != lOther$seenNotification) {
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

extension UtilityExtension$Mutation$SeenNotification
    on Mutation$SeenNotification {
  CopyWith$Mutation$SeenNotification<Mutation$SeenNotification> get copyWith =>
      CopyWith$Mutation$SeenNotification(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SeenNotification<TRes> {
  factory CopyWith$Mutation$SeenNotification(
    Mutation$SeenNotification instance,
    TRes Function(Mutation$SeenNotification) then,
  ) = _CopyWithImpl$Mutation$SeenNotification;

  factory CopyWith$Mutation$SeenNotification.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SeenNotification;

  TRes call({
    bool? seenNotification,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SeenNotification<TRes>
    implements CopyWith$Mutation$SeenNotification<TRes> {
  _CopyWithImpl$Mutation$SeenNotification(
    this._instance,
    this._then,
  );

  final Mutation$SeenNotification _instance;

  final TRes Function(Mutation$SeenNotification) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? seenNotification = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SeenNotification(
        seenNotification: seenNotification == _undefined
            ? _instance.seenNotification
            : (seenNotification as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$SeenNotification<TRes>
    implements CopyWith$Mutation$SeenNotification<TRes> {
  _CopyWithStubImpl$Mutation$SeenNotification(this._res);

  final TRes _res;

  @override
  call({
    bool? seenNotification,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationSeenNotification = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SeenNotification'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idNotification')),
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
        name: NameNode(value: 'seenNotification'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idNotification'),
            value: VariableNode(name: NameNode(value: 'idNotification')),
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
Mutation$SeenNotification _parserFn$Mutation$SeenNotification(
        Map<String, dynamic> data,) =>
    Mutation$SeenNotification.fromJson(data);
typedef OnMutationCompleted$Mutation$SeenNotification = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SeenNotification?,
);

class Options$Mutation$SeenNotification
    extends graphql.MutationOptions<Mutation$SeenNotification> {
  Options$Mutation$SeenNotification({
    String? operationName,
    required Variables$Mutation$SeenNotification variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SeenNotification? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SeenNotification? onCompleted,
    graphql.OnMutationUpdate<Mutation$SeenNotification>? update,
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
                        : _parserFn$Mutation$SeenNotification(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSeenNotification,
          parserFn: _parserFn$Mutation$SeenNotification,
        );

  final OnMutationCompleted$Mutation$SeenNotification? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SeenNotification
    extends graphql.WatchQueryOptions<Mutation$SeenNotification> {
  WatchOptions$Mutation$SeenNotification({
    String? operationName,
    required Variables$Mutation$SeenNotification variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SeenNotification? typedOptimisticResult,
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
          document: documentNodeMutationSeenNotification,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SeenNotification,
        );
}

extension ClientExtension$Mutation$SeenNotification on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SeenNotification>>
      mutate$SeenNotification(
              Options$Mutation$SeenNotification options,) async =>
          await mutate(options);
  graphql.ObservableQuery<Mutation$SeenNotification>
      watchMutation$SeenNotification(
              WatchOptions$Mutation$SeenNotification options,) =>
          watchMutation(options);
}

class Mutation$SeenNotification$HookResult {
  Mutation$SeenNotification$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SeenNotification runMutation;

  final graphql.QueryResult<Mutation$SeenNotification> result;
}

Mutation$SeenNotification$HookResult useMutation$SeenNotification(
    [WidgetOptions$Mutation$SeenNotification? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SeenNotification());
  return Mutation$SeenNotification$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SeenNotification>
    useWatchMutation$SeenNotification(
            WatchOptions$Mutation$SeenNotification options,) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SeenNotification
    extends graphql.MutationOptions<Mutation$SeenNotification> {
  WidgetOptions$Mutation$SeenNotification({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SeenNotification? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SeenNotification? onCompleted,
    graphql.OnMutationUpdate<Mutation$SeenNotification>? update,
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
                        : _parserFn$Mutation$SeenNotification(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSeenNotification,
          parserFn: _parserFn$Mutation$SeenNotification,
        );

  final OnMutationCompleted$Mutation$SeenNotification? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SeenNotification
    = graphql.MultiSourceResult<Mutation$SeenNotification> Function(
  Variables$Mutation$SeenNotification, {
  Object? optimisticResult,
  Mutation$SeenNotification? typedOptimisticResult,
});
typedef Builder$Mutation$SeenNotification = widgets.Widget Function(
  RunMutation$Mutation$SeenNotification,
  graphql.QueryResult<Mutation$SeenNotification>?,
);

class Mutation$SeenNotification$Widget
    extends graphql_flutter.Mutation<Mutation$SeenNotification> {
  Mutation$SeenNotification$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SeenNotification? options,
    required Builder$Mutation$SeenNotification builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SeenNotification(),
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
