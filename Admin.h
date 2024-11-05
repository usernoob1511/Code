#ifndef ADMIN_H
#define ADMIN_H
#include <cstdlib>
#include <iostream>
#include "Doctor_and_Patient.h"
#include <conio.h>

using namespace std;

class Admin {
private:
    QString user, pass, phone;
    bool isLoggedIn = false;

public:
    void login();
};
#endif // ADMIN_H
