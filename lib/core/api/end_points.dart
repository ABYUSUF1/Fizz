class EndPoint {
  static String baseUrl = "https://mock.shop/api?query=%7B%20";

  static String getAllProducts =
      "products(first%3A%2020)%20%7B%20edges%20%7B%20node%20%7B%20id%20title%20description%20featuredImage%20%7B%20id%20url%20%7D%20variants(first%3A%203)%20%7B%20edges%20%7B%20node%20%7B%20price%20%7B%20amount%20currencyCode%20%7D%20%7D%20%7D%20%7D%20%7D%20%7D%20%7D%7D";

  static String getProducts =
      "product(id%3A%20%22gid%3A%2F%2Fshopify%2FProduct%2F7982905098262%22)%20%7B%20id%20title%20description%20featuredImage%20%7B%20id%20url%20%7D%20%7D%7D";

  static String getCollections =
      'collections(first%3A%2010)%20%7B%20edges%20%7B%20cursor%20node%20%7B%20id%20handle%20title%20description%20image%20%7B%20id%20url%20%7D%20%7D%20%7D%20%7D%7D';
}
