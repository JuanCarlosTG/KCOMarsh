/*
 * PostHttp.hpp
 *
 *  Created on: 10/12/2014
 *      Author: kreativeco
 */

#ifndef POSTHTTP_HPP_
#define POSTHTTP_HPP_

#include <QtCore/QObject>

class QNetworkAccessManager;

class PostHttp : public QObject
{
    Q_OBJECT
public:
    PostHttp(QObject* parent = 0);

public Q_SLOTS:
    void post(const QString &body, const QString &body2);

Q_SIGNALS:
    void complete(const QString &info);

private Q_SLOTS:
    void onGetReply();

private:
    QNetworkAccessManager* m_networkAccessManager;
};

#endif /* POSTHTTP_HPP_ */
