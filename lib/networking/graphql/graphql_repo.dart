import 'package:graphql/client.dart';
import 'package:the_horeca_store/networking/models/customer/customer_data.dart';

import 'graph_api.dart';
import 'grapql_api_request.dart';

class GraphQLRepo {
  Future<String> loginAPI(email, password) async {
    final MutationOptions options = MutationOptions(
      document: gql(loginQuery),
      variables: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error = value.data!["customerAccessTokenCreate"]![
          "customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["customerAccessTokenCreate"]
          ["customerAccessToken"]["accessToken"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }

    return Future.error("Unexpected Error Occurred!");
  }

  Future<String> forgotPasswordAPI(email) async {
    final MutationOptions options = MutationOptions(
      document: gql(forgotPasswordQuery),
      variables: <String, dynamic>{
        'email': email,
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error = value.data!["customerAccessTokenCreate"]![
          "customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["customerAccessTokenCreate"]
          ["customerAccessToken"]["accessToken"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }

    return Future.error("Unexpected Error Occurred!");
  }

  Future<String> signUp(
      email, password, firstName, lastName, acceptsMarketing) async {
    final MutationOptions options = MutationOptions(
      document: gql(signUpQuery),
      variables: <String, dynamic>{
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'acceptsMarketing': acceptsMarketing,
      },
    );

    var value = await client.mutate(options);
    if (value.hasException) {
      Future.error("Error Occurred!");
    }
    try {
      var customer = value.data!["customerCreate"]!["customer"]!["id"];
      if (customer != null && customer.isNotEmpty) {
        return Future.value(customer);
      }
    } catch (e) {
      print(e);
    }

    try {
      var error = value.exception!.graphqlErrors[0]!.message!;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error =
          value.data!["customerCreate"]!["customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    return Future.error("Unexpected Error Occurred!");
  }

  Future<dynamic> categoryListAPI() async {
    final MutationOptions options = MutationOptions(
      document: gql(categoryListQuery),
    );

    var value = await client.mutate(options); /*.then((value) {

    });*/
    print("Value! : #${value}");
    if (value.hasException) {
      Future.error("Error Occurred!");
    }
    try {
      var customer = value.data!["collections"];
      if (customer != null && customer.isNotEmpty) {
        return Future.value(customer);
      }
    } catch (e) {
      print(e);
    }

    try {
      var error = value.exception!.graphqlErrors[0]!.message!;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error =
          value.data!["customerCreate"]!["customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    return Future.error("Unexpected Error Occurred!");
  }

  Future<dynamic> productRecommendationApi(String id) async {
    final MutationOptions options = MutationOptions(
      document: gql(recommendedProductsQuery),
      variables: <String, dynamic>{
        'productId': "gid://shopify/Product/$id",
      },
    );

    var value = await client.mutate(options);
    print("Value! : #${value}");
    if (value.hasException) {
      Future.error("Error Occurred!");
    }
    try {
      var customer = value.data!["productRecommendations"];
      if (customer != null && customer.isNotEmpty) {
        return Future.value(customer);
      }
    } catch (e) {
      print(e);
    }

    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error =
          value.data!["customerCreate"]!["customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    return Future.error("Unexpected Error Occurred!");
  }

  Future<dynamic> productListApi() async {
    final MutationOptions options = MutationOptions(
      document: gql(productListQuery),
    );

    var value = await client.mutate(options); /*.then((value) {

    });*/
    print("Value! : #${value}");
    if (value.hasException) {
      Future.error("Error Occurred!");
    }
    try {
      var customer = value.data!["collections"];
      if (customer != null && customer.isNotEmpty) {
        return Future.value(customer);
      }
    } catch (e) {
      print(e);
    }

    try {
      var error = value.exception!.graphqlErrors[0]!.message!;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error =
          value.data!["customerCreate"]!["customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    return Future.error("Unexpected Error Occurred!");
  }

  Future<dynamic> cartListAPI(String cartId) async {
    print("value: $cartId");

    final MutationOptions options = MutationOptions(
      document: gql(cartListQuery),
      variables: <String, dynamic>{
        "cartId": cartId,
      },
    );

    var value = await client.mutate(options);
    print("Value! : #${value}");

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    try {
      var cart = value.data!["cart"];
      if (cart != null && cart.isNotEmpty) {
        return Future.value(cart);
      }
    } catch (e) {
      print(e);
    }

    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    /* try {
      var error = value.data!["cart"]!["customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }*/
    return Future.error("Unexpected Error Occurred!");
  }

  Future<dynamic> orderListAPI(String accessToken) async {
    final MutationOptions options = MutationOptions(
      document: gql(orderListQuery),
      variables: <String, dynamic>{
        "customerAccessToken": accessToken,
      },
    );

    var value = await client.mutate(options);
    print("Value! : #${value}");

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    try {
      var orders = value.data!["customer"]["orders"];
      if (orders != null && orders.isNotEmpty) {
        return Future.value(orders);
      }
    } catch (e) {
      print(e);
    }

    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    /* try {
      var error = value.data!["cart"]!["customerUserErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }*/
    return Future.error("Unexpected Error Occurred!");
  }

  //Merchandise Id == variant id
  Future<String> addToCart(int quantity, String merchandiseId) async {
    print("Add To Cart : $quantity, $merchandiseId");
    final MutationOptions options = MutationOptions(
      document: gql(addToCartQuery),
      variables: <String, dynamic>{
        'cartInput': {
          "lines": [
            {
              "quantity": quantity,
              "merchandiseId": "gid://shopify/ProductVariant/$merchandiseId"
            }
          ]
        }
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["cartCreate"]["cart"]["id"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }

    return Future.error("Unexpected Error Occurred!");
  }

  Future<String> addToCartLine(
      int quantity, String merchandiseId, String cartID) async {
    print("Add To Cart Line : $quantity, $merchandiseId, $cartID");
    final MutationOptions options = MutationOptions(
      document: gql(addToCartLineQuery),
      variables: <String, dynamic>{
        "cartId": cartID,
        "lines": [
          {
            "quantity": quantity,
            "merchandiseId": "gid://shopify/ProductVariant/$merchandiseId"
          }
        ]
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["cartLinesAdd"]["cart"]["id"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }

    return Future.error("Unexpected Error Occurred!");
  }

  Future<String> updateCartLine(
      int quantity, String cartID, String lineID) async {
    print("Add To Cart Line : $quantity, $lineID, $cartID");
    final MutationOptions options = MutationOptions(
      document: gql(updateCartLineApi),
      variables: <String, dynamic>{
        "cartId": cartID,
        "lines": [
          {"quantity": quantity, "id": lineID}
        ]
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["cartLinesUpdate"]["cart"]["id"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }

    return Future.error("Unexpected Error Occurred!");
  }

  Future<String> removeProductFromCart(String cartId, String lineIds) async {
    final MutationOptions options = MutationOptions(
      document: gql(productRemoveCart),
      variables: <String, dynamic>{
        "cartId": cartId,
        "lineIds": [
          lineIds,
        ]
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["cartLinesRemove"]["cart"]["id"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error = value.data!["cartLinesRemove"]!["userErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    return Future.error("Unexpected Error Occurred!");
  }

  Future<String> updateCartAddress(
      String cartId,
      String? countryCode,
      String? customerAccessToken,
      String? address1,
      String? address2,
      String? city,
      String? country,
      String? company,
      String? firstName,
      String? lastName,
      String? phone,
      String? province,
      String? zip,
      String? email) async {
    final MutationOptions options = MutationOptions(
      document: gql(updateCartAddressQuery),
      variables: <String, dynamic>{
        "buyerIdentity": {
          "countryCode": countryCode,
          "deliveryAddressPreferences": [
            {
              "deliveryAddress": {
                "address1": address1,
                "address2": address1,
                "city": city,
                "company": company,
                "country": country,
                "firstName": firstName,
                "lastName": lastName,
                "province": province,
                "zip": zip,
                "province": province,
              }
            }
          ],
          "email": email
        },
        "cartId": cartId,
      },
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    print("value: $value");
    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var accessToken = value.data!["cartBuyerIdentityUpdate"]["cart"]["id"];
      if (accessToken != null && accessToken.isNotEmpty) {
        return Future.value(accessToken);
      }
    } catch (e) {
      print(e);
    }
    try {
      var error = value.data!["cartLinesRemove"]!["userErrors"]![0]!["message"];
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    return Future.error("Unexpected Error Occurred!");
  }

  Future<CustomerData> customerDetail(String accessToken) async {
    final MutationOptions options = MutationOptions(
      document: gql(customerDetailQuery(accessToken)),
      variables: <String, dynamic>{},
    );

    var value = await client.mutate(options);

    if (value.hasException) {
      Future.error("Error Occurred!");
    }

    try {
      var error = value.exception!.graphqlErrors[0].message;
      if (error != null && error.isNotEmpty) {
        return Future.error(error);
      }
    } catch (e) {
      print(e);
    }
    try {
      var customerData = value.data!["customer"];
      if (customerData != null && customerData.isNotEmpty) {
        CustomerData user = CustomerData.fromJson(customerData);
        return Future.value(user);
      }
    } catch (e) {
      print(e);
    }

    return Future.error("Unexpected Error Occurred!");
  }
}
