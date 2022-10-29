import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Products extends ConsumerWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade600)),
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            label: InfoText(
              text: "New Product",
              textstyle:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
            )),
        SizedBox(
          height: 650,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, int index) => Container(
              margin: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGFwdG9wc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                          fit: BoxFit.cover)),
                ),
                title: InfoText(
                  text: "HP Elite book",
                  textstyle: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.green.shade600),
                ),
                subtitle: InfoText(
                  text: "30",
                  textstyle: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.orange.shade600),
                ),
                trailing: InfoText(
                  text: "Ksh. 30000",
                  textstyle: theme.textTheme.bodyLarge!
                      .copyWith(fontSize: 18, color: Colors.orange.shade700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
