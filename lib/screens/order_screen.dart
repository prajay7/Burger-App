import 'package:burger_app/screens/cart_screen.dart' show CartScreen;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            // ----------------------- Header ---------------------------- //
            Header(),
            SizedBox(height: 50,),
            // ------------------- Burger Card --------------------------- //
            BurgerCardWidget(),

            // -------------------- Quantity Widget --------------------- //
            SizedBox(height: 80,),
            QuantityWidget()

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8,24,0,24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Price',style: TextStyle(color:Color(0xff435D6B),fontSize: 16),),
                Text('N2,600.00',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                  color: Color(0xffC8161D),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset('assets/icons/cart.svg'),
                    Text('Go To Cart',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Quantity Widget
class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 50,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if(quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Color(0xffF27D82),
                shape: BoxShape.circle,
            ),
            child: Icon(Icons.remove,size: 20,),
          ),
        ),
        Text(quantity.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24),),
        InkWell(
          onTap: () {
            setState(() {
              quantity++;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Color(0xffF27D82),
                shape: BoxShape.circle,
            ),
            child: Icon(Icons.add,size: 20,),
          ),
        ),
      ],
    );
  }
}

class BurgerCardWidget extends StatefulWidget {
  const BurgerCardWidget({
    super.key,
  });

  @override
  State<BurgerCardWidget> createState() => _BurgerCardWidgetState();
}

class _BurgerCardWidgetState extends State<BurgerCardWidget> {
  String selectedSize = "";
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size .height * 0.52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(190)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            spacing: 16,
            children: [
              Text('Savory Angus Delight',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),
              ),
              Text('Juicy Angus patty, cheddar, lettuce,\ntomatoes, special sauce, all in a toasted\nbrioche bun. Perfection in a bite.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff667C8A),
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                ),
              ),
              Image.asset('assets/images/big_burger.png'),
            ],
          ),
        ),
        Positioned(
            bottom: 20,
            left: 60,
            child: SizeWidget(size: "S",selectedSize: selectedSize, onPress: () => setState(() => selectedSize = "S"),)),
        Positioned(
            bottom: 20,
            right: 50,
            child: SizeWidget(size: "L",selectedSize: selectedSize, onPress: () => setState(() => selectedSize = "L"),)),
        Positioned(
            bottom: -30,
            child: SizeWidget(size: "M",selectedSize: selectedSize, onPress: () => setState(() => selectedSize = "M"),)),
      ],
    );
  }
}


/// Size Widget
class SizeWidget extends StatefulWidget {
  const SizeWidget({
    required this.size,
    required this.selectedSize,
    required this.onPress,
    super.key,
  });

  final String size;
  final String selectedSize ;
  final VoidCallback onPress;
  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

            maximumSize: Size(55, 55),
            minimumSize: Size(55, 55),
            backgroundColor: widget.selectedSize == widget.size ? Color(0xffC8161D) : Colors.white,
            foregroundColor: widget.selectedSize == widget.size ? Colors.white : Color(0xffC8161D)
        ),
        onPressed: widget.onPress, child: Text(widget.size,style: TextStyle(fontSize: 20),)
    );
  }
}

/// Header
class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _isFavorite = false;

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
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              child:_isFavorite ? Icon(Icons.favorite, color: Color(0xffC8161D),size: 24,) : SvgPicture.asset('assets/icons/favorite.svg',
              colorFilter: ColorFilter.mode(Color(0xffC8161D), BlendMode.srcIn),
              )),
        ],
      ),
    );
  }
}
