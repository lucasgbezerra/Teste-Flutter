import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../lib/main.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  testWidgets('Teste da Navbar', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(Home()));

    // Teste do titulo
    final titleFinder = find.text('Calculadora de IMC');

    expect(titleFinder, findsOneWidget);

    // Teste do icon de refresh
    final Finder refreshIconFinder = find.byIcon(Icons.refresh);

    expect(refreshIconFinder, findsOneWidget);
  });

  testWidgets('Teste icone pessoa', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(Home()));
    // Icone pessoa
    final Finder personIconFinder = find.byIcon(Icons.person);

    expect(personIconFinder, findsOneWidget);
  });

  testWidgets('Teste input peso', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(Home()));

    // Input de peso
    final Finder weightInputFinder = find.byKey(Key('WeightInput'));

    expect(weightInputFinder, findsOneWidget);

    await tester.enterText(weightInputFinder, '70');

    expect(find.text('70'), findsOneWidget);
  });

  testWidgets('Teste input altura', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(Home()));

    // Input de altura
    final Finder heightInputFinder = find.byKey(Key('HeightInput'));

    expect(heightInputFinder, findsOneWidget);

    await tester.enterText(heightInputFinder, '1.80');

    expect(find.text('1.80'), findsOneWidget);
  });

  testWidgets('Teste do botão', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(Home()));

    // Testando se o botão foi renderizado
    final Finder buttonFinder = find.byType(RaisedButton);

    expect(buttonFinder, findsOneWidget);

    // Testando se o texto foi renderizado
    final Finder textFinder = find.text("Informe seus dados");

    expect(textFinder, findsOneWidget);

    // Testando se os inputs foram renderizados
    final Finder heightInputFinder = find.byKey(Key('HeightInput'));

    expect(heightInputFinder, findsOneWidget);

    final Finder weightInputFinder = find.byKey(Key('WeightInput'));

    expect(weightInputFinder, findsOneWidget);

    // Inserindo os valores nos inputs
    await tester.enterText(heightInputFinder, '1.80');

    await tester.enterText(weightInputFinder, '70');

    // Pressionando o botão
    await tester.tap(buttonFinder);

    // Reconstruindo a tela
    await tester.pump();

    // Verificando os reasultados
    expect(find.text("Normal (21.6)"), findsOneWidget);

    expect(find.text("Informe seus dados"), findsNothing);

    expect(find.text('1.80'), findsOneWidget);

    expect(find.text('70'), findsOneWidget);
  });
}
