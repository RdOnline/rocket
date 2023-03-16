import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rocket/rocketModel.dart';

class RocketDetails extends StatelessWidget {
  const RocketDetails({Key? key,required this.rocket}) : super(key: key);
  final RocketModel rocket;
  @override
  Widget build(BuildContext context) {
    List<Widget> corosoul = [];
    for (int i = 0; i< rocket.flickrImages.length; i++) {
      corosoul.add(Image.network(rocket.flickrImages.elementAt(i),
        fit: BoxFit.fill,
      ),);
    }
    return Scaffold(
      appBar: AppBar(title: Text(rocket.name)),
      body: Column(
        children: [
          BannerCarousel(
            margin: const EdgeInsets.all(0),
            customizedBanners: corosoul,
            customizedIndicators: IndicatorModel.animation(
                width: 8.0,
                height: 10.0,
                spaceBetween: 5.0,
                widthAnimation: 30.0
            ),
            height: 200.0,
            activeColor: Colors.orangeAccent,
            disableColor: Colors.white,
            animation: true,
            borderRadius: 8.0,
            width: MediaQuery.of(context).size.width,
            indicatorBottom: false,
          ),
          Expanded(
              child: ListView(
                children: [SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        rocket.active
                            ? Text('Active',style: TextStyle(color: Colors.green,fontSize: 20),)
                            : Text('Inactive',style: TextStyle(color: Colors.red,fontSize: 20),)

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cost per launch :',style: TextStyle(fontSize: 20),),
                        Text('${rocket.costPerLaunch.toString()}',style: TextStyle(fontSize: 20),),

                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Success Rate percent :',style: TextStyle(fontSize: 20),),
                        Text('${rocket.successRatePct.toString()}' + '  %',style: TextStyle(fontSize: 20),),

                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${rocket.description}')
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Height :',style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
                          Text('${rocket.height.feet}' + '  feet',style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Diameter :',style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
                          Text('${rocket.diameter.feet}' + '  feet',style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
                        ],
                      )
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Search on Wikipedia',style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
                          SizedBox(height: 10.0),
                          Text('${rocket.wikipedia}',style: TextStyle(fontSize: 20,color: Colors.blueAccent),textAlign: TextAlign.left),
                        ],
                      )
                  ),],
              )
          )


        ],
      )
    );
  }
}
