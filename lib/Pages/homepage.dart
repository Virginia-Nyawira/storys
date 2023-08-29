import 'package:flutter/material.dart';
import 'package:storys/Model/stories.dart';
import 'package:storys/Pages/styles.dart';
import 'package:storys/Service/get_stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Stories>? stories;
  var isLoaded=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStories();
  }
  getStories() async {
    stories = await GetStoriesService().getStory();
    if(stories!=null){
      setState(() {
        isLoaded=true;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Visibility(
          visible: isLoaded,
            replacement:const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
            child: ListView.builder(
                itemCount: stories?.length,
                itemBuilder: (context, index) {
              return Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    AppBar(
                      centerTitle: true,
                      backgroundColor: Colors.green,
                      title: Text(stories![index].heading,
                      style: headingTextStyle(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 75,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(stories![index].image),)
                          ),
                        ),
                      ],
                    ),
                    Text(stories![index].body,
                    softWrap: true,
                      style: bodyTextStyle(),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.green,
                      surfaceTintColor: Colors.greenAccent,
                      child:  Column(
                        children: [
                          AppBar(
                            elevation: 20,
                           centerTitle: true,
                           shadowColor: Colors.teal,
                           title: const Text('Lessons', style: TextStyle(
                             fontWeight: FontWeight.w600,
                             fontStyle: FontStyle.italic,
                             color: Colors.blueGrey
                           ),),
                          ),
                          Text(stories![index].lessons,
                            softWrap: true,
                            style: bodyTextStyle().copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              );


            }
            )
        )
    );
  }
}
