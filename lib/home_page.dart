import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket/rocketModel.dart';
import 'package:rocket/rocket_description.dart';

import 'data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final rocketData = ref.watch(rocketDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Rocket')),
      body: rocketData.when(
          data: (rocketData){
            List<RocketModel> rocketList = rocketData.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemCount: rocketList.length,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 5,
                        color: Colors.blueAccent,
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: ListTile(
                          title: Text(rocketList[index].name),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RocketDetails(rocket: rocketList[index])));
                          },
                          trailing: Text('${rocketList[index].engines.number}' + ' Engines'),
                          subtitle: Text(rocketList[index].country),
                          leading: Container(
                            child: Image.network(rocketList[index].flickrImages.first,fit: BoxFit.fill),
                            height: 50,
                            width: 50,
                          ),
                          
                        ),
                      );
                    }
                )
                )
              ],
            );
          },
          error: (error,s) =>
              Text(error.toString()),
          loading: ()=>
              Center(
                  child: CircularProgressIndicator()
              )
      ),
    );
  }
}
