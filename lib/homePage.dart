import 'package:flutter/material.dart';
import 'package:food_shop/item.dart';
import 'package:food_shop/item_description.dart';
List<Item> getFavItems(List<Item> item){
  return item;
}
 List<Item> getCartItems(List<Item> item){
  return item;
}

List<String> items= ["Blush", "Cleanser", "Makeup remover", "Face mask", "Face cream", "Mattifying powder", "Mascara", "Eyeshadow palette"];


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
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

  
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.black,
                      onPressed: () => Navigator.push(
                                        context,
                                           MaterialPageRoute(builder: (context) => CartPage()),
                       ),
                    ),

                     IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.black,
                      onPressed: () => Navigator.push(
                                        context,
                                           MaterialPageRoute(builder: (context) => FavPage()),
                       ),
                    ),
                  ],
                ),
              ),

                    
              SizedBox(
                height: 24.0,
              ),

              Text(
                "Makeup and Skincare",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16.0,
              ),

             IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),

            

              SizedBox(
                height: 16.0,
              ),

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: getGridItems().map((item) => renderGridItem(item)).toList(),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  

  Widget renderGridItem(Item item){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDescription(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Text(
                item.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    r"$ " + item.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  
                ],
              ),

              SizedBox(
                height: 8.0,
              ),

              Expanded(
                child: Hero(
                  tag: item.title,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),

              SizedBox(
                height: 8.0,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
            
              )

            ],
          ),
        ),
      ),
    );
  }
  
}

class CustomSearchDelegate extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ' ';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in items) {
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in items) {
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }
  }

  class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_left),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                                       context,
                                      MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                        }
                      )
                    ),
                  ],
                ),
              ),

                    
              SizedBox(
                height: 24.0,
              ),

              Text(
                "Favorites",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16.0,
              ), 

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: getFavItems(favItems).map((item) => renderGridItem(item)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderGridItem(Item item){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDescription(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Text(
                item.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    r"$ " + item.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  
                ],
              ),

              SizedBox(
                height: 8.0,
              ),

              Expanded(
                child: Hero(
                  tag: item.title,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),

              SizedBox(
                height: 8.0,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                
              )

            ],
          ),
        ),
      ),
    );
  }
  
}

  class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_left),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                                       context,
                                      MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                        }
                      )
                    ),
                  ],
                ),
              ),

                    
              SizedBox(
                height: 24.0,
              ),

               Text(
                "Your Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16.0,
              ), 

                Container(
                        decoration: BoxDecoration(
                        color: Color(0xFFEF9A9A),
                        borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                        child: Center(
                           child: TextButton(
                           onPressed: () {
                                  Navigator.push(
                                      context,
                                    MaterialPageRoute(builder: (context) => OrderPage()),
                                   );
                                  },
                        child: Text(
                            "Complete order",
                             style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                         )
                      ),
                   )
                 ),
              ),

              SizedBox(
                height: 16.0,
              ),          

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: getCartItems(cartItems).map((item) => renderGridItem(item)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderGridItem(Item item){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDescription(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Text(
                item.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    r"$ " + item.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  
                ],
              ),

              SizedBox(
                height: 8.0,
              ),

              Expanded(
                child: new Hero(
                  tag: item.title,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),

              SizedBox(
                height: 8.0,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                
              )

            ],
          ),
        ),
      ),
    );
  }
  
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_left),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                                       context,
                                      MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                        }
                      )
                    ),
                  ],
                ),
              ),

                    
              SizedBox(
                height: 24.0,
              ),

               Text(
                "Your order is on its way!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),

              SizedBox(
                height: 16.0,
              ), 

              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

