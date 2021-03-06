import 'user.model.dart';

class LoginResponse {
  final int meta;
  final String token;
  final User userInfo;

  const LoginResponse({
    required this.meta,
    required this.token,
    required this.userInfo,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      meta: json["meta"] as int,
      token: json["token"] as String,
      userInfo: User.fromJson(json["user"]),
    );
  }
}

class UserInfoResponse {
  final int meta;
  final User userInfo;

  const UserInfoResponse({
    required this.meta,
    required this.userInfo,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      meta: json["meta"] as int,
      userInfo: User.fromJson(json["user"]),
    );
  }
}

class GetsResponse {
  final int meta;
  dynamic results;
  final int page;
  final int limit;
  final int totalPages;
  final int totalResults;

  GetsResponse({
    required this.meta,
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });

  factory GetsResponse.fromJson(Map<String, dynamic> json) {
    return GetsResponse(
      meta: json["meta"] as int,
      results: json["results"] as dynamic,
      page: json["page"] as int,
      limit: json["limit"] as int,
      totalPages: json["totalPages"] as int,
      totalResults: json["totalResults"] as int,
    );
  }
}

class GetResponse {
  final dynamic meta;
  dynamic data;

  GetResponse({
    required this.meta,
    required this.data,
  });

  factory GetResponse.fromJson(Map<String, dynamic> json) {
    return GetResponse(
      meta: json["meta"] as dynamic,
      data: json["data"] as dynamic,
    );
  }
}

class PostResponse {
  final int meta;
  final dynamic data;

  PostResponse({
    required this.meta,
    required this.data,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      meta: json["meta"] as int,
      data: json["data"] as dynamic,
    );
  }
}

class ErrorResponse {
  final dynamic meta;
  final String message;

  const ErrorResponse({
    required this.meta,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      meta: json["meta"] as dynamic,
      message: json["message"] as String,
    );
  }
}
