import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Orders extends ConsumerWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black54,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const InfoText(text: "Orders"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/order");
                    },
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1603237436931-c2203dcac6f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTd8fHNhbXN1bmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                                fit: BoxFit.cover)),
                      ),
                      title: InfoText(
                        text: "Samsung A03",
                        textstyle: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.green.shade600),
                      ),
                      subtitle: InfoText(
                        text: "Ksh. 30000",
                        textstyle: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.orange.shade600),
                      ),
                      trailing: InfoText(
                        text: "0717105986",
                        textstyle: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.green.shade600),
                      ),
                    ),
                  ),
                )));
  }
}
