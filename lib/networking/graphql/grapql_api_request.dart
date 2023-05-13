const String loginQuery = r'''
mutation SignInWithEmailAndPassword(
    $email: String!, 
    $password: String!,
) {
    customerAccessTokenCreate(input: { 
        email: $email, 
        password: $password,
    }) {
        customerAccessToken {
            accessToken
        }
          customerUserErrors{
            message
            code
        }
    }
}
''';
const String forgotPasswordQuery = r'''
mutation SendPasswordResetEmail($email: String!) {
  customerRecover(email: $email) {
    customerUserErrors {
      code
      message
    }
    userErrors {
      message
    }
  }
}
''';

const String signUpQuery = r'''
mutation RegisterAccount(
    $email: String!, 
    $password: String!,  
    $firstName: String!, 
    $lastName: String!, 
    $acceptsMarketing: Boolean = false,
) {
    customerCreate(input: {
        email: $email, 
        password: $password, 
        firstName: $firstName, 
        lastName: $lastName,
        acceptsMarketing: $acceptsMarketing, 
    }) {
        customer {
            id
        }
        customerUserErrors {
            code
            message
        }
    }
}
''';

const String categoryListQuery = r'''
{
    collections(first:10){
        nodes{
            id
            title
            image{
                url
            }
        }
    }
}
''';

const String productListQuery = r'''
query {
    collections(first : 10){
        nodes{
            id
            title
            products(first:10){
                nodes{
                    title
                    id
                    priceRange{
                        maxVariantPrice{
                            amount
                        }
                        minVariantPrice{
                            amount
                        }
                    }
                    images(first:1){
                        nodes{
                            url
                        }
                    }
                }
            }
        }
    }
}
''';

const String cartListQuery = r'''
 query GetCart($cartId: ID!) {
        cart(id: $cartId) {
          checkoutUrl
          estimatedCost {
            totalAmount {
              amount
              currencyCode
            }
            subtotalAmount{
                amount
                currencyCode
            }
            totalDutyAmount{
                amount
                currencyCode
            }
             totalTaxAmount{
                amount
                currencyCode
            }
          }
          updatedAt
          lines(first:250){
              nodes{
                  id
                  quantity
                   merchandise {
            ... on ProductVariant {
              id
              image{
                  url
              }
              product{
                  title
              }
              priceV2{
                  amount
                  currencyCode
              }
              
            }
          }
          attributes {
            key
            value
          }
              }
          }
        }
      }
''';

const String orderListQuery = r'''
query getcustomerOrders($customerAccessToken: String!, $country: CountryCode)@inContext(country: $country) {
  customer(customerAccessToken: $customerAccessToken) {
    orders(first:250) {
        nodes{
            totalPrice {
            amount
            currencyCode # store's currency
          }
          id
          name
          processedAt
          fulfillmentStatus
          financialStatus
        }
    }
  }
}
''';

const String addToCartQuery = r'''
mutation createCart($cartInput: CartInput) {
  cartCreate(input: $cartInput) {
    cart {
      id
      createdAt
      updatedAt
      }
    }
}

''';

const String addToCartLineQuery = r'''
mutation cartLinesAdd($cartId: ID!, $lines: [CartLineInput!]!) {
  cartLinesAdd(cartId: $cartId, lines: $lines) {
    cart {
     id
     checkoutUrl
    }
    userErrors {
      field
      message
    }
  }
}

''';

const String productRemoveCart = r'''
mutation cartLinesRemove($cartId: ID!, $lineIds: [ID!]!) {
  cartLinesRemove(cartId: $cartId, lineIds: $lineIds) {
    cart {
      id
    }
    userErrors {
      field
      message
    }
  }
}
''';

const String updateCartLineApi = r'''
mutation cartLinesUpdate($cartId: ID!, $lines: [CartLineUpdateInput!]!) {
  cartLinesUpdate(cartId: $cartId, lines: $lines) {
    cart {
        id
    }
    userErrors {
      field
      message
    }
  }
}
''';

String customerDetailQuery(String accessToken) {
  return r'''
query { customer(customerAccessToken: "''' +
      accessToken +
      r'''") {
    id
    firstName
    lastName
    acceptsMarketing
    email
    phone
  }
}
''';
}

const String recommendedProductsQuery = r'''
query productRecommendations($productId: ID!) {
  productRecommendations(productId: $productId) {
    id
    title
    images(first:1){
        nodes{
            url
        }
    }
    priceRange{
        maxVariantPrice{
            amount
        }
        minVariantPrice{
            amount
        }
    }
  }
}
''';

const String updateCartAddressQuery = r'''
mutation updateCartBuyerIdentity($buyerIdentity: CartBuyerIdentityInput!, $cartId: ID!) {
  cartBuyerIdentityUpdate(buyerIdentity: $buyerIdentity, cartId: $cartId) {
    cart {
      id
      buyerIdentity {
        email
        phone
        deliveryAddressPreferences {
          ... on MailingAddress {
            address1
            address2
            city
            company
            country
            firstName
            lastName
            phone
            province
            zip
          }
        }
      }
    }
    userErrors {
      field
      message
    }
  }
}
''';
