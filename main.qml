import QtQuick 2.12
import QtQuick.Window 2.2
import TableModel 0.1
import QtQuick.Controls 2.5
import QtQuick.XmlListModel 2.12

Window {
    visible: true
    width: 880
    height: 480
    title: qsTr("Xml Model")
    property var  titile: ["121","122","ACB","122","dqd","rwr"]
    property int tableCount:0




    TableView{
        id:view
        width: 600
        height: parent.height
        columnSpacing: 1
        rowSpacing: 1
        clip: true
        delegate: xmlDelete
        model:xml
    }


    XmlListModel{
        id:xml
        source: "data.xml"
        query: "/Inspection/Blob/blob"

        XmlRole { name: "_x";    query: "@x/string()" }
        XmlRole { name: "_y";    query: "@y/string()"}
        XmlRole { name: "_size"; query: "@size/string()"}
    }



    ListView {
        id:listView
          x:600
          width: 280;
          height: 400
          spacing: 1
          model: xml
          delegate: xmlDelete
   }





    Component{
        id:xmlDelete
        Rectangle {
            property var value1:_x
            property var value2:_y
            property var value3:_size
            implicitWidth: 300
            implicitHeight: 50
            Row{
                anchors.fill: parent
                spacing: 1
                Rectangle{
                    implicitWidth: 100
                    implicitHeight: 50
                    color: "green"
                    Text {
                        anchors.centerIn: parent
                        text: String(value1)
                    }
                }
                Rectangle{
                    implicitWidth: 100
                    implicitHeight: 50
                    color: "gray"
                    Text {
                        anchors.centerIn: parent
                        text: String(value2)
                    }
                }
                Rectangle{
                    implicitWidth: 100
                    implicitHeight: 50
                    color: "red"
                    Text {
                        anchors.centerIn: parent
                        text: String(value3)
                    }
                }
            }
        }
    }


    Column{
        x:400
        Button{
            text: "Xml_View"
            onClicked: {
                view.model = xml
                view.delegate = xmlDelete
            }
        }
        Button{
            text: "C++_View"
            onClicked: {
                view.model = cplusModel
                view.delegate = cplusDelete
            }
        }

        Button{
            text: "ListView"
            onClicked: {
                listView.visible = !listView.visible
            }
        }
    }


    TableModel {
        id:cplusModel
        Component.onCompleted: {
            setHeader(titile)
            for(var i = 0 ;i< 10;i++){
                insertRowData(i,titile)
            }
            //view.model = cplusModel
        }
    }

    Component{
        id:cplusDelete
        Rectangle {
            property var value:display
            implicitWidth: 100
            implicitHeight: 50

             Button{
                text:String(value)
             }
        }
    }

}
