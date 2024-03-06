import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$NotificationCollection {
  factory Variables$Query$NotificationCollection({String? idBoard}) =>
      Variables$Query$NotificationCollection._({
        if (idBoard != null) r'idBoard': idBoard,
      });

  Variables$Query$NotificationCollection._(this._$data);

  factory Variables$Query$NotificationCollection.fromJson(
      Map<String, dynamic> data,) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('idBoard')) {
      final l$idBoard = data['idBoard'];
      result$data['idBoard'] = (l$idBoard as String?);
    }
    return Variables$Query$NotificationCollection._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get idBoard => (_$data['idBoard'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('idBoard')) {
      final l$idBoard = idBoard;
      result$data['idBoard'] = l$idBoard;
    }
    return result$data;
  }

  CopyWith$Variables$Query$NotificationCollection<
          Variables$Query$NotificationCollection>
      get copyWith => CopyWith$Variables$Query$NotificationCollection(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$NotificationCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (_$data.containsKey('idBoard') != other._$data.containsKey('idBoard')) {
      return false;
    }
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    return Object.hashAll(
        [_$data.containsKey('idBoard') ? l$idBoard : const {}],);
  }
}

abstract class CopyWith$Variables$Query$NotificationCollection<TRes> {
  factory CopyWith$Variables$Query$NotificationCollection(
    Variables$Query$NotificationCollection instance,
    TRes Function(Variables$Query$NotificationCollection) then,
  ) = _CopyWithImpl$Variables$Query$NotificationCollection;

  factory CopyWith$Variables$Query$NotificationCollection.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$NotificationCollection;

  TRes call({String? idBoard});
}

class _CopyWithImpl$Variables$Query$NotificationCollection<TRes>
    implements CopyWith$Variables$Query$NotificationCollection<TRes> {
  _CopyWithImpl$Variables$Query$NotificationCollection(
    this._instance,
    this._then,
  );

  final Variables$Query$NotificationCollection _instance;

  final TRes Function(Variables$Query$NotificationCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? idBoard = _undefined}) =>
      _then(Variables$Query$NotificationCollection._({
        ..._instance._$data,
        if (idBoard != _undefined) 'idBoard': (idBoard as String?),
      }),);
}

class _CopyWithStubImpl$Variables$Query$NotificationCollection<TRes>
    implements CopyWith$Variables$Query$NotificationCollection<TRes> {
  _CopyWithStubImpl$Variables$Query$NotificationCollection(this._res);

  final TRes _res;

  @override
  call({String? idBoard}) => _res;
}

class Query$NotificationCollection {
  Query$NotificationCollection({
    this.notificationCollection,
    this.$__typename = 'Query',
  });

  factory Query$NotificationCollection.fromJson(Map<String, dynamic> json) {
    final l$notificationCollection = json['notificationCollection'];
    final l$$__typename = json['__typename'];
    return Query$NotificationCollection(
      notificationCollection: (l$notificationCollection as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$NotificationFragment.fromJson(
                  (e as Map<String, dynamic>),),)
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$NotificationFragment?>? notificationCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$notificationCollection = notificationCollection;
    resultData['notificationCollection'] =
        l$notificationCollection?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$notificationCollection = notificationCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$notificationCollection == null
          ? null
          : Object.hashAll(l$notificationCollection.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$NotificationCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$notificationCollection = notificationCollection;
    final lOther$notificationCollection = other.notificationCollection;
    if (l$notificationCollection != null &&
        lOther$notificationCollection != null) {
      if (l$notificationCollection.length !=
          lOther$notificationCollection.length) {
        return false;
      }
      for (int i = 0; i < l$notificationCollection.length; i++) {
        final l$notificationCollection$entry = l$notificationCollection[i];
        final lOther$notificationCollection$entry =
            lOther$notificationCollection[i];
        if (l$notificationCollection$entry !=
            lOther$notificationCollection$entry) {
          return false;
        }
      }
    } else if (l$notificationCollection != lOther$notificationCollection) {
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

extension UtilityExtension$Query$NotificationCollection
    on Query$NotificationCollection {
  CopyWith$Query$NotificationCollection<Query$NotificationCollection>
      get copyWith => CopyWith$Query$NotificationCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$NotificationCollection<TRes> {
  factory CopyWith$Query$NotificationCollection(
    Query$NotificationCollection instance,
    TRes Function(Query$NotificationCollection) then,
  ) = _CopyWithImpl$Query$NotificationCollection;

  factory CopyWith$Query$NotificationCollection.stub(TRes res) =
      _CopyWithStubImpl$Query$NotificationCollection;

  TRes call({
    List<Fragment$NotificationFragment?>? notificationCollection,
    String? $__typename,
  });
  TRes notificationCollection(
      Iterable<Fragment$NotificationFragment?>? Function(
              Iterable<
                  CopyWith$Fragment$NotificationFragment<
                      Fragment$NotificationFragment>?>?,)
          fn,);
}

class _CopyWithImpl$Query$NotificationCollection<TRes>
    implements CopyWith$Query$NotificationCollection<TRes> {
  _CopyWithImpl$Query$NotificationCollection(
    this._instance,
    this._then,
  );

  final Query$NotificationCollection _instance;

  final TRes Function(Query$NotificationCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? notificationCollection = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$NotificationCollection(
        notificationCollection: notificationCollection == _undefined
            ? _instance.notificationCollection
            : (notificationCollection as List<Fragment$NotificationFragment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  TRes notificationCollection(
          Iterable<Fragment$NotificationFragment?>? Function(
                  Iterable<
                      CopyWith$Fragment$NotificationFragment<
                          Fragment$NotificationFragment>?>?,)
              fn,) =>
      call(
          notificationCollection:
              fn(_instance.notificationCollection?.map((e) => e == null
                  ? null
                  : CopyWith$Fragment$NotificationFragment(
                      e,
                      (i) => i,
                    ),),)?.toList(),);
}

class _CopyWithStubImpl$Query$NotificationCollection<TRes>
    implements CopyWith$Query$NotificationCollection<TRes> {
  _CopyWithStubImpl$Query$NotificationCollection(this._res);

  final TRes _res;

  @override
  call({
    List<Fragment$NotificationFragment?>? notificationCollection,
    String? $__typename,
  }) =>
      _res;

  @override
  notificationCollection(fn) => _res;
}

const documentNodeQueryNotificationCollection = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'NotificationCollection'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idBoard')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'notificationCollection'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'NotificationFragment'),
            directives: [],
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],),
  ),
  fragmentDefinitionNotificationFragment,
  fragmentDefinitionUserFragment,
],);
Query$NotificationCollection _parserFn$Query$NotificationCollection(
        Map<String, dynamic> data,) =>
    Query$NotificationCollection.fromJson(data);
typedef OnQueryComplete$Query$NotificationCollection = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$NotificationCollection?,
);

class Options$Query$NotificationCollection
    extends graphql.QueryOptions<Query$NotificationCollection> {
  Options$Query$NotificationCollection({
    String? operationName,
    Variables$Query$NotificationCollection? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$NotificationCollection? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$NotificationCollection? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$NotificationCollection(data),
                  ),
          onError: onError,
          document: documentNodeQueryNotificationCollection,
          parserFn: _parserFn$Query$NotificationCollection,
        );

  final OnQueryComplete$Query$NotificationCollection? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$NotificationCollection
    extends graphql.WatchQueryOptions<Query$NotificationCollection> {
  WatchOptions$Query$NotificationCollection({
    String? operationName,
    Variables$Query$NotificationCollection? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$NotificationCollection? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryNotificationCollection,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$NotificationCollection,
        );
}

class FetchMoreOptions$Query$NotificationCollection
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$NotificationCollection({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$NotificationCollection? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryNotificationCollection,
        );
}

extension ClientExtension$Query$NotificationCollection
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$NotificationCollection>>
      query$NotificationCollection(
              [Options$Query$NotificationCollection? options,]) async =>
          await query(options ?? Options$Query$NotificationCollection());
  graphql.ObservableQuery<
      Query$NotificationCollection> watchQuery$NotificationCollection(
          [WatchOptions$Query$NotificationCollection? options,]) =>
      watchQuery(options ?? WatchOptions$Query$NotificationCollection());
  void writeQuery$NotificationCollection({
    required Query$NotificationCollection data,
    Variables$Query$NotificationCollection? variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: const graphql.Operation(
              document: documentNodeQueryNotificationCollection,),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$NotificationCollection? readQuery$NotificationCollection({
    Variables$Query$NotificationCollection? variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation: const graphql.Operation(
            document: documentNodeQueryNotificationCollection,),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$NotificationCollection.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$NotificationCollection>
    useQuery$NotificationCollection(
            [Options$Query$NotificationCollection? options,]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$NotificationCollection());
graphql.ObservableQuery<Query$NotificationCollection>
    useWatchQuery$NotificationCollection(
            [WatchOptions$Query$NotificationCollection? options,]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$NotificationCollection(),);

class Query$NotificationCollection$Widget
    extends graphql_flutter.Query<Query$NotificationCollection> {
  Query$NotificationCollection$Widget({
    widgets.Key? key,
    Options$Query$NotificationCollection? options,
    required graphql_flutter.QueryBuilder<Query$NotificationCollection> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$NotificationCollection(),
          builder: builder,
        );
}
