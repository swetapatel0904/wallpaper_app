import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/home/model/home_model.dart';
import 'package:wallpaper_app/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().flowerGetData("flower");
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Wallpaper",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            if (providerW!.homeModel == null)
              Column(
                children: [
                  SearchBar(
                    elevation: MaterialStateProperty.all(0.9),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.5)),
                    controller: txtName,
                    hintText: 'Search',
                    trailing: [
                      IconButton(
                          onPressed: () {
                            providerR!.flowerGetData(txtName.text);
                          },
                          icon: const Icon(Icons.search))
                    ],
                  ),
                  const Text(
                    "No Data",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )
                ],
              )
            else if (providerW!.homeModel != null)
              Padding(
                padding: const EdgeInsets.all(5),
                child: SearchBar(
                  elevation: MaterialStateProperty.all(0.9),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
                  controller: txtName,
                  hintText: 'Search',
                  trailing: [
                    IconButton(
                        onPressed: () {
                          providerR!.flowerGetData(txtName.text);
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
              ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: MasonryGridView.builder(
                padding: const EdgeInsets.all(5),
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                itemCount: providerW!.homeModel!.l1!.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      HintModel a1 = providerR!.homeModel!.l1![index];
                      Navigator.pushNamed(context, 'detail', arguments: a1);
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          "${providerW!.homeModel!.l1![index].largeImageURL}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                          height: 10,
                          width: 10,
                          child: Center(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
