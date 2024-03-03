import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$InviteUserBoard {
  factory Variables$Mutation$InviteUserBoard({
    required String idBoard,
    List<String>? idUser,
  }) =>
      Variables$Mutation$InviteUserBoard._({
        r'idBoard': idBoard,
        if (idUser != null) r'idUser': idUser,
      });

  Variables$Mutation$InviteUserBoard._(this._$data);

  factory Variables$Mutation$InviteUserBoard.fromJson(
      Map<String, dynamic> data,) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    if (data.containsKey('idUser')) {
      final l$idUser = data['idUser'];
      result$data['idUser'] =
          (l$idUser as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Variables$Mutation$InviteUserBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  List<String>? get idUser => (_$data['idUser'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    if (_$data.containsKey('idUser')) {
      final l$idUser = idUser;
      result$data['idUser'] = l$idUser?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$InviteUserBoard<
          Variables$Mutation$InviteUserBoard>
      get copyWith => CopyWith$Variables$Mutation$InviteUserBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$InviteUserBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
      return false;
    }
    final l$idUser = idUser;
    final lOther$idUser = other.idUser;
    if (_$data.containsKey('idUser') != other._$data.containsKey('idUser')) {
      return false;
    }
    if (l$idUser != null && lOther$idUser != null) {
      if (l$idUser.length != lOther$idUser.length) {
        return false;
      }
      for (int i = 0; i < l$idUser.length; i++) {
        final l$idUser$entry = l$idUser[i];
        final lOther$idUser$entry = lOther$idUser[i];
        if (l$idUser$entry != lOther$idUser$entry) {
          return false;
        }
      }
    } else if (l$idUser != lOther$idUser) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idBoard = idBoard;
    final l$idUser = idUser;
    return Object.hashAll([
      l$idBoard,
      _$data.containsKey('idUser')
          ? l$idUser == null
              ? null
              : Object.hashAll(l$idUser.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$InviteUserBoard<TRes> {
  factory CopyWith$Variables$Mutation$InviteUserBoard(
    Variables$Mutation$InviteUserBoard instance,
    TRes Function(Variables$Mutation$InviteUserBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$InviteUserBoard;

  factory CopyWith$Variables$Mutation$InviteUserBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InviteUserBoard;

  TRes call({
    String? idBoard,
    List<String>? idUser,
  });
}

class _CopyWithImpl$Variables$Mutation$InviteUserBoard<TRes>
    implements CopyWith$Variables$Mutation$InviteUserBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$InviteUserBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InviteUserBoard _instance;

  final TRes Function(Variables$Mutation$InviteUserBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? idBoard = _undefined,
    Object? idUser = _undefined,
  }) =>
      _then(Variables$Mutation$InviteUserBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
        if (idUser != _undefined) 'idUser': (idUser as List<String>?),
      }),);
}

class _CopyWithStubImpl$Variables$Mutation$InviteUserBoard<TRes>
    implements CopyWith$Variables$Mutation$InviteUserBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InviteUserBoard(this._res);

  final TRes _res;

  @override
  call({
    String? idBoard,
    List<String>? idUser,
  }) =>
      _res;
}

class Mutation$InviteUserBoard {
  Mutation$InviteUserBoard({
    this.inviteUsersToBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$InviteUserBoard.fromJson(Map<String, dynamic> json) {
    final l$inviteUsersToBoard = json['inviteUsersToBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$InviteUserBoard(
      inviteUsersToBoard: (l$inviteUsersToBoard as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? inviteUsersToBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$inviteUsersToBoard = inviteUsersToBoard;
    resultData['inviteUsersToBoard'] = l$inviteUsersToBoard;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$inviteUsersToBoard = inviteUsersToBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$inviteUsersToBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InviteUserBoard ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inviteUsersToBoard = inviteUsersToBoard;
    final lOther$inviteUsersToBoard = other.inviteUsersToBoard;
    if (l$inviteUsersToBoard != lOther$inviteUsersToBoard) {
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

extension UtilityExtension$Mutation$InviteUserBoard
    on Mutation$InviteUserBoard {
  CopyWith$Mutation$InviteUserBoard<Mutation$InviteUserBoard> get copyWith =>
      CopyWith$Mutation$InviteUserBoard(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$InviteUserBoard<TRes> {
  factory CopyWith$Mutation$InviteUserBoard(
    Mutation$InviteUserBoard instance,
    TRes Function(Mutation$InviteUserBoard) then,
  ) = _CopyWithImpl$Mutation$InviteUserBoard;

  factory CopyWith$Mutation$InviteUserBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InviteUserBoard;

  TRes call({
    bool? inviteUsersToBoard,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$InviteUserBoard<TRes>
    implements CopyWith$Mutation$InviteUserBoard<TRes> {
  _CopyWithImpl$Mutation$InviteUserBoard(
    this._instance,
    this._then,
  );

  final Mutation$InviteUserBoard _instance;

  final TRes Function(Mutation$InviteUserBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? inviteUsersToBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InviteUserBoard(
        inviteUsersToBoard: inviteUsersToBoard == _undefined
            ? _instance.inviteUsersToBoard
            : (inviteUsersToBoard as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Mutation$InviteUserBoard<TRes>
    implements CopyWith$Mutation$InviteUserBoard<TRes> {
  _CopyWithStubImpl$Mutation$InviteUserBoard(this._res);

  final TRes _res;

  @override
  call({
    bool? inviteUsersToBoard,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationInviteUserBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'InviteUserBoard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idBoard')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idUser')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'inviteUsersToBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
          ),
          ArgumentNode(
            name: NameNode(value: 'idUsers'),
            value: VariableNode(name: NameNode(value: 'idUser')),
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
Mutation$InviteUserBoard _parserFn$Mutation$InviteUserBoard(
        Map<String, dynamic> data,) =>
    Mutation$InviteUserBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$InviteUserBoard = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$InviteUserBoard?,
);

class Options$Mutation$InviteUserBoard
    extends graphql.MutationOptions<Mutation$InviteUserBoard> {
  Options$Mutation$InviteUserBoard({
    String? operationName,
    required Variables$Mutation$InviteUserBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InviteUserBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InviteUserBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$InviteUserBoard>? update,
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
                        : _parserFn$Mutation$InviteUserBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInviteUserBoard,
          parserFn: _parserFn$Mutation$InviteUserBoard,
        );

  final OnMutationCompleted$Mutation$InviteUserBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$InviteUserBoard
    extends graphql.WatchQueryOptions<Mutation$InviteUserBoard> {
  WatchOptions$Mutation$InviteUserBoard({
    String? operationName,
    required Variables$Mutation$InviteUserBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InviteUserBoard? typedOptimisticResult,
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
          document: documentNodeMutationInviteUserBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$InviteUserBoard,
        );
}

extension ClientExtension$Mutation$InviteUserBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InviteUserBoard>> mutate$InviteUserBoard(
          Options$Mutation$InviteUserBoard options,) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$InviteUserBoard>
      watchMutation$InviteUserBoard(
              WatchOptions$Mutation$InviteUserBoard options,) =>
          watchMutation(options);
}

class Mutation$InviteUserBoard$HookResult {
  Mutation$InviteUserBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$InviteUserBoard runMutation;

  final graphql.QueryResult<Mutation$InviteUserBoard> result;
}

Mutation$InviteUserBoard$HookResult useMutation$InviteUserBoard(
    [WidgetOptions$Mutation$InviteUserBoard? options,]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$InviteUserBoard());
  return Mutation$InviteUserBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$InviteUserBoard>
    useWatchMutation$InviteUserBoard(
            WatchOptions$Mutation$InviteUserBoard options,) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$InviteUserBoard
    extends graphql.MutationOptions<Mutation$InviteUserBoard> {
  WidgetOptions$Mutation$InviteUserBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InviteUserBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InviteUserBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$InviteUserBoard>? update,
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
                        : _parserFn$Mutation$InviteUserBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInviteUserBoard,
          parserFn: _parserFn$Mutation$InviteUserBoard,
        );

  final OnMutationCompleted$Mutation$InviteUserBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$InviteUserBoard
    = graphql.MultiSourceResult<Mutation$InviteUserBoard> Function(
  Variables$Mutation$InviteUserBoard, {
  Object? optimisticResult,
  Mutation$InviteUserBoard? typedOptimisticResult,
});
typedef Builder$Mutation$InviteUserBoard = widgets.Widget Function(
  RunMutation$Mutation$InviteUserBoard,
  graphql.QueryResult<Mutation$InviteUserBoard>?,
);

class Mutation$InviteUserBoard$Widget
    extends graphql_flutter.Mutation<Mutation$InviteUserBoard> {
  Mutation$InviteUserBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$InviteUserBoard? options,
    required Builder$Mutation$InviteUserBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$InviteUserBoard(),
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
