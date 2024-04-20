import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pr_6/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
          routes: [
            GoRoute(
                path: '/',
                builder: (context, state) => const MyHomePage(),
                routes: [
                  GoRoute(
                    path: 'page-1',
                    builder: (context, state) => const TextPage(text: "Страница 1"),
                  ),
                  GoRoute(
                    path: 'page-2',
                    builder: (context, state) => const TextPage(text: "Страница 2"),
                  ),
                ]
            ),
          ],
      ),
      title: 'Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Страничная", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextPage(text: "Вертикальная"))
              ),
              child: const Text("Вертикальная"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TextPage(text: "Горизонтальная"))
              ),
              child: const Text("Горизонтальная"),
            ),
            const SizedBox(height: 32),
            const Text("Маршрутная", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go('/page-1'),
              child: const Text("Страница 1"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go('/page-2'),
              child: const Text("Страница 2"),
            ),
          ],
        ),
      ),
    );
  }
}
