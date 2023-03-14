import 'package:flutter/material.dart';
import 'package:intelligentproject/Provider.dart';
import 'package:provider/provider.dart';

class view_Page extends StatefulWidget {
  const view_Page({Key? key}) : super(key: key);

  @override
  State<view_Page> createState() => _view_PageState();
}

class _view_PageState extends State<view_Page> {
  final List<Map<String, dynamic>> gridMap = [

  ];

  @override
  Widget build(BuildContext context) {
    print(context.watch<DataProvider>().getData);
    return Scaffold( appBar: AppBar(
      backgroundColor: Colors.amberAccent.shade100,
      title: Text("EXPLORE NEPAL"),
    ),
      body:GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 600,
        ),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0,),
              color: Colors.amberAccent.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    "${gridMap.elementAt(index)['images']}",
                    height: 300,
                    width:double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${gridMap.elementAt(index)['title']}",
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "${gridMap.elementAt(index)['description']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
