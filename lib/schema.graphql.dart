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
      _then(Input$InputEmail._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (passWord != _undefined && passWord != null)
          'passWord': (passWord as String),
      }),);
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
      _then(Input$InputLogin._({
        ..._instance._$data,
        if (deviceId != _undefined && deviceId != null)
          'deviceId': (deviceId as String),
        if (idToken != _undefined && idToken != null)
          'idToken': (idToken as String),
      }),);
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
    if (other is! Input$InputVerifyEmail ||
        runtimeType != other.runtimeType) {
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
      _then(Input$InputVerifyEmail._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (otp != _undefined && otp != null) 'otp': (otp as String),
      }),);
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
  NoReminder,
  OnDueDate,
  OneDayBefore,
  OneHourBefore,
  TenMinutesBefore,
  TwoDaysBefore,
  TwoHoursBefore,
  $unknown
}

String toJson$Enum$Reminder(Enum$Reminder e) {
  switch (e) {
    case Enum$Reminder.FifteenMinutesBefore:
      return r'FifteenMinutesBefore';
    case Enum$Reminder.FiveMinutesBefore:
      return r'FiveMinutesBefore';
    case Enum$Reminder.NoReminder:
      return r'NoReminder';
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
    case r'NoReminder':
      return Enum$Reminder.NoReminder;
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
    default:
      return Enum$Reminder.$unknown;
  }
}

enum Enum$TopicNotification { Board, Card, CheckList, Comment, $List, $unknown }

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
    case Enum$TopicNotification.$List:
      return r'List';
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
    case r'List':
      return Enum$TopicNotification.$List;
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
