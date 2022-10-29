import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/custome_container.dart';
import 'package:shikishaadmin/widgets/custome_row.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          CircleAvatar(
            radius: 20,
            child: InfoText(
              text: "M",
              textstyle:
                  theme.textTheme.headline5!.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
                child: InfoText(text: "available  Commodities".toUpperCase())),
            const SizedBox(
              height: 20,
            ),
            CustomeContainer(
                widget: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomeRow(
                        imgurl:
                            "https://images.unsplash.com/photo-1583573636246-18cb2246697f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2Ftc3VuZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                        qtytext: InfoText(
                          text: "Phones",
                          textstyle: theme.textTheme.bodyLarge!
                              .copyWith(color: Colors.green.shade600),
                        ),
                        titletext: InfoText(
                          text: "300",
                          textstyle: theme.textTheme.headline6!
                              .copyWith(color: Colors.orange.shade600),
                        ))),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CustomeRow(
                      imgurl:
                          "https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGFwdG9wc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                      qtytext: InfoText(
                        text: "Laptops",
                        textstyle: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.green.shade600),
                      ),
                      titletext: InfoText(
                        text: "200",
                        textstyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.orange.shade600),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CustomeRow(
                      imgurl:
                          "https://images.unsplash.com/photo-1616763355548-1b606f439f86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bW9uaXRvcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                      qtytext: InfoText(
                        text: "Monitors",
                        textstyle: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.green.shade600),
                      ),
                      titletext: InfoText(
                        text: "100",
                        textstyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.orange.shade600),
                      )),
                )
              ],
            )),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade500)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/sellers");
                    },
                    icon: const Icon(
                      Icons.people,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: InfoText(
                      text: "Sellers",
                      textstyle: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                    )),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade600)),
                    onPressed: null,
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 26,
                      color: Colors.white,
                    ),
                    label: InfoText(
                      text: "Manage sales",
                      textstyle: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
