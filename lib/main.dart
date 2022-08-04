import 'package:flutter/material.dart';
import 'story_brain.dart';

// Step 15 - Run the app and see if you can see the screen update with the first story. Delete this if it looks as you expected.

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

// Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/title-1.jpg"),
            fit: BoxFit.cover,
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  // Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                  // 'Story Text will go here.',
                  storyBrain.getStory(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.redAccent,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user.
                      // Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                     // Step 13 - Use the storyBrain to get the text for choice 1.
                    // 'Choice 1',
                    storyBrain.getChoice1(),
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
               // Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                // Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Container(
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () {
                       //Choice 2 made by user.
                        // Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                     setState(() {
                        storyBrain.nextStory(2);
                     });
                    },
                    child: Text(
                      // Step 14 - Use the storyBrain to get the text for choice 2.
                      // 'choice 2',
                      storyBrain.getChoice2(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/

