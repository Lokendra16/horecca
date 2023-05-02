import 'localization.dart';

enum AppLocalizationKeys {
  appName,
  email,
  password,
  login,
  loginWith,
  facebook,
  google,
  doNotAccount,
  signup,
  filter,
  sort,
  view,
  welcome,
  firstName,
  lastName,
  alreadyAccount,
  searchBarText,
  shopByCategoryTxt,
  dealOfTheDay,
  tableAccessories,
  kitchenPastry,
  kitchenEquipment,
  guestRoom,
  addToCart,
  selectSize,
  capeCity,
  color,
  productDescription,
  additionInformation,
  customerReview,
  seeAllReview,
  youMayAlsoLike,
  wishList,
  share,
  myAccount,
  shoppingBag,
  priceDetails,
  totalItem,
  totalAed,
  discountOnAed,
  couponDiscount,
  other,
  knowMore,
  applyCoupon,
  free,
  proceedToCheckOut,
  myOrder,
  quantity,
  savedAddress,
  forgotPassword,
  register,
  testimonials,
  needHelp,
  getSocialWithUs,
  igArabic,
  igEnglish,
  youTube,
  addAddress,
  address,
  city,
  zipcode,
  submit,
  phone,
  apartment,
  logOut,
  search,
  privacyPolicy,
  send,
  order,
  date,
  paymentStatus,
  fulfillmentStatus,
  total,
  orderDetail,
  shipping,
  tax,
  reset,
  done,
  home,
  category,
  sale,
  cart,
  addressBook,
  rateUs,
  contactUs
}

extension AppLocalizationKeysExt on AppLocalizationKeys {
  String? localized(AppLocalizations localization, [Map<String, String>? params]) {
    switch (this) {
      case AppLocalizationKeys.appName:
        return localization.appName;
      case AppLocalizationKeys.email:
        return localization.email;
      case AppLocalizationKeys.password:
        return localization.password;
      case AppLocalizationKeys.login:
        return localization.login;
      case AppLocalizationKeys.loginWith:
        return localization.loginWith;
      case AppLocalizationKeys.facebook:
        return localization.facebook;
      case AppLocalizationKeys.google:
        return localization.google;
      case AppLocalizationKeys.doNotAccount:
        return localization.doNotAccount;
      case AppLocalizationKeys.signup:
        return localization.signup;
      case AppLocalizationKeys.filter:
        return localization.filter;
      case AppLocalizationKeys.sort:
        return localization.sort;
      case AppLocalizationKeys.view:
        return localization.view;
      case AppLocalizationKeys.welcome:
        return localization.welcome;
      case AppLocalizationKeys.firstName:
        return localization.firstName;
      case AppLocalizationKeys.lastName:
        return localization.lastName;
      case AppLocalizationKeys.alreadyAccount:
        return localization.alreadyAccount;
      case AppLocalizationKeys.searchBarText:
        return localization.searchBarText;
      case AppLocalizationKeys.shopByCategoryTxt:
        return localization.shopByCategoryTxt;
      case AppLocalizationKeys.dealOfTheDay:
        return localization.dealOfTheDay;
      case AppLocalizationKeys.tableAccessories:
        return localization.tableAccessories;
      case AppLocalizationKeys.kitchenPastry:
        return localization.kitchenPastry;
      case AppLocalizationKeys.kitchenEquipment:
        return localization.kitchenEquipment;
      case AppLocalizationKeys.guestRoom:
        return localization.guestRoom;
      case AppLocalizationKeys.addToCart:
        return localization.addToCart;
      case AppLocalizationKeys.selectSize:
        return localization.selectSize;
      case AppLocalizationKeys.capeCity:
        return localization.capeCity;
      case AppLocalizationKeys.color:
        return localization.color;
      case AppLocalizationKeys.productDescription:
        return localization.productDescription;
      case AppLocalizationKeys.additionInformation:
        return localization.additionInformation;
      case AppLocalizationKeys.customerReview:
        return localization.customerReview;
      case AppLocalizationKeys.seeAllReview:
        return localization.seeAllReview;
      case AppLocalizationKeys.youMayAlsoLike:
        return localization.youMayAlsoLike;
      case AppLocalizationKeys.wishList:
        return localization.wishList;
      case AppLocalizationKeys.share:
        return localization.share;
      case AppLocalizationKeys.myAccount:
        return localization.myAccount;
      case AppLocalizationKeys.shoppingBag:
        return localization.shoppingBag;
      case AppLocalizationKeys.priceDetails:
        return localization.priceDetails;
      case AppLocalizationKeys.totalItem:
        return localization.totalItem;
      case AppLocalizationKeys.totalAed:
        return localization.totalAed;
      case AppLocalizationKeys.discountOnAed:
        return localization.discountOnAed;
      case AppLocalizationKeys.couponDiscount:
        return localization.couponDiscount;
      case AppLocalizationKeys.other:
        return localization.other;
      case AppLocalizationKeys.knowMore:
        return localization.knowMore;
      case AppLocalizationKeys.applyCoupon:
        return localization.applyCoupon;
      case AppLocalizationKeys.free:
        return localization.free;
      case AppLocalizationKeys.proceedToCheckOut:
        return localization.proceedToCheckOut;
      case AppLocalizationKeys.myOrder:
        return localization.myOrder;
      case AppLocalizationKeys.quantity:
        return localization.quantity;
      case AppLocalizationKeys.savedAddress:
        return localization.savedAddress;
      case AppLocalizationKeys.forgotPassword:
        return localization.forgotPassword;
      case AppLocalizationKeys.register:
        return localization.register;
      case AppLocalizationKeys.testimonials:
        return localization.testimonials;
      case AppLocalizationKeys.getSocialWithUs:
        return localization.getSocialWithUs;
      case AppLocalizationKeys.igArabic:
        return localization.igArabic;
      case AppLocalizationKeys.igEnglish:
        return localization.igEnglish;
      case AppLocalizationKeys.youTube:
        return localization.youTube;
      case AppLocalizationKeys.addAddress:
        return localization.addAddress;
      case AppLocalizationKeys.address:
        return localization.address;
      case AppLocalizationKeys.city:
        return localization.city;
      case AppLocalizationKeys.zipcode:
        return localization.zipcode;
      case AppLocalizationKeys.phone:
        return localization.phone;
      case AppLocalizationKeys.submit:
        return localization.submit;
      case AppLocalizationKeys.apartment:
        return localization.apartment;
      case AppLocalizationKeys.logOut:
        return localization.logOut;
      case AppLocalizationKeys.search:
        return localization.search;
      case AppLocalizationKeys.privacyPolicy:
        return localization.privacyPolicy;
        case AppLocalizationKeys.send:
        return localization.send;
        case AppLocalizationKeys.order:
        return localization.order;
        case AppLocalizationKeys.date:
        return localization.date;
        case AppLocalizationKeys.paymentStatus:
        return localization.paymentStatus;
        case AppLocalizationKeys.fulfillmentStatus:
        return localization.fulfillmentStatus;
        case AppLocalizationKeys.total:
        return localization.total;
        case AppLocalizationKeys.orderDetail:
        return localization.orderDetail;
    case AppLocalizationKeys.shipping:
        return localization.shipping;
        case AppLocalizationKeys.tax:
        return localization.tax;
        case AppLocalizationKeys.reset:
        return localization.reset;
        case AppLocalizationKeys.done:
        return localization.done;
        case AppLocalizationKeys.home:
        return localization.home;
        case AppLocalizationKeys.category:
        return localization.category;
        case AppLocalizationKeys.sale:
        return localization.sale;
        case AppLocalizationKeys.cart:
        return localization.cart;
        case AppLocalizationKeys.addressBook:
        return localization.addressBook;
        case AppLocalizationKeys.rateUs:
        return localization.rateUs;
        case AppLocalizationKeys.contactUs:
        return localization.contactUs;
    }
  }

  UiMessage asMessage([Map<String, String>? param]) => UiMessage.key(this, param);
}
