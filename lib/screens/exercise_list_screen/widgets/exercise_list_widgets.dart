import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mokey_box/utils/math_utils.dart';
import 'package:mokey_box/widgets/base_text.dart';

class ExerciseListWidget extends StatelessWidget {
  final String title;
  final String image;
  final bool selected;
  final Function(int) onTap;
  final int index;

  const ExerciseListWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.selected,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(index),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getSize(10), vertical: getSize(10)),
        margin: EdgeInsets.only(
            bottom: getSize(10), left: getSize(10), right: getSize(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  spreadRadius: 2,
                  offset: const Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                      height: getSize(50),
                      width: getSize(50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          placeholder: (context, url) => SizedBox(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      )),
                  SizedBox(
                    width: getSize(10),
                  ),
                  Expanded(
                    child: BaseText(
                      text: title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: ()=> onTap(index),
                child: selected?Icon(Icons.check_box): Icon(Icons.check_box_outline_blank))
          ],
        ),
      ),
    );
  }
}
class GroupListWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final Function(int) onTap;
  final int index;

  const GroupListWidget(
      {super.key,
        required this.title,

        required this.selected,
        required this.onTap,
        required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(index),
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: getSize(10), vertical: getSize(10)),
        margin: EdgeInsets.only(
            bottom: getSize(10), left: getSize(10), right: getSize(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  spreadRadius: 2,
                  offset: const Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: title,
              textColor: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
            InkWell(
                onTap: ()=> onTap(index),
                child: selected?Icon(Icons.check_box): Icon(Icons.check_box_outline_blank))
          ],
        ),
      ),
    );
  }
}
class WorkOutWidget extends StatelessWidget {
  final String title;
  final Function(int) onTap;
  final int index;

  const WorkOutWidget(
      {super.key,
        required this.title,
        required this.onTap,
        required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(index),
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: getSize(10), vertical: getSize(10)),
        margin: EdgeInsets.only(
            bottom: getSize(10), left: getSize(10), right: getSize(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  spreadRadius: 2,
                  offset: const Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: title,
              textColor: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
           InkWell(
             child: Icon(Icons.arrow_forward_ios,size: getSize(22),),
           )
          ],
        ),
      ),
    );
  }
}