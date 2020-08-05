import QtQuick 2.11
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import Qmlio.Controls 1.0


/*!  \qmltype Avatar

  \inqmlmodule Qmlio.Controls 1.0
 \since 5.11

  \brief A QML component to display rounded Images.


\div {class="flow-row"}

  \div {class=" row-child screen-shot-Example"}
\image avatar-preview-3.png
 \enddiv

\enddiv

Avatar can both enhance the user experience and express a brand’s visual language. It also portrays context in way that adds user delight.

\section1 Focal point
The component creates an iconic focal point in an image and clearly convey concepts in a memorable way.

\div {class="flow-row"}

  \div {class=" row-child screen-shot-Example"}
\image avatar.gif
 \enddiv

\enddiv


\section1 UI Usage
The Component can be used mainly in:

 \list 1
      \li \div {class="flow-row"}

  \div {class=" row-child screen-shot-Example "}
\image avatar-list1.png
 \enddiv
\enddiv

/caption  Food app showing round-corners on images


      \li \div {class="flow-row"}

  \div {class=" row-child screen-shot-Example "}
\image avatar-list2.png
 \enddiv
\enddiv

/caption  Qml illustration of a rounded image in a ListView.


      \li \div {class="flow-row"}

  \div {class=" row-child screen-shot-Example "}
\image avatar-list3.png
 \enddiv
\enddiv

/caption  A photo gallery of a restaurant in a food app.


      \li \div {class="flow-row"}

  \div {class=" row-child screen-shot-Example "}
\image avatar-list4.png
 \enddiv
\enddiv

/caption  A card  with two images with round corners.


      \li \div {class="flow-row"}

  \div {class=" row-child screen-shot-Example "}
\image avatar-list5.png
 \enddiv
\enddiv

/caption  A Qml image chooser for android.



\section1 Example
  \qml
    Avatar {
        id: avatar
        width: height
        height: dp(100)
        radius: width / 2
        source: "images/a (4).jpg"
    }


\endqml
*/
Item {

    /*!
    This property holds the radius of the Avatar .

    Avatar {
        radius: 4
    }
\div {class="flow-row"}
  \div {class=" row-child screen-shot-Example "}
\image avatar-preview-2.png
 \enddiv
\enddiv


    */
    property real radius: 0

    /*!
    This property holds the source of the image to be displayed.
    */
    property url source

    /*!
    This property holds the status of the Avatar.

 \list 1
      \li Image.Null - no image has been set
      \li Image.Ready - the image has been loaded
      \li Image.Loading - the image is currently being loaded
      \li Image.Error - an error occurred while loading the image
\endlist

    */
    property real status

    /*!
    This property holds the internal Image item  of the Avatar.
    */
    property alias image: img

    /*!
    This property holds the color to be displayed if the image fails to load.
    */
    property color bgColor: "#f5f5f5"

    width: implicitWidth
    height: implicitHeight
    id: item

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: bgColor
        Rectangle {
            id: bg
            anchors.fill: parent
            radius: item.radius
            color: bgColor
        }
        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: item.bgColor
            Image {
                id: img
                fillMode: Image.PreserveAspectCrop
                source: item.source
                asynchronous: true
                smooth: true
                anchors.fill: parent
                onStatusChanged: {
                    item.status = status
                    //console.log("ustrgergre"+status)
                }
            }

            layer.enabled: true
            layer.effect: OpacityMask {
                smooth: true
                antialiasing: true
                maskSource: Rectangle {
                    width: bg.width
                    height: bg.height
                    radius: bg.radius
                    smooth: true
                    antialiasing: true
                    color: bgColor
                }
            }
        }
    }
}
