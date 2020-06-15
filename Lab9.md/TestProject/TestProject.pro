include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += thread
CONFIG -= qt

HEADERS += \
        ../ProjectT/IKeypad.h \
        ../ProjectT/ILatch.h \
        ../ProjectT/lockcontroller.h \
        tst_testdivisionbyzero.h

SOURCES += \
        ../ProjectT/lockcontroller.cpp \
        main.cpp

INCLUDEPATH += E:\LabQT\ProjectT
