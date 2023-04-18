import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Service/UserProvider.dart';
import '../../../config/responsive.dart';
import '../../../config/size_config.dart';
import '../../../style/colors.dart';
import '../../../style/style.dart';
import '../../data.dart';

class UserList extends StatelessWidget {
  const UserList();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return FutureBuilder(
        future: userProvider.fetchUsers(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Failed to fetch users.'),
            );
          }

          final users = userProvider.users;
          print(users[0].name);

          if (users.isEmpty) {
            return Center(
              child: Text('No users found.'),
            );
          }
          return SingleChildScrollView(
            scrollDirection:
                Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
            child: SizedBox(
              width: Responsive.isDesktop(context)
                  ? double.infinity
                  : SizeConfig.screenWidth,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: List.generate(
                  users.length,
                  (index) => TableRow(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 20.0),
                        child: CircleAvatar(
                          radius: 17,
                          backgroundImage: NetworkImage(
                              "https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859"),
                        ),
                      ),
                      PrimaryText(
                        text: users[index].name,
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary,
                      ),
                      PrimaryText(
                        text: users[index].email,
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary,
                      ),
                      PrimaryText(
                        text: users[index].rool,
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
