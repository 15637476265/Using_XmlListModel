#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QAbstractTableModel>




class TableModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    TableModel();

    int rowCount(const QModelIndex & = QModelIndex()) const override
    {
        return hash.count();
    }

    int columnCount(const QModelIndex & = QModelIndex()) const override
    {
        return m_header.count();
    }

    QVariant data(const QModelIndex &index, int role) const override;


//    QHash<int, QByteArray> roleNames() const override
//    {
//        return { {Qt::DisplayRole, "display"} };
//    }

    Q_INVOKABLE void setHeader(QVariantList title){
        m_header.clear();
        m_header = title;
    }

    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    Q_INVOKABLE void setTableValue(QHash<int,QVariantList> data);
    Q_INVOKABLE void insertRowData(int index,QVariantList data);
    Q_INVOKABLE void appendRowData(QVariantList data);

private:
    QVariantList m_header;
    QHash<int,QVariantList> hash;
    QHash<int, QVariantList> tempData;
};

#endif // TABLEMODEL_H
