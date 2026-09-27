import 'package:flutter/material.dart';

class ReportsTab extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsTab({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1C2B39), size: 20),
                onPressed: onBack,
              ),
              const Text(
                'التقارير الشهرية',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
              // Empty SizedBox to balance the Row since the title is centered in the design
              const SizedBox(width: 40),
            ],
          ),
        ),
        const SizedBox(height: 16),
        
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // Date Picker Dropdown Mockup
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.keyboard_arrow_left, color: Colors.grey),
                      Text(
                        'سبتمبر 2025',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C2B39),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Total Expenses Chart Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'إجمالي المصروفات',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C2B39),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            'ج.م ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '12,450',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C2B39),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Mock Chart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildBar(60, const Color(0xFF1C2B39)),
                          _buildBar(40, Colors.blueGrey),
                          _buildBar(70, const Color(0xFF1C2B39)),
                          _buildBar(90, const Color(0xFF1C2B39)),
                          _buildBar(50, Colors.blueGrey),
                          _buildBar(65, Colors.grey.shade300),
                          _buildBar(45, Colors.grey.shade300),
                          _buildBar(80, Colors.grey.shade400),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Top 5 Categories Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'أعلى 5 فئات إنفاق',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C2B39),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildCategoryRow('بقالة', '32%', '3,980', Colors.brown),
                      const Divider(),
                      _buildCategoryRow('مواصلات', '18%', '2,240', Colors.orange),
                      const Divider(),
                      _buildCategoryRow('ترفيه', '12%', '1,490', Colors.blue),
                      const Divider(),
                      _buildCategoryRow('فواتير', '10%', '1,250', Colors.purple),
                      const Divider(),
                      _buildCategoryRow('صحة', '8%', '1,000', Colors.pink),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Export Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C2B39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'تصدير PDF',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBar(double height, Color color) {
    return Container(
      width: 16,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildCategoryRow(String title, String percentage, String amount, Color dotColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                percentage,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
