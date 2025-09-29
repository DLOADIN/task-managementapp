import 'package:flutter/material.dart'; 
import 'package:flutter_test/flutter_test.dart'; 
import 'package:aga_project/screens/screens.dart';

void main() { 
  testWidgets(
    'Bumbogo screen renders', 
    (WidgetTester tester) 
    async { await tester.pumpWidget(
      const MaterialApp(home: Bumbogo()));  
    expect(find.byType(Bumbogo),
     findsOneWidget);}); 
}