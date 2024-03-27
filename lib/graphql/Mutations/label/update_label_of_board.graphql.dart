import '../../Fragment/label_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UpdateLabelOfBoard {
  factory Variables$Mutation$UpdateLabelOfBoard({
    required String idLabel,
    required String color,
    String? title,
  }) =>
      Variables$Mutation$UpdateLabelOfBoard._({
        r'idLabel': idLabel,
        r'color': color,
        if (title != null) r'title': title,
      });

  Variables$Mutation$UpdateLabelOfBoard._(this._$data);

  factory Variables$Mutation$UpdateLabelOfBoard.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idLabel = data['idLabel'];
    result$data['idLabel'] = (l$idLabel as String);
    final l$color = data['color'];
    result$data['color'] = (l$color as String);
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    return Variables$Mutation$UpdateLabelOfBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idLabel => (_$data['idLabel'] as String);

  String get color => (_$data['color'] as String);

  String? get title => (_$data['title'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idLabel = idLabel;
    result$data['idLabel'] = l$idLabel;
    final l$color = color;
    result$data['color'] = l$color;
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateLabelOfBoard<
          Variables$Mutation$UpdateLabelOfBoard>
      get copyWith => CopyWith$Variables$Mutation$UpdateLabelOfBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateLabelOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idLabel = idLabel;
    final lOther$idLabel = other.idLabel;
    if (l$idLabel != lOther$idLabel) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$idLabel = idLabel;
    final l$color = color;
    final l$title = title;
    return Object.hashAll([
      l$idLabel,
      l$color,
      _$data.containsKey('title') ? l$title : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateLabelOfBoard<TRes> {
  factory CopyWith$Variables$Mutation$UpdateLabelOfBoard(
    Variables$Mutation$UpdateLabelOfBoard instance,
    TRes Function(Variables$Mutation$UpdateLabelOfBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateLabelOfBoard;

  factory CopyWith$Variables$Mutation$UpdateLabelOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateLabelOfBoard;

  TRes call({
    String? idLabel,
    String? color,
    String? title,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateLabelOfBoard<TRes>
    implements CopyWith$Variables$Mutation$UpdateLabelOfBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateLabelOfBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateLabelOfBoard _instance;

  final TRes Function(Variables$Mutation$UpdateLabelOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? idLabel = _undefined,
    Object? color = _undefined,
    Object? title = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateLabelOfBoard._({
        ..._instance._$data,
        if (idLabel != _undefined && idLabel != null)
          'idLabel': (idLabel as String),
        if (color != _undefined && color != null) 'color': (color as String),
        if (title != _undefined) 'title': (title as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateLabelOfBoard<TRes>
    implements CopyWith$Variables$Mutation$UpdateLabelOfBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateLabelOfBoard(this._res);

  TRes _res;

  call({
    String? idLabel,
    String? color,
    String? title,
  }) =>
      _res;
}

class Mutation$UpdateLabelOfBoard {
  Mutation$UpdateLabelOfBoard({
    this.updateLabelOfBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateLabelOfBoard.fromJson(Map<String, dynamic> json) {
    final l$updateLabelOfBoard = json['updateLabelOfBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateLabelOfBoard(
      updateLabelOfBoard: l$updateLabelOfBoard == null
          ? null
          : Fragment$LabelFragment.fromJson(
              (l$updateLabelOfBoard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$LabelFragment? updateLabelOfBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLabelOfBoard = updateLabelOfBoard;
    _resultData['updateLabelOfBoard'] = l$updateLabelOfBoard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLabelOfBoard = updateLabelOfBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateLabelOfBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateLabelOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLabelOfBoard = updateLabelOfBoard;
    final lOther$updateLabelOfBoard = other.updateLabelOfBoard;
    if (l$updateLabelOfBoard != lOther$updateLabelOfBoard) {
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

extension UtilityExtension$Mutation$UpdateLabelOfBoard
    on Mutation$UpdateLabelOfBoard {
  CopyWith$Mutation$UpdateLabelOfBoard<Mutation$UpdateLabelOfBoard>
      get copyWith => CopyWith$Mutation$UpdateLabelOfBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateLabelOfBoard<TRes> {
  factory CopyWith$Mutation$UpdateLabelOfBoard(
    Mutation$UpdateLabelOfBoard instance,
    TRes Function(Mutation$UpdateLabelOfBoard) then,
  ) = _CopyWithImpl$Mutation$UpdateLabelOfBoard;

  factory CopyWith$Mutation$UpdateLabelOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateLabelOfBoard;

  TRes call({
    Fragment$LabelFragment? updateLabelOfBoard,
    String? $__typename,
  });
  CopyWith$Fragment$LabelFragment<TRes> get updateLabelOfBoard;
}

class _CopyWithImpl$Mutation$UpdateLabelOfBoard<TRes>
    implements CopyWith$Mutation$UpdateLabelOfBoard<TRes> {
  _CopyWithImpl$Mutation$UpdateLabelOfBoard(
    this._instance,
    this._then,
  );

  final Mutation$UpdateLabelOfBoard _instance;

  final TRes Function(Mutation$UpdateLabelOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateLabelOfBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateLabelOfBoard(
        updateLabelOfBoard: updateLabelOfBoard == _undefined
            ? _instance.updateLabelOfBoard
            : (updateLabelOfBoard as Fragment$LabelFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$LabelFragment<TRes> get updateLabelOfBoard {
    final local$updateLabelOfBoard = _instance.updateLabelOfBoard;
    return local$updateLabelOfBoard == null
        ? CopyWith$Fragment$LabelFragment.stub(_then(_instance))
        : CopyWith$Fragment$LabelFragment(
            local$updateLabelOfBoard, (e) => call(updateLabelOfBoard: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateLabelOfBoard<TRes>
    implements CopyWith$Mutation$UpdateLabelOfBoard<TRes> {
  _CopyWithStubImpl$Mutation$UpdateLabelOfBoard(this._res);

  TRes _res;

  call({
    Fragment$LabelFragment? updateLabelOfBoard,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$LabelFragment<TRes> get updateLabelOfBoard =>
      CopyWith$Fragment$LabelFragment.stub(_res);
}

const documentNodeMutationUpdateLabelOfBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateLabelOfBoard'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'idLabel')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'color')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
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
        name: NameNode(value: 'updateLabelOfBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idLabel'),
            value: VariableNode(name: NameNode(value: 'idLabel')),
          ),
          ArgumentNode(
            name: NameNode(value: 'color'),
            value: VariableNode(name: NameNode(value: 'color')),
          ),
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'LabelFragment'),
            directives: [],
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionLabelFragment,
]);
Mutation$UpdateLabelOfBoard _parserFn$Mutation$UpdateLabelOfBoard(
        Map<String, dynamic> data) =>
    Mutation$UpdateLabelOfBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateLabelOfBoard = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateLabelOfBoard?,
);

class Options$Mutation$UpdateLabelOfBoard
    extends graphql.MutationOptions<Mutation$UpdateLabelOfBoard> {
  Options$Mutation$UpdateLabelOfBoard({
    String? operationName,
    required Variables$Mutation$UpdateLabelOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateLabelOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateLabelOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateLabelOfBoard>? update,
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
                        : _parserFn$Mutation$UpdateLabelOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateLabelOfBoard,
          parserFn: _parserFn$Mutation$UpdateLabelOfBoard,
        );

  final OnMutationCompleted$Mutation$UpdateLabelOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateLabelOfBoard
    extends graphql.WatchQueryOptions<Mutation$UpdateLabelOfBoard> {
  WatchOptions$Mutation$UpdateLabelOfBoard({
    String? operationName,
    required Variables$Mutation$UpdateLabelOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateLabelOfBoard? typedOptimisticResult,
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
          document: documentNodeMutationUpdateLabelOfBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateLabelOfBoard,
        );
}

extension ClientExtension$Mutation$UpdateLabelOfBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateLabelOfBoard>>
      mutate$UpdateLabelOfBoard(
              Options$Mutation$UpdateLabelOfBoard options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateLabelOfBoard>
      watchMutation$UpdateLabelOfBoard(
              WatchOptions$Mutation$UpdateLabelOfBoard options) =>
          this.watchMutation(options);
}

class Mutation$UpdateLabelOfBoard$HookResult {
  Mutation$UpdateLabelOfBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateLabelOfBoard runMutation;

  final graphql.QueryResult<Mutation$UpdateLabelOfBoard> result;
}

Mutation$UpdateLabelOfBoard$HookResult useMutation$UpdateLabelOfBoard(
    [WidgetOptions$Mutation$UpdateLabelOfBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateLabelOfBoard());
  return Mutation$UpdateLabelOfBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateLabelOfBoard>
    useWatchMutation$UpdateLabelOfBoard(
            WatchOptions$Mutation$UpdateLabelOfBoard options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateLabelOfBoard
    extends graphql.MutationOptions<Mutation$UpdateLabelOfBoard> {
  WidgetOptions$Mutation$UpdateLabelOfBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateLabelOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateLabelOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateLabelOfBoard>? update,
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
                        : _parserFn$Mutation$UpdateLabelOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateLabelOfBoard,
          parserFn: _parserFn$Mutation$UpdateLabelOfBoard,
        );

  final OnMutationCompleted$Mutation$UpdateLabelOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateLabelOfBoard
    = graphql.MultiSourceResult<Mutation$UpdateLabelOfBoard> Function(
  Variables$Mutation$UpdateLabelOfBoard, {
  Object? optimisticResult,
  Mutation$UpdateLabelOfBoard? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateLabelOfBoard = widgets.Widget Function(
  RunMutation$Mutation$UpdateLabelOfBoard,
  graphql.QueryResult<Mutation$UpdateLabelOfBoard>?,
);

class Mutation$UpdateLabelOfBoard$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateLabelOfBoard> {
  Mutation$UpdateLabelOfBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateLabelOfBoard? options,
    required Builder$Mutation$UpdateLabelOfBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateLabelOfBoard(),
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
