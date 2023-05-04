import 'package:graphql/client.dart';
const baseURL = "https://thehorecastore.myshopify.com/api/2023-01/graphql.json";


HttpLink httpLink = HttpLink(baseURL,defaultHeaders: {'X-Shopify-Storefront-Access-Token': '6cca5f10598bf8fae6bae6eb45a27131'});

final GraphQLClient client = GraphQLClient(
  link: httpLink,
  cache: GraphQLCache(),
);
