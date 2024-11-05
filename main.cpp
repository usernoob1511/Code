#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QString>
#include <QTextStream>
#include <QQmlContext>
#include <QDebug>
#include <QDir>
#include "Doctor_and_Patient.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    qmlRegisterType<Person> ("Person",1,0,"Person");
    qmlRegisterType<Doctor>("Doctor", 1, 0, "Doctor");
    qmlRegisterType<Available>("Available", 1, 0, "Available");
    qmlRegisterType<DoctorModel>("DoctorModel", 1, 0, "DoctorModel");
    qmlRegisterType<Doctor_and_Patient>("Doctor_and_patient",1,0,"Doctor_and_Patient");

    DoctorModel doctorModel;
    Doctor doctor;
    doctor.setModel(&doctorModel);

    engine.rootContext()->setContextProperty("doctorModel", &doctorModel);
    engine.loadFromModule("test1", "Main");

    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Không thể tải root object từ module.";
        return -1; // Hoặc xử lý lỗi khác
    } else {
        qDebug() << "Đã tải thành công root object từ module.";
    }

    return app.exec();
}


// QString readDataFromFile(const QString &filePath) {
//     QFile file(filePath);
//     if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
//         qCritical() << "Could not open file:" << file.errorString();
//         return QString();  // Trả về chuỗi rỗng nếu không mở được file
//     }

//     QTextStream in(&file);
//     QString data = in.readAll();
//     file.close();
//     qDebug() <<"Data read from file: " << data;
//     return data;
// }

// void appendDataToFile(const QString &filePath, const QString &data) {
//     QFile file(filePath);
//     if (!file.open(QIODevice::Append | QIODevice::Text)) {
//         qCritical() << "Could not open file for appending:" << file.errorString();
//         return;
//     }

//     QTextStream out(&file);
//     out << data << "\n";  // Ghi thêm dữ liệu và xuống dòng
//     file.close();
// }

// qDebug() << "Current directory:" << QDir::currentPath();
// Đọc dữ liệu từ file
// QString data = readDataFromFile("D:/Minhh/Learn/QT_creator/PBL/test1/data.txt");
// QString filePath = ":/data.txt";
// QString data = readDataFromFile(filePath);

// appendDataToFile("../../data.txt", "Nội dung thêm vào");

// Truyền dữ liệu vào QMLd
// engine.rootContext()->setContextProperty("fileContent", data);


// QString mainQmlPath = "../../Main.qml"; // hoặc đường dẫn cụ thể của bạn
// QFile file(mainQmlPath);
// if (!file.exists()) {
//     qDebug() << "File không tồn tại:" << mainQmlPath;
//     return -3; // Hoặc xử lý lỗi khác
// } else {
//     qDebug() << "Đang tải file:" << mainQmlPath;
// }
