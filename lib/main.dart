import 'package:flutter/material.dart';
import 'package:storys/Pages/homepage.dart';
import 'package:storys/Pages/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Blog app by yours truly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    );
  }
}

class TouchRipple extends StatelessWidget {
  const TouchRipple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Login failed")));
            },
            child: const Center(
              child: Card(
                child: Text('Here we go'),
              ),
            ),
          ),
          AnimatedContainer(
            width: 100,
            height: 110,
            color: Colors.pink,
            curve: Curves.linear,
            duration: const Duration(seconds: 2),
          ),

        ],
      ),
    );
  }
}

class TryingPageView extends StatefulWidget {
  const TryingPageView({super.key});
  @override
  State<TryingPageView> createState() => _TryingPageViewState();
}

class _TryingPageViewState extends State<TryingPageView> {
  PageController controller = PageController();
  int _curr = 0;

  final List<Widget> list = [
    Center(
      child: Container(
        color: Colors.teal.shade900,
      ),
    ),Center(
      child: Container(
        color: Colors.green,
      ),
    ),Center(
      child: Container(
        color: Colors.green.shade200,
      ),
    ),Center(
      child: Container(
        color: Colors.greenAccent.shade700,
      ),
    ),Center(
      child: Container(
        color: Colors.green.shade400,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PageView'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: PageView(
        reverse: true,
        controller: controller,
        children: list,
        scrollDirection: Axis.vertical,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
    );
  }
}


enum BannerDemoAction {
  reset,
  showMultipleActions,
  showLeading,
}

class BannerDemo extends StatefulWidget {
  const BannerDemo();

  @override
  _BannerDemoState createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  static const _itemCount = 20;
  var _displayBanner = true;
  var _showMultipleActions = true;
  var _showLeading = true;

  void handleDemoAction(BannerDemoAction action) {
    setState(() {
      switch (action) {
        case BannerDemoAction.reset:
          _displayBanner = true;
          _showMultipleActions = true;
          _showLeading = true;
          break;
        case BannerDemoAction.showMultipleActions:
          _showMultipleActions = !_showMultipleActions;
          break;
        case BannerDemoAction.showLeading:
          _showLeading = !_showLeading;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final banner = MaterialBanner(
      content: const Text('Material Banner Widget'),
      leading: _showLeading
          ? CircleAvatar(
        backgroundColor: colorScheme.primary,
        child: Icon(Icons.access_alarm, color: colorScheme.onPrimary),
      )
          : null,
      actions: [
        MaterialButton(
          child: const Text('MB action 1'),
          onPressed: () {
            setState(() {
              _displayBanner = false;
            });
          },
        ),
        if (_showMultipleActions)
          MaterialButton(
            child: const Text('MB action 2'),
            onPressed: () {
              setState(() {
                _displayBanner = false;
              });
            },
          ),MaterialButton(
            child: const Text('MB action 3'),
            onPressed: () {
              setState(() {
                _displayBanner = false;
              });
            },
          ),MaterialButton(
            child: const Text('MB action 4'),
            onPressed: () {
              setState(() {
                _displayBanner = false;
              });
            },
          ),
      ],
      backgroundColor: colorScheme.background,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('flutter banner example'),
        actions: [
          PopupMenuButton<BannerDemoAction>(
            onSelected: handleDemoAction,
            itemBuilder: (context) => <PopupMenuEntry<BannerDemoAction>>[
              const PopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.reset,
                child:
                Text('Popup menu button'),
              ),
              const PopupMenuDivider(),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showMultipleActions,
                checked: _showMultipleActions,
                child: const Text(
                    'CheckedPopupMenuItem 1'),
              ),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showLeading,
                checked: _showLeading,
                child: const Text(
                   ' CheckedPopupMenuItem 2'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
          // itemCount: _displayBanner ? _itemCount + 1 : _itemCount,
          itemBuilder: (context, index) {
            if (index == 0 && _displayBanner) {
              return banner;
            }
            return const ListTile(
              title: Text(
               ' List tile gen'
              ),
            );
          }),
    );
  }
}


