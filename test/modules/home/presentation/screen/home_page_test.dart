import 'package:classroom_project/app_module.dart';
import 'package:classroom_project/main.dart';
import 'package:classroom_project/modules/home/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestable() => ModularApp(
      module: AppModule(),
      child: const MyApp(),
    );

void main() {
  testWidgets('Test Home page widgets', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable());

    

    // final btnFinder = find.byWidget(Scaffold);
    // expect(btnFinder, findsOne);

    //   final Finder txtClass = find.by(type) byText(TextButton);
    // expect(btnFinder, findsWidgets);

    // // Aqui utilizamos nosso Finder junto ao nosso Matcher para garantirmos que temos apenas um Icon sendo renderizado.
    // expect(iconFinder, findsOneWidget);
    // // Como necessito do Widget, reaproveito nosso Finder junto ao WidgetTester para ter acesso ao Widget e suas propriedades.
    // final Icon icon = tester.widget(iconFinder);
    // // Verificando a verificação da cor do meu Widget.
    // expect(icon.color, Colors.pink[200]);
    // // Verificando o size do Icon.
    // expect(icon.size, 32.0);
    // // Verificando o ícone que foi renderizado.
    // expect(icon.icon, Icons.favorite_border);
    // // Para realizarmos o click, primeiro precisamos encontrar o Widget responsável por isto.
    // final gestureFinder = find.byType(GestureDetector);
    // // Tendo o Widget de Gesture encontrado, podemos simular o click também utilizando o WidgetTester.
    // await tester.tap(gestureFinder);
    // // pumpAndSettle() é semelhante ao uso do pump(), porém aqui temos a necessidade que todos os quadros necessários sejam renderizados devido a nossa animação.
    // await tester.pumpAndSettle();
    // // Finalizado toda a nossa animação, precisamos encontrar novamente o nosso ícone.
    // final Icon iconAfter = tester.widget(iconFinder);
    // // Agora verificarmos se o seu valor de size foi alterado após a animação.
    // expect(iconAfter.size, 58.0);
    // // Também verificamos a cor e o icon para garantirmos o que era esperado.
    // expect(iconAfter.color, Colors.pink);
    // expect(iconAfter.icon, Icons.favorite);
  });
}
