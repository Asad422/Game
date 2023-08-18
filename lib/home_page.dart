// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:math';

import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/advice.dart';
import 'package:project/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}
String? userName;
int? coin;
SharedPreferences? prefs;

 final questions = {
  '1': {
    "question" : "Инфляция это?",
    "answers" : [
   { 'answer' : 'повышение заработной платы бюджетникам',
    'isCorrect': false

    },
   
   { 'answer' :   'повышение покупательной способности денег' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : 'понижение покупательгой способности денег',
      'isCorrect' : true

    }
    ]
  },
'2': {
    "question" : "Вы решили обменять рубли на иностранную валюту. На какой курс надо обратить внимание в банке?",
    "answers" : [
   { 'answer' : 'На официальный курс Банка России',
    'isCorrect': false

    },
   
   { 'answer':   'На курс продажи валюты' ,
      'isCorrect' : true,
   } ,
    {
      'answer' : 'На курс покупки валюты',
      'isCorrect' : false

    }
    ]
  },
  '3': {
    "question" : "Что из перечисленного является ценной бумагой?",
    "answers" : [
   { 'answer' : 'Декларация',
    'isCorrect': false

    },
   
   { 'answer':   'Облигация' ,
      'isCorrect' : true,
   } ,
    {
      'answer' : 'Страховой полис на предъявителя',
      'isCorrect' : false

    }
    ]
  },
  '4': {
    "question" : "Каким качеством не обладают деньги?",
    "answers" : [
   { 'answer' : 'Износостойкость',
    'isCorrect': false

    },
   
   { 'answer':   'Однородность' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : 'Неделимость',
      'isCorrect' : true,

    },
    
    ]
  },
  '5': {
    "question" : "На что влияет изменение ключевой ставки Центрального Банка?",
    "answers" : [
   { 'answer' : 'На проценты по кредитам и вкладам',
    'isCorrect': true

    },
   
   { 'answer':   'На размер будущей пенсии' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : 'На размер заработной платы',
      'isCorrect' : false,

    },
    
    ]
  },
  '6': {
    "question" : "Умеренная, галопирующая .. - это все виды чего?",
    "answers" : [
   { 'answer' : 'Инвестиции',
    'isCorrect': false

    },
   
   { 'answer':   'Инфляции' ,
      'isCorrect' : true,
   } ,
    {
      'answer' : 'Депозита',
      'isCorrect' : false,

    },
    
    ]
  },
   '7': {
    "question" : "Способность любой актив превратить в деньги - это?",
    "answers" : [
   { 'answer' : 'Ликвидность',
    'isCorrect': true

    },
   
   { 'answer':   'Надежность' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : 'Рентабельность',
      'isCorrect' : false,

    },
    
    ]
  },
  '8': {
    "question" : "Как называется залог недвижимого имущества?",
    "answers" : [
   { 'answer' : 'Квартирный кредит',
    'isCorrect': false

    },
   
   { 'answer':   'Жилищный кредит' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : 'Ипотека',
      'isCorrect' : true,

    },
    
    ]
  },
   '9': {
    "question" : "Из чего не могут состоять ваши доходы после выхода на пенсию?",
    "answers" : [
   { 'answer' : 'Государственная пенсия',
    'isCorrect': false

    },
   
   { 'answer':   'Обязательные отчисления работодателя' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : 'Негосударственная пенсия',
      'isCorrect' : true,

    },
    
    ]
  },
   '10': {
    "question" : "По какой базовой ставке в России начисляется налог на доходы физических лиц?",
    "answers" : [
   { 'answer' : '20%',
    'isCorrect': false

    },
   
   { 'answer':   '10%' ,
      'isCorrect' : false,
   } ,
    {
      'answer' : '13%',
      'isCorrect' : true,

    },
    
    ]
  },
};

final advices = {
  '1' : {
    'topic' : 'В первую очередь удовлетворяйте базовые потребности',
    'text' : 'Когда стоит вопрос между «отложить эту сумму на покупку квартиры» и «лишний раз поехать за границу», какой выбор сделаете вы? Здравый смысл подсказывает, что в первую очередь следует удовлетворить базовую потребность в жилье. И лишь затем можно пускаться во все тяжкие и тратить деньги на развлечения.'
  },
  '2' : {
    'topic' : 'Учитывайте не только стоимость покупки, но и ее содержание',
    'text' : 'Принимая решение о покупке, учитывайте и скрытые траты, которые не входят в основную цену. Приобретение автомобиля означает траты на бензин, запчасти, страховку, техобслуживание и т.д. Путешествие за границу означает не только плату за готовый тур, но и прочие расходы на сувениры, дополнительные экскурсии и форс-мажоры. Учитывайте этот фактор и всегда планируйте бюджет на содержание.'

  },

  '3' : {
    'topic' : 'Создавайте финансовые резервы',
    'text' : 'Любое государство или частное предприятие имеет резервные фонды в структуре бюджета. Их наличие обусловлено непредсказуемостью мира, в котором мы живем. Финансовые кризисы, потеря работы, внезапная болезнь, судебный иск от недоброжелателя – все эти «черные лебеди» могут моментально опустошить ваш кошелек. Обязательно создайте свой личный резервный фонд на случай непредвиденных обстоятельств.'

  },

    '4' : {
    'topic' : 'Отслеживайте свои траты',
    'text' : 'Есть три главных загадки жизни: откуда берется пыль, где пропадают носки и куда деваются деньги. Что ж, по крайней мере одну из них вы можете решить. Понаблюдайте за своими тратами в течение месяца, и вы наверняка обнаружите удивительные закономерности. А еще – массу возможностей сэкономить.'

  },
 '5' : {
    'topic' : 'Учитесь экономить',
    'text' : 'Умение экономить – это не скряжничество, а осознанный подход к совершению покупок. Никогда не хватайтесь за первый попавшийся товар. Потратьте немного времени, чтобы изучить рынок и выбрать более выгодное предложение. Торгуйтесь – это вам ничего не стоит, за исключением той выгоды, которую вы можете получить. Используйте дисконтные программы, кэшбек и вообще все, что поможет вам сэкономить какую-либо долю расходов. Только делайте все это без фанатизма.'

  },

  '6' : {
    'topic' : 'Ищите источники пассивного дохода',
    'text' : 'Умный человек работает на деньги, у мудрого человека деньги работают на него. Приблизительно так можно описать парадигму пассивного дохода. Если вы все сделали правильно, старательно откладывали деньги, то со временем у вас должен накопиться небольшой капитал. Теперь вы подошли к самому важному шагу для вашей финансовой свободы – созданию источника пассивного дохода.\nНет нужды описывать, почему это так круто – вы и сами все понимаете. Нужно лишь озаботиться этим и искать возможности для инвестирования своих средств. Это может быть бизнес, ценные бумаги, депозит – все что угодно, что будет приносить деньги без вашего участия.'

  },
  '7' : {
    'topic' : 'Отслеживайте свои траты',
    'text' : 'Есть три главных загадки жизни: откуда берется пыль, где пропадают носки и куда деваются деньги. Что ж, по крайней мере одну из них вы можете решить. Понаблюдайте за своими тратами в течение месяца, и вы наверняка обнаружите удивительные закономерности. А еще – массу возможностей сэкономить.'

  },
  '8' : {
    'topic' : 'Диверсифицируйте риски',
    'text' : 'Помните историю о том, как Робинзон Крузо сохранил свой порох от поражения молнией? Он просто поместил его в несколько мешочков и спрятал в разные места. Это был его главный капитал, и он распорядился им очень правильно.\nТо же самое должны делать и вы. Храните деньги в разных банках, в разных валютах, используйте разные источники дохода. Это позволит сохранить деньги от инфляции, кризисов, воров и прочих неприятных неожиданностей.'

  },
  
  '9' : {
    'topic' : 'Вычислите свой реальный заработок',
    'text' : 'Вычитаете из годового заработка налог и все расходы, напрямую связанные с работой, в том числе обед вне дома, рабочую одежду и подобные вещи. Затем считаете, сколько часов в год вы реально тратите на работу, включая все сверхурочные и доработку из дома. Делите реальный доход на реальное количество рабочих часов. Вот столько вы на самом деле получаете за час работы.'

  },
    '10' : {
    'topic' : 'Не обращайте внимания на то, что думают другие',
    'text' : 'Законы общества потребления не только бессмысленны, но и очень агрессивны. Не следуешь правилам? Станешь изгоем. К счастью, это работает только с очень недалёкими людьми, а более-менее разумный человек понимает, что ни машина, ни другая атрибутика не впечатлит другого так, как разум, интеллект, идеи и поступки.'

  },
  

};

class _HomePageState extends State<HomePage> {
  final  cantGenerate = SnackBar(
  content: Text('Генерация вопроса возможна каждые 20 секунд!'),
);

final  noMoreQuestions = SnackBar(
  content: Text('Вы ответили на все вопросы , поздравляем!'),
);

final  notEnoughcoins = SnackBar(
  content: Text('Недостаточно монет!'),
);

  @override
  void initState() {
    
    super.initState();

    SharedPreferences.getInstance().then((value) {
      prefs = value;
       getNameAndBalance();
      
    });
   
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton:  ClipRRect(

        borderRadius: BorderRadius.circular(40),
        child: Container(
          color: Colors.white, 
          child: IconButton(icon: Icon(Icons.shopping_bag),onPressed: (){
            showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Получить совет'),
          content: const Text('Вы обмениваете 10 монет на 1 совет'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отменить'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                getRandomAdvice();},
              child: const Text('Ок'),
            ),
          ],
        ),
            );
          },),
          )),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end
                  ,
                  children: [
                    Text(coin.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20)),
                  
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
              
                
                'assets/introduce/coin.png',
               
                
                ),
            )
            
                  ],
                ),
          ),
        ],
         elevation: 0.0,
      backgroundColor: Colors.transparent,
        title: Text(userName ?? 'Loading',style: const TextStyle(color: Colors.white),),

        
      ),

      body:   Center(
        child: AnimatedButton(
          type: PredefinedThemes.light,
  isOutline: true,
  borderWidth: 1,
  onTap: () async {

    bool canGenerate = canShow();
    if(canGenerate) {
    saveDate();
     getRandomQuestion();
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
     }

     else { 
      ScaffoldMessenger.of(context).showSnackBar(cantGenerate);
     }
  },
          child: Text(
    'Задание', // add your text here
    style: GoogleFonts.asap(
      fontWeight: FontWeight.w600
    )
  ),
        )
      )
      
    );
  }

  getNameAndBalance(){
    setState(() {
       userName = prefs?.getString('username');
       coin = prefs?.getInt('coin');
    });
  }
  
  getRandomQuestion(){
    var intValue = Random().nextInt(10) + 1 ;
   List <String>?  checkpoints = prefs?.getStringList('checkpoints');
    if(checkpoints!.contains(intValue.toString())) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Question(
        data: questions[intValue.toString()] as Map<dynamic,dynamic>,
        checkpoint: intValue.toString(),
        update: getNameAndBalance,

      )));
    }
      if (!checkpoints.contains(intValue.toString()) && checkpoints.isNotEmpty){
        getRandomQuestion();
      }
    else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(noMoreQuestions);
    }
  }

  getRandomAdvice(){
    var intValue = Random().nextInt(10) + 1 ;
   List <String>?  checkpoints = prefs?.getStringList('checkpointsAdvices');
    int? coin = prefs?.getInt('coin');
    if (coin == 0){}
    
    else {
      
    prefs?.setInt('coin', coin!-10);
    getNameAndBalance();

    if(checkpoints!.contains(intValue.toString())) {
      checkpoints.remove(intValue.toString());
      prefs?.setStringList('checkpointsAdvices', checkpoints);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Advice(
        topic: advices[intValue.toString()]!['topic'].toString(),
        text: advices[intValue.toString()]!['text'].toString(),
      ))
      );
    }
    if (!checkpoints.contains(intValue.toString()) && checkpoints.isNotEmpty){
        getRandomAdvice();
      }
    

    }

  }


  bool canShow() {
    var prefsDate = prefs?.getString('lastPressed');
    if (prefsDate == null) return true;
    var date = DateTime.parse(prefsDate);
    return DateTime.now().isAfter(date);
  }

  Future saveDate() async {
    var date = DateTime.now();
    var dataSet = date.add(const Duration(seconds: 20));
    await prefs?.setString('lastPressed', dataSet.toString());
  }
}