class Bot {
 
  

  List<String> health = [
    "wie geht es dir?",
    "was geht?",
    "wie gehts dir?",
    "Wie geht es dir?",
    "Was geht?",
    "Wie gehts dir?"
  ];

  List<String> weather = [
    "Wie ist das Wetter heute?",
    "Was sagst du zum Wetter?",
    "Wetter?",
    "wie ist das Wetter heute?",
    "was sagst du zum Wetter?",
    "wetter?",
  ];

  List<String> dumb = [
    "Bist du dumm?",
    "Bist wohl nicht der hellste?",
    "Hi Forest",
    "Was stimmt nicht mit dir?",
    "bist du dumm?",
    "bist wohl nicht der hellste?",
    "hi Forest",
    "was stimmt nicht mit dir?"
  ];

  List<String> actives = [
    "Hast du Hobbies?",
    "Was machst du am liebsten?",
    "Was trebst so in deiner Freizeit?",
  ];
  List<String> sense = [
    "Was ist der Sinn des Lebens?",
    "Kennst du die Antwort auf alles Fragen?",
  ];

 Future<String> botAnswer(String userInput)async {
   userInput = userInput.toString();


    if (userInput.contains("beende") && userInput.contains("Beende")) {
       return  ("Bis zum nächsten Mal!");
        
      }

      // weitere themen können sein... wer hat dich gebaut? ,was machst du?, Hobby?,
      //  erzähl mir einen witz. Was ist der Sinn des Lebens?(42)
      // implementierung von verschiedenen launen durch if else funktionsblock in klasse auslagern und durch zusätzliche if reaktion simulieren .

      else if (health.any((element) => userInput.contains(element))) {
        return ("Mir geht es gut, danke! Und dir?");
      } else if (weather.any((element) => userInput.contains(element))) {
        return("Das Wetter ist heute schön, oder?");
      } else if (dumb.any((element) => userInput.contains(element))) {
        return("Dumm ist der, der dummes tut ; )... mein lieber Freund! ");
      } else if (actives.any((element) => userInput.contains(element))) {
        return(
            "Ich stricke am liebsten in meiner Freizeit! Die Ruhe und die Ausgeglichenheit dabei");
      } else if (sense.any((element) => userInput.contains(element))) {
       return("42!");
      } else {
        return ("Das ist interessant. Kannst du mir mehr darüber erzählen?");
      }
    }
  }
}
