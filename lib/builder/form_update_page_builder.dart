import 'package:flutter/material.dart';
import 'package:my_app/helper/service.dart';
import 'package:provider/provider.dart';
import 'package:my_app/provider.dart/my_provider.dart';
import 'package:my_app/model/my_model.dart';

class UpdatePageBuilder extends StatefulWidget {
  Map<String, dynamic> data;
  UpdatePageBuilder(@required this.data);
  @override
  _UpdatePageBuilderState createState() => _UpdatePageBuilderState();
}

class _UpdatePageBuilderState extends State<UpdatePageBuilder> {
  List<TextEditingController> textController = [];

  @override
  void initState() {
    // TODO: implement initState
    print("object");
    print("input form data : ${widget.data}");
    setState(() {
      textController = [];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                flex: 7,
                child: Column(
                    children: List.generate(
                        widget.data["widget"]["items"].length, (index) {
                  if (widget.data["widget"]["items"][index]["value"] ==
                      "name") {
                    textControllerGenerator(myProvider.selectedItem.name);
                  } else if (widget.data["widget"]["items"][index]["value"] ==
                      "email") {
                    textControllerGenerator(myProvider.selectedItem.email);
                  } else {
                    textControllerGenerator(null);
                  }
                  return textViewParser(
                      item: widget.data["widget"]["items"][index],
                      controller: textController[index]);
                }))),
            Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        Map<String, dynamic> body = {};
                        body["privilege_id"] = "1";
                        for (var i = 0;
                            i < widget.data["widget"]["items"].length;
                            i++) {
                          body.putIfAbsent(
                              widget.data["widget"]["items"][i]["value"],
                              () => textController[i].text);
                        }
                        print(body);
                        API()
                            .postApi(
                                endPoint:
                                    "${widget.data["post_endpoint"]}/${myProvider.selectedItem.id}",
                                body: body)
                            .then((value) {
                          // Navigator.pop(context);
                          Provider.of<MyProvider>(context, listen: false)
                              .clearData();
                          API().getData(endPoint: "users/data").then((value) {
                            print(value);
                            Provider.of<MyProvider>(context, listen: false)
                                .clearData();
                            for (var item in value["data"]["data"]) {
                              // setState(() {
                              // datas.add(MyModel.fromJSON(item));
                              Provider.of<MyProvider>(context, listen: false)
                                  .setData(item["id"].toString(),
                                      MyModel.fromJSON(item));
                              // });
                            }
                            // Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        });
                      },
                      child: Text("Update"),
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget textViewParser(
      {Map<String, dynamic> item, TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: item.containsKey("obsecure") ? item["obsecure"] : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: item.containsKey("label") ? item["label"] : null,
          hintText: item.containsKey("hint") ? item["hint"] : null,
        ),
      ),
    );
  }

  void textControllerGenerator(String value) {
    textController.add(TextEditingController(text: value));
  }
}
