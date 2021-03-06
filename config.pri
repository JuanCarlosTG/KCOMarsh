# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            LIBS += -lbbdata \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            LIBS += -lbbdata \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            LIBS += -lbbdata \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data)

            LIBS += -lbbdata \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/720x720/images/KCOMarshEnergy.png) \
        $$quote($$BASEDIR/assets/720x720/images/KCOMarshLogIn.png) \
        $$quote($$BASEDIR/assets/720x720/images/KCOMarshMenu.png) \
        $$quote($$BASEDIR/assets/720x720/images/KCOMarshNews.png) \
        $$quote($$BASEDIR/assets/720x720/images/KCOMarshPractices.png) \
        $$quote($$BASEDIR/assets/720x720/images/KCOMarshSplash.png) \
        $$quote($$BASEDIR/assets/ArticleItem.qml) \
        $$quote($$BASEDIR/assets/KCONewsExample.qml) \
        $$quote($$BASEDIR/assets/KCOOffices.qml) \
        $$quote($$BASEDIR/assets/KCOPractices.qml) \
        $$quote($$BASEDIR/assets/KCOPruebaConexion.qml) \
        $$quote($$BASEDIR/assets/KCOmenuPage.qml) \
        $$quote($$BASEDIR/assets/buttons/ENTRAR.png) \
        $$quote($$BASEDIR/assets/buttons/Negocio.png) \
        $$quote($$BASEDIR/assets/buttons/NegocioPressed.png) \
        $$quote($$BASEDIR/assets/buttons/Oficinas.png) \
        $$quote($$BASEDIR/assets/buttons/OficinasPressed.png) \
        $$quote($$BASEDIR/assets/buttons/Practices.png) \
        $$quote($$BASEDIR/assets/buttons/PracticesPressed.png) \
        $$quote($$BASEDIR/assets/buttons/SecAsegurador.png) \
        $$quote($$BASEDIR/assets/buttons/SecAseguradorPressed.png) \
        $$quote($$BASEDIR/assets/buttons/Segmentos.png) \
        $$quote($$BASEDIR/assets/buttons/SegmentosPressed.png) \
        $$quote($$BASEDIR/assets/controls/NetworkActivity.qml) \
        $$quote($$BASEDIR/assets/googlerssfeeds.json) \
        $$quote($$BASEDIR/assets/images/KCOMarshEnergy.png) \
        $$quote($$BASEDIR/assets/images/KCOMarshLogIn.png) \
        $$quote($$BASEDIR/assets/images/KCOMarshMenu.png) \
        $$quote($$BASEDIR/assets/images/KCOMarshNews.png) \
        $$quote($$BASEDIR/assets/images/KCOMarshPractice.png) \
        $$quote($$BASEDIR/assets/images/KCOMarshSplash.jpg) \
        $$quote($$BASEDIR/assets/images/KCOMarshSplash.png) \
        $$quote($$BASEDIR/assets/images/beer1.png) \
        $$quote($$BASEDIR/assets/images/beer2.png) \
        $$quote($$BASEDIR/assets/images/beer3.png) \
        $$quote($$BASEDIR/assets/images/beer4.png) \
        $$quote($$BASEDIR/assets/images/botonPrueba.jpg) \
        $$quote($$BASEDIR/assets/images/icon.jpg) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/yahoorssfeeds.json)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/AppSettings.cpp) \
        $$quote($$BASEDIR/src/PostHttp.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/AppSettings.hpp) \
        $$quote($$BASEDIR/src/PostHttp.hpp) \
        $$quote($$BASEDIR/src/applicationui.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/720x720/*.qml) \
        $$quote($$BASEDIR/../assets/720x720/*.js) \
        $$quote($$BASEDIR/../assets/720x720/*.qs) \
        $$quote($$BASEDIR/../assets/720x720/images/*.qml) \
        $$quote($$BASEDIR/../assets/720x720/images/*.js) \
        $$quote($$BASEDIR/../assets/720x720/images/*.qs) \
        $$quote($$BASEDIR/../assets/buttons/*.qml) \
        $$quote($$BASEDIR/../assets/buttons/*.js) \
        $$quote($$BASEDIR/../assets/buttons/*.qs) \
        $$quote($$BASEDIR/../assets/controls/*.qml) \
        $$quote($$BASEDIR/../assets/controls/*.js) \
        $$quote($$BASEDIR/../assets/controls/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)
