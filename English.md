# Language #---->[English](http://qwqw)//[Chinese](http://qwqw)
# Describe #
## 1.Using C++ model and QmlXmlListModel ##

left:Qt 5.12 Quick TableView
right:ListView

Note:

Run Result:
![](https://i.imgur.com/8O2eIH4.png)
For XmlListModel as TableView Delegates:
- -XmlListModel Delegates can only be a row Delegates and cannot be used as a cell Delegates
-  C++ model can use cell proxy
-  Xmlrole cannot get the current tree node index
-  Xmlrole's query needs to be added with the @ symbol.
