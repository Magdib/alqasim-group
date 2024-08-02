import 'package:flutter/material.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';

class AdminCarsPage extends StatelessWidget {
  const AdminCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const CarSliverAppBar(title: "تفاصيل البائع"),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
          ]))
        ],
      ),
    );
  }
}
