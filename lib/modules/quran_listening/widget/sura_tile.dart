import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuraTile extends StatelessWidget {
  const SuraTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.meaning,
    required this.onTap,
    required this.onAudioTap,
  });

  final String? subTitle;
  final int? index;
  final String? title;
  final String? meaning;
  final VoidCallback onTap;
  final VoidCallback onAudioTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withAlpha(100),
          ),
          child: ListTile(
            leading: InkWell(
              onTap: onAudioTap,
              child: FaIcon(
                FontAwesomeIcons.circlePlay,
                color: Colors.blue.shade700,
              ),
            ),
            title: Text(
              title.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              subTitle.toString(),
              style: const TextStyle(
                fontFamily: 'Amiri',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              meaning.toString(),
              style: const TextStyle(
                height: 1.0,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
