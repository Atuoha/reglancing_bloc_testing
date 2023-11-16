import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSearchBox extends StatelessWidget {
  const UserSearchBox({
    super.key,
    required this.textKeyword,
    required this.fetchUserFnc,
  });

  final TextEditingController textKeyword;
  final Function fetchUserFnc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      key: const Key('text_id'),
      controller: textKeyword,
      validator: (value) {
        if (value!.isEmpty || value.length < 3) {
          return "User ID can not be empty";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.number,
          color: Colors.grey,
        ),
        suffix: textKeyword.text.isNotEmpty
            ? GestureDetector(
                key: const Key('user_search_btn'),
                onTap: () => fetchUserFnc(),
                child: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
              )
            : const SizedBox.shrink(),
        hintText: 'Enter user id',
        label: const Text('User ID'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
      ),
    );
  }
}
