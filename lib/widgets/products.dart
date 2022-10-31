import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/models/product_model.dart';
import 'package:shikishaadmin/models/user_model.dart';
import 'package:shikishaadmin/providers/product_provider.dart';
import 'package:shikishaadmin/widgets/custome_input.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Products extends ConsumerWidget {
  const Products({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    ThemeData theme = Theme.of(context);
    final product = ref.watch(productclass);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade600)),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => Form(
                    key: formKey,
                    child: AlertDialog(
                      scrollable: true,
                      title: Center(
                        child: InfoText(
                          text: "Add new Product",
                          textstyle: theme.textTheme.headline6!
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                      content: Column(
                        children: [
                          CustomeInput(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Title cannot be empty";
                                }
                                return null;
                              },
                              inputType: TextInputType.name,
                              controller: titleController,
                              label: "Title"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomeInput(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Description cannot be empty";
                              }
                              return null;
                            },
                            controller: descriptionController,
                            label: "Description",
                            inputType: TextInputType.multiline,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomeInput(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Price cannot be empty";
                              }
                              return null;
                            },
                            controller: priceController,
                            label: "Price",
                            inputType: TextInputType.number,
                          )
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: null,
                                icon: const Icon(
                                  Icons.cancel,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                label: InfoText(
                                  text: "Cancel",
                                  textstyle: theme.textTheme.bodyLarge!
                                      .copyWith(color: Colors.white),
                                )),
                            ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green.shade600)),
                                onPressed: () async {
                                  ProductModel productModel = ProductModel(
                                      title: titleController.text,
                                      category: "category",
                                      description: descriptionController.text,
                                      img: "img",
                                      price: int.parse(priceController.text),
                                      seller: user.name,
                                      phone: user.phone);
                                  await product.addProduct(productModel, user);
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                label: InfoText(
                                  text: "Save",
                                  textstyle: theme.textTheme.bodyLarge!
                                      .copyWith(color: Colors.white),
                                ))
                          ],
                        )
                      ],
                    ))),
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
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
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
        ),
      ],
    );
  }
}
