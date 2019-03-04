#include "TableModel.h"
#include <QDebug>
#include <QHash>
#include <QHashIterator>

TableModel::TableModel()
{
    QVariantList temp;
    temp << "A"<< "B"<< "C" << "A"<< 456<< "C" << "A"<< "B"<< 123 ;
    for (int i = 0; i < temp.length(); ++i) {
          tempData.insert(i,temp);
    }
//    setTableValue(tempData);
//    setHeader(temp);
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    if(role==Qt::DisplayRole){
        return hash[role].value(index.column());
    }
    return QVariant();
}

QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role == Qt::DisplayRole)
    {
        if (orientation == Qt::Horizontal)
        {
            return m_header[section];
        }
    }

    return QVariant();
}

void TableModel::setTableValue(QHash<int, QVariantList> data)
{
    hash = data;
}

void TableModel::insertRowData(int index,QVariantList data)
{
    hash.insert(index,data);
}

void TableModel::appendRowData(QVariantList data)
{
    QHash<int, QVariantList>::const_iterator it =  hash.constBegin();
    while (it == hash.constEnd()) {
        hash.insert(it.key()+1,data);
    }
}
