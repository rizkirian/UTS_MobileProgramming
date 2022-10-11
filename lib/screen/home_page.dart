import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riz_ongkir/screen/cek_ongkir_page.dart';

final List<String> imgList = [
  'assets/images/carousel_1.png',
  'assets/images/carousel_2.jpg',
  'assets/images/carousel_3.jpg'
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  Widget _notificationIcon() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.centerRight,
        child: SizedBox.fromSize(
          size: Size(
            (MediaQuery.of(context).size.width / 100) * 10,
            (MediaQuery.of(context).size.width / 100) * 10,
          ),
          child: ClipOval(
            child: Material(
              color: const Color(0xFFE5E5E5),
              child: InkWell(
                splashColor: Colors.amberAccent,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.notifications_outlined),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _carousel() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? const Color(0xFF77C3FA)
                          : const Color(0xFFC4C4C4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.fill,
                      width: 1000.0,
                      height: 250,
                    ),
                  ],
                )),
          ))
      .toList();

  Widget _space() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
      ),
    );
  }

  Widget _menu(
    IconData iconData1,
    IconData iconData2,
    IconData iconData3,
    String iconTitle1,
    String iconTitle2,
    String iconTitle3,
    VoidCallback onClick,
  ) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 100) * 20,
                  height: (MediaQuery.of(context).size.width / 100) * 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC4C4C4),
                  ),
                  child: InkWell(
                    splashColor: Colors.amberAccent,
                    child: Icon(
                      iconData1,
                      size: 42,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  iconTitle1,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 100) * 20,
                  height: (MediaQuery.of(context).size.width / 100) * 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC4C4C4),
                  ),
                  child: InkWell(
                    splashColor: Colors.amberAccent,
                    onTap: onClick,
                    child: Icon(
                      iconData2,
                      size: 42,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  iconTitle2,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 100) * 20,
                  height: (MediaQuery.of(context).size.width / 100) * 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC4C4C4),
                  ),
                  child: InkWell(
                    splashColor: Colors.amberAccent,
                    child: Icon(
                      iconData3,
                      size: 42,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  iconTitle3,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF77C3FA),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Question",
                    style: TextStyle(
                        color: Color(0xFF6B5177),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Kenapa sih kita butuh mencari asisten rumah tangga yang cocok dengan kita?",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.width / 100) * 2,
                  ),
                  const Text(
                    "Answer",
                    style: TextStyle(
                        color: Color(0xFF6B5177),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Demi kenyamanan customer dan keluarga customer, kami menyediakan fitur - fitur agar customer dapat dengan mudah menemukan calon ART ataupun babysitter yang cocok",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 30,
                    height: (MediaQuery.of(context).size.height / 100) * 10,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/banner.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
        ),
        color: const Color(0xFF930000),
        child: CustomScrollView(
          slivers: [
            _notificationIcon(),
            _space(),
            _carousel(),
            _space(),
            _menu(
              Icons.connected_tv,
              Icons.shopping_cart_outlined,
              Icons.store_outlined,
              "Cek Resi",
              "Cek Ongkir",
              "Gerai",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CekOngkirPage()),
                );
              },
            ),
            _space(),
            _menu(
              Icons.phone_in_talk_outlined,
              Icons.stroller_outlined,
              Icons.phone_iphone_outlined,
              "Hubungi Kami",
              "Order",
              "Address Book",
              () {},
            ),
            _space(),
            _menu(
              Icons.shop_2_outlined,
              Icons.monetization_on_outlined,
              Icons.money_outlined,
              "Hubungkan E-Commerce",
              "Donasi",
              "Bonus",
              () {},
            ),
            _space(),
            _banner(),
            _space(),
          ],
        ),
      ),
    );
  }
}
