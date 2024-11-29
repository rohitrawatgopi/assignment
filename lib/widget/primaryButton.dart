import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback callback;
  final backGradundColor;
  final IconData icon;
  const AppPrimaryButton({
    Key? key,
    required this.buttonName,
    required this.callback,
    required this.icon,
    this.backGradundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: backGradundColor,
        ),
        height: 48,
        width: double.infinity,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Text(
                buttonName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
