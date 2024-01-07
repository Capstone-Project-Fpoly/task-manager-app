import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$getAllBooks {
  Query$getAllBooks({
    this.books,
    this.$__typename = 'Query',
  });

  factory Query$getAllBooks.fromJson(Map<String, dynamic> json) {
    final l$books = json['books'];
    final l$$__typename = json['__typename'];
    return Query$getAllBooks(
      books: (l$books as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getAllBooks$books.fromJson((e as Map<String, dynamic>)),)
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getAllBooks$books?>? books;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$books = books;
    resultData['books'] = l$books?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$books = books;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$books == null ? null : Object.hashAll(l$books.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$getAllBooks || runtimeType != other.runtimeType) {
      return false;
    }
    final l$books = books;
    final lOther$books = other.books;
    if (l$books != null && lOther$books != null) {
      if (l$books.length != lOther$books.length) {
        return false;
      }
      for (int i = 0; i < l$books.length; i++) {
        final l$books$entry = l$books[i];
        final lOther$books$entry = lOther$books[i];
        if (l$books$entry != lOther$books$entry) {
          return false;
        }
      }
    } else if (l$books != lOther$books) {
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

extension UtilityExtension$Query$getAllBooks on Query$getAllBooks {
  CopyWith$Query$getAllBooks<Query$getAllBooks> get copyWith =>
      CopyWith$Query$getAllBooks(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getAllBooks<TRes> {
  factory CopyWith$Query$getAllBooks(
    Query$getAllBooks instance,
    TRes Function(Query$getAllBooks) then,
  ) = _CopyWithImpl$Query$getAllBooks;

  factory CopyWith$Query$getAllBooks.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllBooks;

  TRes call({
    List<Query$getAllBooks$books?>? books,
    String? $__typename,
  });
  TRes books(
      Iterable<Query$getAllBooks$books?>? Function(
              Iterable<
                  CopyWith$Query$getAllBooks$books<Query$getAllBooks$books>?>?,)
          fn,);
}

class _CopyWithImpl$Query$getAllBooks<TRes>
    implements CopyWith$Query$getAllBooks<TRes> {
  _CopyWithImpl$Query$getAllBooks(
    this._instance,
    this._then,
  );

  final Query$getAllBooks _instance;

  final TRes Function(Query$getAllBooks) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? books = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllBooks(
        books: books == _undefined
            ? _instance.books
            : (books as List<Query$getAllBooks$books?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);

  @override
  TRes books(
          Iterable<Query$getAllBooks$books?>? Function(
                  Iterable<
                      CopyWith$Query$getAllBooks$books<
                          Query$getAllBooks$books>?>?,)
              fn,) =>
      call(
          books: fn(_instance.books?.map((e) => e == null
              ? null
              : CopyWith$Query$getAllBooks$books(
                  e,
                  (i) => i,
                ),),)?.toList(),);
}

class _CopyWithStubImpl$Query$getAllBooks<TRes>
    implements CopyWith$Query$getAllBooks<TRes> {
  _CopyWithStubImpl$Query$getAllBooks(this._res);

  final TRes _res;

  @override
  call({
    List<Query$getAllBooks$books?>? books,
    String? $__typename,
  }) =>
      _res;

  @override
  books(fn) => _res;
}

const documentNodeQuerygetAllBooks = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getAllBooks'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'books'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'genre'),
            alias: null,
            arguments: [],
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
Query$getAllBooks _parserFn$Query$getAllBooks(Map<String, dynamic> data) =>
    Query$getAllBooks.fromJson(data);
typedef OnQueryComplete$Query$getAllBooks = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getAllBooks?,
);

class Options$Query$getAllBooks
    extends graphql.QueryOptions<Query$getAllBooks> {
  Options$Query$getAllBooks({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getAllBooks? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getAllBooks? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$getAllBooks(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetAllBooks,
          parserFn: _parserFn$Query$getAllBooks,
        );

  final OnQueryComplete$Query$getAllBooks? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getAllBooks
    extends graphql.WatchQueryOptions<Query$getAllBooks> {
  WatchOptions$Query$getAllBooks({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getAllBooks? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerygetAllBooks,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getAllBooks,
        );
}

class FetchMoreOptions$Query$getAllBooks extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getAllBooks({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetAllBooks,
        );
}

extension ClientExtension$Query$getAllBooks on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getAllBooks>> query$getAllBooks(
          [Options$Query$getAllBooks? options,]) async =>
      await query(options ?? Options$Query$getAllBooks());
  graphql.ObservableQuery<Query$getAllBooks> watchQuery$getAllBooks(
          [WatchOptions$Query$getAllBooks? options,]) =>
      watchQuery(options ?? WatchOptions$Query$getAllBooks());
  void writeQuery$getAllBooks({
    required Query$getAllBooks data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetAllBooks),),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getAllBooks? readQuery$getAllBooks({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetAllBooks),),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getAllBooks.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getAllBooks> useQuery$getAllBooks(
        [Options$Query$getAllBooks? options,]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getAllBooks());
graphql.ObservableQuery<Query$getAllBooks> useWatchQuery$getAllBooks(
        [WatchOptions$Query$getAllBooks? options,]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$getAllBooks());

class Query$getAllBooks$Widget
    extends graphql_flutter.Query<Query$getAllBooks> {
  Query$getAllBooks$Widget({
    widgets.Key? key,
    Options$Query$getAllBooks? options,
    required graphql_flutter.QueryBuilder<Query$getAllBooks> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getAllBooks(),
          builder: builder,
        );
}

class Query$getAllBooks$books {
  Query$getAllBooks$books({
    this.name,
    this.id,
    this.genre,
    this.$__typename = 'Book',
  });

  factory Query$getAllBooks$books.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$id = json['id'];
    final l$genre = json['genre'];
    final l$$__typename = json['__typename'];
    return Query$getAllBooks$books(
      name: (l$name as String?),
      id: (l$id as String?),
      genre: (l$genre as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String? id;

  final String? genre;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$name = name;
    resultData['name'] = l$name;
    final l$id = id;
    resultData['id'] = l$id;
    final l$genre = genre;
    resultData['genre'] = l$genre;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$id = id;
    final l$genre = genre;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$id,
      l$genre,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$getAllBooks$books ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$genre = genre;
    final lOther$genre = other.genre;
    if (l$genre != lOther$genre) {
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

extension UtilityExtension$Query$getAllBooks$books on Query$getAllBooks$books {
  CopyWith$Query$getAllBooks$books<Query$getAllBooks$books> get copyWith =>
      CopyWith$Query$getAllBooks$books(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getAllBooks$books<TRes> {
  factory CopyWith$Query$getAllBooks$books(
    Query$getAllBooks$books instance,
    TRes Function(Query$getAllBooks$books) then,
  ) = _CopyWithImpl$Query$getAllBooks$books;

  factory CopyWith$Query$getAllBooks$books.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllBooks$books;

  TRes call({
    String? name,
    String? id,
    String? genre,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getAllBooks$books<TRes>
    implements CopyWith$Query$getAllBooks$books<TRes> {
  _CopyWithImpl$Query$getAllBooks$books(
    this._instance,
    this._then,
  );

  final Query$getAllBooks$books _instance;

  final TRes Function(Query$getAllBooks$books) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? name = _undefined,
    Object? id = _undefined,
    Object? genre = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllBooks$books(
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined ? _instance.id : (id as String?),
        genre: genre == _undefined ? _instance.genre : (genre as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ),);
}

class _CopyWithStubImpl$Query$getAllBooks$books<TRes>
    implements CopyWith$Query$getAllBooks$books<TRes> {
  _CopyWithStubImpl$Query$getAllBooks$books(this._res);

  final TRes _res;

  @override
  call({
    String? name,
    String? id,
    String? genre,
    String? $__typename,
  }) =>
      _res;
}
