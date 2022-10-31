import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/controllers/user_controller.dart';
import 'package:shikishaadmin/models/user_model.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class ManageUser extends ConsumerWidget {
  const ManageUser({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    User users = User();
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916__340.png"),
          radius: 60,
        ),
        const SizedBox(
          height: 30,
        ),
        InfoText(text: user.name),
        const SizedBox(
          height: 30,
        ),
        InfoText(text: user.phone),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade600)),
                onPressed: () {},
                icon: const Icon(Icons.delete),
                label: InfoText(
                  text: "Deactivate",
                  textstyle:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                )),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade600)),
                onPressed: () async {
                  await users.deleteUser(user.id);
                  Navigator.pushNamed(context, "/sellers");
                },
                icon: const Icon(Icons.delete),
                label: InfoText(
                  text: "Delete",
                  textstyle:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                ))
          ],
        )
      ],
    );
  }
}
