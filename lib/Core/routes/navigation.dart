import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushTo(BuildContext context, String routeName) {
  context.pushNamed(routeName);
}

void pushReplacement(BuildContext context, String routeName) {
  context.pushReplacementNamed(routeName);
}
void pushTobase(BuildContext context, String routeName) {
  context.go(routeName);
}

void pop(BuildContext context) {
  context.pop();
}