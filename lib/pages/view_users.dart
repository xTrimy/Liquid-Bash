import 'package:liquid_bash/models/user.dart';
import 'package:flutter/material.dart';

class ViewUsers extends StatefulWidget {
  const ViewUsers({Key? key}) : super(key: key);

  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 32),
      ),
      body: const ViewUsersView(),
    );
  }
}

class ViewUsersView extends StatelessWidget {
  const ViewUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2D3E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "View All Users",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Flexible(
                    child: DataTable(
                      columnSpacing: 16.0,
                      horizontalMargin: 0,
                      columns: dataColumnList(),
                      rows: dataRowList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> dataColumnList() {
    return [
      const DataColumn(label: Text('')),
      const DataColumn(label: Text('Email')),
      const DataColumn(label: Text('Action')),
    ];
  }

  List<DataRow> dataRowList() {
    return dummyUsers.map((e) => userDataRow(e)).toList();
  }

  DataRow userDataRow(Userr user) {
    return DataRow(cells: [
      DataCell(
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                user.imagePath,
                height: 30,
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ],
        ),
      ),
      DataCell(Text(
        user.email,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )),
      DataCell(IconButton(
        icon: const Icon(Icons.remove_red_eye),
        color: Colors.white,
        onPressed: () {},
      )),
    ]);
  }
}
