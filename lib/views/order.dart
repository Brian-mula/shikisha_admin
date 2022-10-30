import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/stepper.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Order extends ConsumerWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/orders");
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
              size: 30,
            ),
          ),
        ),
        title: const InfoText(text: "Order"),
      ),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 20,
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1597639244466-3eb1b6d985bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjN8fHNhbXN1bmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 250,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InfoText(
                          text: "Price",
                          textstyle: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 18, color: Colors.green.shade600),
                        ),
                        InfoText(
                          text: "Ksh. 30000",
                          textstyle: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 20, color: Colors.orange.shade600),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InfoText(
                          text: "Quantity",
                          textstyle: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 18, color: Colors.green.shade600),
                        ),
                        InfoText(
                          text: "3",
                          textstyle: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 20, color: Colors.orange.shade600),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InfoText(
                          text: "Payment",
                          textstyle: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 18, color: Colors.green.shade600),
                        ),
                        InfoText(
                          text: "On delivery",
                          textstyle: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 20, color: Colors.orange.shade600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
              top: 300, left: 20, right: 20, child: CustomeStepper())
        ],
      ),
    );
  }
}
