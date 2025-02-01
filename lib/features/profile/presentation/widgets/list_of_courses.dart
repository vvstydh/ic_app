import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';

class ListOfCourses extends StatelessWidget {
  const ListOfCourses({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 2),
        ),
        height: 40,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Theme(
            data: Theme.of(context).copyWith(
              popupMenuTheme: PopupMenuThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: Observer(
                builder: (_) => DropdownButton<String>(
                  value: userData.selectedCourse,
                  dropdownColor: theme.colorScheme.primary,
                  items: [
                    DropdownMenuItem<String>(
                        value: 'none',
                        child: Transform.translate(
                          offset: Offset(0, 2),
                          child: Text(
                            'Выберите курс',
                            style: theme.textTheme.labelMedium,
                          ),
                        )),
                    ...List.generate(6, (index) {
                      String course = (index + 1).toString();
                      return DropdownMenuItem<String>(
                          value: course,
                          child: Transform.translate(
                            offset: Offset(0, 2),
                            child: Text(
                              '$course курс',
                              style: theme.textTheme.labelMedium,
                            ),
                          ));
                    }),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      userData.selectCourse(newValue);
                    }
                  },
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ));
  }
}


// child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: '1',
//               dropdownColor: theme.colorScheme.primary,
//               items: List.generate(6, (index) {
//                 String course = (index + 1).toString();
//                 return DropdownMenuItem<String>(
//                     value: course,
//                     child: Transform.translate(
//                       offset: Offset(0, 3),
//                       child: Text(
//                         '$course курс',
//                         style: theme.textTheme.labelMedium,
//                       ),
//                     ));
//               }),
//               onChanged: (String? newValue) {
//                 print('Выбран курс: $newValue');
//               },
//               isExpanded: true,
//               icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),