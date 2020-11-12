import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_app/builder/not_found_page.dart';
import 'package:my_app/helper/parser.dart';
import 'package:my_app/helper/service.dart';
import 'package:my_app/model/my_model.dart';
import 'package:my_app/provider.dart/my_provider.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_builder.dart';
import 'list_menu_builder.dart';
import 'grid_menu_builder.dart';

class MainPageBuilder extends StatefulWidget {
  Map<String, dynamic> data = {};
  MainPageBuilder(this.data);

  @override
  _MainPageBuilderState createState() => _MainPageBuilderState();
}

class _MainPageBuilderState extends State<MainPageBuilder>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController tabController;
  bool isLoading = true;
  var data;
  List<MyModel> datas = [];

  @override
  void initState() {
    // TODO: implement initState
    print(widget.data);
    if (widget.data["widget"].containsKey("tabbar")) {
      tabController = TabController(
          length: widget.data["widget"]["tabbar"]["tabbar_items"].length,
          vsync: this);
    }
    super.initState();
    API().getData(endPoint: widget.data["endpoint"]).then((value) {
      print("length = ${value["data"]["data"].length}");
      Provider.of<MyProvider>(context, listen: false).clearData();
      for (var item in value["data"]["data"]) {
        // setState(() {
        // datas.add(MyModel.fromJSON(item));
        print("1 : $item");

        Provider.of<MyProvider>(context, listen: false)
            .setData(item["id"].toString(), MyModel.fromJSON(item));
        // });
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    print(widget.data);
    return Scaffold(
      appBar: AppBar(
        actions: widget.data["widget"]["menu"]["type"] == "crud"
            ? [
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      print("data dari widget${widget.data}");
                      navigatorParser(context,
                          {"route_name": "input", "type": "pushNamed"});
                    })
              ]
            : [],
        bottom: widget.data["widget"].containsKey("tabbar")
            ? TabBar(
                controller: tabController,
                tabs: tabbarItemParser(widget.data["widget"]["tabbar"]),
              )
            : null,
        title: Text(widget.data["title"] ?? "App"),
      ),
      drawer: widget.data.containsKey("drawer")
          ? drawerParser(widget.data["drawer"])
          : null,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : widget.data["widget"].containsKey("tabbar")
              ? TabBarView(controller: tabController, children: [
                  ListMenuBuilder(data: widget.data["widget"]),
                  GridMenuBuilder(widget.data["widget"]),
                  Center(
                    child: Text("da"),
                  ),
                  Center(
                    child: Text("da"),
                  ),
                ])
              : Builder(builder: (context) {
                  // print(widget.data["drawer"]["items"]);
                  if (widget.data.isNotEmpty) {
                    switch (widget.data["widget"]["menu"]["type"]) {
                      case "list_menu":
                        return ListMenuBuilder(
                          data: widget.data["widget"],
                        );
                        break;
                      case "grid_menu":
                        return GridMenuBuilder(
                          widget.data["widget"],
                        );
                        break;
                      case "crud":
                        return ListView.builder(
                          itemBuilder: (context, i) {
                            return Slidable(
                              actionPane: SlidableBehindActionPane(),
                              key: Key(myProvider.datas.values
                                  .toList()[i]
                                  .id
                                  .toString()),
                              secondaryActions: [
                                IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      myProvider.clearSelectedItem();
                                      myProvider.setSelectedItem(
                                          myProvider.datas.values.toList()[i]);
                                      navigatorParser(context, {
                                        "route_name": "update",
                                        "type": "pushNamed"
                                      });
                                    }),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Peringatan"),
                                              content: Text(
                                                  "Apakah Anda Yakin Akan Menghapus Data Ini?"),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text("Tidak")),
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      //
                                                      API()
                                                          .postApi(
                                                              endPoint:
                                                                  "users/delete/${datas[i].id}")
                                                          .then((value) {
                                                        print(value);
                                                        setState(() {
                                                          datas = [];
                                                        });
                                                        API()
                                                            .getData(
                                                                endPoint: widget
                                                                        .data[
                                                                    "endpoint"])
                                                            .then((value) {
                                                          print(value);
                                                          for (var item
                                                              in value["data"]
                                                                  ["data"]) {
                                                            setState(() {
                                                              datas.add(MyModel
                                                                  .fromJSON(
                                                                      item));
                                                            });
                                                          }
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                        });
                                                      });
                                                    },
                                                    child: Text("Iya"))
                                              ],
                                            );
                                          });
                                    })
                              ],
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.grey[400],
                                ),
                                title: Text(
                                    myProvider.datas.values.toList()[i].name),
                                subtitle: Text(
                                    myProvider.datas.values.toList()[i].email),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            );
                          },
                          itemCount: myProvider.datas.values.toList().length,
                        );
                        break;
                      default:
                        return NotFoundPage();
                    }
                  } else {
                    return Center(
                      child: Text("Loading..."),
                    );
                  }
                }),
      bottomNavigationBar: widget.data.containsKey("bottom_navigation")
          ? BottomNavigationBuilder(widget.data["bottom_navigation"])
          : null,
    );
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
