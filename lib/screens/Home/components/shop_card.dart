import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/screens/shopdetail/index.dart';
import 'package:userapp/services/sell_company.service.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchShops(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(height: 80, child: Center(child: Text(snapshot.error.toString())));
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(height: 80, child: Center(child: CircularProgressIndicator()));
        }

        //FIXME error response thrown
        // List<SellCompany> shops = snapshot.data ?? [];

        // return SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     children: [
        //       for (var i in shops) ShopCard(shop: i),
        //     ],
        //   ),
        // );
        return const Text("shop");
      },
    );
  }
}

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.shop}) : super(key: key);
  final SellCompany shop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 95,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/300"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(6),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shop.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(thickness: 2, color: Colors.grey.shade200),
                    Flexible(
                      child: Text(
                        shop.remark,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: ShopDetail(shopInfo: shop), type: PageTransitionType.rightToLeftWithFade));
      },
    );
  }
}
