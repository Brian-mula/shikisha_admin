import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/products.dart';
import 'package:shikishaadmin/widgets/rejected.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Seller extends ConsumerWidget {
  const Seller({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sellers');
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const InfoText(text: "+254717105986"),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                child: InfoText(
                  text: "Products",
                  textstyle: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.green.shade600),
                ),
              ),
              Tab(
                child: InfoText(
                  text: "Rejected",
                  textstyle: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.green.shade600),
                ),
              ),
              Tab(
                child: InfoText(
                  text: "Manage",
                  textstyle: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.green.shade600),
                ),
              )
            ]),
          ),
          body: const TabBarView(children: [
            Products(),
            Rejected(),
            InfoText(text: "Manage"),
          ])),
    );
  }
}
