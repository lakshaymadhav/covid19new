import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: theme.primaryColor,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryTextTheme: theme.primaryTextTheme,
    );
  }

  final List StateList;

  Search(this.StateList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
    
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String sname;
    final SuggestionList = query.isEmpty
        ? StateList
        : StateList.where((element) =>
                element['state'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: SuggestionList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 140,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 180,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      SuggestionList[index]['state'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'CONFRIMED: ' +
                            SuggestionList[index]['confirmed'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      Text(
                        '[+' +
                            SuggestionList[index]['cChanges'].toString() +
                            "]",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      Text(
                        'ACTIVE: ' + SuggestionList[index]['active'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      Text(
                        '[' +
                            SuggestionList[index]['aChanges'].toString() +
                            ']',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      Text(
                        'RECOVERED: ' +
                            SuggestionList[index]['recovered'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        '[+' +
                            SuggestionList[index]['rChanges'].toString() +
                            ']',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        'DEATHS: ' + SuggestionList[index]['deaths'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      Text(
                        '[+' +
                            SuggestionList[index]['dChanges'].toString() +
                            ']',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    
  }
}