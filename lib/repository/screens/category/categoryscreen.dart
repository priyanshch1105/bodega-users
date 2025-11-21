import 'package:bodega_delivery/repository/screens/cart/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<String> filters = ["All", "Vegetables", "Fruits", "Meat"];
  Set<String> selectedFilters = {"All"};

  final List<Map<String, String>> allProducts = [
    {
      "img": "assets/images/apple.png",
      "name": "Organic Apples",
      "price": "₹299",
      "weight": "Organic Apples 1 KG",
      "seller": "Vidyuth Jamal Mart",
      "category": "Fruits"
    },
    {
      "img": "assets/images/tomato.png",
      "name": "Tomatoes",
      "price": "₹49",
      "weight": "Tomatoes 1 KG",
      "seller": "Fresh Veggies",
      "category": "Vegetables"
    },
    {
      "img": "assets/images/potato.png",
      "name": "Potato",
      "price": "₹29",
      "weight": "Potatoes 1 KG",
      "seller": "Vidyuth Jamal Mart",
      "category": "Vegetables"
    },
  ];

  List<Map<String, String>> get filteredProducts {
    if (selectedFilters.contains("All")) return allProducts;
    return allProducts
        .where((p) => selectedFilters.contains(p["category"]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSearchBar(context),
            _buildFilterChips(context),
            Expanded(child: _buildProductGrid(context)),
          ],
        ),
      ),
    );
  }

  /// HEADER
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: UiHelper.CustomText(
              text: "BOdega",
              color: AppColors.text1(context),
              fontweight: FontWeight.bold,
              fontsize: 20,
              fontfamily: "bold",
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 16,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (_, __, ___) => ProfileScreen(),
                transitionsBuilder: (_, animation, __, child) {
                  final tween = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeInOut));
                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              ),
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.profileb(context),
              child: Icon(Icons.person, color: AppColors.icon(context)),
            ),
          ),
        ),
      ],
    );
  }

  /// SEARCH BAR
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: UiHelper.CustomTextField(
        controller: searchController,
        hintText: "Search for items...",
        fillColor: AppColors.inputField(context),
        color: AppColors.text(context),
      ),
    );
  }

  /// FILTER CHIPS
  Widget _buildFilterChips(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((filter) {
            final isSelected = selectedFilters.contains(filter);
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(filter),
                selected: isSelected,
                selectedColor: AppColors.button(context),
                backgroundColor: AppColors.inputField(context),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColors.text(context),
                ),
                onSelected: (_) => _toggleFilter(filter, isSelected),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _toggleFilter(String filter, bool isSelected) {
    setState(() {
      if (filter == "All") {
        selectedFilters = {"All"};
      } else {
        selectedFilters.remove("All");
        isSelected ? selectedFilters.remove(filter) : selectedFilters.add(filter);
        if (selectedFilters.isEmpty) selectedFilters.add("All");
      }
    });
  }

  /// PRODUCT GRID
  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () => _showProductDetails(context, product),
            child: _buildProductCard(context, product),
          );
        },
      ),
    );
  }

  /// PRODUCT CARD
  Widget _buildProductCard(BuildContext context, Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card(context),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(product['img']!, height: 150, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(product['name']!,
              style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text(context))),
          const SizedBox(height: 4),
          Text(product['price']!, style: TextStyle(color: AppColors.text(context))),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button(context),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              child: Text("Add", style: TextStyle(color: AppColors.buttontext(context))),
            ),
          ),
        ],
      ),
    );
  }

  /// PRODUCT DETAILS BOTTOM SHEET
  void _showProductDetails(BuildContext context, Map<String, String> product) {
    int quantity = 1;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card(context),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(25),
              child: Wrap(
                children: [
                  _buildBottomSheetHeader(() => Navigator.pop(context)),
                  const SizedBox(height: 20),
                  _buildBottomSheetImage(product),
                  const SizedBox(height: 20),
                  _buildBottomSheetDetails(context, product),
                  const SizedBox(height: 12),
                  _buildPriceAndQuantity(context, product, setModalState, quantity),
                  const SizedBox(height: 10),
                  _buildAddToCartButton(context),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomSheetHeader(VoidCallback onClose) {
    return Row(
      children: [
        const Text("Product Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Spacer(),
        GestureDetector(onTap: onClose, child: const Icon(Icons.close)),
      ],
    );
  }

  Widget _buildBottomSheetImage(Map<String, String> product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(product['img']!, height: 160, width: double.infinity, fit: BoxFit.cover),
    );
  }

  Widget _buildBottomSheetDetails(BuildContext context, Map<String, String> product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product['name']!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.text(context))),
        const SizedBox(height: 8),
        Text(product['weight']!, style: TextStyle(color: AppColors.text(context))),
        const SizedBox(height: 8),
        Text("Sold by : ${product['seller']}",
            style: TextStyle(color: AppColors.text(context), fontSize: 13)),
      ],
    );
  }

  Widget _buildPriceAndQuantity(BuildContext context, Map<String, String> product,
      Function setModalState, int quantity) {
    return StatefulBuilder(
      builder: (context, innerSetState) {
        return Row(
          children: [
            Text(
              product['price']!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text1(context),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                if (quantity > 1) {
                  innerSetState(() => quantity--);
                }
              },
              icon: const Icon(Icons.remove_circle_outline),
              color: AppColors.button(context),
            ),
            Text('$quantity', style: TextStyle(fontSize: 16, color: AppColors.text1(context))),
            IconButton(
              onPressed: () {
                innerSetState(() => quantity++);
              },
              icon: const Icon(Icons.add_circle_outline),
              color: AppColors.button(context),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 100),
              pageBuilder: (context, animation, secondaryAnimation) => CartScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(-1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeInOut));
                return SlideTransition(position: animation.drive(tween), child: child);
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text("Add to Cart", style: TextStyle(color: AppColors.buttontext(context))),
      ),
    );
  }
}
