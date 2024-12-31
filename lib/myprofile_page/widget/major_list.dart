import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider_class/addmajor_provider.dart';

class MajorList extends StatelessWidget {
  const MajorList({super.key});

  @override
  Widget build(BuildContext context) {

    final major = Provider.of<Major>(context,listen: true);

    return Consumer<Major>(
      builder: (context, provider, _) {
        print(provider.majorList);
        return SizedBox(
          width: 200,
          child: Wrap(
            spacing: 8,
            children: provider.majorList.map((major) {
              return Chip(
                label: Text(major, style: TextStyle(fontSize: 14)),
                deleteIcon: Icon(Icons.close, size: 16),
                onDeleted: () {
                  // Remove the selected major from the list
                  provider.remove_major(major:major);
                },
              );
            }).toList(),
          ),
        );
      },
    );

  }
}
