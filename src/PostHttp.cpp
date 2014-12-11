/*
 * PostHttp.cpp
 *
 *  Created on: 10/12/2014
 *      Author: kreativeco
 */

#include "PostHttp.hpp"
#include "AppSettings.hpp"
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QSslConfiguration>
#include <QUrl>

/**
 * PostHttp
 *
 * In this class you will learn the following:
 * -- How to use QNetworkAccessManager to make a network request
 * -- How to set Http headers for your request
 * -- How to setup a secure connection with QSslConfiguration
 * -- How to read a network response with QNetworkReply
 * -- How to parse JSON data using JsonDataAccess
 */
//! [0]
PostHttp::PostHttp(QObject* parent): QObject(parent) , m_networkAccessManager(new QNetworkAccessManager(this))
{
}
//! [0]

/**
 * PostHttp::post
 *
 * Make a network request to httpbin.org/post with POST data and get
 * the response
 */
//! [1]
void PostHttp::post(const QString &body, const QString &body2)
{
    const QUrl url("http://kreativeco.com/marsh/actions/webservices.php?task=login&user=" + body + "&password=" + body2);

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "text/plain");

    if (AppSettings::isUsingHttps()) {
        request.setUrl(QUrl("http://kreativeco.com/marsh/actions/webservices.php?task=login&user=" + body + "&password=" +body2));

        QSslConfiguration config = request.sslConfiguration();
        config.setPeerVerifyMode(QSslSocket::VerifyNone);
        config.setProtocol(QSsl::TlsV1);
        request.setSslConfiguration(config);
    }

    QNetworkReply* reply = m_networkAccessManager->post(request, body.toAscii());
    bool ok = connect(reply, SIGNAL(finished()), this, SLOT(onGetReply()));
    Q_ASSERT(ok);
    Q_UNUSED(ok);
}

/**
 * PostHttp::onGetReply()
 *
 * SLOT
 * Read and return the http response from our http post request
 */
void PostHttp::onGetReply()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());

    QString response;
    if (reply) {
        if (reply->error() == QNetworkReply::NoError) {
            const int available = reply->bytesAvailable();
            if (available > 0) {
                const QByteArray buffer(reply->readAll());
                response = QString::fromUtf8(buffer);
            }
        } else {
            response = tr("Error: %1 status: %2").arg(reply->errorString(), reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString());
            qDebug() << response;
        }

        reply->deleteLater();
    }

    if (response.trimmed().isEmpty()) {
        response = tr("Unable to retrieve post response");
    }

    emit complete(response);
}
//! [1]


