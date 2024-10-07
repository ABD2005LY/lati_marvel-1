import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lati_marvel/widget/card.dart';
import 'package:lati_marvel/helpers/const.dart';
import 'package:lati_marvel/helpers/functions_helper.dart';
import 'package:lati_marvel/providers/movies_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MoviesProvider>(context, listen: false).fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (context, moviesConsumer, child) {
      return Scaffold(
          appBar: AppBar(
              actions: [
                SizedBox(width: 16),
                CustomIconButton(
                    asset: "assets/icons/favoriteIcon.png", onTap: () {}),
                SizedBox(width: 8),
                CustomIconButton(
                    asset: "assets/icons/inboxIcon.png", onTap: () {}),
                SizedBox(width: 16),
              ],
              title: Image.asset(
                "assets/marvelLogo.png",
                width: getSize(context).width * 0.2,
              )),
          drawer: const Drawer(),
          body: GridView.builder(
              itemCount: moviesConsumer.busy ? 6 : moviesConsumer.Movies.length,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: moviesConsumer.busy
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Shimmer.fromColors(
                                baseColor: Colors.black12,
                                highlightColor: Colors.white38,
                                child: Container(
                                  color: Colors.white,
                                )),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CustomGridTile(moviesConsumer.Movies[index]),
                          ));
              }));
    });
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.asset, required this.onTap});
  final String asset;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: mainColor.withOpacity(0.1), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              asset,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
