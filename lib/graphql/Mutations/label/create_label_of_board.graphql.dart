import '../../Fragment/label_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$CreateLabelOfBoard {
  factory Variables$Mutation$CreateLabelOfBoard({
    required String idBoard,
    required String color,
    String? title,
  }) =>
      Variables$Mutation$CreateLabelOfBoard._({
        r'idBoard': idBoard,
        r'color': color,
        if (title != null) r'title': title,
      });

  Variables$Mutation$CreateLabelOfBoard._(this._$data);

  factory Variables$Mutation$CreateLabelOfBoard.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$idBoard = data['idBoard'];
    result$data['idBoard'] = (l$idBoard as String);
    final l$color = data['color'];
    result$data['color'] = (l$color as String);
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    return Variables$Mutation$CreateLabelOfBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get idBoard => (_$data['idBoard'] as String);

  String get color => (_$data['color'] as String);

  String? get title => (_$data['title'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$idBoard = idBoard;
    result$data['idBoard'] = l$idBoard;
    final l$color = color;
    result$data['color'] = l$color;
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateLabelOfBoard<
          Variables$Mutation$CreateLabelOfBoard>
      get copyWith => CopyWith$Variables$Mutation$CreateLabelOfBoard(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateLabelOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$idBoard = idBoard;
    final lOther$idBoard = other.idBoard;
    if (l$idBoard != lOther$idBoard) {
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
    final l$idBoard = idBoard;
    final l$color = color;
    final l$title = title;
    return Object.hashAll([
      l$idBoard,
      l$color,
      _$data.containsKey('title') ? l$title : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateLabelOfBoard<TRes> {
  factory CopyWith$Variables$Mutation$CreateLabelOfBoard(
    Variables$Mutation$CreateLabelOfBoard instance,
    TRes Function(Variables$Mutation$CreateLabelOfBoard) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateLabelOfBoard;

  factory CopyWith$Variables$Mutation$CreateLabelOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateLabelOfBoard;

  TRes call({
    String? idBoard,
    String? color,
    String? title,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateLabelOfBoard<TRes>
    implements CopyWith$Variables$Mutation$CreateLabelOfBoard<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateLabelOfBoard(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateLabelOfBoard _instance;

  final TRes Function(Variables$Mutation$CreateLabelOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? idBoard = _undefined,
    Object? color = _undefined,
    Object? title = _undefined,
  }) =>
      _then(Variables$Mutation$CreateLabelOfBoard._({
        ..._instance._$data,
        if (idBoard != _undefined && idBoard != null)
          'idBoard': (idBoard as String),
        if (color != _undefined && color != null) 'color': (color as String),
        if (title != _undefined) 'title': (title as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateLabelOfBoard<TRes>
    implements CopyWith$Variables$Mutation$CreateLabelOfBoard<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateLabelOfBoard(this._res);

  TRes _res;

  call({
    String? idBoard,
    String? color,
    String? title,
  }) =>
      _res;
}

class Mutation$CreateLabelOfBoard {
  Mutation$CreateLabelOfBoard({
    this.createLabelOfBoard,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateLabelOfBoard.fromJson(Map<String, dynamic> json) {
    final l$createLabelOfBoard = json['createLabelOfBoard'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateLabelOfBoard(
      createLabelOfBoard: l$createLabelOfBoard == null
          ? null
          : Fragment$LabelFragment.fromJson(
              (l$createLabelOfBoard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$LabelFragment? createLabelOfBoard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createLabelOfBoard = createLabelOfBoard;
    _resultData['createLabelOfBoard'] = l$createLabelOfBoard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createLabelOfBoard = createLabelOfBoard;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createLabelOfBoard,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateLabelOfBoard) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createLabelOfBoard = createLabelOfBoard;
    final lOther$createLabelOfBoard = other.createLabelOfBoard;
    if (l$createLabelOfBoard != lOther$createLabelOfBoard) {
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

extension UtilityExtension$Mutation$CreateLabelOfBoard
    on Mutation$CreateLabelOfBoard {
  CopyWith$Mutation$CreateLabelOfBoard<Mutation$CreateLabelOfBoard>
      get copyWith => CopyWith$Mutation$CreateLabelOfBoard(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateLabelOfBoard<TRes> {
  factory CopyWith$Mutation$CreateLabelOfBoard(
    Mutation$CreateLabelOfBoard instance,
    TRes Function(Mutation$CreateLabelOfBoard) then,
  ) = _CopyWithImpl$Mutation$CreateLabelOfBoard;

  factory CopyWith$Mutation$CreateLabelOfBoard.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateLabelOfBoard;

  TRes call({
    Fragment$LabelFragment? createLabelOfBoard,
    String? $__typename,
  });
  CopyWith$Fragment$LabelFragment<TRes> get createLabelOfBoard;
}

class _CopyWithImpl$Mutation$CreateLabelOfBoard<TRes>
    implements CopyWith$Mutation$CreateLabelOfBoard<TRes> {
  _CopyWithImpl$Mutation$CreateLabelOfBoard(
    this._instance,
    this._then,
  );

  final Mutation$CreateLabelOfBoard _instance;

  final TRes Function(Mutation$CreateLabelOfBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createLabelOfBoard = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateLabelOfBoard(
        createLabelOfBoard: createLabelOfBoard == _undefined
            ? _instance.createLabelOfBoard
            : (createLabelOfBoard as Fragment$LabelFragment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$LabelFragment<TRes> get createLabelOfBoard {
    final local$createLabelOfBoard = _instance.createLabelOfBoard;
    return local$createLabelOfBoard == null
        ? CopyWith$Fragment$LabelFragment.stub(_then(_instance))
        : CopyWith$Fragment$LabelFragment(
            local$createLabelOfBoard, (e) => call(createLabelOfBoard: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateLabelOfBoard<TRes>
    implements CopyWith$Mutation$CreateLabelOfBoard<TRes> {
  _CopyWithStubImpl$Mutation$CreateLabelOfBoard(this._res);

  TRes _res;

  call({
    Fragment$LabelFragment? createLabelOfBoard,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$LabelFragment<TRes> get createLabelOfBoard =>
      CopyWith$Fragment$LabelFragment.stub(_res);
}

const documentNodeMutationCreateLabelOfBoard = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateLabelOfBoard'),
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
        name: NameNode(value: 'createLabelOfBoard'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'idBoard'),
            value: VariableNode(name: NameNode(value: 'idBoard')),
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
Mutation$CreateLabelOfBoard _parserFn$Mutation$CreateLabelOfBoard(
        Map<String, dynamic> data) =>
    Mutation$CreateLabelOfBoard.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateLabelOfBoard = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CreateLabelOfBoard?,
);

class Options$Mutation$CreateLabelOfBoard
    extends graphql.MutationOptions<Mutation$CreateLabelOfBoard> {
  Options$Mutation$CreateLabelOfBoard({
    String? operationName,
    required Variables$Mutation$CreateLabelOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateLabelOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateLabelOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateLabelOfBoard>? update,
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
                        : _parserFn$Mutation$CreateLabelOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateLabelOfBoard,
          parserFn: _parserFn$Mutation$CreateLabelOfBoard,
        );

  final OnMutationCompleted$Mutation$CreateLabelOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateLabelOfBoard
    extends graphql.WatchQueryOptions<Mutation$CreateLabelOfBoard> {
  WatchOptions$Mutation$CreateLabelOfBoard({
    String? operationName,
    required Variables$Mutation$CreateLabelOfBoard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateLabelOfBoard? typedOptimisticResult,
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
          document: documentNodeMutationCreateLabelOfBoard,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateLabelOfBoard,
        );
}

extension ClientExtension$Mutation$CreateLabelOfBoard on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateLabelOfBoard>>
      mutate$CreateLabelOfBoard(
              Options$Mutation$CreateLabelOfBoard options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateLabelOfBoard>
      watchMutation$CreateLabelOfBoard(
              WatchOptions$Mutation$CreateLabelOfBoard options) =>
          this.watchMutation(options);
}

class Mutation$CreateLabelOfBoard$HookResult {
  Mutation$CreateLabelOfBoard$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateLabelOfBoard runMutation;

  final graphql.QueryResult<Mutation$CreateLabelOfBoard> result;
}

Mutation$CreateLabelOfBoard$HookResult useMutation$CreateLabelOfBoard(
    [WidgetOptions$Mutation$CreateLabelOfBoard? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateLabelOfBoard());
  return Mutation$CreateLabelOfBoard$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateLabelOfBoard>
    useWatchMutation$CreateLabelOfBoard(
            WatchOptions$Mutation$CreateLabelOfBoard options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateLabelOfBoard
    extends graphql.MutationOptions<Mutation$CreateLabelOfBoard> {
  WidgetOptions$Mutation$CreateLabelOfBoard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateLabelOfBoard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateLabelOfBoard? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateLabelOfBoard>? update,
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
                        : _parserFn$Mutation$CreateLabelOfBoard(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateLabelOfBoard,
          parserFn: _parserFn$Mutation$CreateLabelOfBoard,
        );

  final OnMutationCompleted$Mutation$CreateLabelOfBoard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateLabelOfBoard
    = graphql.MultiSourceResult<Mutation$CreateLabelOfBoard> Function(
  Variables$Mutation$CreateLabelOfBoard, {
  Object? optimisticResult,
  Mutation$CreateLabelOfBoard? typedOptimisticResult,
});
typedef Builder$Mutation$CreateLabelOfBoard = widgets.Widget Function(
  RunMutation$Mutation$CreateLabelOfBoard,
  graphql.QueryResult<Mutation$CreateLabelOfBoard>?,
);

class Mutation$CreateLabelOfBoard$Widget
    extends graphql_flutter.Mutation<Mutation$CreateLabelOfBoard> {
  Mutation$CreateLabelOfBoard$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateLabelOfBoard? options,
    required Builder$Mutation$CreateLabelOfBoard builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateLabelOfBoard(),
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
