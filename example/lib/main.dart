import 'package:flutter/material.dart';
import 'package:flutter_showcase/flutter_showcase.dart';

import 'apps/apps.dart';
import 'indicator/effects/expanding_dots_effect.dart';
import 'indicator/smooth_page_indicator.dart';

void main() => runApp(const Examples());

class Examples extends StatefulWidget {
  const Examples({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(children: [
          PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index > 0 && index <= GskinnerApps.values.length) {
                  final app = GskinnerApps.values[index - 1];
                  return app.showcase;
                } else {
                  return Showcase(
                      title: 'Flutter Showcase',
                      app: MyApp(pageController: pageController),
                      description:
                          '''
Share your Flutter project with the world            
                  ''',
                      template: SimpleTemplate(reverse: false),
                      theme: TemplateThemeData(
                          backgroundColor: Colors.grey[100],
                          titleTextStyle:
                              const TextStyle(fontWeight: FontWeight.w700),
                          descriptionTextStyle: const TextStyle(
                              fontSize: 24,
                              height: 1.2,
                              fontWeight: FontWeight.w200)),
                      links: [
                        LinkData.github(
                            'https://github.com/jamesblasco/flutter_showcase'),
                        LinkData.pub(
                            'https://github.com/jamesblasco/flutter_showcase')
                      ],
                      logoLink: LinkData(
                          icon: Image.asset('assets/jaime_logo.png',
                              fit: BoxFit.fitHeight),
                          url: 'https://github.com/jamesblasco'));
                }
              },
              itemCount: 1 + GskinnerApps.values.length),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SmoothPageIndicator(
                      controller: pageController,
                      count: 1 + GskinnerApps.values.length,
                      effect: ExpandingDotsEffect(
                          radius: 14,
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.black12,
                          activeDotColor: Colors.black87))))
        ]));
  }
}

class MyApp extends StatelessWidget {
  final PageController? pageController;
  const MyApp({Key? key, this.pageController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Showcase',
        builder: (context, child) =>
            FrameBuilder(app: child, builder: Frame.builder),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.white),
        home: MyHomePage(title: 'Your app', pageController: pageController));
  }
}

class MyHomePage extends StatefulWidget {
  final PageController? pageController;
  const MyHomePage({Key? key, this.title, this.pageController})
      : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text('Add your App here',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black87)),
          const SizedBox(height: 8),
          const Text('Make your showcase project interactive',
              style: TextStyle(fontSize: 20)),
          const SizedBox(height: 200),
          const Text('Scroll down\nto explore some examples',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          FloatingActionButton(
              onPressed: () => widget.pageController?.animateToPage(1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuart),
              tooltip: 'Scroll',
              child: const Icon(Icons.arrow_downward))
        ])));
  }
}
