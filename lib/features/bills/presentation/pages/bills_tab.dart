import 'package:flutter/material.dart';
import 'add_bill_screen.dart';

class BillsTab extends StatefulWidget {
  final VoidCallback onBack;

  const BillsTab({Key? key, required this.onBack}) : super(key: key);

  @override
  State<BillsTab> createState() => _BillsTabState();
}

class _BillsTabState extends State<BillsTab> {
  int _selectedFilterIndex = 0;

  final List<String> _filters = ['الكل', 'مدفوعة', 'غير مدفوعة', 'متأخرة'];

  final List<Map<String, dynamic>> _bills = [
    {
      'title': 'فاتورة الكهرباء',
      'date': '2025/09/10',
      'amount': '450',
      'status': 'مدفوعة',
      'icon': Icons.flash_on,
      'iconColor': Colors.orange,
      'bgColor': Colors.orange.shade50,
    },
    {
      'title': 'فاتورة المياه',
      'date': '2025/09/08',
      'amount': '320',
      'status': 'متأخرة',
      'icon': Icons.water_drop_outlined,
      'iconColor': Colors.blue,
      'bgColor': Colors.blue.shade50,
    },
    {
      'title': 'فاتورة الإنترنت',
      'date': '2025/09/05',
      'amount': '280',
      'status': 'مدفوعة',
      'icon': Icons.wifi,
      'iconColor': Colors.purple,
      'bgColor': Colors.purple.shade50,
    },
    {
      'title': 'فاتورة الغاز',
      'date': '2025/09/03',
      'amount': '600',
      'status': 'غير مدفوعة',
      'icon': Icons.local_fire_department_outlined,
      'iconColor': Colors.green,
      'bgColor': Colors.green.shade50,
    },
    {
      'title': 'فاتورة التليفون',
      'date': '2025/09/01',
      'amount': '150',
      'status': 'مدفوعة',
      'icon': Icons.phone_in_talk_outlined,
      'iconColor': Colors.red.shade400,
      'bgColor': Colors.red.shade50,
    },
    {
      'title': 'فاتورة الصيانة',
      'date': '2025/08/28',
      'amount': '420',
      'status': 'متأخرة',
      'icon': Icons.build_outlined,
      'iconColor': Colors.deepPurple,
      'bgColor': Colors.deepPurple.shade50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBillScreen()),
          );
        },
        backgroundColor: const Color(0xFF1C2B39),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1C2B39), size: 20),
                onPressed: widget.onBack,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'الفواتير',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2B39),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'جميع فواتير الخدمات الخاصة بك',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Filters
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: List.generate(_filters.length, (index) {
              final isSelected = _selectedFilterIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilterIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF1C2B39) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF1C2B39) : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    _filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 24),

        // Bills List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            itemCount: _bills.length,
            itemBuilder: (context, index) {
              final bill = _bills[index];
              return _buildBillCard(bill);
            },
          ),
        ),
      ],
    ),
    );
  }

  Widget _buildBillCard(Map<String, dynamic> bill) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Arrow and Amount/Status
          Row(
            children: [
              const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        ' ج.م',
                        style: TextStyle(fontSize: 14, color: Color(0xFF1C2B39)),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        bill['amount'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C2B39),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildStatusBadge(bill['status']),
                ],
              ),
            ],
          ),
          
          // Right side: Title/Date and Icon
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bill['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2B39),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        bill['date'],
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.calendar_month_outlined, size: 14, color: Colors.grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bill['bgColor'],
                  shape: BoxShape.circle,
                ),
                child: Icon(bill['icon'], color: bill['iconColor'], size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    IconData icon;

    if (status == 'مدفوعة') {
      bgColor = Colors.green.shade50;
      textColor = Colors.green;
      icon = Icons.check_circle_outline;
    } else if (status == 'متأخرة') {
      bgColor = Colors.red.shade50;
      textColor = Colors.red;
      icon = Icons.access_time;
    } else {
      bgColor = Colors.grey.shade100;
      textColor = Colors.grey.shade700;
      icon = Icons.access_time;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status,
            style: TextStyle(fontSize: 10, color: textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 12, color: textColor),
        ],
      ),
    );
  }
}
