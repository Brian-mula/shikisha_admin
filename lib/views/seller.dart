import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/models/user_model.dart';
import 'package:shikishaadmin/widgets/manage_user.dart';
import 'package:shikishaadmin/widgets/products.dart';
import 'package:shikishaadmin/widgets/rejected.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Seller extends ConsumerWidget {
  const Seller({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    print(user.toSnapshot().entries.first);
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
            title: InfoText(text: user.phone),
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
          body: TabBarView(children: [
            const Products(),
            const Rejected(),
            ManageUser(
              user: user,
            )
          ])),
    );
  }
}
