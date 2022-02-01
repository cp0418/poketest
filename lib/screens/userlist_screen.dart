import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/models/users_model.dart';
import 'package:flutter_exam_pokedex/services/user_service.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String query = '', sortSeleted = '';

  Stream getUser() async* {
    yield await UserService().getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomAppBar(appBarTitle: 'Users'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product');
                },
                icon: Icon(Icons.next_plan)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/bluetooth');
                },
                icon: Icon(Icons.bluetooth)),
          ],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildSearchBox(),
                ),
                _buildSorting()
              ],
            ),
          ),
          StreamBuilder(
            stream: getUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                        'Something wrong with ${snapshot.error.toString()}'));
              } else if (snapshot.connectionState == ConnectionState.done) {
                return _userList(snapshot.data);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ]));
  }

  Widget _userList(List<Users> users) {
    if (query.isEmpty) {
      users = users;
    } else {
      final queryUser = users.where((user) {
        final name = user.name.toString().toLowerCase();
        final email = user.email.toString().toLowerCase();
        return name.contains(query.toLowerCase()) ||
            email.contains(query.toLowerCase());
      });
      users = queryUser.toList();
    }

    if (sortSeleted.isEmpty) {
      users = users;
    } else {
      switch (sortSeleted) {
        case 'idasc':
          users.sort((userA, userB) {
            return userA.id.compareTo(userB.id);
          });
          break;
        case 'iddesc':
          users.sort((userA, userB) {
            return userB.id.compareTo(userA.id);
          });
          break;
        case 'asc':
          users.sort((userA, userB) {
            return userA.name.compareTo(userB.name);
          });
          break;
        case 'desc':
          users.sort((userA, userB) {
            return userB.name.compareTo(userA.name);
          });
          break;
      }
    }
    return Expanded(
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, index) {
            Users user = users[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.id} - ${user.name}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3),
                        Text(
                          user.email,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextFormField(
          style: TextStyle(fontSize: 18, color: Colors.black),
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.orange, size: 30),
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          )),
    );
  }

  Widget _buildSorting() {
    String sortLabel = '';
    switch (sortSeleted) {
      case 'idasc':
        sortLabel = "1-10";
        break;
      case 'iddesc':
        sortLabel = "10-1";
        break;
      case 'asc':
        sortLabel = "A-Z";
        break;
      case 'desc':
        sortLabel = "Z-A";
        break;
    }
    print(sortLabel);
    TextStyle sortStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue);
    return Container(
      height: 60,
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                _showSortingType();
              },
              icon: Icon(
                Icons.sort,
                size: 35,
              )),
          Positioned(
            left: 8,
            right: 8,
            bottom: 0,
            child: Container(
              child: Text(
                sortLabel,
                style: sortStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showSortingType() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text('Sorting Selection'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Order by 1-10 '),
                    trailing: Radio(
                      value: 'idasc',
                      groupValue: sortSeleted,
                      onChanged: (value) {
                        setState(() {
                          sortSeleted = value.toString();
                        });
                        this.setState(() {});
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Order by 10-1 '),
                    trailing: Radio(
                      value: 'iddesc',
                      groupValue: sortSeleted,
                      onChanged: (value) {
                        setState(() {
                          sortSeleted = value.toString();
                        });
                        this.setState(() {});
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Order by  A-Z'),
                    trailing: Radio(
                      value: 'asc',
                      groupValue: sortSeleted,
                      onChanged: (value) {
                        setState(() {
                          sortSeleted = value.toString();
                        });
                        this.setState(() {});
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Order by  Z-A'),
                    trailing: Radio(
                      value: 'desc',
                      groupValue: sortSeleted,
                      onChanged: (value) {
                        setState(() {
                          sortSeleted = value.toString();
                        });
                        this.setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          });
        });
  }
}
