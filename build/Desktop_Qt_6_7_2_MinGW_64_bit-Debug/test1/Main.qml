import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Doctor 1.0
import DoctorModel 1.0
import Doctor_and_patient 1.0

Window {
    width: 1500
    height: 1080
    visible: true
    title: qsTr("Hello World")


    DoctorModel {
        id: doctorModel
    }
    Doctor{
        id: doctor
    }


    TableView {
            anchors.fill: parent
            model: doctorModel

            delegate: Item {
                width: parent.width
                height: 50

                Row {
                    spacing: 10
                    Text { text: id }
                    Text { text: name }
                    Text { text: cccd }
                    Text { text: phone }
                }
            }
        }
       Button {
           width: 243
           height: 198
           text: "Doan Ngoc Minh"
           anchors.verticalCenterOffset: 434
           anchors.horizontalCenterOffset: -628
           anchors.centerIn: parent
           onClicked: {
               doctor.showDoctorDataFromFile()
           }
       }
       Component.onCompleted: {
           doctor.showDoctorDataFromFile()
           console.log("Doctor model row count:", doctorModel.rowCount())
           doctorModel.printDoctors()
       }
    // TableView {
    //        id: tableView
    //        anchors.fill: parent
    //        model: doctorModel

    //        columnWidthProvider: function (column) {
    //            return 200; // Độ rộng cho mỗi cột
    //        }

    //        // Delegate để hiển thị từng hàng
    //        delegate: Item {
    //            width: tableView.columnWidth
    //            height: 50

    //            RowLayout {
    //                anchors.fill: parent

    //                // Hiển thị các giá trị của các thuộc tính
    //                Text {
    //                    text: model.id
    //                    Layout.preferredWidth: 200
    //                }
    //                Text {
    //                    text: model.name
    //                    Layout.preferredWidth: 200
    //                }
    //                Text {
    //                    text: model.cccd
    //                    Layout.preferredWidth: 200
    //                }
    //                Text {
    //                    text: model.phone
    //                    Layout.preferredWidth: 200
    //                }
    //            }
    //        }
    //    }

    //    Button {
    //        width: 300
    //        height: 300
    //        anchors.centerIn: parent
    //        onClicked: {
    //            doctor.showDoctorDataFromFile()
    //        }
    //    }


    // Doctor{
    //     id: doctor
    // }

    // Rectangle {
    //     id: rectangle
    //     x: 0
    //     y: 0
    //     width: 1500
    //     height: 1080
    //     color: "#f0f0f0"
    //     border.width: 0

    //     Text {
    //         id: _text
    //         x: 567
    //         y: 53
    //         width: 366
    //         height: 71
    //         text: qsTr("Add Doctor Details")
    //         font.pixelSize: 40
    //         font.bold: true
    //         font.family: "Times New Roman"
    //     }

    //     Rectangle {
    //         id: rectangle1
    //         x: 68
    //         y: 143
    //         width: 1365
    //         height: 878
    //         color: "#f0f0f0"
    //         border.color: "#020202"
    //         border.width: 3

    //         Text {
    //             id: _text1
    //             x: 59
    //             y: 39
    //             width: 104
    //             height: 34
    //             text: qsTr("Name")
    //             font.pixelSize: 25
    //             font.bold: true
    //             font.family: "Times New Roman"
    //         }

    //         TextField {
    //             id: nameField
    //             x: 59
    //             y: 73
    //             width: 313
    //             height: 41
    //             verticalAlignment: Text.AlignVCenter
    //             leftPadding: 14
    //             font.family: "Times New Roman"
    //             font.pointSize: 14
    //             placeholderText: qsTr("Nguyen Van A")
    //         }


    //         Text {
    //             id: _text2
    //             x: 490
    //             y: 39
    //             width: 183
    //             height: 49
    //             text: "ID Number"
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         TextField {
    //             id:  doctorIdField
    //             x: 491
    //             y: 73
    //             width: 313
    //             height: 41
    //             placeholderText: qsTr("XXXXXXXXX")
    //             font.pointSize: 14
    //             font.italic: false
    //             font.family: "Times New Roman"
    //             verticalAlignment: Text.AlignVCenter
    //             leftPadding: 14
    //         }

    //         Text {
    //             id: _text4
    //             x: 935
    //             y: 42
    //             width: 91
    //             height: 31
    //             text: qsTr("CNIC")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         TextField {
    //             id: personalIDField
    //             x: 935
    //             y: 73
    //             width: 295
    //             height: 41
    //             placeholderText: qsTr("048205XXXXXX")
    //             font.pointSize: 14
    //             font.italic: false
    //             font.family: "Times New Roman"
    //             verticalAlignment: Text.AlignVCenter
    //             leftPadding: 14
    //         }

    //         Text {
    //             id: _text5
    //             x: 59
    //             y: 157
    //             width: 112
    //             height: 31
    //             text: qsTr("Phone No.")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         TextField {
    //             id: phoneField
    //             x: 59
    //             y: 194
    //             width: 313
    //             height: 41
    //             placeholderText: qsTr("0795513XXX")
    //             font.pointSize: 14
    //             font.italic: false
    //             font.family: "Times New Roman"
    //             verticalAlignment: Text.AlignVCenter
    //             leftPadding: 14
    //         }

    //         Text {
    //             id: _text6
    //             x: 935
    //             y: 157
    //             width: 167
    //             height: 31
    //             text: qsTr("Date of Birth")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         TextField {
    //             x: 491
    //             y: 194
    //             id:  emailField
    //             width: 313
    //             height: 41
    //             placeholderText: qsTr("XXXXXXXXXX@gmail.com")
    //             font.pointSize: 14
    //             font.italic: false
    //             font.family: "Times New Roman"
    //             verticalAlignment: Text.AlignVCenter
    //             leftPadding: 14
    //         }

    //         Text {
    //             id: _text7
    //             x: 490
    //             y: 157
    //             width: 91
    //             height: 31
    //             text: qsTr("Mail")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         TextField {
    //             id: dateField
    //             x: 935
    //             y: 194
    //             width: 320
    //             height: 41
    //             placeholderText: qsTr("01/01/1990")
    //             font.pointSize: 14
    //             font.italic: false
    //             font.family: "Times New Roman"
    //             verticalAlignment: Text.AlignVCenter
    //             leftPadding: 14
    //         }

    //         Text {
    //             id: _text8
    //             x: 59
    //             y: 277
    //             width: 91
    //             height: 31
    //             text: qsTr("sex")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         ComboBox {
    //             id: sexField
    //             x: 59
    //             y: 314
    //             width: 181
    //             height: 41
    //             flat: false
    //             editable: false
    //             font.pointSize: 14
    //             font.family: "Times New Roman"
    //             model: ListModel {
    //                     ListElement { sex: "Male" }
    //                     ListElement { sex: "Female" }
    //                     ListElement { sex: "Other" }
    //             }

    //             textRole: "sex"
    //             displayText :  "Select sex";
    //             currentIndex: -1
    //             delegate: ItemDelegate {
    //                 width: sexField.width
    //                 contentItem: Text {
    //                     text: model.sex
    //                     font.pointSize: 14
    //                     font.family: "Times New Roman"
    //                 }
    //             }

    //             onCurrentIndexChanged: {
    //                 if (currentIndex >= 0) {
    //                     displayText = model.get(currentIndex).sex;
    //                 }
    //             }
    //         }

    //         Text {
    //             id: _text9
    //             x: 490
    //             y: 277
    //             width: 91
    //             height: 31
    //             text: qsTr("Address")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         TextField {
    //             id: addressField
    //             x: 490
    //             y: 323
    //             width: 393
    //             height: 79
    //             verticalAlignment: Text.AlignTop
    //             placeholderText: qsTr("Xã xxxxx, huyện xxxxxx, thành phố xxxxxxxxxx")
    //             font.pointSize: 14
    //             font.italic: false
    //             font.family: "Times New Roman"
    //             leftPadding: 14
    //         }


    //         Text {
    //             id: _text11
    //             x: 59
    //             y: 480
    //             width: 176
    //             height: 29
    //             text: qsTr("Department")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         ComboBox {
    //             id: departmentField
    //             x: 59
    //             y: 508
    //             width: 320
    //             height: 41
    //             font.pointSize: 14
    //             font.family: "Times New Roman"
    //             flat: false
    //             editable: false

    //             model: ListModel {
    //                 ListElement { department: "Noi khoa" }
    //                 ListElement { department: "Ngoai khoa" }
    //                 ListElement { department: "Khoa tai mui hong"}
    //                 ListElement { department: "Khoa mat"}
    //                 ListElement { department: "Khoa da lieu"}
    //                 ListElement { department: "Khoa tim mach" }
    //                 ListElement { department: "Khoa Than - Tiet nieu" }
    //                 ListElement { department: "Khoa Gan - Mat"}
    //                 ListElement { department: "Khoa than kinh"}
    //                 ListElement { department: "Khoa ho hap"}
    //                 ListElement { department: "Khoa xuong khop"}
    //                 ListElement { department: "Khoa khac"}
    //             }

    //             textRole: "department"
    //             displayText: "Select Department"
    //             currentIndex: -1


    //             delegate: ItemDelegate {
    //                 width: departmentField.width
    //                 contentItem: Text {
    //                     text: model.department
    //                     font.pointSize: 14
    //                     font.family: "Times New Roman"
    //                 }
    //             }

    //             onCurrentIndexChanged: {
    //                 if (currentIndex >= 0) {
    //                     displayText = model.get(currentIndex).department;
    //                 }
    //             }
    //         }

    //         Text {
    //             id: _text12
    //             x: 479
    //             y: 480
    //             width: 176
    //             height: 29
    //             text: qsTr("Working hours")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }

    //         RowLayout {
    //             id: rowLayout
    //             x: 479
    //             y: 508
    //             width: 416
    //             height: 55
    //             spacing: 15

    //             Text {
    //                 id: _text13
    //                 x: 99
    //                 y: 816
    //                 width: 64
    //                 height: 36
    //                 text: qsTr("From")
    //                 font.pixelSize: 25
    //                 font.family: "Times New Roman"
    //                 font.bold: false
    //             }



    //             ComboBox {
    //                 id: shift1Field
    //                 x: 188
    //                 y: 813
    //                 width: 160
    //                 height: 41

    //                 font.pointSize: 14
    //                 font.family: "Times New Roman"
    //                 flat: false
    //                 editable: false
    //                 displayText: "Select shift 1"
    //                 model: ListModel {
    //                     ListElement { hour: "07:00" }
    //                     ListElement { hour: "08:00" }
    //                     ListElement { hour: "09:00" }
    //                     ListElement { hour: "10:00" }
    //                     ListElement { hour: "11:00" }
    //                     ListElement { hour: "12:00" }
    //                     ListElement { hour: "13:00" }
    //                     ListElement { hour: "14:00" }
    //                     ListElement { hour: "15:00" }
    //                     ListElement { hour: "16:00" }
    //                     ListElement { hour: "17:00" }
    //                     ListElement { hour: "18:00" }
    //                     ListElement { hour: "19:00" }
    //                     ListElement { hour: "20:00" }
    //                     ListElement { hour: "21:00" }
    //                     ListElement { hour: "22:00" }
    //                     ListElement { hour: "23:00" }
    //                     ListElement { hour: "00:00" }
    //                 }

    //                 textRole: "hour"
    //                 currentIndex: -1

    //                 delegate: ItemDelegate {
    //                     width: shift1Field.width
    //                     contentItem: Text {
    //                         text: model.hour
    //                         font.pointSize: 14
    //                         font.family: "Times New Roman"
    //                     }
    //                 }

    //                 onCurrentIndexChanged: {
    //                     if (currentIndex >= 0) {
    //                         displayText = model.get(currentIndex).hour;
    //                     }
    //                 }

    //             }

    //             Text {
    //                 id: _text14
    //                 x: 386
    //                 y: 836
    //                 width: 28
    //                 height: 38
    //                 text: qsTr("to")
    //                 font.pixelSize: 25
    //                 font.family: "Times New Roman"
    //                 font.bold: false


    //             }

    //             ComboBox {
    //                 id: shift2Field
    //                 x: 421
    //                 y: 829
    //                 width: 160
    //                 height: 41
    //                 font.pointSize: 14
    //                 font.family: "Times New Roman"
    //                 flat: false
    //                 editable: false
    //                 displayText: "Select shift 2"

    //                 model: ListModel {
    //                     ListElement { hour: "07:00" }
    //                     ListElement { hour: "08:00" }
    //                     ListElement { hour: "09:00" }
    //                     ListElement { hour: "10:00" }
    //                     ListElement { hour: "11:00" }
    //                     ListElement { hour: "12:00" }
    //                     ListElement { hour: "13:00" }
    //                     ListElement { hour: "14:00" }
    //                     ListElement { hour: "15:00" }
    //                     ListElement { hour: "16:00" }
    //                     ListElement { hour: "17:00" }
    //                     ListElement { hour: "18:00" }
    //                     ListElement { hour: "19:00" }
    //                     ListElement { hour: "20:00" }
    //                     ListElement { hour: "21:00" }
    //                     ListElement { hour: "22:00" }
    //                     ListElement { hour: "23:00" }
    //                     ListElement { hour: "00:00" }
    //                 }

    //                 textRole: "hour"
    //                 currentIndex: -1

    //                 delegate: ItemDelegate {
    //                     width: shift2Field.width
    //                     contentItem: Text {
    //                         text: model.hour
    //                         font.pointSize: 14
    //                         font.family: "Times New Roman"
    //                     }
    //                 }

    //                 onCurrentIndexChanged: {
    //                     if (currentIndex >= 0) {
    //                         displayText = model.get(currentIndex).hour;
    //                     }
    //                 }

    //             }
    //         }


    //         Text {
    //             id: _text15
    //             x: 925
    //             y: 480
    //             width: 91
    //             height: 35
    //             text: qsTr("Days")
    //             font.pixelSize: 25
    //             font.family: "Times New Roman"
    //             font.bold: true
    //         }
    //         // ComboBox {
    //         //     id: comboBox5
    //         //     x: 592
    //         //     y: 592
    //         //     width: 181
    //         //     height: 41
    //         //     font.pointSize: 14
    //         //     font.family: "Times New Roman"
    //         //     flat: false
    //         //     editable: false

    //         //     model: ListModel {
    //         //             ListElement { day: "Monday" }
    //         //             ListElement { day: "Tuesday" }
    //         //             ListElement { day: "Wednesday"}
    //         //             ListElement { day: "Wednesday"}
    //         //             ListElement { day: "Thursday"}
    //         //             ListElement { day: "Friday"}
    //         //             ListElement { day: "Saturday"}
    //         //             ListElement { day: "Sunday"}
    //         //     }

    //         //     textRole: "day"
    //         //     displayText :  "Select Day";
    //         //     currentIndex: -1

    //         //     delegate: ItemDelegate {
    //         //         width: comboBox.width
    //         //         contentItem: Text {
    //         //             text: model.day
    //         //             font.pointSize: 14
    //         //             font.family: "Times New Roman"
    //         //         }
    //         //     }

    //         //     onCurrentIndexChanged: {
    //         //         if (currentIndex >= 0) {
    //         //             displayText = model.get(currentIndex).sex;
    //         //         }
    //         //     }
    //         // }

    //         ListView {
    //             id: dayOfWeek
    //             x: 994
    //             y: 487
    //             width: 281
    //             height: 274
    //             spacing: 40

    //             model: ListModel {
    //                 ListElement { day: "Monday"; selected: false }
    //                 ListElement { day: "Tuesday"; selected: false }
    //                 ListElement { day: "Wednesday"; selected: false }
    //                 ListElement { day: "Thursday"; selected: false }
    //                 ListElement { day: "Friday"; selected: false }
    //                 ListElement { day: "Saturday"; selected: false }
    //                 ListElement { day: "Sunday"; selected: false }
    //             }

    //             delegate: Item {
    //                 Row {
    //                     spacing: 10
    //                     CheckBox {
    //                         id: checkBox
    //                         checked: model.selected
    //                         onCheckedChanged: {
    //                             model.selected = checked;
    //                         }
    //                     }
    //                     Text {
    //                         text: model.day
    //                         font.pointSize: 14
    //                         font.family: "Times New Roman"
    //                     }
    //                 }
    //             }
    //         }

    //         Button {
    //             id: button
    //             x: 1049
    //             y: 809
    //             width: 131
    //             height: 49
    //             text: qsTr("Cancel")
    //             icon.width: 20
    //             font.bold: true
    //             font.pointSize: 20
    //             font.family: "Times New Roman"

    //             onClicked: {
    //                 stackView1.pop()
    //             }
    //         }

    //         Button {
    //             id: button1
    //             x: 1206
    //             y: 809
    //             width: 131
    //             height: 49
    //             text: qsTr("Update")
    //             icon.width: 20
    //             font.pointSize: 20
    //             font.family: "Times New Roman"
    //             font.bold: true
    //             onClicked: {
    //                 // Lấy dữ liệu từ các TextField và gọi getDoctorData
    //                 let selectedDays = [];
    //                 for (let i = 0; i < dayOfWeek.model.count; i++) {
    //                     let element = dayOfWeek.model.get(i);
    //                     if (element.selected) {
    //                         selectedDays.push(element.day);
    //                     }
    //                 }
    //                 console.log("Selected Days: ", selectedDays);

    //                 doctor.getDoctorData(
    //                     parseInt(doctorIdField.text),
    //                     //departmentField.text,
    //                     //"tim",
    //                     departmentField.currentText,
    //                     phoneField.text,
    //                     nameField.text,
    //                     addressField.text,
    //                     emailField.text,
    //                     dateField.text,
    //                     personalIDField.text,
    //                     // sexField.text
    //                     //    "man"
    //                     sexField.currentIndex,
    //                     selectedDays,
    //                     selectedDays.length,
    //                     shift1Field.currentText,
    //                     shift2Field.currentText,
    //                 )
    //                 // Lưu thông tin vào file
    //                 doctor.addDoctorData();
    //             }
    //         }
    //     }
    // }
}
