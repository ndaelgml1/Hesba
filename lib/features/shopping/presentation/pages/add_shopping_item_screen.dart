import 'package:flutter/material.dart';

class AddShoppingItemScreen extends StatefulWidget {
  const AddShoppingItemScreen({Key? key}) : super(key: key);

  @override
  State<AddShoppingItemScreen> createState() => _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends State<AddShoppingItemScreen> {
  String _selectedCategory = 'مشتريات عامة';

  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'مشتريات عامة',
      'icon': Icons.shopping_cart_outlined,
      'iconColor': Colors.blue,
    },
    {
      'title': 'خضروات',
      'icon': Icons.eco_outlined,
      'iconColor': Colors.green,
    },
    {
      'title': 'فواكه',
      'icon': Icons.apple_outlined,
      'iconColor': Colors.redAccent,
    },
    {
      'title': 'لحوم ودواجن',
      'icon': Icons.set_meal_outlined, // Using set_meal as placeholder for meat
      'iconColor': Colors.red,
    },
    {
      'title': 'ألبان',
      'icon': Icons.local_drink_outlined,
      'iconColor': Colors.blueAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: SafeArea(
          child: Column(
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'إضافة مشتريات جديدة',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C2B39),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'أضف تفاصيل المشتريات اللي هتشتريها',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Color(0xFF1C2B39), size: 24),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      
                      // Category Section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.grid_view, size: 20, color: Color(0xFF1C2B39)),
                                SizedBox(width: 8),
                                Text(
                                  'الكاتيجوري',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1C2B39),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: _categories.map((type) {
                                  final isSelected = _selectedCategory == type['title'];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedCategory = type['title'];
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 12),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isSelected ? Colors.blue.shade50 : Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: isSelected ? Colors.blue : Colors.transparent,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            type['icon'],
                                            color: type['iconColor'],
                                            size: 28,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            type['title'],
                                            style: TextStyle(
                                              color: isSelected ? Colors.blue : Colors.grey.shade600,
                                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),

                      // Item Name
                      _buildLabel('اسم الصنف', Icons.local_offer_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(hint: 'مثال: طماطم'),
                      
                      const SizedBox(height: 20),

                      // Count Field
                      _buildLabel('العدد', Icons.inventory_2_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(hint: 'مثال: 2'),
                      
                      const SizedBox(height: 20),

                      // Weight Field
                      _buildLabel('الوزن', Icons.shopping_bag_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(hint: 'مثال: 1 كجم'),
                      
                      const SizedBox(height: 20),

                      // Price Field
                      _buildLabel('السعر', Icons.monetization_on_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(hint: 'مثال: 25 ج.م'),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Bottom Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C2B39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'إضافة للمشتريات',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF1C2B39)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C2B39),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required String hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
