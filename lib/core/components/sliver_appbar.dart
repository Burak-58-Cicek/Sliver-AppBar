import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:sliver_appbar/main.dart';

class CustomScrollWidget extends StatefulWidget {
  const CustomScrollWidget({Key key}) : super(key: key);

  @override
  _CustomScrollWidgetState createState() => _CustomScrollWidgetState();
}

class _CustomScrollWidgetState extends State<CustomScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: (FlexibleSpaceBar(
              background:
                  Image.network('https://source.unsplash.com/1600x900/?redlips'),
              title: Text('Sliver AppBar'),
              collapseMode: CollapseMode.parallax,
              // centerTitle: true,
            )),
            pinned: true,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 200,
            centerTitle: true,
            leading: Icon(Icons.arrow_back, color: Colors.white),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          buildImages(),
        ],
      ),
    );
  }

  Widget buildImages() => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => ImageWidget(index: index),
        ),
      );
}

class ImageWidget extends StatelessWidget {
  final int index;

  const ImageWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        width: double.infinity,
        child: FullScreenWidget(
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
