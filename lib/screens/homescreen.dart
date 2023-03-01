import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/provider/movie_provider.dart';
import 'package:providerexample/screens/cartscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerPage = Provider.of<MovieProvider>(context);
    var movies = providerPage.movier;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoViEs"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: Center(
                  child: Text("Go To Cart  "+providerPage.myList.length.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_,index){
                  final currentmovie = movies[index];
                  return Card(
                    color: Colors.green,
                    elevation: 4,
                    child: ListTile(
                      title: Text(currentmovie.movieName,style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(currentmovie.movieTitle??"",style: TextStyle(color: Colors.white)),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite,size: 30,
                        color: providerPage.myList.contains(currentmovie)? Colors.redAccent: Colors.white,
                        ),
                        onPressed: (){
                          if(providerPage.myList.contains(currentmovie)){
                            providerPage.removeItems(currentmovie);
                          }else{
                            providerPage.addItem(currentmovie);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
