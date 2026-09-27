import 'package:flutter/material.dart';
import 'add_shopping_item_screen.dart';

class ShoppingListTab extends StatefulWidget {
  final VoidCallback onBack;

  const ShoppingListTab({Key? key, required this.onBack}) : super(key: key);

  @override
  State<ShoppingListTab> createState() => _ShoppingListTabState();
}

class _ShoppingListTabState extends State<ShoppingListTab> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['الكل', 'خضروات', 'فواكه', 'منتجات ألبان', 'مخبوزات'];

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'طماطم',
      'category': 'خضروات',
      'emoji': '🍅',
      'quantity': '1 كجم',
      'checked': false,
    },
    {
      'title': 'موز',
      'category': 'فواكه',
      'emoji': '🍌',
      'quantity': '1 كجم',
      'checked': true,
    },
    {
      'title': 'لبن',
      'category': 'منتجات ألبان',
      'emoji': '🥛',
      'quantity': '2 لتر',
      'checked': false,
    },
    {
      'title': 'عيش بلدي',
      'category': 'مخبوزات',
      'emoji': '🥖',
      'quantity': '2 رغيف',
      'checked': true,
    },
    {
      'title': 'بيض',
      'category': 'منتجات ألبان',
      'emoji': '🥚',
      'quantity': '1 كرتونة',
      'checked': false,
    },
    {
      'title': 'بصل',
      'category': 'خضروات',
      'emoji': '🧅',
      'quantity': '1 كجم',
      'checked': false,
    },
    {
      'title': 'دجاج',
      'category': 'لحوم ودواجن',
      'emoji': '🍗',
      'quantity': '1 كجم',
      'checked': false,
    },
    {
      'title': 'أرز',
      'category': 'بقالة جافة',
      'emoji': '🍚',
      'quantity': '1 كجم',
      'checked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1C2B39), size: 20),
                onPressed: widget.onBack,
              ),
              const Text(
                'قائمة المشتريات',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Color(0xFF1C2B39), size: 24),
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'ابحث عن منتج...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),

        // Categories
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: List.generate(_categories.length, (index) {
              final isSelected = _selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF1C2B39) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF1C2B39) : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        _categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey.shade600,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      if (index != 0) ...[
                        const SizedBox(width: 8),
                        Icon(
                          _getCategoryIcon(_categories[index]),
                          size: 16,
                          color: isSelected ? Colors.white : Colors.grey.shade600,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        
        const SizedBox(height: 16),

        // List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return _buildItemCard(item, index);
            },
          ),
        ),

        // Add Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddShoppingItemScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C2B39),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'إضافة منتج',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Checkbox
          GestureDetector(
            onTap: () {
              setState(() {
                _items[index]['checked'] = !_items[index]['checked'];
              });
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: item['checked'] ? const Color(0xFF1C2B39) : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: item['checked'] ? const Color(0xFF1C2B39) : Colors.grey.shade400,
                ),
              ),
              child: item['checked']
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          
          // Image / Emoji
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              item['emoji'],
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(width: 16),
          
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2B39),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['category'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          // Quantity and Arrow
          Row(
            children: [
              Text(
                item['quantity'],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'خضروات':
        return Icons.eco_outlined;
      case 'فواكه':
        return Icons.apple_outlined;
      case 'منتجات ألبان':
        return Icons.local_drink_outlined;
      case 'مخبوزات':
        return Icons.bakery_dining_outlined;
      default:
        return Icons.category_outlined;
    }
  }
}
