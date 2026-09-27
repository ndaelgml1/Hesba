import 'package:flutter/material.dart';
import 'receipt_ocr_screen.dart';

class AddBillScreen extends StatefulWidget {
  const AddBillScreen({Key? key}) : super(key: key);

  @override
  State<AddBillScreen> createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {
  String _selectedType = 'كهرباء';

  final List<Map<String, dynamic>> _billTypes = [
    {
      'title': 'كهرباء',
      'icon': Icons.flash_on,
      'iconColor': Colors.orange,
    },
    {
      'title': 'مياه',
      'icon': Icons.water_drop_outlined,
      'iconColor': Colors.blue,
    },
    {
      'title': 'غاز',
      'icon': Icons.local_fire_department_outlined,
      'iconColor': Colors.red.shade400,
    },
    {
      'title': 'إنترنت',
      'icon': Icons.wifi,
      'iconColor': Colors.green,
    },
    {
      'title': 'أخرى',
      'icon': Icons.storefront_outlined,
      'iconColor': Colors.purple,
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
                            'إضافة فاتورة',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C2B39),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'أضف تفاصيل الفاتورة الجديدة بسهولة',
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
                      
                      // Invoice Type Section
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
                            const Text(
                              'نوع الفاتورة',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1C2B39),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: _billTypes.map((type) {
                                  final isSelected = _selectedType == type['title'];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedType = type['title'];
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 12),
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

                      // Amount Field
                      _buildLabel('المبلغ', Icons.payments_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(
                        hint: 'أدخل المبلغ',
                        suffixIcon: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('ج.م', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ),
                      ),
                      
                      const SizedBox(height: 20),

                      // Due Date Field
                      _buildLabel('تاريخ الاستحقاق', Icons.calendar_today_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(
                        hint: 'اختر التاريخ',
                        suffixIcon: const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                        readOnly: true,
                      ),
                      
                      const SizedBox(height: 20),

                      // Month Field
                      _buildLabel('الشهر', Icons.calendar_month_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(
                        hint: 'اختر الشهر',
                        suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                        readOnly: true,
                      ),
                      
                      const SizedBox(height: 20),

                      // Notes Field
                      _buildLabel('ملاحظات (اختياري)', Icons.notes_outlined),
                      const SizedBox(height: 8),
                      _buildTextField(
                        hint: 'أضف أي ملاحظات إن وجدت',
                        maxLines: 4,
                      ),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
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
                          'حفظ الفاتورة',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ReceiptOcrScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF1C2B39)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFF1C2B39)),
                        label: const Text(
                          'إضافة صورة الفاتورة',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C2B39),
                          ),
                        ),
                      ),
                    ),
                  ],
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

  Widget _buildTextField({
    required String hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool readOnly = false,
    int maxLines = 1,
  }) {
    return TextField(
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
