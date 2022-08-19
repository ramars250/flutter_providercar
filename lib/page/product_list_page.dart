import 'package:flutter/material.dart';
import 'package:flutter_providercar/page/product_detail_page.dart';
import 'package:flutter_providercar/store/mystore.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //註冊監聽器進行接收變更通知
    var store = Provider.of<MyStore>(context);
    print(store.products[0].name);
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductList'),
      ),
      body: GridView.builder(
          itemCount: store.products.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //設置item到activeProduce
                //將點擊的那個項目傳至setActiveProduct當作_activeProduct，方便後續用activeProduct調用
                store.setActiveProduce(store.products[index]);
                //移動至productdetail page
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
              },
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.contain,
                      placeholder: 'assets/loading2.gif',
                      image: store.products[index].pic,
                    ),
                  ),
                  Text(store.products[index].name),
                ],
              ),
            );
          }),
    );
  }
}
