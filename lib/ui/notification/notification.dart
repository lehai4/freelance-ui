import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_ui/ui/home/home.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationTabPage();
  }
}

class NotificationTabPage extends StatefulWidget {
  const NotificationTabPage({super.key});

  @override
  State<NotificationTabPage> createState() => _NotificationTabPage();
}

class _NotificationTabPage extends State<NotificationTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }
}

Widget getBody() {
  return SafeArea(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 56, // Chiều cao chuẩn của AppBar
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text('Thông báo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.chat_outlined)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: _ListItem()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: _ProductCartState(),
          ),
        ],
      ),
    ),
  );
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ListItem();
  }
}

class _ListItem extends StatefulWidget {
  const _ListItem({super.key});

  @override
  State<_ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Khuyến mãi",
      "subtitle": "🍳 Nhập mã T4GIAM18 với ShopeeFood",
      "icon": Icons.sell_outlined,
      "iconColor": Colors.orange,
      "badge": 8,
    },
    {
      "title": "Live & Video",
      "subtitle": "SALE MGG LIVE Đèn TAO1501",
      "icon": Icons.video_library_outlined,
      "iconColor": Colors.teal,
      "badge": 4,
    },
    {
      "title": "Thông tin Tài chính",
      "subtitle": "💖 Tặng bạn Voucher MIỄN LÃI - Dành riêng...",
      "icon": Icons.account_balance_wallet_outlined,
      "iconColor": Colors.redAccent,
      "badge": 1
    },
    {
      "title": "Cập nhật Shopee",
      "subtitle": "Ý kiến của bạn rất quan troọng. Hãy cho c...",
      "icon": Icons.shopping_bag_outlined,
      "iconColor": Colors.deepOrange,
      "badge": 5
    },
    {
      "title": "Giải Thưởng Shopee",
      "subtitle": "Các bước nhận xu khủng tui nhắc bạn nè!!!",
      "icon": Icons.card_giftcard_outlined,
      "iconColor": Colors.blue,
      "badge": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 0, color: Color(0xFFEEEEEE)),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Icon(item['icon'] as IconData, color: item['iconColor'] as Color, size: 28),
          ),
          title: Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(
            item['subtitle'] as String,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if ((item['badge'] as int) > 0)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEE4D2D),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    item['badge'].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProductCartState();
  }
}

class _ProductCartState extends StatefulWidget {
  const _ProductCartState({super.key});

  @override
  State<_ProductCartState> createState() => _ProductCartStateState();
}

class _ProductCartStateState extends State<_ProductCartState> {
  final List<Map<String, dynamic>> products = [
    {
      "icon": Icons.sell_outlined,
      "iconColor": Colors.orange,
      "time": "12:23 27-03-2026",
      "status": "Đơn hàng đã hoàn tất",
      "image":"assets/taiphone.png",
      "description": 'Đơn hàng 260321QBTTCGSD đã hoàn thành. Đánh giá sản phẩm trước 26-04-2026 để nhận tối đa 200 Shopee Xu',
    },
    {
      "icon": Icons.sell_outlined,
      "iconColor": Colors.orange,
      "time": "12:23 27-03-2026",
      "status": "Đơn hàng đang chờ vận chuyển",
      "image":"assets/istockphoto-2171717506-612x612.png",
      "description": 'Đơn hàng 260321QBTTCGSD đã hoàn thành. Đánh giá sản phẩm trước 26-04-2026 để nhận tối đa 200 Shopee Xu',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, indent: 0, color: Color(0xFFEEEEEE)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Cập nhật đơn hàng", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(height: 1, indent: 0, color: Color(0xFFEEEEEE)),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                // child: Icon(item['icon'] as IconData, color: item['iconColor'] as Color, size: 20),
                child:
                Image.asset(
                  item['image'],
                  width: 20,
                  height: 20,
                ),
              ),
              title: Text(item['status'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              subtitle: Text(
                item['description'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_drop_down, size: 14, color: Colors.grey),
              onTap: () {},
            );
          },
        )
      ],
    );
  }
}