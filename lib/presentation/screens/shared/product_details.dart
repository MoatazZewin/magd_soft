import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widget/default_app_button.dart';

class ProductsDetails extends StatelessWidget {
  final data;
  const ProductsDetails({this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${data.name}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text('Type:'),
                    Text('${data.type}'),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Material(
                  elevation: 15.0,
                  borderRadius: BorderRadius.circular(20.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      height: 240,
                      fit: BoxFit.fill,
                      image: NetworkImage(data.image),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontSize: 20.0,
                              ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${data.price} EGP',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    DefaultAppButton(
                      height: 8.h,
                      width: 50.w,
                      fontSize: 20.0,
                      onTap: () {},
                      text: 'Add To Cart',
                      textColor: Colors.white,
                      backGround: Colors.blue,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 10.0,
                    end: 20.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overview',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Specification',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Review',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: Text('${data.description}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
