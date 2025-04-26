import 'package:burger_app/controller/cart_controller.dart';
import 'package:burger_app/screens/rate_screen.dart' show RateScreen;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartController cartController = CartController();

  @override
  void dispose() {
    cartController.dispose();
    super.dispose();
  }

  void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(color: Color(0xffC8161D),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      shrinkWrap: true,
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartInfo = cartController.cartItems[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(cartInfo.image,width: 80,),
                              ),
                              Column(
                                children: [
                                  Text(cartInfo.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                                  Row(
                                    children: [
                                      IconButton(onPressed: () {
                                        cartController.quantityDecrement(index);
                                      }, icon: Icon(Icons.remove,color: Color(0xffC8161D),)),
                                      ValueListenableBuilder(
                                      valueListenable: cartController.quantity,
                                      builder: (BuildContext context, value, Widget? child) {
                                            return Text(cartInfo.quantity.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),);
                                      },),
                                      IconButton(onPressed: () {
                                        cartController.quantityIncrement(index);
                                      }, icon: Icon(Icons.add,color: Color(0xffC8161D),)),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.close,color: Color(0xffC8161D),)),
                                  Text('N${cartInfo.price}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    ),
                    ElevatedButton.icon(
                      iconAlignment: IconAlignment.end,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),
                      ),
                      onPressed: () {

                    },label: Text('Apply Coupons'),
                    icon: SvgPicture.asset('assets/icons/arrow_right.svg',colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
                      child: Divider(color: Color(0xffF7F9FA)),
                    ),

                    PriceCard(title: 'Item Total',price: 'N23,600.95',),
                    SizedBox(height: 20,),
                    PriceCard(title: 'Delivery Charge',price: 'N950.00',),
                    SizedBox(height: 20,),
                    PriceCard(title: 'Tax',price: 'N100.00',),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total : ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          Text('N24,650.95',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                        backgroundColor: Color(0xffC8161D),
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),
                      ),
                      onPressed: () async {
                        showProgressDialog(context);
                        await Future.delayed(Duration(seconds: 2));
                        if(!context.mounted)return;
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RateScreen(),));
                    }, child: Text('Proceed to payment method'),)

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Price Card
class PriceCard extends StatelessWidget {
  const PriceCard({
    required this.title,
    required this.price,
    super.key,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Color(0xff9FADB6),fontWeight: FontWeight.w500),),
          Text(price,style: TextStyle(fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}

/// Header
class Header extends StatefulWidget {
  const   Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  maximumSize: Size(45, 45),
                  minimumSize: Size(45, 45),
                  backgroundColor: Colors.white
              ),
              onPressed: () => Navigator.pop(context),
              child: SvgPicture.asset('assets/icons/back_arrow.svg')),
          Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  maximumSize: Size(45, 45),
                  minimumSize: Size(45, 45),
                  backgroundColor: Colors.white
              ),
              onPressed: (){
              },
              child: Icon(Icons.more_vert_rounded,size: 25,color: Colors.black,),
          ),
        ],
      ),
    );
  }
}