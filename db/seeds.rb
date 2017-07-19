Product.create!([
  {name: "Choco-Ban Smoothie", price: "5.99", image: "http://www.cookingclassy.com/wp-content/uploads/2015/02/chocolate-peanut-butter-banana-breakfast-shake3-srgb.jpg", description: "The Chocolate Banana smoothie does not need a description. Period. ", stock: true, supplier_id: 2},
  {name: "Mango Smoothie", price: "6.95", image: "https://silk.com/sites/default/files/recipes/medium/CarrotMango_1146X860.png", description: "This smoothie offers a delightful smooth mango flavour.", stock: true, supplier_id: 1},
  {name: "Strawberry Banana Smoothie", price: "7.25", image: "http://urockgirl.com/urg/wp-content/uploads/2016/04/shutterstock_398479468.jpg", description: "This smoothie combines an insane blend of all things strawberry with a subtle flavor of its banana base", stock: true, supplier_id: 1},
  {name: "Coconut Smasher Smoothie", price: "5.97", image: "http://www.eazypeazymealz.com/wp-content/uploads/2015/04/caramel-cashew-coconut-smoothie-4.jpg", description: "Coconut smoothie make you go cray-cray", stock: true, supplier_id: 1},
  {name: "Berry Blast Smoothie!", price: "7.89", image: "http://23209-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2013/04/IMG_5603.jpg", description: "A berry smoothie containing strawberries, raspberries, blueberries and a goat yogurt base", stock: true, supplier_id: 1}
])
Supplier.create!([
  {name: "FruitLoops", email: "tracy@fruitloops.com", phone_number: "555-675-5575"},
  {name: "The Chocoholics", email: "chocoholics@gmail.com", phone_number: "555-800-8009"}
])
