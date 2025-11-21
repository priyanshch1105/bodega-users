import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';

class VendorScreen extends StatelessWidget {
  VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stores = [
      {"name": "Bharath Mart", "rating": 4.5, "time": "25–35 min", "distance": "5 km"},
      {"name": "Onkar Lalaso Mart", "rating": 4.1, "time": "10–15 min", "distance": "900 m"},
      {"name": "Dhruvesh Ali Mart", "rating": 4.4, "time": "8–10 min", "distance": "500 m"},
      {"name": "Eshwar Mart", "rating": 4.3, "time": "10–12 min", "distance": "1 km"},
      {"name": "G.V. Prasanna Kumar Mart", "rating": 4.5, "time": "7–14 min", "distance": "1.2 km"},
      {"name": "Anjali Mart", "rating": 4.2, "time": "40–55 min", "distance": "2.0 km"},
    ];

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Stack(
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
              ),
          const SizedBox(height: 16),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for products",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.cardColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(0.2)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // "Near By" label
              Text(
                "Near By",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),

              // Map Placeholder
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Guntur Map",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // List of Nearby Stores
              Expanded(
                child: ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    final store = stores[index];
                    final letter = store['name'][0].toUpperCase();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          // Leading Letter
                          Container(
                            width: 38,
                            height: 38,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              letter,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Store Info
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, size: 14, color: Colors.amber),
                                  const SizedBox(width: 2),
                                  Text("${store['rating']}  "),
                                  const Icon(Icons.timer, size: 14, color: Colors.grey),
                                  Text(" ${store['time']}  "),
                                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                  Text(store['distance']),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
