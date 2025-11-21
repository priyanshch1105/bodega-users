import 'package:bodega_delivery/repository/screens/cart/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';
import '../profile/profilescreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 12),
              _buildSearchBar(context),
              const SizedBox(height: 20),
              _buildSectionTitle(context, "Sales Offers"),
              const SizedBox(height: 12),
              _buildSalesOffers(context),
              const SizedBox(height: 24),
              _buildSectionTitle(context, "Categories"),
              const SizedBox(height: 12),
              _buildCategories(context),
              const SizedBox(height: 24),
              _buildSectionTitle(context, "Featured Products"),
              const SizedBox(height: 12),
              _buildFeaturedProducts(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 HEADER
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: UiHelper.CustomText(
              text: "BOdega",
              color: AppColors.text1(context),
              fontweight: FontWeight.bold,
              fontsize: 22,
              fontfamily: "bold",
            ),
          ),
        ),
        Positioned(
          left: 8,
          top: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (_, __, ___) =>  ProfileScreen(),
                  transitionsBuilder: (_, animation, __, child) {
                    final tween = Tween(begin: const Offset(-1, 0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut));
                    return SlideTransition(position: animation.drive(tween), child: child);
                  },
                ),
              );
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.profileb(context),
              child: Icon(Icons.person, color:AppColors.icon(context)),
            ),
          ),
        ),
      ],
    );
  }

  /// 🔹 SEARCH BAR
  Widget _buildSearchBar(BuildContext context) {
    return UiHelper.CustomTextField(
      controller: searchController,
      hintText: "Search for products...",
      fillColor: AppColors.inputField(context),
      color: AppColors.text(context),
    );
  }

  /// 🔹 SECTION TITLE
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.text1(context),
      ),
    );
  }

  /// 🔹 SALES OFFERS
  Widget _buildSalesOffers(BuildContext context) {
    final offers = [
      {"img": "assets/images/buy1get1free.png", "label": "Grocery Sale"},
      {"img": "assets/images/festival_sale.png", "label": "Festival Sale"},
      {"img": "assets/images/potato.png", "label": "50% Off"},
    ];

    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (_, index) {
          final offer = offers[index];
          return GestureDetector(
            onTap: () {
              // Example navigation
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) =>  ProfileScreen(),
                  transitionsBuilder: (_, animation, __, child) {
                    final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut));
                    return SlideTransition(position: animation.drive(tween), child: child);
                  },
                ),
              );
            },
            child: Container(
              width: 226,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey(context).withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        offer['img']!,
                        height: 140,
                        width: 226,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    offer['label']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 CATEGORIES
  Widget _buildCategories(BuildContext context) {
    final categories = [
      {"img": "assets/images/fruit.png", "label": "Fruits"},
      {"img": "assets/images/vegetable.png", "label": "Vegetables"},
      {"img": "assets/images/snack.png", "label": "Snacks"},
      {"img": "assets/images/milk.png", "label": "Dairy"},
    ];

    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Example transition
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) =>  ProfileScreen(),
                  transitionsBuilder: (_, animation, __, child) {
                    final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut));
                    return SlideTransition(position: animation.drive(tween), child: child);
                  },
                ),
              );
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(right: 14),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.card(context),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey(context).withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        category['img']!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['label']!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 FEATURED PRODUCTS
  Widget _buildFeaturedProducts(BuildContext context) {
    final products = [
      {"title": "Apple", "price": "₹120 / Kg", "img": "assets/images/apple.png"},
      {"title": "Tomato", "price": "₹299 / Kg", "img": "assets/images/tomato.png"},
      {"title": "Milk", "price": "₹349 / Liter", "img": "assets/images/milk.png"},
      {"title": "Potato", "price": "₹49 / Kg", "img": "assets/images/potato.png"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((p) => _buildProductCard(context, p)).toList(),
      ),
    );
  }

  /// 🔹 PRODUCT CARD
  Widget _buildProductCard(BuildContext context, Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        // Example navigation
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) =>  ProfileScreen(),
            transitionsBuilder: (_, animation, __, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut));
              return SlideTransition(position: animation.drive(tween), child: child);
            },
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey(context).withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(product['img']!, height: 80, width: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              product['title']!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.text(context),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product['price']!,
              style: TextStyle(
                color: AppColors.button(context),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 100),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        CartScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(-1.0, 0.0);
                      const end = Offset.zero;
                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: Curves.easeInOut));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button(context),
                  foregroundColor: AppColors.text(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: Text("Add",
                  style: TextStyle(color: AppColors.buttontext(context)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
