class Input$CheckListInput {
  factory Input$CheckListInput({
    required String content,
    required bool isChecked,
  }) =>
      Input$CheckListInput._({
        r'content': content,
        r'isChecked': isChecked,
      });

  Input$CheckListInput._(this._$data);

  factory Input$CheckListInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    final l$isChecked = data['isChecked'];
    result$data['isChecked'] = (l$isChecked as bool);
    return Input$CheckListInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get content => (_$data['content'] as String);

  bool get isChecked => (_$data['isChecked'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$content = content;
    result$data['content'] = l$content;
    final l$isChecked = isChecked;
    result$data['isChecked'] = l$isChecked;
    return result$data;
  }

  CopyWith$Input$CheckListInput<Input$CheckListInput> get copyWith =>
      CopyWith$Input$CheckListInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CheckListInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$isChecked = isChecked;
    final lOther$isChecked = other.isChecked;
    if (l$isChecked != lOther$isChecked) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$content = content;
    final l$isChecked = isChecked;
    return Object.hashAll([
      l$content,
      l$isChecked,
    ]);
  }
}

abstract class CopyWith$Input$CheckListInput<TRes> {
  factory CopyWith$Input$CheckListInput(
    Input$CheckListInput instance,
    TRes Function(Input$CheckListInput) then,
  ) = _CopyWithImpl$Input$CheckListInput;

  factory CopyWith$Input$CheckListInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CheckListInput;

  TRes call({
    String? content,
    bool? isChecked,
  });
}

class _CopyWithImpl$Input$CheckListInput<TRes>
    implements CopyWith$Input$CheckListInput<TRes> {
  _CopyWithImpl$Input$CheckListInput(
    this._instance,
    this._then,
  );

  final Input$CheckListInput _instance;

  final TRes Function(Input$CheckListInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? content = _undefined,
    Object? isChecked = _undefined,
  }) =>
      _then(
        Input$CheckListInput._({
          ..._instance._$data,
          if (content != _undefined && content != null)
            'content': (content as String),
          if (isChecked != _undefined && isChecked != null)
            'isChecked': (isChecked as bool),
        }),
      );
}

class _CopyWithStubImpl$Input$CheckListInput<TRes>
    implements CopyWith$Input$CheckListInput<TRes> {
  _CopyWithStubImpl$Input$CheckListInput(this._res);

  final TRes _res;

  @override
  call({
    String? content,
    bool? isChecked,
  }) =>
      _res;
}

class Input$InputEmail {
  factory Input$InputEmail({
    required String email,
    required String passWord,
  }) =>
      Input$InputEmail._({
        r'email': email,
        r'passWord': passWord,
      });

  Input$InputEmail._(this._$data);

  factory Input$InputEmail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$passWord = data['passWord'];
    result$data['passWord'] = (l$passWord as String);
    return Input$InputEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get passWord => (_$data['passWord'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$passWord = passWord;
    result$data['passWord'] = l$passWord;
    return result$data;
  }

  CopyWith$Input$InputEmail<Input$InputEmail> get copyWith =>
      CopyWith$Input$InputEmail(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputEmail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$passWord = passWord;
    final lOther$passWord = other.passWord;
    if (l$passWord != lOther$passWord) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$passWord = passWord;
    return Object.hashAll([
      l$email,
      l$passWord,
    ]);
  }
}

abstract class CopyWith$Input$InputEmail<TRes> {
  factory CopyWith$Input$InputEmail(
    Input$InputEmail instance,
    TRes Function(Input$InputEmail) then,
  ) = _CopyWithImpl$Input$InputEmail;

  factory CopyWith$Input$InputEmail.stub(TRes res) =
      _CopyWithStubImpl$Input$InputEmail;

  TRes call({
    String? email,
    String? passWord,
  });
}

class _CopyWithImpl$Input$InputEmail<TRes>
    implements CopyWith$Input$InputEmail<TRes> {
  _CopyWithImpl$Input$InputEmail(
    this._instance,
    this._then,
  );

  final Input$InputEmail _instance;

  final TRes Function(Input$InputEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? email = _undefined,
    Object? passWord = _undefined,
  }) =>
      _then(
        Input$InputEmail._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (passWord != _undefined && passWord != null)
            'passWord': (passWord as String),
        }),
      );
}

class _CopyWithStubImpl$Input$InputEmail<TRes>
    implements CopyWith$Input$InputEmail<TRes> {
  _CopyWithStubImpl$Input$InputEmail(this._res);

  final TRes _res;

  @override
  call({
    String? email,
    String? passWord,
  }) =>
      _res;
}

class Input$InputLogin {
  factory Input$InputLogin({
    required String deviceId,
    required String idToken,
  }) =>
      Input$InputLogin._({
        r'deviceId': deviceId,
        r'idToken': idToken,
      });

  Input$InputLogin._(this._$data);

  factory Input$InputLogin.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$deviceId = data['deviceId'];
    result$data['deviceId'] = (l$deviceId as String);
    final l$idToken = data['idToken'];
    result$data['idToken'] = (l$idToken as String);
    return Input$InputLogin._(result$data);
  }

  Map<String, dynamic> _$data;

  String get deviceId => (_$data['deviceId'] as String);

  String get idToken => (_$data['idToken'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$deviceId = deviceId;
    result$data['deviceId'] = l$deviceId;
    final l$idToken = idToken;
    result$data['idToken'] = l$idToken;
    return result$data;
  }

  CopyWith$Input$InputLogin<Input$InputLogin> get copyWith =>
      CopyWith$Input$InputLogin(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputLogin || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deviceId = deviceId;
    final lOther$deviceId = other.deviceId;
    if (l$deviceId != lOther$deviceId) {
      return false;
    }
    final l$idToken = idToken;
    final lOther$idToken = other.idToken;
    if (l$idToken != lOther$idToken) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$deviceId = deviceId;
    final l$idToken = idToken;
    return Object.hashAll([
      l$deviceId,
      l$idToken,
    ]);
  }
}

abstract class CopyWith$Input$InputLogin<TRes> {
  factory CopyWith$Input$InputLogin(
    Input$InputLogin instance,
    TRes Function(Input$InputLogin) then,
  ) = _CopyWithImpl$Input$InputLogin;

  factory CopyWith$Input$InputLogin.stub(TRes res) =
      _CopyWithStubImpl$Input$InputLogin;

  TRes call({
    String? deviceId,
    String? idToken,
  });
}

class _CopyWithImpl$Input$InputLogin<TRes>
    implements CopyWith$Input$InputLogin<TRes> {
  _CopyWithImpl$Input$InputLogin(
    this._instance,
    this._then,
  );

  final Input$InputLogin _instance;

  final TRes Function(Input$InputLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? deviceId = _undefined,
    Object? idToken = _undefined,
  }) =>
      _then(
        Input$InputLogin._({
          ..._instance._$data,
          if (deviceId != _undefined && deviceId != null)
            'deviceId': (deviceId as String),
          if (idToken != _undefined && idToken != null)
            'idToken': (idToken as String),
        }),
      );
}

class _CopyWithStubImpl$Input$InputLogin<TRes>
    implements CopyWith$Input$InputLogin<TRes> {
  _CopyWithStubImpl$Input$InputLogin(this._res);

  final TRes _res;

  @override
  call({
    String? deviceId,
    String? idToken,
  }) =>
      _res;
}

class Input$InputMoveCard {
  factory Input$InputMoveCard({
    required int newItemIndex,
    required int newListIndex,
    required int oldItemIndex,
    required int oldListIndex,
  }) =>
      Input$InputMoveCard._({
        r'newItemIndex': newItemIndex,
        r'newListIndex': newListIndex,
        r'oldItemIndex': oldItemIndex,
        r'oldListIndex': oldListIndex,
      });

  Input$InputMoveCard._(this._$data);

  factory Input$InputMoveCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$newItemIndex = data['newItemIndex'];
    result$data['newItemIndex'] = (l$newItemIndex as int);
    final l$newListIndex = data['newListIndex'];
    result$data['newListIndex'] = (l$newListIndex as int);
    final l$oldItemIndex = data['oldItemIndex'];
    result$data['oldItemIndex'] = (l$oldItemIndex as int);
    final l$oldListIndex = data['oldListIndex'];
    result$data['oldListIndex'] = (l$oldListIndex as int);
    return Input$InputMoveCard._(result$data);
  }

  Map<String, dynamic> _$data;

  int get newItemIndex => (_$data['newItemIndex'] as int);

  int get newListIndex => (_$data['newListIndex'] as int);

  int get oldItemIndex => (_$data['oldItemIndex'] as int);

  int get oldListIndex => (_$data['oldListIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$newItemIndex = newItemIndex;
    result$data['newItemIndex'] = l$newItemIndex;
    final l$newListIndex = newListIndex;
    result$data['newListIndex'] = l$newListIndex;
    final l$oldItemIndex = oldItemIndex;
    result$data['oldItemIndex'] = l$oldItemIndex;
    final l$oldListIndex = oldListIndex;
    result$data['oldListIndex'] = l$oldListIndex;
    return result$data;
  }

  CopyWith$Input$InputMoveCard<Input$InputMoveCard> get copyWith =>
      CopyWith$Input$InputMoveCard(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputMoveCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$newItemIndex = newItemIndex;
    final lOther$newItemIndex = other.newItemIndex;
    if (l$newItemIndex != lOther$newItemIndex) {
      return false;
    }
    final l$newListIndex = newListIndex;
    final lOther$newListIndex = other.newListIndex;
    if (l$newListIndex != lOther$newListIndex) {
      return false;
    }
    final l$oldItemIndex = oldItemIndex;
    final lOther$oldItemIndex = other.oldItemIndex;
    if (l$oldItemIndex != lOther$oldItemIndex) {
      return false;
    }
    final l$oldListIndex = oldListIndex;
    final lOther$oldListIndex = other.oldListIndex;
    if (l$oldListIndex != lOther$oldListIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$newItemIndex = newItemIndex;
    final l$newListIndex = newListIndex;
    final l$oldItemIndex = oldItemIndex;
    final l$oldListIndex = oldListIndex;
    return Object.hashAll([
      l$newItemIndex,
      l$newListIndex,
      l$oldItemIndex,
      l$oldListIndex,
    ]);
  }
}

abstract class CopyWith$Input$InputMoveCard<TRes> {
  factory CopyWith$Input$InputMoveCard(
    Input$InputMoveCard instance,
    TRes Function(Input$InputMoveCard) then,
  ) = _CopyWithImpl$Input$InputMoveCard;

  factory CopyWith$Input$InputMoveCard.stub(TRes res) =
      _CopyWithStubImpl$Input$InputMoveCard;

  TRes call({
    int? newItemIndex,
    int? newListIndex,
    int? oldItemIndex,
    int? oldListIndex,
  });
}

class _CopyWithImpl$Input$InputMoveCard<TRes>
    implements CopyWith$Input$InputMoveCard<TRes> {
  _CopyWithImpl$Input$InputMoveCard(
    this._instance,
    this._then,
  );

  final Input$InputMoveCard _instance;

  final TRes Function(Input$InputMoveCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? newItemIndex = _undefined,
    Object? newListIndex = _undefined,
    Object? oldItemIndex = _undefined,
    Object? oldListIndex = _undefined,
  }) =>
      _then(
        Input$InputMoveCard._({
          ..._instance._$data,
          if (newItemIndex != _undefined && newItemIndex != null)
            'newItemIndex': (newItemIndex as int),
          if (newListIndex != _undefined && newListIndex != null)
            'newListIndex': (newListIndex as int),
          if (oldItemIndex != _undefined && oldItemIndex != null)
            'oldItemIndex': (oldItemIndex as int),
          if (oldListIndex != _undefined && oldListIndex != null)
            'oldListIndex': (oldListIndex as int),
        }),
      );
}

class _CopyWithStubImpl$Input$InputMoveCard<TRes>
    implements CopyWith$Input$InputMoveCard<TRes> {
  _CopyWithStubImpl$Input$InputMoveCard(this._res);

  final TRes _res;

  @override
  call({
    int? newItemIndex,
    int? newListIndex,
    int? oldItemIndex,
    int? oldListIndex,
  }) =>
      _res;
}

class Input$InputMoveList {
  factory Input$InputMoveList({
    required int newListIndex,
    required int oldListIndex,
  }) =>
      Input$InputMoveList._({
        r'newListIndex': newListIndex,
        r'oldListIndex': oldListIndex,
      });

  Input$InputMoveList._(this._$data);

  factory Input$InputMoveList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$newListIndex = data['newListIndex'];
    result$data['newListIndex'] = (l$newListIndex as int);
    final l$oldListIndex = data['oldListIndex'];
    result$data['oldListIndex'] = (l$oldListIndex as int);
    return Input$InputMoveList._(result$data);
  }

  Map<String, dynamic> _$data;

  int get newListIndex => (_$data['newListIndex'] as int);

  int get oldListIndex => (_$data['oldListIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$newListIndex = newListIndex;
    result$data['newListIndex'] = l$newListIndex;
    final l$oldListIndex = oldListIndex;
    result$data['oldListIndex'] = l$oldListIndex;
    return result$data;
  }

  CopyWith$Input$InputMoveList<Input$InputMoveList> get copyWith =>
      CopyWith$Input$InputMoveList(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputMoveList || runtimeType != other.runtimeType) {
      return false;
    }
    final l$newListIndex = newListIndex;
    final lOther$newListIndex = other.newListIndex;
    if (l$newListIndex != lOther$newListIndex) {
      return false;
    }
    final l$oldListIndex = oldListIndex;
    final lOther$oldListIndex = other.oldListIndex;
    if (l$oldListIndex != lOther$oldListIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$newListIndex = newListIndex;
    final l$oldListIndex = oldListIndex;
    return Object.hashAll([
      l$newListIndex,
      l$oldListIndex,
    ]);
  }
}

abstract class CopyWith$Input$InputMoveList<TRes> {
  factory CopyWith$Input$InputMoveList(
    Input$InputMoveList instance,
    TRes Function(Input$InputMoveList) then,
  ) = _CopyWithImpl$Input$InputMoveList;

  factory CopyWith$Input$InputMoveList.stub(TRes res) =
      _CopyWithStubImpl$Input$InputMoveList;

  TRes call({
    int? newListIndex,
    int? oldListIndex,
  });
}

class _CopyWithImpl$Input$InputMoveList<TRes>
    implements CopyWith$Input$InputMoveList<TRes> {
  _CopyWithImpl$Input$InputMoveList(
    this._instance,
    this._then,
  );

  final Input$InputMoveList _instance;

  final TRes Function(Input$InputMoveList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? newListIndex = _undefined,
    Object? oldListIndex = _undefined,
  }) =>
      _then(
        Input$InputMoveList._({
          ..._instance._$data,
          if (newListIndex != _undefined && newListIndex != null)
            'newListIndex': (newListIndex as int),
          if (oldListIndex != _undefined && oldListIndex != null)
            'oldListIndex': (oldListIndex as int),
        }),
      );
}

class _CopyWithStubImpl$Input$InputMoveList<TRes>
    implements CopyWith$Input$InputMoveList<TRes> {
  _CopyWithStubImpl$Input$InputMoveList(this._res);

  final TRes _res;

  @override
  call({
    int? newListIndex,
    int? oldListIndex,
  }) =>
      _res;
}

class Input$InputUpdateBoard {
  factory Input$InputUpdateBoard({
    String? color,
    bool? isPublic,
    String? title,
  }) =>
      Input$InputUpdateBoard._({
        if (color != null) r'color': color,
        if (isPublic != null) r'isPublic': isPublic,
        if (title != null) r'title': title,
      });

  Input$InputUpdateBoard._(this._$data);

  factory Input$InputUpdateBoard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('color')) {
      final l$color = data['color'];
      result$data['color'] = (l$color as String?);
    }
    if (data.containsKey('isPublic')) {
      final l$isPublic = data['isPublic'];
      result$data['isPublic'] = (l$isPublic as bool?);
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    return Input$InputUpdateBoard._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get color => (_$data['color'] as String?);

  bool? get isPublic => (_$data['isPublic'] as bool?);

  String? get title => (_$data['title'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('color')) {
      final l$color = color;
      result$data['color'] = l$color;
    }
    if (_$data.containsKey('isPublic')) {
      final l$isPublic = isPublic;
      result$data['isPublic'] = l$isPublic;
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    return result$data;
  }

  CopyWith$Input$InputUpdateBoard<Input$InputUpdateBoard> get copyWith =>
      CopyWith$Input$InputUpdateBoard(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputUpdateBoard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (_$data.containsKey('color') != other._$data.containsKey('color')) {
      return false;
    }
    if (l$color != lOther$color) {
      return false;
    }
    final l$isPublic = isPublic;
    final lOther$isPublic = other.isPublic;
    if (_$data.containsKey('isPublic') !=
        other._$data.containsKey('isPublic')) {
      return false;
    }
    if (l$isPublic != lOther$isPublic) {
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
    final l$color = color;
    final l$isPublic = isPublic;
    final l$title = title;
    return Object.hashAll([
      _$data.containsKey('color') ? l$color : const {},
      _$data.containsKey('isPublic') ? l$isPublic : const {},
      _$data.containsKey('title') ? l$title : const {},
    ]);
  }
}

abstract class CopyWith$Input$InputUpdateBoard<TRes> {
  factory CopyWith$Input$InputUpdateBoard(
    Input$InputUpdateBoard instance,
    TRes Function(Input$InputUpdateBoard) then,
  ) = _CopyWithImpl$Input$InputUpdateBoard;

  factory CopyWith$Input$InputUpdateBoard.stub(TRes res) =
      _CopyWithStubImpl$Input$InputUpdateBoard;

  TRes call({
    String? color,
    bool? isPublic,
    String? title,
  });
}

class _CopyWithImpl$Input$InputUpdateBoard<TRes>
    implements CopyWith$Input$InputUpdateBoard<TRes> {
  _CopyWithImpl$Input$InputUpdateBoard(
    this._instance,
    this._then,
  );

  final Input$InputUpdateBoard _instance;

  final TRes Function(Input$InputUpdateBoard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? color = _undefined,
    Object? isPublic = _undefined,
    Object? title = _undefined,
  }) =>
      _then(
        Input$InputUpdateBoard._({
          ..._instance._$data,
          if (color != _undefined) 'color': (color as String?),
          if (isPublic != _undefined) 'isPublic': (isPublic as bool?),
          if (title != _undefined) 'title': (title as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$InputUpdateBoard<TRes>
    implements CopyWith$Input$InputUpdateBoard<TRes> {
  _CopyWithStubImpl$Input$InputUpdateBoard(this._res);

  final TRes _res;

  @override
  call({
    String? color,
    bool? isPublic,
    String? title,
  }) =>
      _res;
}

class Input$InputUpdateCard {
  factory Input$InputUpdateCard({
    List<Input$CheckListInput>? checkLists,
    String? description,
    String? endDate,
    required String idCard,
    required Enum$Reminder reminder,
    String? startedDate,
    String? title,
    List<String>? users,
  }) =>
      Input$InputUpdateCard._({
        if (checkLists != null) r'checkLists': checkLists,
        if (description != null) r'description': description,
        if (endDate != null) r'endDate': endDate,
        r'idCard': idCard,
        r'reminder': reminder,
        if (startedDate != null) r'startedDate': startedDate,
        if (title != null) r'title': title,
        if (users != null) r'users': users,
      });

  Input$InputUpdateCard._(this._$data);

  factory Input$InputUpdateCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('checkLists')) {
      final l$checkLists = data['checkLists'];
      result$data['checkLists'] = (l$checkLists as List<dynamic>?)
          ?.map(
            (e) => Input$CheckListInput.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] = (l$endDate as String?);
    }
    final l$idCard = data['idCard'];
    result$data['idCard'] = (l$idCard as String);
    final l$reminder = data['reminder'];
    result$data['reminder'] = fromJson$Enum$Reminder((l$reminder as String));
    if (data.containsKey('startedDate')) {
      final l$startedDate = data['startedDate'];
      result$data['startedDate'] = (l$startedDate as String?);
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('users')) {
      final l$users = data['users'];
      result$data['users'] =
          (l$users as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$InputUpdateCard._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$CheckListInput>? get checkLists =>
      (_$data['checkLists'] as List<Input$CheckListInput>?);

  String? get description => (_$data['description'] as String?);

  String? get endDate => (_$data['endDate'] as String?);

  String get idCard => (_$data['idCard'] as String);

  Enum$Reminder get reminder => (_$data['reminder'] as Enum$Reminder);

  String? get startedDate => (_$data['startedDate'] as String?);

  String? get title => (_$data['title'] as String?);

  List<String>? get users => (_$data['users'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('checkLists')) {
      final l$checkLists = checkLists;
      result$data['checkLists'] = l$checkLists?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate;
    }
    final l$idCard = idCard;
    result$data['idCard'] = l$idCard;
    final l$reminder = reminder;
    result$data['reminder'] = toJson$Enum$Reminder(l$reminder);
    if (_$data.containsKey('startedDate')) {
      final l$startedDate = startedDate;
      result$data['startedDate'] = l$startedDate;
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('users')) {
      final l$users = users;
      result$data['users'] = l$users?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$InputUpdateCard<Input$InputUpdateCard> get copyWith =>
      CopyWith$Input$InputUpdateCard(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputUpdateCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkLists = checkLists;
    final lOther$checkLists = other.checkLists;
    if (_$data.containsKey('checkLists') !=
        other._$data.containsKey('checkLists')) {
      return false;
    }
    if (l$checkLists != null && lOther$checkLists != null) {
      if (l$checkLists.length != lOther$checkLists.length) {
        return false;
      }
      for (int i = 0; i < l$checkLists.length; i++) {
        final l$checkLists$entry = l$checkLists[i];
        final lOther$checkLists$entry = lOther$checkLists[i];
        if (l$checkLists$entry != lOther$checkLists$entry) {
          return false;
        }
      }
    } else if (l$checkLists != lOther$checkLists) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$idCard = idCard;
    final lOther$idCard = other.idCard;
    if (l$idCard != lOther$idCard) {
      return false;
    }
    final l$reminder = reminder;
    final lOther$reminder = other.reminder;
    if (l$reminder != lOther$reminder) {
      return false;
    }
    final l$startedDate = startedDate;
    final lOther$startedDate = other.startedDate;
    if (_$data.containsKey('startedDate') !=
        other._$data.containsKey('startedDate')) {
      return false;
    }
    if (l$startedDate != lOther$startedDate) {
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
    final l$users = users;
    final lOther$users = other.users;
    if (_$data.containsKey('users') != other._$data.containsKey('users')) {
      return false;
    }
    if (l$users != null && lOther$users != null) {
      if (l$users.length != lOther$users.length) {
        return false;
      }
      for (int i = 0; i < l$users.length; i++) {
        final l$users$entry = l$users[i];
        final lOther$users$entry = lOther$users[i];
        if (l$users$entry != lOther$users$entry) {
          return false;
        }
      }
    } else if (l$users != lOther$users) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$checkLists = checkLists;
    final l$description = description;
    final l$endDate = endDate;
    final l$idCard = idCard;
    final l$reminder = reminder;
    final l$startedDate = startedDate;
    final l$title = title;
    final l$users = users;
    return Object.hashAll([
      _$data.containsKey('checkLists')
          ? l$checkLists == null
              ? null
              : Object.hashAll(l$checkLists.map((v) => v))
          : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      l$idCard,
      l$reminder,
      _$data.containsKey('startedDate') ? l$startedDate : const {},
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('users')
          ? l$users == null
              ? null
              : Object.hashAll(l$users.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$InputUpdateCard<TRes> {
  factory CopyWith$Input$InputUpdateCard(
    Input$InputUpdateCard instance,
    TRes Function(Input$InputUpdateCard) then,
  ) = _CopyWithImpl$Input$InputUpdateCard;

  factory CopyWith$Input$InputUpdateCard.stub(TRes res) =
      _CopyWithStubImpl$Input$InputUpdateCard;

  TRes call({
    List<Input$CheckListInput>? checkLists,
    String? description,
    String? endDate,
    String? idCard,
    Enum$Reminder? reminder,
    String? startedDate,
    String? title,
    List<String>? users,
  });
  TRes checkLists(
    Iterable<Input$CheckListInput>? Function(
      Iterable<CopyWith$Input$CheckListInput<Input$CheckListInput>>?,
    ) fn,
  );
}

class _CopyWithImpl$Input$InputUpdateCard<TRes>
    implements CopyWith$Input$InputUpdateCard<TRes> {
  _CopyWithImpl$Input$InputUpdateCard(
    this._instance,
    this._then,
  );

  final Input$InputUpdateCard _instance;

  final TRes Function(Input$InputUpdateCard) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? checkLists = _undefined,
    Object? description = _undefined,
    Object? endDate = _undefined,
    Object? idCard = _undefined,
    Object? reminder = _undefined,
    Object? startedDate = _undefined,
    Object? title = _undefined,
    Object? users = _undefined,
  }) =>
      _then(
        Input$InputUpdateCard._({
          ..._instance._$data,
          if (checkLists != _undefined)
            'checkLists': (checkLists as List<Input$CheckListInput>?),
          if (description != _undefined)
            'description': (description as String?),
          if (endDate != _undefined) 'endDate': (endDate as String?),
          if (idCard != _undefined && idCard != null)
            'idCard': (idCard as String),
          if (reminder != _undefined && reminder != null)
            'reminder': (reminder as Enum$Reminder),
          if (startedDate != _undefined)
            'startedDate': (startedDate as String?),
          if (title != _undefined) 'title': (title as String?),
          if (users != _undefined) 'users': (users as List<String>?),
        }),
      );

  @override
  TRes checkLists(
    Iterable<Input$CheckListInput>? Function(
      Iterable<CopyWith$Input$CheckListInput<Input$CheckListInput>>?,
    ) fn,
  ) =>
      call(
        checkLists: fn(
          _instance.checkLists?.map(
            (e) => CopyWith$Input$CheckListInput(
              e,
              (i) => i,
            ),
          ),
        )?.toList(),
      );
}

class _CopyWithStubImpl$Input$InputUpdateCard<TRes>
    implements CopyWith$Input$InputUpdateCard<TRes> {
  _CopyWithStubImpl$Input$InputUpdateCard(this._res);

  final TRes _res;

  @override
  call({
    List<Input$CheckListInput>? checkLists,
    String? description,
    String? endDate,
    String? idCard,
    Enum$Reminder? reminder,
    String? startedDate,
    String? title,
    List<String>? users,
  }) =>
      _res;

  @override
  checkLists(fn) => _res;
}

class Input$InputVerifyEmail {
  factory Input$InputVerifyEmail({
    required String email,
    required String otp,
  }) =>
      Input$InputVerifyEmail._({
        r'email': email,
        r'otp': otp,
      });

  Input$InputVerifyEmail._(this._$data);

  factory Input$InputVerifyEmail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$otp = data['otp'];
    result$data['otp'] = (l$otp as String);
    return Input$InputVerifyEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get otp => (_$data['otp'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$otp = otp;
    result$data['otp'] = l$otp;
    return result$data;
  }

  CopyWith$Input$InputVerifyEmail<Input$InputVerifyEmail> get copyWith =>
      CopyWith$Input$InputVerifyEmail(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$InputVerifyEmail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$otp = otp;
    final lOther$otp = other.otp;
    if (l$otp != lOther$otp) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$otp = otp;
    return Object.hashAll([
      l$email,
      l$otp,
    ]);
  }
}

abstract class CopyWith$Input$InputVerifyEmail<TRes> {
  factory CopyWith$Input$InputVerifyEmail(
    Input$InputVerifyEmail instance,
    TRes Function(Input$InputVerifyEmail) then,
  ) = _CopyWithImpl$Input$InputVerifyEmail;

  factory CopyWith$Input$InputVerifyEmail.stub(TRes res) =
      _CopyWithStubImpl$Input$InputVerifyEmail;

  TRes call({
    String? email,
    String? otp,
  });
}

class _CopyWithImpl$Input$InputVerifyEmail<TRes>
    implements CopyWith$Input$InputVerifyEmail<TRes> {
  _CopyWithImpl$Input$InputVerifyEmail(
    this._instance,
    this._then,
  );

  final Input$InputVerifyEmail _instance;

  final TRes Function(Input$InputVerifyEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? email = _undefined,
    Object? otp = _undefined,
  }) =>
      _then(
        Input$InputVerifyEmail._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (otp != _undefined && otp != null) 'otp': (otp as String),
        }),
      );
}

class _CopyWithStubImpl$Input$InputVerifyEmail<TRes>
    implements CopyWith$Input$InputVerifyEmail<TRes> {
  _CopyWithStubImpl$Input$InputVerifyEmail(this._res);

  final TRes _res;

  @override
  call({
    String? email,
    String? otp,
  }) =>
      _res;
}

enum Enum$Reminder {
  FifteenMinutesBefore,
  FiveMinutesBefore,
  OnDueDate,
  OneDayBefore,
  OneHourBefore,
  TenMinutesBefore,
  TwoDaysBefore,
  TwoHoursBefore,
  Unknown,
  $unknown
}

String toJson$Enum$Reminder(Enum$Reminder e) {
  switch (e) {
    case Enum$Reminder.FifteenMinutesBefore:
      return r'FifteenMinutesBefore';
    case Enum$Reminder.FiveMinutesBefore:
      return r'FiveMinutesBefore';
    case Enum$Reminder.OnDueDate:
      return r'OnDueDate';
    case Enum$Reminder.OneDayBefore:
      return r'OneDayBefore';
    case Enum$Reminder.OneHourBefore:
      return r'OneHourBefore';
    case Enum$Reminder.TenMinutesBefore:
      return r'TenMinutesBefore';
    case Enum$Reminder.TwoDaysBefore:
      return r'TwoDaysBefore';
    case Enum$Reminder.TwoHoursBefore:
      return r'TwoHoursBefore';
    case Enum$Reminder.Unknown:
      return r'Unknown';
    case Enum$Reminder.$unknown:
      return r'$unknown';
  }
}

Enum$Reminder fromJson$Enum$Reminder(String value) {
  switch (value) {
    case r'FifteenMinutesBefore':
      return Enum$Reminder.FifteenMinutesBefore;
    case r'FiveMinutesBefore':
      return Enum$Reminder.FiveMinutesBefore;
    case r'OnDueDate':
      return Enum$Reminder.OnDueDate;
    case r'OneDayBefore':
      return Enum$Reminder.OneDayBefore;
    case r'OneHourBefore':
      return Enum$Reminder.OneHourBefore;
    case r'TenMinutesBefore':
      return Enum$Reminder.TenMinutesBefore;
    case r'TwoDaysBefore':
      return Enum$Reminder.TwoDaysBefore;
    case r'TwoHoursBefore':
      return Enum$Reminder.TwoHoursBefore;
    case r'Unknown':
      return Enum$Reminder.Unknown;
    default:
      return Enum$Reminder.$unknown;
  }
}

enum Enum$TopicNotification {
  Board,
  Card,
  CheckList,
  Comment,
  InviteUserToBoard,
  $List,
  RemoveUserFromBoard,
  $unknown
}

String toJson$Enum$TopicNotification(Enum$TopicNotification e) {
  switch (e) {
    case Enum$TopicNotification.Board:
      return r'Board';
    case Enum$TopicNotification.Card:
      return r'Card';
    case Enum$TopicNotification.CheckList:
      return r'CheckList';
    case Enum$TopicNotification.Comment:
      return r'Comment';
    case Enum$TopicNotification.InviteUserToBoard:
      return r'InviteUserToBoard';
    case Enum$TopicNotification.$List:
      return r'List';
    case Enum$TopicNotification.RemoveUserFromBoard:
      return r'RemoveUserFromBoard';
    case Enum$TopicNotification.$unknown:
      return r'$unknown';
  }
}

Enum$TopicNotification fromJson$Enum$TopicNotification(String value) {
  switch (value) {
    case r'Board':
      return Enum$TopicNotification.Board;
    case r'Card':
      return Enum$TopicNotification.Card;
    case r'CheckList':
      return Enum$TopicNotification.CheckList;
    case r'Comment':
      return Enum$TopicNotification.Comment;
    case r'InviteUserToBoard':
      return Enum$TopicNotification.InviteUserToBoard;
    case r'List':
      return Enum$TopicNotification.$List;
    case r'RemoveUserFromBoard':
      return Enum$TopicNotification.RemoveUserFromBoard;
    default:
      return Enum$TopicNotification.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
