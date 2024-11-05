#include <cstdlib>
#include <iostream>
#include "Doctor_and_Patient.h"
#include <conio.h>
using namespace std;

string takePasswdFromUser(char asterisk = '*') {
    string password = "";
    char c_input;
    while (true) {
        c_input = _getch();

        if (c_input == '\r') {
            cout << endl;
            return password;
        } else if (c_input == '\b' && !password.empty()) {
            password.pop_back();
            cout << "\b \b";
        } else if (c_input != '\b') {
            password.push_back(c_input);
            cout << asterisk;
        }
    }
}

class admin {
private:
    string user, pass, phone;
    bool isLoggedIn = false;

public:
    void login() {
        int check = 0;
        string u, p, sdt;
        cout << "Please enter the following details: " << endl;
        cout << "Username : "; cin >> user;
        cout << "Password : "; pass = takePasswdFromUser();
        ifstream input("database.txt");
        while (input >> u >> p >> sdt) {
            if (u == user && p == pass) {
                check = 1;
                isLoggedIn = true;
                system("cls");
                break;
            }
        }
        input.close();
        if (check == 1) {
            cout << "Hello " << user << "\nLogin successful" << endl;
            cin.get();
        } else {
            cout << "Error!!! Please check your username and password.\n";
            mainchoice();
        }
    }

    void registr() {
        system("cls");
        cout << "Enter username : ";
        cin >> user;

        cout << "Enter password : ";
        cin >> pass;

        cout << "Enter phone : ";
        cin >> phone;

        ofstream reg("database.txt", ios::app);
        reg << user << " " << pass << " " << phone << endl;
        system("cls");
        cout << "\nRegistration successful!" << endl;
        mainchoice();
    }

    void forgot() {
        int ch;
        system("cls");
        cout << "Forgot your account? We're here to help you." << endl;
        cout << "1. Search by username" << endl;
        cout << "2. Main menu" << endl;
        cin >> ch;
        switch (ch) {
        case 1: {
            int count = 0;
            string searchuser, su, sp, sdt;
            cout << "\nEnter your remembered username: ";
            cin >> searchuser;
            cout << "\nEnter your remembered phone: ";
            cin >> phone;
            cin.ignore();

            ifstream searchu("database.txt");

            while (searchu >> su >> sp >> sdt) {
                if (su == searchuser && sdt == phone) {
                    count = 1;
                    break;
                }
            }
            searchu.close();
            if (count == 1) {
                cout << "\nACCOUNT FOUND" << endl;
                cout << "\nYour password is: " << sp;
                cin.get();
                system("cls");
                mainchoice();
            } else {
                cout << "\nSorry, your userID is not found in our database.\n";
                cin.get();
                mainchoice();
            }
            break;
        }
        case 2:
            system("cls");
            mainchoice();
            break;
        default:
            cout << "Invalid choice. Try again." << endl;
            forgot();
        }
    }

    void mainchoice() {
        int choice;
        cout << "*****************************************" << endl;
        cout << "****************WELCOME*****************" << endl;
        cout << "MENU" << endl;
        cout << "1. Login" << endl;
        cout << "2. Register" << endl;
        cout << "3. Forgot username or password" << endl;
        cout << "4. Exit" << endl;
        cout << "Enter your choice: ";
        cin >> choice;
        cout << endl;

        switch (choice) {
        case 1:
            login();
            break;
        case 2:
            registr();
            break;
        case 3:
            forgot();
            break;
        case 4:
            return;
        default:
            system("cls");
            cout << "Invalid choice. Try again." << endl;
            mainchoice();
        }
    }

    bool getLoginStatus() { return isLoggedIn; }
};
int main() {
    admin a;
    a.mainchoice();

    if (a.getLoginStatus()) {
        Patient *p;
        Doctor d;

        int choice;

        do{
            cout<<"\n\nEnter option 1 for inpatient "<<endl;
            cout<<"\n\nEnter option 2 for outpatient "<<endl;
            cout<<"\n\nEnter option 3 for doctor "<<endl;
            cin>>choice;

            switch(choice){
            case 1:
                cout<<"\n---INPATIENT---"<<endl;
                p=new Inpatient;
                p->patienchoice();
                system("cls");
                break;
            case 2:
                cout<<"\n---OUTPATIENT---"<<endl;
                p=new Outpatient;
                p->patienchoice();
                system("cls");
                break;
            case 3:
                cout<<"\n---DOCTOR---"<<endl;
                d.doDoctorRelateWork();
                system("cls");
                break;
            default:
                cout<<"Invalid choice!!!"<<endl;
            }
        }while(choice==1||choice==2||choice==3);
    }

    return 0;
}

