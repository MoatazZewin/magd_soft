import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';

import '../../../data/models/product_model.dart';
import '../../widget/abbar_material_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  Widget currentScreen = HelpScreen();
  String button = 'All';
  List<ProductModel>? model;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (button == 'All') {
            model = GlobalCubit.get(context).all;
          } else if (button == 'Acer') {
            model = GlobalCubit.get(context).acer;
          } else if (button == 'Razer') {
            model = GlobalCubit.get(context).razer;
          } else {
            model = GlobalCubit.get(context).apple;
          }

          return Scaffold(
            extendBody: true,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 4,
                                    )
                                  ]),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Container(
                              height: 53.0,
                              width: 53.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 4,
                                    )
                                  ]),
                              child: IconButton(
                                  iconSize: 30.0,
                                  color: Colors.grey,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.filter_alt,
                                  ))),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Card(
                          elevation: 5.0,
                          margin: const EdgeInsets.all(30),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                const Image(
                                    height: 144.0,
                                    width: double.infinity,
                                    image:
                                        AssetImage('assets/images/Acer.png')),
                                Text(
                                  'New Release\n'
                                  'Acer predator Helios 300',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                            )
                          ]),
                      height: 60,
                      child: ListView(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildItemCategory(
                              name: 'All',
                              path: 'assets/images/all.png',
                              context: context),
                          const SizedBox(
                            width: 20.0,
                          ),
                          buildItemCategory(
                              name: 'Acer',
                              path: 'assets/images/AcerLog.png',
                              context: context),
                          const SizedBox(
                            width: 20.0,
                          ),
                          buildItemCategory(
                              name: 'Razer',
                              path: 'assets/images/Razer.png',
                              context: context),
                          buildItemCategory(
                              name: 'Apple',
                              path: 'assets/images/ios.png',
                              context: context),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20.0,
                        end: 20.0,
                      ),
                      child: GridView.count(
                        shrinkWrap: true,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 15.0,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 1 / 1.70,
                        crossAxisCount: 2,
                        children: List.generate(
                          model!.length,
                          (index) => buildGridProduct(model![index], context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.home),
              backgroundColor: Colors.blue,
              onPressed: () {},
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: TabBarMaterialWidget(
              index: index,
              onChangedTab: onChangedTab,
            ),
          );
        });
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/help');
          break;
        case 1:
          Navigator.pushNamed(context, '/favorite');
          break;
        case 2:
          Navigator.pushNamed(context, '/notification');
          break;
        case 3:
          Navigator.pushNamed(context, '/setting');
          break;
      }
    });
  }

  Widget buildItemCategory({
    required String name,
    required String path,
    required var context,
  }) {
    return GestureDetector(
      onTap: () {
        button = name;
        setState(() {});
      },
      child: Material(
        elevation: 50.0,
        borderRadius: BorderRadius.circular(30.0),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                borderRadius: BorderRadius.circular(20.0),
                elevation: 5.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(path),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                '${name}',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridProduct(ProductModel model, context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: model);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 4,
              )
            ]),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(model.image),
                  height: 150,
                  width: double.infinity,
                ),
                IconButton(
                  onPressed: () {
                    // HomeCubit.get(context).changeFavoritesDataModel(model.id);
                  },
                  icon: const Icon(
                    Icons.favorite,
                  ),
                  color: Colors.grey,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.company,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price}',
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          primary: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
