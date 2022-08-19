import 'package:flutter/material.dart';
import 'package:flutter_providercar/store/mystore.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //註冊監聽器進行接收變更通知
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductDetail'),
        actions: [
          Text(store.getBasketQty().toString()),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            //圖片
            FadeInImage.assetNetwork(
                width: 150,
                height: 150,
                fit: BoxFit.contain,
                placeholder: 'assets/loading2.gif',
                image: store.avticeProduct.pic),
            //name
            //先前已將點擊item設為_activeProduct所以這邊可以直接調用
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(store.avticeProduct.name),
            ),
            //價格
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(store.avticeProduct.price.toString()),
            ),
            SizedBox(height: 200),

            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              //數量條
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      //減少item並推送至basket
                      store.removeOneItemToBasket(store.avticeProduct);
                    },
                    icon: Icon(Icons.remove, color: Colors.red),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Text(store.avticeProduct.qty.toString()),
                  ),
                  IconButton(
                    onPressed: () {
                      //增加item並推送至basket
                      store.addOneItemToBasket(store.avticeProduct);
                    },
                    icon: Icon(Icons.add, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
