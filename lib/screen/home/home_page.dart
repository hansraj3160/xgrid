import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'package:xgrid_test/model/products_model.dart';

import 'package:xgrid_test/util/constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   ProductDataModel productData=ProductDataModel();
  @override
  void initState() {
     getData();
    super.initState();
  }
   getData(){
     productData= ProductDataModel.fromJson(ProductConstData.productData);
   
   }

  @override
  Widget build(BuildContext context) {
        var controller = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shopping Cart"),
        ),
        body: SizedBox(child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                      const Text("Products"),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                 crossAxisSpacing: 10,
                                childAspectRatio: 0.75,  
                                ),
                        itemCount: productData.data!.cart!.products!.length,
                        itemBuilder: (context, index) {
                          Products product = productData.data!.cart!.products![index];
                             
                          return Container(
                               padding:const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const[
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.9,
                                      offset: Offset(0.1, 0.1), // Shadow position
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(3.0)),
                              child: Column(children: [
                                // ignore: unnecessary_null_comparison
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    product.thumb ?? "",
                                    height: 130,
                                    // width:190,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (BuildContext context, obj, trace) {
                                      return const Center(
                                          child: SizedBox(
                                        height: 130,
                                        width: 150,
                                        child: Icon(Icons.error_outline,
                                            size: 40, color: Colors.red),
                                      ));
                                    },
                                  ),
                                ),
                              const  SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Rs.${product.price.toString()}",
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: SizedBox(child:
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                              controller.hasProductCheck.value
                                                ? Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                             controller
                                                                        .getProductCount(
                                                                            productDetails:
                                                                                product);
                                                            if (controller.quantity.value <=
                                                                1) {
                                                              controller
                                                                  .removeProductFromCart(
                                                                      productDetails:
                                                                          product);
                                                            } else {
                                                              controller.addProduct(
                                                                  product: product,
                                                                  count: controller.quantity.value -
                                                                      1);
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            padding:
                                                                EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF163257),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: Text(
                                                                "-",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF163257),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: SizedBox(child:
                                                                 Text(
                                                                  "View (${controller.quantity.value})",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 10),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            // controller.getProductCount(productDetails: product);
                                                             controller
                                                                        .getProductCount(
                                                                            productDetails:
                                                                                product);
                                                            controller.addProduct(
                                                                product: product,
                                                                count:controller.quantity.value +
                                                                    1);
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            padding:
                                                                EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF163257),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                          controller.hasProduct(product);
                                                         controller.addProduct(product: product);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color(0xFF163257),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5)),
                                                        child: Center(
                                                          child: Text(
                                                            "Add to Cart",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                          ]),
                                    ))
                              ]));
                        }),
                        SizedBox(height: 20,),
                           const Text("Recomonded Product"),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                 crossAxisSpacing: 10,
                                childAspectRatio: 0.68,  
                                ),
                        itemCount: controller
                            .productData.value.data!.recommendedProducts!.products!.length,
                        itemBuilder: (context, index) {
                          Products product =  controller
                            .productData.value.data!.recommendedProducts!.products![index];
                            
                          return Container(
                               padding:const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const[
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.9,
                                      offset: Offset(0.1, 0.1), // Shadow position
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(3.0)),
                              child: Column(children: [
                                // ignore: unnecessary_null_comparison
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    product.thumb ?? "",
                                    height: 120,
                                    // width:190,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (BuildContext context, obj, trace) {
                                      return const Center(
                                          child: SizedBox(
                                        height: 130,
                                        width: 150,
                                        child: Icon(Icons.error_outline,
                                            size: 40, color: Colors.red),
                                      ));
                                    },
                                  ),
                                ),
                              const  SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name ?? '',
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Rs.${product.price.toString()}",
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: SizedBox(child:
                                      
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                           controller.hasProperty(product)
                                                ? Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                             controller
                                                                        .getProductCount(
                                                                            productDetails:
                                                                                product);
                                                            if (controller.quantity.value <=
                                                                1) {
                                                              controller
                                                                  .removeProductFromCart(
                                                                      productDetails:
                                                                          product);
                                                            } else {
                                                              controller.addProduct(
                                                                  product: product,
                                                                  count: controller.quantity.value -
                                                                      1);
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            padding:
                                                                EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF163257),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: Text(
                                                                "-",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF163257),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: SizedBox(child:
                                                                 Text(
                                                                  "View (${controller.quantity.value})",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 10),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            // controller.getProductCount(productDetails: product);
                                                             controller
                                                                        .getProductCount(
                                                                            productDetails:
                                                                                product);
                                                            controller.addProduct(
                                                                product: product,
                                                                count:controller.quantity.value +
                                                                    1);
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            padding:
                                                                EdgeInsets.all(8),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF163257),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                          controller.hasProduct(product);
                                                         controller.addProduct(product: product);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color(0xFF163257),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5)),
                                                        child: Center(
                                                          child: Text(
                                                            "Add to Cart",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                          ]),
                                    ))
                              ]));
                        }),
                  ],
                ),
              ),
            )));
  }
}
