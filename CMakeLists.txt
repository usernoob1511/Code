cmake_minimum_required(VERSION 3.16)

project(test1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOMOC ON)
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(apptest1
    main.cpp
    test1qrc.qrc
)

qt_add_qml_module(apptest1
    URI test1
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES test1qrc.qrc
        SOURCES Doctor_and_Patient.h Doctor_and_Patient.cpp
        SOURCES
        SOURCES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptest1 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptest1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptest1
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS apptest1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
