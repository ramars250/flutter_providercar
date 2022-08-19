import 'package:flutter/material.dart';
import 'package:flutter_providercar/model/product.dart';

//我們將在此處添加全局和獲得以及修改變量內容的函數
class MyStore extends ChangeNotifier {
  //添加全局數據，加底線私有化避免不小心改到
  List<Product> _products = [];
  List<Product> _basket = [];
  Product _activeProduct = null;

  //構造子初始化變量
  MyStore() {
    _products = [
      Product(
          id: 1,
          qty: 1,
          name: 'mango',
          price: 10,
          pic:
          'https://res.cloudinary.com/general-mills/image/upload/c_limit,dpr_auto,h_1024,w_1024/v1608643268/HaagenDazs/2020/12/22/mango-sorbet_.png'),
      Product(
          id: 2,
          qty: 1,
          name: 'coconut',
          price: 20,
          pic:
          'https://saverafresh.com/wp-content/uploads/2021/08/coconut.jpg'),
      Product(
          id: 3,
          qty: 1,
          name: 'banana',
          price: 30,
          pic:
          'https://www.collinsdictionary.com/images/full/banana_64728013.jpg'),
    ];
    //進行監聽
    notifyListeners();
  }

  //為了訪問全局變量所以使用獲得的函數
  List<Product> get products {
    return _products;
  }

  List<Product> get basket => _basket;

  Product get avticeProduct {
    return _activeProduct;
  }

  //調用_activeProduct
  setActiveProduce(Product p) {
    _activeProduct = p;
  }

  //增加item至basket
  addOneItemToBasket(Product p) {
    //創建Product的found，檢查_basket內的物件id是否有等於傳回的物件id
    Product found = _basket.firstWhere((i) => i.id == p.id, orElse: () => null);
    //如果物件id有相等，只要將qty增加1，如果沒有則直接加至_basket
    if (found != null) {
      found.qty += 1;
    } else {
      _basket.add(p);
    }
    //如果有異動需要通知，所以加上監聽器
    notifyListeners();
  }

  //減少item至basket
  removeOneItemToBasket(Product p) {
    //創建Product的found，檢查_basket內的物件id是否有等於傳回的物件id
    Product found = _basket.firstWhere((i) => i.id == p.id, orElse: () => null);
    //如果物件id有相等且等於1時，就將_basket內移除，否則就直接-1
    if (found != null && found.qty == 1) {
      _basket.remove(p);
    } else {
      found.qty -= 1;
    }
    //如果有異動需要通知，所以加上監聽器
    notifyListeners();
  }

  //獲得購物車數量
  getBasketQty() {
    int total = 0;
    for (int i = 0; i< basket.length; i++) {
      total += basket[i].qty;
    }
    return total;
  }
}
