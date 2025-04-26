import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC8161D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text('Rate your service',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),),
            SizedBox(height: 50),
            Text('How was',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28,height:0.5)),
            Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28),
                text:'your',
                children: [
                  TextSpan(
                    text: ' food?',
                    style: TextStyle(color: Color(0xffFF3D3D),fontWeight: FontWeight.w600,fontSize: 28),
                  )
                ]
              ),
            ),
            Spacer(),
            Row(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset('assets/icons/dislike.svg'),
                  ),
                ),
                Image.asset('assets/images/pizaa_big_1.png'),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset('assets/icons/like.svg'),
                  ),
                ),
              ],
            ),
            Spacer(),
            
            Text('How was your',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28),),
            Text('delivery?',style: TextStyle(color: Color(0xffFF3D3D),fontWeight: FontWeight.w600,fontSize: 28,height:0.5),),
            Spacer(),

            Row(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset('assets/icons/dislike.svg'),
                  ),
                ),
                Image.asset('assets/images/delivery.png'),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset('assets/icons/like.svg'),
                  ),
                ),
              ],
            ),
            Spacer(),


          ],
        ),
      ),
    );
  }
}
