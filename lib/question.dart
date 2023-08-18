// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Question extends StatefulWidget {
   final Map data;
   final String checkpoint;
   final Function update;
   
 const  Question({super.key,  required this.data,required this.checkpoint,required this.update});

  @override
  State<Question> createState() => _QuestionState();
}
class _QuestionState extends State<Question> {
  bool isAnswered = false;
 final snackBarCorrect = const SnackBar(
  content: Text('Вы заработали 10 монет'),
);
final snackBarWrong = const SnackBar(
  content: Text('Вы ответили неверно'),
);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.transparent,
      floatingActionButton: Visibility(
        visible: isAnswered,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: Colors.white,
            child: IconButton(
             
              onPressed: (){
                Navigator.pop(context);
              }, icon:
            
            const Icon(
            
              
              
              Icons.home,
              
              color: Colors.black,)),
          ),
        ),
      ),
        
      body: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            
            widget.data['question'],
          textAlign: TextAlign.center,
          style: const TextStyle(
          
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 
          25
          ),
        
         
          
          ),
           ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.data['answers'].length,
            itemBuilder: (BuildContext context, int index) {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: ()  async {
                  if (isAnswered) return;
                  if(widget.data['answers'][index]['isCorrect']) {
                    setState(() {
                    isAnswered = true;
                  });
                  
                  await updateBalanceAndSetCheckpoint();
                widget.update();
                ScaffoldMessenger.of(context).showSnackBar(snackBarCorrect);
                  }

                  if(!widget.data['answers'][index]['isCorrect']){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBarWrong);
                  }
                }, 
                style: ElevatedButton.styleFrom(
                                backgroundColor:  widget.data['answers'][index]['isCorrect']  && isAnswered
                                ? const Color.fromRGBO(0,154,34,1) : Colors.transparent,
                                
                                elevation: 0,
                                
                                side: const BorderSide(
                                  width: 1.0,
                                  color: Color.fromRGBO(0,154,34,1)
                                )),
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text( widget.data['answers'][index]['answer'],
                              style: const TextStyle(color: Colors.white),),
                            ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
   updateBalanceAndSetCheckpoint()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
     List <String>?  checkpoints = prefs.getStringList('checkpoints');
    int? coin =  prefs.getInt('coin');

    prefs.setInt('coin', coin! + 10);

   checkpoints?.remove(widget.checkpoint);
   await prefs.setStringList('checkpoints', checkpoints!);
  }
}