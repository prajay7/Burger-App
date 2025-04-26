import 'package:burger_app/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Column(
         children: [
           // ----------------------- Header ---------------------------- //
           Header(),
           SizedBox(height: 20),

           Expanded(
             child: SingleChildScrollView(
               padding: EdgeInsets.symmetric(horizontal: 12),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Hey!',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
                   Text("Let's get your order",style: TextStyle(color: Color(0xff667C8A),fontWeight: FontWeight.w600,fontSize: 16),),
                   SizedBox(height: 20,),
               
                   // ------------------- Search Bar --------------------------- //
                   SearchBar(),
               
                   SizedBox(height: 20),
                   // ------------------- Categories --------------------------- //
               
                   Categories(),
                   SizedBox(height: 40,),
                   Text("Popular",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
               
                   Stack(
                     clipBehavior: Clip.none,
                     alignment: Alignment.center,
                     children: [
                       Container(
                         margin: EdgeInsets.only(top: 30),
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(20),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withValues(alpha: 0.5),
                                 spreadRadius: 1,
                                 blurRadius: 7,
                                 offset: Offset(0, 3), // changes position of shadow
                               ),
                             ]
                         ),
                         child: Column(
                           children: [
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 0,vertical: 12),
                               height: 161,
                               width: double.infinity,
                               decoration: BoxDecoration(
                                 color: Color(0xffC8161D),
                                 borderRadius: BorderRadius.circular(20),
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text('Pizza ai funghi',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                                 Text('N5,250.45',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                               ],
                             ),
                             SizedBox(height: 30,),
                           ],
                         ),
                       ),
                       Positioned(
                           top: -5,
                           child: Image.asset('assets/images/big_pizza.png'))
                     ],
                   )
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

/// Categories
class Categories extends StatelessWidget {
  Categories({super.key,});


  final List<String> categoriesName = [
    'Burger',
    'Pizza',
    'Cakes',
  ];

  final List<String> images = [
    'assets/images/burger.png',
    'assets/images/pizza.png',
    'assets/images/cakes.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(categoriesName.length, (index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => OrderScreen(),));
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: index == 1  ? Color(0xffC8161D) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Column(
                spacing: 12,
                children: [
                  Image.asset(images[index],height: 100,width: 80,),
                  Text(categoriesName[index],style: TextStyle(
                      fontWeight: FontWeight.w500,fontSize: 16,color: index == 1 ? Colors.white : Colors.black),),

                  index == 1 ?
                  SvgPicture.asset('assets/icons/arrow_right_1.svg') :
                  SvgPicture.asset('assets/icons/arrow_right.svg')
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top,horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/menu.svg'),
          Spacer(),
          SvgPicture.asset('assets/icons/location.svg'),
          Text('Lagos,',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          Text('Ng',style: TextStyle(color: Color(0xff667C8A),fontWeight: FontWeight.w600,fontSize: 16),),
          Spacer(),
          Image.asset  ('assets/images/profile.png'),
        ],
      ),
    );
  }
}


/// Search Bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 50,
            minWidth: 50,
          ),
          prefixIcon: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 20,
            colorFilter: ColorFilter.mode(Color(0xff708492), BlendMode.srcIn),
          ),
          hintText: 'Search our delicious burgers',
          hintStyle: TextStyle(color: Color(0xff798C99)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}