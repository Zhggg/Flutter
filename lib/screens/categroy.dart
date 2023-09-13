import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/screens/details.dart';
import 'package:ui1/service/provider/category_provider.dart';
import 'package:ui1/service/provider/item_provider.dart';
import './../model/categoryInfo.dart';

class CategoryData extends ConsumerStatefulWidget {
  const CategoryData({super.key});

  @override
  ConsumerState<CategoryData> createState() => _CategoryDataState();
}

class _CategoryDataState extends ConsumerState<CategoryData> {
  @override
  Widget build(BuildContext context) {
    final itemProv = ref.watch(itemProvider.notifier);
    final itemState = ref.watch(itemProvider);
    final categoryProv = ref.watch(categProvider.notifier);
    final categoryState = ref.watch(categProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allCategoriesRawData.length,
              itemBuilder: (context, index) {
                final item = allCategoriesRawData[index];
                return GestureDetector(
                  onTap: () {
                    categoryProv.filterItems(item['cid']);
                  },
                  child: Card(
                    color: categoryState.selectedCategory == item['cid']
                        ? Colors.grey
                        : Colors.white,
                    child: Stack(
                      children: [
                        Image.asset(
                          item["photo"],
                          fit: BoxFit.cover,
                          height: 150,
                          width: 400,
                        ),
                        Container(
                          // padding: const EdgeInsets.symmetric(
                          //   horizontal: 58.0,
                          // ),
                          alignment: const Alignment(1.0, 1.0),
                          child: Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(138, 139, 138, 136),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Text(
            "Items",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 128, 128),
            ),
          ),
          const Divider(),
          if (categoryState.loading)
            Container(
              child: CircularProgressIndicator(),
              padding: const EdgeInsets.symmetric(
                vertical: 195.0,
              ),
            ),
          if (!categoryState.loading)
            SingleChildScrollView(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10),
                itemCount: (categoryState.filteredItems ?? []).length,
                itemBuilder: (context, index) {
                  final item = (categoryState.filteredItems ?? [])[index];
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        itemProv.filterDetails(item['iid']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            item["photo"],
                            width: 200,
                            height: 170,
                            fit: BoxFit.fitHeight,
                          ),
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
