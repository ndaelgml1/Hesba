import 'package:flutter/material.dart';
import '../../../../features/family/presentation/pages/family_tab.dart';
import '../../../../core/network/supabase/supabase_manager.dart';
import '../../../../features/splash/presentation/pages/splash_screen.dart';
class SettingsTab extends StatelessWidget {
  final VoidCallback onBack;

  const SettingsTab({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1C2B39), size: 20),
                onPressed: onBack,
              ),
              const Text(
                'الإعدادات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B39),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'محمد أحمد',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C2B39),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'mohamed@example.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Setting Items
          _buildSettingItem('الملف الشخصي', Icons.person_outline),
          const SizedBox(height: 12),
          _buildSettingItem(
            'البيت العائلي',
            Icons.family_restroom,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (routeContext) => Scaffold(
                  backgroundColor: const Color(0xFFF8F9FA),
                  body: SafeArea(
                    // Import needed for FamilyTab, so let's make sure it's accessible or we will add import
                    child: FamilyTab(onBack: () => Navigator.pop(routeContext)),
                  ),
                )),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildSettingItem('الأمان والخصوصية', Icons.lock_outline),
          const SizedBox(height: 12),
          _buildSettingItem('الإشعارات', Icons.notifications_none),
          const SizedBox(height: 12),
          _buildSettingItem('اللغة', Icons.language_outlined),
          const SizedBox(height: 12),
          _buildSettingItem('المظهر', Icons.light_mode_outlined),
          const SizedBox(height: 12),
          _buildSettingItem('المساعدة والدعم', Icons.headset_mic_outlined),
          const SizedBox(height: 12),
          _buildSettingItem('عن التطبيق', Icons.info_outline),
          const SizedBox(height: 24),
          
          // Logout Button
          InkWell(
            onTap: () async {
              // Sign out from Supabase
              await SupabaseManager.client.auth.signOut();
              // Navigate back to Splash Screen
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red.shade700),
                      const SizedBox(width: 16),
                      Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red.shade700),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF1C2B39)),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C2B39),
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
