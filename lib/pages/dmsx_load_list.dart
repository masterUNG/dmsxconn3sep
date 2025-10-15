import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:psinsx/models/dmsx_load_model.dart';
import 'package:psinsx/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

class DmsxLoadList extends StatefulWidget {
  const DmsxLoadList({super.key});

  @override
  State<DmsxLoadList> createState() => _DmsxLoadListState();
}

class _DmsxLoadListState extends State<DmsxLoadList> {
  Future<List<DmsxLoadModel>> readAllDmsxLoad() async {
    try {
      var dmsxLoadModels = <DmsxLoadModel>[];

      String urlAPI = 'https://www.dissrecs.com/api/dmsx_load_list.php';

      SharedPreferences preferences = await SharedPreferences.getInstance();

      dio.Dio objDio = dio.Dio();
      objDio.options.headers['Content-Type'] = 'application/json';
      objDio.options.headers['apikey'] = preferences.getString('token');

      await objDio.get(urlAPI).then(
        (value) {
          var data = value.data['data'];
          if (data.isNotEmpty) {
            for (var element in data) {
              DmsxLoadModel model = DmsxLoadModel.fromMap(element);
              dmsxLoadModels.add(model);
            }
          }
        },
      );

      return dmsxLoadModels;
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(


      useDefaultLoading: false,
      overlayWidgetBuilder: (progress) {
        return Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitCubeGrid(
              color: Colors.white,
            ),
            Text('Loading ...', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('โหลดข้อมูล Dm'),
        ),
        body: FutureBuilder(
            future: readAllDmsxLoad(),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                //Loading
                return Center(child: CircularProgressIndicator());
              } else {
                //finish Load
                if (asyncSnapshot.hasData) {
                  List<DmsxLoadModel> dmsxLoadModels = asyncSnapshot.data!;
                  if (dmsxLoadModels.isNotEmpty) {
                    return ListView.builder(
                      itemCount: dmsxLoadModels.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          MyDialog(context: context).normalDialot(
                              title: dmsxLoadModels[index].desc, textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              subTitle: 'คุณต้องการโหลดข้อมูลนี่ ???',
                              firstButton: TextButton(
                                  onPressed: () async {
                                    Get.back();

                                    context.loaderOverlay.show();

                                    String urlAPI =
                                        'https://www.dissrecs.com/api/dmsx_load_proc.php?id=${dmsxLoadModels[index].id}';

                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();

                                    dio.Dio objDio = dio.Dio();
                                    objDio.options.headers['Content-Type'] =
                                        'application/json';
                                    objDio.options.headers['apikey'] =
                                        preferences.getString('token');

                                    await objDio.get(urlAPI).then(
                                      (value) {
                                        context.loaderOverlay.hide();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.black,
                                                duration: Duration(seconds: 5),
                                                content: Text(
                                                  'โหลดสำเร็จ กรุณา Refresh',
                                                  style: TextStyle(
                                                      color: Colors.amberAccent,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )));

                                        // Navigator.pop(context, [true]);

                                        Get.back(result: true);
                                      },
                                    );
                                  },
                                  child: Text('ยืนยัน')));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text('id = ${dmsxLoadModels[index].id}'),
                              SizedBox(height: 8),
                              Text('สาขา = ${dmsxLoadModels[index].desc}'),
                              SizedBox(height: 8),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text('ไม่มีข้อมูล');
                  }
                } else {
                  return SizedBox();
                }
              }
            }),
      ),
    );
  }
}
