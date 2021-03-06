import 'user.model.dart';
import 'service.model.dart';
import 'sell_company.model.dart';

class Appointment {
  String? remark;
  late User userId;
  late List<SubService> services;
  late SellCompany sellCompany;
  late List<Status> status;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isActive;

  Appointment({
    required this.id,
    required this.services,
    required this.userId,
    required this.sellCompany,
    required this.remark,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json["id"] as String,
      remark: json["remark"] as String,
      services: json["services"].length != 0 ? json["services"].map<SubService>((json) => SubService.fromJson(json)).toList() : [],
      userId: User.fromJson(json["userId"]),
      sellCompany: SellCompany.fromJson(json["sellCompany"]),
      status: json["status"].length != 0 ? json["status"].map<Status>((json) => Status.fromJson(json)).toList() : [],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      isActive: json["isActive"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "services": services,
      "userId": userId.id,
      "sellCompany": sellCompany.id,
      "remark": remark,
      "status": status,
      "isActive": isActive,
    };
  }
}

List<Appointment> parseAppointments(dynamic body) {
  return body.map<Appointment>((json) => Appointment.fromJson(json)).toList();
}

class SubService {
  String id;
  ShopService service;
  DateTime date;

  SubService({
    required this.id,
    required this.service,
    required this.date,
  });

  factory SubService.fromJson(Map<String, dynamic> json) {
    return SubService(
      id: json["id"] as String,
      service: ShopService.fromJson(json["service"]),
      date: DateTime.parse(json["date"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "service": service.id,
      "date": date.toIso8601String(),
    };
  }
}

class Status {
  int type;
  DateTime date;

  Status({
    required this.type,
    required this.date,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      type: json["type"] as int,
      date: DateTime.parse(json["date"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "date": date.toIso8601String(),
    };
  }
}
