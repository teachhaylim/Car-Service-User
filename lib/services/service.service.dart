import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/models/service.model.dart';

Future<List<ShopService>> fetchServices(String shopId) async {
  final api = ApiManager();
  final GetsResponse response = await api.getsApiCall("service?sellCompany=$shopId");

  return compute(parseServices, response.results);
}

void addServiceToAppointment(BuildContext context, ShopService service) {
  // Provider.of<Cart>(context, listen: false).addSubService(SubService.fromService(service));
}
