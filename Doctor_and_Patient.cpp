#include "Doctor_and_Patient.h"
#include <QStringList>
#include <QFile>
#include <QTextStream>
#include <QDebug>

// Constructor
Doctor_and_Patient::Doctor_and_Patient() {}

// CLASS AVAILABLE
void Available::whenAvailable(const QStringList days, const QString& I_NoD, const QString& I_shift1, const QString& I_shift2) {
    NoD = I_NoD;
    shift1 = I_shift1;
    shift2 = I_shift2;
    daysOfWeek = days;
}

// CLASS PERSON
void Person::calculateAge() {
    QStringList dateParts = date.split('/');  // Tách ngày theo định dạng dd/mm/yyyy
    if (dateParts.size() == 3) {
        int birthYear = dateParts[2].toInt();  // Lấy năm sinh
        age = QString::number(2024 - birthYear); // Tính tuổi và chuyển đổi sang QString
    } else {
        age = "0"; // Gán giá trị mặc định
    }
}

void Person::getPersonData(const QString &I_phone, const QString &I_name, const QString &I_address,
                           const QString &I_email, const QString &I_date, const QString &I_CCCD, const QString &I_sex) {
    phone = I_phone;
    name = I_name;
    address = I_address;
    mail = I_email;
    date = I_date;
    CCCD = I_CCCD;
    sex = I_sex;
    calculateAge();  // Tính tuổi dựa vào ngày sinh
}

// CLASS DOCTOR
void Doctor::getDoctorData(const QString &I_doctorId, const QString &I_department, const QString &I_phone,
                           const QString &I_name, const QString &I_address, const QString &I_email, const QString &I_date,
                           const QString &I_CCCD, const QString &I_sex, const QStringList days, const QString& I_NoD,
                           const QString& I_shift1, const QString& I_shift2) {
    doctorId = I_doctorId;
    department = I_department;
    getPersonData(I_phone, I_name, I_address, I_email, I_date, I_CCCD, I_sex);
    whenAvailable(days, I_NoD, I_shift1, I_shift2);
}

void Doctor::addDoctorData() {
    QFile file(doctorFile_write);
    if (file.open(QIODevice::Append | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << doctorId << "\n";
        stream << department << "\n";
        stream << age << "\n"; // age là QString
        stream << phone << "\n";
        stream << name << "\n";
        stream << address << "\n";
        stream << mail << "\n";
        stream << date << "\n";
        stream << CCCD << "\n";
        stream << sex << "\n";
        stream << NoD << "\n";

        for (int i = 0; i < NoD.toInt() ; i++) {
            stream << daysOfWeek[i] << "\n";
        }

        stream << shift1 << "\n";
        stream << shift2 << "\n";

        file.close();
        qDebug() << "Doctor data added successfully.";
    } else {
        qDebug() << "Cannot open file for writing:" << doctorFile_write;
        qDebug() << "Error:" << file.errorString();
    }
}

void Doctor::showDoctorDataFromFile() {
    QFile file(doctorFile_read);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Could not open file for reading.";
        return;
    }
    QTextStream in(&file);

    while (!in.atEnd()) {
        doctorId = in.readLine().trimmed();
        department = in.readLine().trimmed();
        age = in.readLine().trimmed();
        phone = in.readLine().trimmed();
        name = in.readLine().trimmed();
        address = in.readLine().trimmed();
        mail = in.readLine().trimmed();
        date = in.readLine().trimmed();
        CCCD = in.readLine().trimmed();
        sex = in.readLine().trimmed();
        NoD = in.readLine().trimmed();
        for (int i = 0; i < NoD.toInt(); ++i) {
            daysOfWeek.append(in.readLine().trimmed());
        }

        shift1 = in.readLine().trimmed();
        shift2 = in.readLine().trimmed();
        model->addDoctor(doctorId, name, CCCD, phone);
    }
    model->printDoctors();
    qDebug() << "Rowcount model" <<model->rowCount();
    file.close();
    qDebug() << "Doctor data added successfully.";
}


