import 'package:flutter/material.dart';

const List<String> list = <String>[
  "Jawa Tengah",
  "Jawa Barat",
  "Jawa Timur",
  "Bali",
  "Sulawesi Selatan",
  "Daerah Istimewa Yogyakarta",
];

class CekOngkirPage extends StatefulWidget {
  const CekOngkirPage({Key? key}) : super(key: key);

  @override
  State<CekOngkirPage> createState() => _CekOngkirPageState();
}

class _CekOngkirPageState extends State<CekOngkirPage> {
  String _asalValue = list.first;
  String _tujuanValue = list.last;

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Cek Ongkir"),
      backgroundColor: const Color(0xFF930000),
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width / 100) * 4,
          ),
        )
      ],
    );
  }

  Widget _space() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
      ),
    );
  }

  Widget _asal() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Asal",
            style: TextStyle(
              color: Color(0xFF827E7D),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _asalValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _asalValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tujuan() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tujuan",
            style: TextStyle(
              color: Color(0xFF827E7D),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _tujuanValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _tujuanValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _berat() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Berat",
            style: TextStyle(
              color: Color(0xFF827E7D),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: '1',
                hintStyle: const TextStyle(fontSize: 16, color: Colors.black45),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Material(
                  color: const Color(0xff827E7D),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'kg',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1))),
          ),
        ],
      ),
    );
  }

  Widget _dimensi() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dimensi",
            style: TextStyle(
              color: Color(0xFF827E7D),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 100) * 6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Panjang",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF827E7D),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 100) * 6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Lebar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF827E7D),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 100) * 6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Tinggi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF827E7D),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 100) * 6,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "cm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.width / 100) * 4,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF930000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: (MediaQuery.of(context).size.width / 100) * 4,
            ),
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Cek Harga",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        color: const Color(0xFF930000),
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  _asal(),
                  _space(),
                  _tujuan(),
                  _space(),
                  _berat(),
                  _space(),
                  _dimensi(),
                ],
              ),
              _button(),
            ],
          ),
        ),
      ),
    );
  }
}
