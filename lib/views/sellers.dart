import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shikishaadmin/widgets/custome_input.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class Sellers extends ConsumerWidget {
  const Sellers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/");
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
        title: const InfoText(text: "All Sellers"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => Form(
                        child: AlertDialog(
                      scrollable: true,
                      title: const InfoText(text: "New Seller"),
                      content: Column(
                        children: [
                          CustomeInput(
                            controller: nameController,
                            label: "username",
                            inputType: TextInputType.name,
                            icon: Icons.person,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          IntlPhoneField(
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'KE',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          )
                        ],
                      ),
                    ))),
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/seller");
                      },
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916__340.png"),
                          radius: 20,
                        ),
                        title: InfoText(
                          text: "Mulati Brian",
                          textstyle: theme.textTheme.bodyLarge,
                        ),
                        trailing: const IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: Colors.black45,
                            )),
                      ),
                    ),
                  ))),
    );
  }
}
