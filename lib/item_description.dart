import 'package:flutter/material.dart';
import 'package:food_shop/item.dart';
import 'package:food_shop/homePage.dart';


 List<Item> favItems = [];
 List<Item> cartItems = [];

class ItemDescription extends StatelessWidget {

  final Item item;

  int _counter =0;

  ItemDescription({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0, top: 48.0),
              child: Row(
                children: <Widget>[

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 28,
                      )
                    ),
                  ),

                ],
              ),
            ),

            Center(
              child: SizedBox(
                height: 120,
                child: Hero(
                  tag: item.title,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 32.0,
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(
                        height: 24.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Container(
                            child: Row(
                              children: <Widget>[

                                Container(
                                  width: 0,
                                  height: 48,
                                /*  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  )*/
                                ),

                                Container(
                                  /*color: Colors.grey[200],
                                  width: 48,
                                  height: 48,*/
                                  child: Center(
                                    child: MyStatefulWidget(),
                                  ),
                                      /*"2",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),*/
                                ),

                                Container(
                                  width: 0,
                                  height: 48,
                                  /*decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  )*/
                                ),

                              ],
                            )
                          ),

                          Container(
                            child: Text(
                              r"$ " + item.price,
                               style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 24.0,
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Text(
                                "Product description",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              Text(
                                item.description,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 24.0,
                      ),

                      Row(
                        children: <Widget>[

                          Container(
                            child: Container(
                              height: 72,
                              width: 72,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: item.color,
                                  width: 2,
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.favorite),
                                color: item.color,
                                onPressed:() {
                                  favItems.add(item);
                                  getFavItems(favItems);
                                }
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 16,
                          ),

                          Expanded(
                            child: Container(
                              height: 72,
                              decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    cartItems.add(item);
                                    getCartItems(cartItems);
                                  },
                                  child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                                ),
                                )
                              ),
                            ),
                          )

                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

int counter = 0;

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Item item;

  _MyStatefulWidgetState({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          // tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
        ),

        Text('  $counter'),

        IconButton(
          icon: const Icon(Icons.remove),
          // tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              counter -= 1;
              if(counter <= 0)
                counter = 0;
            });
          },
        ),
        //  Text('  $_counter')
      ],
    );
  }
}