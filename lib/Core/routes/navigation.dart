import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushTo(BuildContext context, String routeName) {
  context.push(routeName);
}

void pushReplacement(BuildContext context, String routeName) {
  context.pushReplacement(routeName);
}
void pushTobase(BuildContext context, String routeName) {
  context.go(routeName);
}

void pop(BuildContext context) {
  context.pop();
}