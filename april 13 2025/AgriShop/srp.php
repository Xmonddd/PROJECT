<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>SRP - Product Prices</title>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background: #f5f5f5;
    }
    h1 {
      text-align: center;
      margin-bottom: 30px;
    }
    .container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
    }
    .card {
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      width: 220px;
      overflow: hidden;
      text-align: center;
      padding-bottom: 15px;
      transition: transform 0.2s;
    }
    .card:hover {
      transform: scale(1.02);
    }
    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-bottom: 1px solid #ddd;
    }
    .card h3 {
      margin: 10px 0 5px;
      font-size: 16px;
    }
    .card p {
      margin: 0;
      font-weight: bold;
      color: #333;
    }
    .price {
      color: #2a8b2a;
    }
  </style>
</head>
<body>

<h1>Suggested Retail Price (SRP)</h1>

<div class="container">
  <?php
    $products = [
      [
        'name' => 'Atsuete',
        'image' => 'images/atsuete.jpg',
        'weight' => '1kg',
        'price' => 350.00
      ],
      [
        'name' => 'Watermelon Yellow Oblong',
        'image' => 'images/watermelon-yellow.jpg',
        'weight' => 'kg',
        'price' => 70.00
      ],
      [
        'name' => 'Watermelon Red Round',
        'image' => 'images/watermelon-red.jpg',
        'weight' => 'kg',
        'price' => 60.00
      ],
      [
        'name' => 'Kalubay',
        'image' => 'images/kalubay.jpg',
        'weight' => '1kg',
        'price' => 45.00
      ]
    ];

    foreach ($products as $product) {
      echo '<div class="card">';
      echo '<img src="' . $product['image'] . '" alt="' . $product['name'] . '">';
      echo '<h3>' . $product['name'] . ' <small>' . $product['weight'] . '</small></h3>';
      echo '<p class="price">₱ ' . number_format($product['price'], 2) . ' / kilogram</p>';
      echo '</div>';
    }
  ?>
</div>

</body>
</html>
