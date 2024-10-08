import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lati_marvel/widget/card.dart';
import 'package:lati_marvel/providers/moviesProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MoviesProvider>(context, listen: false)..fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (context, moviesConsumer, child) {
      return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              "assets/marvelLogo.png",
              height: 32,
              width: 100,
            ),
            centerTitle: true,
            actions: [
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red)),
                child: Image.asset(
                  "assets/icons/FavoriteButton.png",
                  height: 28,
                  width: 28,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red)),
                child: Image.asset(
                  "assets/icons/InboxIcon.png",
                  height: 28,
                  width: 28,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
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
