/*
 * AppSettings.cpp
 *
 *  Created on: 10/12/2014
 *      Author: kreativeco
 */

#include "AppSettings.hpp"

#include <QSettings>

namespace
{
const QString httpsSettings = QLatin1String("usehttps");
}

/**
 * AppSettings::isUsingHttps()
 * Check Apps QSettings for key httpsSettings and return
 *
 * return httpsSettings value
 */
bool AppSettings::isUsingHttps()
{
    QSettings settings;
    return settings.value(httpsSettings, false).toBool();
}

/**
 * AppSettings::setHttps(bool value)
 * Set httpsSettings flag in your Apps QSettings
 */
void AppSettings::setHttps(bool value)
{
    QSettings settings;
    settings.setValue(httpsSettings, QVariant(value));
}


