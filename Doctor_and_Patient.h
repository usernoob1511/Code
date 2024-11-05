#ifndef DOCTOR_AND_PATIENT_H
#define DOCTOR_AND_PATIENT_H

#include <QString>
#include <QObject>
#include <QList>
#include <QTime>
#include <QStringList>
#include <QAbstractListModel>
#include <QDebug>

class DoctorModel : public QAbstractListModel {
    Q_OBJECT
public:

    enum DoctorRoles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        CccdRole,
        PhoneRole
    };

    DoctorModel(QObject *parent = nullptr) : QAbstractListModel(parent) {
         addDoctor("102230157", "Nguyen Phan Khanh Quynh", "048205008909", "0795513578");
    }

    void addDoctor(const QString &id, const QString &name, const QString &cccd, const QString &phone) {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        doctors.append({Doctor{id, name, cccd, phone}});
        endInsertRows();
        if (doctors.isEmpty()) {
            qWarning() << "Danh sách doctors chưa khởi tạo!";
            return;
        }
    }

    Q_INVOKABLE void printDoctors() {
        qDebug() << "Danh sách bác sĩ:";
        for (const auto &doctor : doctors) {
            qDebug() << "ID:" << doctor.id
                     << ", Name:" << doctor.name
                     << ", CCCD:" << doctor.cccd
                     << ", Phone:" << doctor.phone;
        }
    }

    int rowCount(const QModelIndex &parent = QModelIndex()) const override {
        Q_UNUSED(parent);
        return doctors.size();
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override {
        if (!index.isValid() || index.row() >= doctors.size())
            return QVariant();

        const auto &doctor = doctors.at(index.row());
        if (role == IdRole)
            return doctor.id;
        else if (role == NameRole)
            return doctor.name;
        else if (role == CccdRole)
            return doctor.cccd;
        else if (role == PhoneRole)
            return doctor.phone;
        return QVariant();
    }

    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        roles[IdRole] = "id";
        roles[NameRole] = "name";
        roles[CccdRole] = "cccd";
        roles[PhoneRole] = "phone";
        return roles;
    }

private:
    struct Doctor {
        QString id;
        QString name;
        QString cccd;
        QString phone;
    };
    QList<Doctor> doctors;
};


class Available {
protected:
    QStringList daysOfWeek;
    QString shift1, shift2, NoD;  // Số lượng ngày làm việc

public:
    void whenAvailable(const QStringList days, const QString& I_NoD, const QString& I_shift1, const QString& I_shift2);  // Cập nhật ngày làm việc
};

class Doctor_and_Patient
{
public:
    Doctor_and_Patient();
};

// CLASS PERSON
class Person : public QObject {

public:
    void getPersonData(const QString &I_phone, const QString &I_name, const QString &I_address,
                       const QString &I_email, const QString &I_date, const QString &I_CCCD, const QString &I_sex);

protected:
    void calculateAge();

    QString name, address, phone, mail, date, CCCD, sex, age;
};

// CLASS DOCTOR
class Doctor : public Person, public Available {
    Q_OBJECT
public:
    Doctor(QObject* parent = nullptr) : Person(), Available(), model(new DoctorModel(this)) {
        // Khởi tạo model mới cho Doctor
    }
    Q_INVOKABLE void getDoctorData(const QString &I_doctorId, const QString &I_department, const QString &I_phone,
                                   const QString &I_name, const QString &I_address, const QString &I_email, const QString &I_date,
                                   const QString &I_CCCD, const QString &I_sex, const QStringList days, const QString& I_NoD,
                                   const QString& I_shift1, const QString& I_shift2);
    Q_INVOKABLE void addDoctorData();
    Q_INVOKABLE void showDoctorDataFromFile();
    void setModel(DoctorModel *model) { this->model = model; }


private:
    QString doctorId, department;
    QString doctorFile_read = ":/Doctor_Minh.txt";
    QString doctorFile_write="../../Doctor_Minh.txt";
    QString doctorFileTemp = "../../Doctor_Minh_temp.txt";
    DoctorModel* model= nullptr;

};

#endif // DOCTOR_AND_PATIENT_H
