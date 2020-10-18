import 'package:flutter/material.dart';

class RepoCard extends StatefulWidget {
  String name;
  String description;
  int stars;
  @override
  _RepoCardState createState() => _RepoCardState();
  RepoCard(this.name, this.description, this.stars);
}

class _RepoCardState extends State<RepoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 200,
        child: Row(
          children: [
            Expanded(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text("Nome: ",textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    Text(widget.name,textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                    Text("Descrição: ",textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    ( Text(widget.description,textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)),
                    Text("Estrelas: ",textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    Text(widget.stars.toString(),textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),

                    // Row(
                    //   children: [
                    //     Text("Nome: ",textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    //     Text(widget.name,textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text("Descrição: ",textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    //     Expanded(child: Text(widget.description,textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),)
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text("Nome: ",textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    //     Text(widget.name,textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                    //   ],
                    // ),
                  ],
                )
            ),),
          ],
        )
    ),);
  }
}

