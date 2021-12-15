import 'package:flutter/material.dart';
import 'package:submission/view/desktop/main_screen_desktop.dart';
import 'package:submission/view/mobile/main_screen_mobile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Resep Size ${MediaQuery.of(context).size.width}'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if(constraints.maxWidth <= 600){
              return const MobileView();
            }else if(constraints.maxWidth <= 1000){
              return const DesktopView(gridCount: 2,);
            }else{
              return const DesktopView(gridCount: 4,);
            }
          },
        ),
      ),
    );
  }
}