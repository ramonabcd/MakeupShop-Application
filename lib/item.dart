import 'dart:ui';

class Item {

  String title;
  String description;
  Color color;
  String price;
  int counter;

  String imageUrl;


  Item(this.title, this.description, this.color, this.price,  this.imageUrl);

}

List<Item> getGridItems(){
  return <Item>[
    Item(
      'Blush',
      'A cushion blush formula, with a heart-shaped applicator, that blends out to a sheer-to-buildable flush of color.', 
      Color(0xFFF48FB1), 
      '18.20',  
      'assets/images/blush.png',
    ),
    Item(
      'Cleanser',
      'Redolent of the finest spa because of a stimulating blend of essential oils, this triple-phase formula cleanses and invigorates. The gel texture melts into an oil as it is massaged into skin.', 
      Color(0xFF80CBC4), 
      '14.80', 
      'assets/images/cleanser.png',
    ),
    Item(
      'Makeup remover',
      'A go-to makeup remover that gently erases long-wearing eye and lip makeup without tugging skin.This eye and lip makeup remover leaves nothing behind.', 
      Color(0xFFEAB9E7), 
      '5.36', 
      'assets/images/demachiant.png',
    ),
    Item(
      'Foundation',
      "A long-lasting, weightless, hybrid skincare-foundation—Charlotte’s secret to a flawless, poreless-looking, confident complexion.", 
      Color(0xFFFBE9E7), 
      '80.22', 
      'assets/images/fond.png',
    ),
    Item(
      'Face mask',
      "A pampering lotus face mask made of a plant-based 'second skin' fiber that moisturazes and soothes in 15 minutes.", 
      Color(0xFFA1887F), 
      '13.06', 
      'assets/images/masca.png',
    ),
    Item(
      'Mattifying powder',
      'A lightweight, easy-to-apply, loose powder that blends effortlessly to set makeup for up to 16 hours of wear.', 
      Color(0xFFFFB570), 
      '16.86', 
      'assets/images/pudra.png',
    ),
    Item(
      'Mascara',
      'With its long, skinny teeth, the plastic comb brush allows you to precisely coat each lash one-by-one, creating a long, separated fan of lashes that usually takes the skill of a makeup artist. The extra-hold formula provides a 24 hour-curl with 100% smudge-proof results.', 
      Color(0xFF9CCC65), 
      '21.99', 
      'assets/images/rimel.png',
    ),
    Item(
      'Eyeshadow palette',
      'A palette of highly pigmented mattes, metallics, and shimmer swirls—all with smooth, blendable textures in three color schemes: Rose, Lilac, Nude', 
      Color(0xFF9575CD), 
      '45.53', 
      'assets/images/paleta.png',
    ),
  ];
}