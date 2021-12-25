import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_showcase/flutter_showcase.dart';

class GskinnerApp extends StatefulWidget {
  final _GskinnerApp app;
  final TemplateThemeData theme;

  const GskinnerApp({Key? key, required this.app, required this.theme})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<GskinnerApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: Future.value(),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return MaterialApp(
          builder: Frame.builder,
          debugShowCheckedModeBanner: false,
          home: widget.app.page!(context),
        );
      } else {
        return Frame.builder(
            context, Container(color: widget.theme.backgroundColor));
      }
    });
  }
}

class _GskinnerApp {
  final String? title;

  final String? description;

  final String? githubUrl;

  final String? codePenUrl;

  final Future<dynamic> Function()? loadLibrary;

  final WidgetBuilder? page;

  final TemplateThemeData? theme;

  _GskinnerApp(
      {this.title,
      this.description,
      this.githubUrl,
      this.loadLibrary,
      this.page,
      this.theme,
      this.codePenUrl});

  Widget get showcase => Showcase(
        key: Key('showcase: $title'),
        title: title,
        template: SimpleTemplate(),
        app: GskinnerApp(
          app: this,
          theme: theme ?? TemplateThemeData(),
        ),
        theme: theme,
        description: description,
        links: [
          LinkData.github(githubUrl ?? ""),
          if (codePenUrl != null) LinkData.codePen(codePenUrl ?? ""),
        ],
        logoLink: LinkData(
          url: 'https://flutter.gskinner.com/',
          icon: Opacity(
            opacity: 0.8,
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  theme?.brightness == Brightness.dark
                      ? 'assets/logo-gskinner-white.png'
                      : 'assets/logo-gskinner.png',
                  fit: BoxFit.fitHeight,
                )),
          ),
        ),
      );
}

class GskinnerApps {
  static _GskinnerApp gooeyEdge = _GskinnerApp(
    title: 'Mindfullness Gooey Transition',
    description:
        '''
Built by gskinner

Three onboarding screens that introducing you to a mindfulness app. Swiping between three screens gives you a fluid transition from one screen to the next.
Draw curved vector paths and use them to mask content. Utilizes a small physics simulation to calculate tension between a set of points.
    ''',
    theme: TemplateThemeData(
        brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF4259B2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textTheme: ButtonTextTheme.accent,
          padding: EdgeInsets.all(16),
        ),
        flutterLogoColor: FlutterLogoColor.white,
        descriptionTextStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w300,
            fontFamily: 'OpenSans',
            package: 'gooey_edge'),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'DMSerifDisplay',
            package: 'gooey_edge'),
        backgroundColor: Color(0xFFE95B43),
        frameTheme: FrameThemeData(statusBarBrightness: Brightness.dark),
        buttonTextStyle: TextStyle(
            fontSize: 16,
            letterSpacing: .8,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            package: 'gooey_edge'),
        buttonIconTheme: IconThemeData(color: Colors.white)),
  );

  static _GskinnerApp ticketFold = _GskinnerApp(
    title: 'Boarding Pass Cards',
    description:
        ''' 
Built by gskinner

All your boarding passes in one place, tapping them flips the card open to see more details about your flight.
Uses the Transform widget to create a folding card effect. In this case a boarding pass with multiple folds, each fold containing a child widget.
    ''',
    githubUrl:
        'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/ticket_fold',
    theme: TemplateThemeData(
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF083e64),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textTheme: ButtonTextTheme.accent,
          padding: EdgeInsets.all(16),
        ),
        flutterLogoColor: FlutterLogoColor.original,
        descriptionTextStyle: TextStyle(
            color: Color(0xFF083e64),
            fontWeight: FontWeight.w300,
            fontFamily: 'OpenSans',
            package: 'gooey_edge'),
        titleTextStyle: TextStyle(
            color: Color(0xFF212121),
            fontFamily: 'OpenSans',
            fontSize: 50,
            fontWeight: FontWeight.w700,
            package: 'ticket_fold'),
        backgroundColor: Color(0xFFf0f0f0),
        buttonTextStyle: TextStyle(
            fontSize: 16,
            letterSpacing: .8,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            package: 'ticket_fold'),
        buttonIconTheme: IconThemeData(color: Colors.white)),
  );

  static _GskinnerApp parallaxTravelCardsList = _GskinnerApp(
    title: 'Travel Cards',
    description:
        '''
Built by gskinner

Browse different destination cards from around the world and see hotel recommendations.
Use a Stack widget to create a parallax effect inside of a list, while also using a Transform to give it a 3D card effect.
    ''',
    githubUrl:
        'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/parallax_travel_cards_list',
    theme: TemplateThemeData(
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.all(16),
        ),
        flutterLogoColor: FlutterLogoColor.black,
        descriptionTextStyle: TextStyle(
            color: Color(0xFF666666),
            height: 1.5,
            fontWeight: FontWeight.w300,
            fontFamily: 'OpenSans',
            package: 'parallax_travel_cards_list'),
        titleTextStyle: TextStyle(
            color: Color(0xFF1a1a1a),
            height: 1,
            fontFamily: 'DMSerifDisplay',
            package: 'parallax_travel_cards_list'),
        backgroundColor: Color(0xffdaf3f7),
        buttonTextStyle: TextStyle(
            fontSize: 16,
            letterSpacing: .8,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1a1a1a),
            package: 'ticket_fold'),
        buttonIconTheme: IconThemeData(color: Color(0xFF1a1a1a))),
  );

  static _GskinnerApp productDetailZoom = _GskinnerApp(
    title: 'Product Zoom Transition',
    description:
        '''
Built by gskinner

Looking for the perfect speaker? Get a better look at the Classic Speaker 2700 by zooming in and discovering its great features.
Example of an animated png sequence within a Hero animation; also uses a Canvas to render and animate a product detail overlay.
    ''',
    githubUrl:
        'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/product_detail_zoom',
    theme: TemplateThemeData(
        brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textTheme: ButtonTextTheme.accent,
          padding: EdgeInsets.all(16),
        ),
        flutterLogoColor: FlutterLogoColor.white,
        descriptionTextStyle: TextStyle(
            fontFamily: 'WorkSans',
            color: Colors.white70,
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            package: 'product_detail_zoom'),
        titleTextStyle: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            package: 'product_detail_zoom',
            color: Colors.white,
            height: 1.1,
            letterSpacing: 5),
        frameTheme: FrameThemeData(
          frameColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.black,
        buttonTextStyle: TextStyle(
            fontFamily: 'WorkSans',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            package: 'product_detail_zoom'),
        buttonIconTheme: IconThemeData(color: Colors.black)),
  );

  // Doesn't work well with Flutter Web yet
  static _GskinnerApp indie3d = _GskinnerApp(
    title: 'Feature Artist Carousel.',
    description:
        '''
Built by gskinner

Explore three new indie artists, all with a distinct visual style applied to them.
Uses a custom 3D model renderer and blending mask to create a fun and unique background effect.
    ''',
    githubUrl:
        'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/indie_3d',
    theme: TemplateThemeData.black(),
  );

  // Doesn't work well with Flutter Web yet
  static _GskinnerApp constellationsList = _GskinnerApp(
    title: 'Guide To the Stars Particles',
    description:
        ''' 
Built by gskinner

Learn about different constellations in the night sky. Tap on the names to travel through space and see what a constellation looks like.
Shows how to use an animated Canvas as the primary background for your app. In this case, a starfield effect that controls its animation speed based on user scrolling and page transitions.
    ''',
    githubUrl:
        'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/constellations_list',
    theme: TemplateThemeData.black(),
  );

  static _GskinnerApp bubbleTabBar = _GskinnerApp(
    title: 'Icon Flip Button Bar',
    description:
        '''
Built by gskinner

Flipping icons, revealing colors and text helps this button bar stand out.
Example of a bespoke NavigationBar with animated buttons that change size, shape, and color when selected.
    ''',
    githubUrl:
        'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/bubble_tab_bar',
  );

  static _GskinnerApp dogSlider = _GskinnerApp(
      title: 'Dog Toy Slider',
      description:
          '''
Built by gskinner
   
Order your pup some more dog toys! Watch the dog chase the ball as you increase or decrease the amount of fetch balls you want to order.
Use a Flare animation to create a custom Slider control. Creates a custom FlareControl class for playback while the slider itself is painted on a Canvas.
    ''',
      githubUrl:
          'https://github.com/gskinnerTeam/flutter_vignettes/tree/master/vignettes/dog_slider',
      theme: TemplateThemeData(
        brightness: Brightness.light,
        titleTextStyle: TextStyle(
            fontSize: 60.0,
            fontFamily: "Quicksand",
            package: 'dog_slider',
            color: Color(0xff174d4c),
            fontWeight: FontWeight.w600,
            textBaseline: TextBaseline.alphabetic,
            height: 1.2),
        flutterLogoColor: FlutterLogoColor.original,
        descriptionTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: "Quicksand",
          package: 'dog_slider',
        ),
        buttonTextStyle: TextStyle(color: Colors.white),
        buttonIconTheme: IconThemeData(color: Colors.white),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xff2cb5b5),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textTheme: ButtonTextTheme.primary,
          hoverColor: Color(0xff2cb5b5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ));

  static List<_GskinnerApp> values = [
    gooeyEdge,
    parallaxTravelCardsList,

    ticketFold,
    productDetailZoom,
    dogSlider,

    // bubbleTabBar,

    //constellationsList,
    //indie3d
  ];
}
