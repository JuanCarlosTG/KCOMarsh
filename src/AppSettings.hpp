/*
 * AppSettings.hpp
 *
 *  Created on: 10/12/2014
 *      Author: kreativeco
 */

#ifndef APPSETTINGS_HPP_
#define APPSETTINGS_HPP_

/**
 * AppSettings
 *
 * In this class you will learn the following:
 * -- How to use QSettings to store and retrieve settings for your App
 */
class AppSettings
{
public:
    /*
     * Retrieves the https settings flag saved in the QSettings db
     */
    static bool isUsingHttps();

    /*
     * Saves the https setting flag in the QSettings db
     */
    static void setHttps(bool value);
};

#endif /* APPSETTINGS_HPP_ */
