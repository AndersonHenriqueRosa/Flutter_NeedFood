import 'package:flutter/material.dart';
import 'package:need_food/common/my_colors.dart';
import 'package:need_food/common/my_style.dart';
import 'package:need_food/components/_search_app_bar.dart';
import 'package:need_food/components/image_slider.dart';
import 'package:need_food/views/product/product_details.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool burge = false, drink = false, pizza = false;
  List _products = [];

  List<String> imagePaths = [
    "assets/img/row-banner.png",
    "assets/img/blog-3.png",
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchAppBar(), // Barra de pesquisa personalizada
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 0), // Margens horizontais para o ImageSlider
                    width: MediaQuery.of(context).size.width - 20, // Largura ocupando a tela, com margens
                    height: 150,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ImageSlider(imagePaths: imagePaths), // Slider de imagens personalizado
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  buildSectionTitle("Categories"),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildCategoryItem(
                          "assets/img/menu-1.png",
                          "Burger",
                          burge,
                          () {
                            setState(() {
                              burge = true;
                              drink = false;
                              pizza = false;
                            });
                          },
                        ),
                        buildCategoryItem(
                          "assets/img/cat-6.png",
                          "Drink",
                          drink,
                          () {
                            setState(() {
                              burge = false;
                              drink = true;
                              pizza = false;
                            });
                          },
                        ),
                        buildCategoryItem(
                          "assets/img/food-8.png",
                          "Pizza",
                          pizza,
                          () {
                            setState(() {
                              burge = false;
                              drink = false;
                              pizza = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  buildSectionTitle("Popular Now"),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildPopularItem(
                          "assets/img/food-2.png",
                          "Beef Burger",
                          "Mcdi",
                          "\$20,00",
                        ),
                        SizedBox(width: 15),
                        buildPopularItem(
                          "assets/img/cat-2.png",
                          "Pizza Fruit",
                          "Pijja hul",
                          "\$40,00",
                        ),
                        SizedBox(width: 15),
                        buildPopularItem(
                          "assets/img/menu-4.png",
                          "Sandwich",
                          "Mcdi",
                          "\$10,00",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  buildSectionTitle("Recommended"),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildImageCard("assets/img/blog-1.png"),
                          SizedBox(width: 10),
                          buildImageCard("assets/img/blog-3.png"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(
      String imagePath, String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            decoration: BoxDecoration(
              color: isSelected ? MyColors.gray : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: MyStyle.categoriesTextFeilStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPopularItem(
      String imagePath, String title, String subTitle, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails()));
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: MyStyle.categoriesTextFeilStyle(),
                ),
                Text(
                  subTitle,
                  style: MyStyle.lightTextFeilStyle(),
                ),
                SizedBox(height: 3),
                Text(
                  price,
                  style: MyStyle.priceTextFeilStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: MyStyle.boldTextFeilStyle(),
    );
  }

  Widget buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imagePath,
        height: 200, // Altura fixa
        width: MediaQuery.of(context).size.width * 0.8, 
        fit: BoxFit.cover,
      ),
    );
  }
}
