import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizeApp(),
    );
  }
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});

  @override
  State createState() => _QuizeAppState();
}

class _QuizeAppState extends State {
  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsfot",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 1,
    },
    {
      "question": "Who is the founder of Google",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 2
    },
    {
      "question": "Who is the founder of SpaceX",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 3
    },
    {
      "question": "Who is the founder of Apple",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 0
    },
    {
      "question": "Who is the founder of Meta",
      "options": ["Steve Jobs", "Mark Zuckerberg", "Lary Page", "Elon Musk"],
      "correctAnswer": 1
    }
  ];
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int totalScore = 0;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      const Text(
        "Please select the option",
      );
      return const WidgetStatePropertyAll(null);
    }
  }

  int questionPage = 0;

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage == 0) {
      return Scaffold(
        //backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.pinkAccent,
            ),
            ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              width: 700,
              height: 80,
            ),
            Image.network(
                "https://thumbs.dreamstime.com/b/%C3%B0%C2%BF%C3%B0%C2%B5%C3%B1%E2%80%A1%C3%B0%C2%B0%C3%B1%E2%80%9A%C3%B1%C5%93-143799229.jpg"),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "All the best...",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    questionPage = 1;
                    setState(() {});
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purpleAccent,
                      // backgroundColor: Colors.pinkAccent,

                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (questionPage == 1) {
      return Scaffold(
        // backgroundColor:Color.fromARGB(255, 174, 171, 81),
        appBar: AppBar(
          title: const Text(
            "Quize App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                ),
                Text(
                  "Question: ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            //Questions...

            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                allQuestions[currentQuestionIndex]["question"],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //Option1

            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      totalScore++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "A.${allQuestions[currentQuestionIndex]["options"][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //Option 2

            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      totalScore++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "B.${allQuestions[currentQuestionIndex]["options"][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      totalScore++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "C.${allQuestions[currentQuestionIndex]["options"][2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      totalScore++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "D.${allQuestions[currentQuestionIndex]["options"][3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                questionPage = 2;
              }
              selectedAnswerIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
          ),
        ),
      );
    } else {
      return Scaffold(
        //backgroundColor:Colors.pinkAccent,
        appBar: AppBar(
          title: const Text(
            "Quize Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.pinkAccent,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://img.freepik.com/free-vector/golden-trophy_23-2147497729.jpg",
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  color: Colors.pinkAccent,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Score :$totalScore/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  currentQuestionIndex = 0;
                  totalScore = 0;
                  questionPage = 0;
                  setState(() {});
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    //backgroundColor: Colors.pinkAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
