import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/screens/pos_screen.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomAppBar(
            appBarTitle: 'Check out',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _productList(),
            const Divider(
              height: 10,
              color: Colors.grey,
              thickness: 2,
            ),
            _total(),
            SizedBox(height: 20),
            _actions(),
          ],
        ));
  }

  Widget _productList() {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Product $index'),
                  Text('300 ฿'),
                ],
              ),
            );
          }),
    );
  }

  Widget _total() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Total ",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "800 ฿",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _actions() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Check out',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Clear',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
