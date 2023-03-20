/*
 * This file was generated by qdbusxml2cpp version 0.8
 * Command line was: qdbusxml2cpp dbus/org.mkiol.Stt.xml -a src/dbus_stt_adaptor
 *
 * qdbusxml2cpp is Copyright (C) 2020 The Qt Company Ltd.
 *
 * This is an auto-generated file.
 * Do not edit! All changes made to it will be lost.
 */

#include "dbus_stt_adaptor.h"

#include <QtCore/QByteArray>
#include <QtCore/QList>
#include <QtCore/QMap>
#include <QtCore/QMetaObject>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>

/*
 * Implementation of adaptor class SttAdaptor
 */

SttAdaptor::SttAdaptor(QObject *parent)
    : QDBusAbstractAdaptor(parent)
{
    // constructor
    setAutoRelaySignals(true);
}

SttAdaptor::~SttAdaptor()
{
    // destructor
}

int SttAdaptor::currentTask() const
{
    // get the value of property CurrentTask
    return qvariant_cast< int >(parent()->property("CurrentTask"));
}

QString SttAdaptor::defaultLang() const
{
    // get the value of property DefaultLang
    return qvariant_cast< QString >(parent()->property("DefaultLang"));
}

void SttAdaptor::setDefaultLang(const QString &value)
{
    // set the value of property DefaultLang
    parent()->setProperty("DefaultLang", QVariant::fromValue(value));
}

QString SttAdaptor::defaultModel() const
{
    // get the value of property DefaultModel
    return qvariant_cast< QString >(parent()->property("DefaultModel"));
}

void SttAdaptor::setDefaultModel(const QString &value)
{
    // set the value of property DefaultModel
    parent()->setProperty("DefaultModel", QVariant::fromValue(value));
}

QVariantMap SttAdaptor::langs() const
{
    // get the value of property Langs
    return qvariant_cast< QVariantMap >(parent()->property("Langs"));
}

QVariantMap SttAdaptor::models() const
{
    // get the value of property Models
    return qvariant_cast< QVariantMap >(parent()->property("Models"));
}

int SttAdaptor::speech() const
{
    // get the value of property Speech
    return qvariant_cast< int >(parent()->property("Speech"));
}

int SttAdaptor::state() const
{
    // get the value of property State
    return qvariant_cast< int >(parent()->property("State"));
}

QVariantMap SttAdaptor::translations() const
{
    // get the value of property Translations
    return qvariant_cast< QVariantMap >(parent()->property("Translations"));
}

int SttAdaptor::CancelTranscribeFile(int task)
{
    // handle method call org.mkiol.Stt.CancelTranscribeFile
    int result;
    QMetaObject::invokeMethod(parent(), "CancelTranscribeFile", Q_RETURN_ARG(int, result), Q_ARG(int, task));
    return result;
}

double SttAdaptor::GetFileTranscribeProgress(int task)
{
    // handle method call org.mkiol.Stt.GetFileTranscribeProgress
    double progress;
    QMetaObject::invokeMethod(parent(), "GetFileTranscribeProgress", Q_RETURN_ARG(double, progress), Q_ARG(int, task));
    return progress;
}

int SttAdaptor::KeepAliveService()
{
    // handle method call org.mkiol.Stt.KeepAliveService
    int timer;
    QMetaObject::invokeMethod(parent(), "KeepAliveService", Q_RETURN_ARG(int, timer));
    return timer;
}

int SttAdaptor::KeepAliveTask(int task)
{
    // handle method call org.mkiol.Stt.KeepAliveTask
    int timer;
    QMetaObject::invokeMethod(parent(), "KeepAliveTask", Q_RETURN_ARG(int, timer), Q_ARG(int, task));
    return timer;
}

int SttAdaptor::Reload()
{
    // handle method call org.mkiol.Stt.Reload
    int result;
    QMetaObject::invokeMethod(parent(), "Reload", Q_RETURN_ARG(int, result));
    return result;
}

int SttAdaptor::StartListen(int mode, const QString &lang)
{
    // handle method call org.mkiol.Stt.StartListen
    int task;
    QMetaObject::invokeMethod(parent(), "StartListen", Q_RETURN_ARG(int, task), Q_ARG(int, mode), Q_ARG(QString, lang));
    return task;
}

int SttAdaptor::StopListen(int task)
{
    // handle method call org.mkiol.Stt.StopListen
    int result;
    QMetaObject::invokeMethod(parent(), "StopListen", Q_RETURN_ARG(int, result), Q_ARG(int, task));
    return result;
}

int SttAdaptor::TranscribeFile(const QString &file, const QString &lang)
{
    // handle method call org.mkiol.Stt.TranscribeFile
    int task;
    QMetaObject::invokeMethod(parent(), "TranscribeFile", Q_RETURN_ARG(int, task), Q_ARG(QString, file), Q_ARG(QString, lang));
    return task;
}

