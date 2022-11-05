import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shikishaadmin/models/product_model.dart';
import 'package:shikishaadmin/models/user_model.dart';
import 'package:shikishaadmin/providers/product_provider.dart';
import 'package:shikishaadmin/widgets/custome_input.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Productss extends ConsumerStatefulWidget {
  const Productss({super.key, required this.user});
  final UserModel user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductssState();
}

class _ProductssState extends ConsumerState<Productss> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    ThemeData theme = Theme.of(context);
    final product = ref.watch(productclass);
    final allProducts = ref.watch(productProvider);

    FirebaseStorage storage = FirebaseStorage.instance;

    String? imageUrl;
    Future<void> uploadImage(String? inputSource) async {
      final picker = ImagePicker();
      XFile? pickedImage;
      try {
        pickedImage = await picker.pickImage(
            source: inputSource == 'camera'
                ? ImageSource.camera
                : ImageSource.gallery);
        final String fileName = path.basename(pickedImage!.path);
        File file = File(pickedImage.path);
        var snapshot =
            await storage.ref().child("images/imageName").putFile(file);

        final downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrl = downloadUrl;
        // setState(() {
        //   imageUrl = downloadUrl;
        // });
        print(imageUrl);
      } catch (e) {}
    }

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
                          ),
                          // !testing image upload
                          Container(
                              margin: const EdgeInsets.all(15),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2, 2),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: (imageUrl != null)
                                  ? Image.network(imageUrl!)
                                  : Image.network(
                                      'https://i.imgur.com/sUFH1Aq.png')),

                          ElevatedButton.icon(
                              onPressed: () async {
                                // await uploadImage('');
                              },
                              icon: const Icon(Icons.file_copy),
                              label: InfoText(
                                text: "Upload image",
                                textstyle: theme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              ))
                          //! end of testing
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
                                      img: "imageUrl!",
                                      price: int.parse(priceController.text),
                                      seller: widget.user.name,
                                      phone: widget.user.phone);
                                  await product.addProduct(
                                      productModel, widget.user);
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
              child: allProducts.when(
                  data: (data) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, int index) => Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(data[index].img),
                                    fit: BoxFit.cover)),
                          ),
                          title: InfoText(
                            text: data[index].title,
                            textstyle: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.green.shade600),
                          ),
                          subtitle: InfoText(
                            text: "30",
                            textstyle: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.orange.shade600),
                          ),
                          trailing: InfoText(
                            text: "Ksh. ${data[index].price}",
                            textstyle: theme.textTheme.bodyLarge!.copyWith(
                                fontSize: 18, color: Colors.orange.shade700),
                          ),
                        ),
                      ),
                    );
                  },
                  error: (error, stacktrace) => InfoText(
                        text: error.toString(),
                        textstyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.red),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))),
        ),
      ],
    );
  }
}

// class Products extends ConsumerWidget {
//   const Products({super.key, required this.user});
//   final UserModel user;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final formKey = GlobalKey<FormState>();
//     final TextEditingController titleController = TextEditingController();
//     final TextEditingController descriptionController = TextEditingController();
//     final TextEditingController priceController = TextEditingController();
//     ThemeData theme = Theme.of(context);
//     final product = ref.watch(productclass);
//     final allProducts = ref.watch(productProvider);
//     final specifiUser = ref.watch(specificUserProducts);
//     Future<List<ProductModel>> firebaseProducts =
//         specifiUser.userProducts(user);

//     String? imageUrl;
//     void uploadImage() async {
//       final _firebaseStorage = FirebaseStorage.instance;
//       final _imagePicker = ImagePicker();
//       PickedFile image;
//     }

    
//   }
// }
