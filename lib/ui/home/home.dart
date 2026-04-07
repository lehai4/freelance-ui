import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../discount/discount.dart';
import '../notification/notification.dart';

class FreelanceUi extends StatelessWidget {
  const FreelanceUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freelance UI App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const FreelanceUiHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FreelanceUiHomePage extends StatefulWidget {
  const FreelanceUiHomePage({super.key});

  @override
  State<FreelanceUiHomePage> createState() => _FreelanceUiHomePage();
}

class _FreelanceUiHomePage extends State<FreelanceUiHomePage> {
  final List<Widget> _tabs = [
    const HomeTab(),
    const DiscountTab(),
    const NotificationTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surface.withValues(alpha: 0.8),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.sell)),
            BottomNavigationBarItem(icon: Icon(Icons.keyboard_option_key)),
            BottomNavigationBarItem(icon: Icon(Icons.support)),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return _tabs[index];
        },
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeTabPage();
  }
}

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }
}

Widget getBody() {
  return SafeArea(
    child: Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(color: Colors.deepOrange),
            ),
            Expanded(
              flex: 8,
              child: Container(color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Tìm kiếm sản phẩm',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.mic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hoverColor: Colors.grey,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_outlined, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeBanner(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final List<Map<String, dynamic>> banners = [
    {
      "title": "ShopeePay",
      "subtitle": "Gói 1 Triệu đồng. Tải app ngay 🐦‍🔥",
      "icon": Icons.sell_outlined,
    },
    {
      "title": "Điểm danh",
      "subtitle": "Để nhận Xu!",
      "icon": Icons.grid_goldenratio_outlined,
    },
    {
      "title": "SPayLater",
      "subtitle": "Kích hoạt nhận voucher 150.00...",
      "icon": Icons.access_time,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: banners.length,
            separatorBuilder: (context, index) => VerticalDivider(
              width: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.grey.shade300,
            ),
            itemBuilder: (context, index) {
              final item = banners[index];
              return InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 120,
                  child: Center(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      leading: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.shade50,
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          size: 16,
                          color: Colors.deepOrange,
                        ),
                      ),
                      title: Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        item['subtitle'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SquareBanner extends StatefulWidget {
  const SquareBanner({super.key});

  @override
  State<SquareBanner> createState() => _SquareBannerState();
}

class _SquareBannerState extends State<SquareBanner> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

