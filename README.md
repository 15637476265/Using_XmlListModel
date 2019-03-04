# Using_XmlListModel
QML TableView 5.12 Use  Xml

# 描述 #
## 1.使用C++的model和Qml的XmlListModel ##
运行结果:
![](https://i.imgur.com/8O2eIH4.png)

left:Qt 5.12 Quick TableView
right:ListView



Note:

XmlListModel作为模型	
- 代理只能为行代理,无法作为单元格代理
- C++模型可以用单元格代理
- XmlRole无法获取当前树状节点索引
- XmlRole的query需要加上@符号.




For XmlListModel as TableView Delegates:
