import 'package:flutter/material.dart';
import '../../../../features/settings/presentation/pages/settings_tab.dart';
import '../../../../features/expenses/presentation/pages/add_expense_screen.dart';
import '../../../../features/expenses/presentation/pages/expenses_tab.dart';
import '../../../../features/bills/presentation/pages/bills_tab.dart';
import '../../../../features/budget/presentation/pages/budget_tab.dart';
import '../../../../features/analytics/presentation/pages/analytics_tab.dart';
import '../../../../features/reports/presentation/pages/reports_tab.dart';
import '../../../../features/family/presentation/pages/family_tab.dart';
import '../../../../features/shopping/presentation/pages/shopping_list_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF9F6),
        body: SafeArea(
          child: _buildBody(),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return ExpensesTab(onBack: () => setState(() => _currentIndex = 0));
      case 2:
        return BillsTab(onBack: () => setState(() => _currentIndex = 0));
      case 3:
        return AnalyticsTab(onBack: () => setState(() => _currentIndex = 0));
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildBalanceCard(),
          const SizedBox(height: 24),
          _buildMainCategories(),
          const SizedBox(height: 24),
          _buildRecentTransactions(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey,
              // Using an icon as a placeholder for the avatar image
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'مرحباً، محمد',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2B39),
                  ),
                ),
                Text(
                  'لنصنع مستقبلاً أفضل معاً',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Color(0xFF1C2B39), size: 28),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return GestureDetector(
      onTap: () {
        _showMoreBottomSheet(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (routeContext) => Scaffold(
            backgroundColor: const Color(0xFFF8F9FA),
            body: SafeArea(child: BudgetTab(onBack: () => Navigator.pop(routeContext))),
          )),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1C2B39),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'إجمالي الرصيد المتاح',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Icon(Icons.account_balance_wallet_outlined, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '25,000 ج.م',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '56%',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: LinearProgressIndicator(
                    value: 0.56,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBalanceItem('المصروفات', '12,450 ج.م'),
              Container(width: 1, height: 40, color: Colors.white.withOpacity(0.2)),
              _buildBalanceItem('المدخرات', '12,550 ج.م'),
            ],
          ),
        ],
      ),
    ));
  }

  Widget _buildBalanceItem(String title, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMainCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الأقسام الرئيسية',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C2B39),
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2.2,
          children: [
            _buildCategoryCard('الطعام', '320 ج.م', Icons.restaurant, Colors.orange.shade100, Colors.orange),
            _buildCategoryCard('المسكن', '450 ج.م', Icons.home_outlined, Colors.orange.shade100, Colors.orange),
            _buildCategoryCard('الترفيه', '150 ج.م', Icons.wifi, Colors.purple.shade100, Colors.purple),
            _buildCategoryCard('المواصلات', '280 ج.م', Icons.directions_car_outlined, Colors.blue.shade100, Colors.blue),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String amount, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(amount, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'آخر المصاريف ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
              Text(
                'عرض الكل',
                style: TextStyle(fontSize: 14, color: Colors.blue.shade700, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTransactionItem('مطعم', 'الطعام • 2025/09/04', '450 ج.م', Icons.restaurant, Colors.orange.shade100, Colors.orange),
          const Divider(height: 24),
          _buildTransactionItem('مواصلات', 'المواصلات • 2025/09/02', '320 ج.م', Icons.directions_car, Colors.blue.shade100, Colors.blue),
          const Divider(height: 24),
          _buildTransactionItem('بقالة', 'الطعام • 2025/09/01', '280 ج.م', Icons.shopping_cart_outlined, Colors.green.shade100, Colors.green),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'إضافة مصروف جديد',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1C2B39),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount, IconData icon, Color bgColor, Color iconColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Text(
          amount,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex >= 5 ? 0 : _currentIndex, // For Budget overlay
        onTap: (index) {
          if (index == 4) {
            _showMoreBottomSheet(context);
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1C2B39),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'المصاريف'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'الفواتير'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: 'التحليلات'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'المزيد'),
        ],
      ),
    );
  }

  void _showMoreBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'المزيد',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
              const SizedBox(height: 16),
              _buildBottomSheetItem(
                context: context,
                icon: Icons.bar_chart,
                title: 'التقارير الشهرية',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (routeContext) => Scaffold(
                      backgroundColor: const Color(0xFFF8F9FA),
                      body: SafeArea(child: ReportsTab(onBack: () => Navigator.pop(routeContext))),
                    )),
                  );
                },
              ),
              _buildBottomSheetItem(
                context: context,
                icon: Icons.pie_chart_outline,
                title: 'إدارة الميزانية',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (routeContext) => Scaffold(
                      backgroundColor: const Color(0xFFF8F9FA),
                      body: SafeArea(child: BudgetTab(onBack: () => Navigator.pop(routeContext))),
                    )),
                  );
                },
              ),
              _buildBottomSheetItem(
                context: context,
                icon: Icons.shopping_cart_outlined,
                title: 'قائمة المشتريات',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (routeContext) => Scaffold(
                      backgroundColor: const Color(0xFFF8F9FA),
                      body: SafeArea(child: ShoppingListTab(onBack: () => Navigator.pop(routeContext))),
                    )),
                  );
                },
              ),
              _buildBottomSheetItem(
                context: context,
                icon: Icons.family_restroom,
                title: 'البيت العائلي',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (routeContext) => Scaffold(
                      backgroundColor: const Color(0xFFF8F9FA),
                      body: SafeArea(child: FamilyTab(onBack: () => Navigator.pop(routeContext))),
                    )),
                  );
                },
              ),
              _buildBottomSheetItem(
                context: context,
                icon: Icons.settings_outlined,
                title: 'الإعدادات',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (routeContext) => Scaffold(
                      backgroundColor: const Color(0xFFF8F9FA),
                      body: SafeArea(child: SettingsTab(onBack: () => Navigator.pop(routeContext))),
                    )),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2B39),
              ),
            ),
            const SizedBox(width: 16),
            Icon(icon, color: const Color(0xFF1C2B39)),
          ],
        ),
      ),
    );
  }
}
