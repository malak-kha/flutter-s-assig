import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// تأكدي أن الاسم هنا يطابق اسم المشروع في pubspec.yaml
import 'package:zahraawa/main.dart';

import '../my_app/lap-flutter/main.dart'; 

void main() {
  testWidgets('Animal Sounds App smoke test', (WidgetTester tester) async {
    // نقوم بتشغيل التطبيق باستخدام الاسم الجديد للكلاس
    await tester.pumpWidget(const AnimalSoundsApp());

    // بما أن تطبيقك الآن هو "Animal Sounds" وليس تطبيق العداد (Counter)
    // سنقوم بالتحقق من وجود نص "Animals Sounds" الذي يظهر في الشاشة
    expect(find.text('Animals Sounds'), findsOneWidget);
  });
}
