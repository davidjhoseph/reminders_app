import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final int numberCount;
  final Function navigate;
  MenuBox(
      {@required this.color,
      @required this.title,
      @required this.numberCount,
      @required this.icon,
      @required this.navigate});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.445,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Text(
                  numberCount.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
