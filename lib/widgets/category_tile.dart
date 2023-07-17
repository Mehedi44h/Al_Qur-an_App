import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String? title;
  final int? index;
  final VoidCallback onTap;

  const CategoryTile(
      {Key? key, required this.title, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                // Colors.tealAccent.shade400,
                // Colors.teal,
                //  Colors HexColor('#004d6b')
                Color(0xff004d6b),
                Color.fromARGB(255, 26, 125, 164),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            title: Text(
              title.toString(),
              style: const TextStyle(
                height: 1.1,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
