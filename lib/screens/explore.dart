import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_round_textbox.dart';
import '../widgets/recipe_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: buildHeader(),
        ),
        SliverToBoxAdapter(
          child: buildSearchBlcok(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => RecipeItem(
            data: recipes[index],
            onFavoriteTap: () {
              setState(() {
                recipes[index]["is_favorited"] =
                    !recipes[index]["is_favorited"];
              });
            },
            onTap: () {},
          ),
          childCount: recipes.length,
        ))
      ],
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Sepet",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget buildSearchBlcok() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      child: Row(
        children: const [
          Expanded(
            child: CustomRoundTextBox(
              hint: "Sepet'e Ara",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;
  Widget buildCategory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 7, 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryItem(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              data: categories[index],
              isSelected: index == selectedCategoryIndex,
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
