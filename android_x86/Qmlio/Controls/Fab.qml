/****************************************************************************
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:

** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.

** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
** THE SOFTWARE.

****************************************************************************/
//![0]
import QtQuick 2.11
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import Qmlio.Controls 1.0
/*!

  \qmltype Fast Action Button (FAB)

  \inqmlmodule Felgo 3.0
\since 5.11


  \brief A Fast Action Button (FAB).


   A FAB is a floating action button that provides a primary action
   on the current page. In this project, it is mainly used in the BottomNavigation. Fast Action Button (FAB) is made up of the forground and background layer
Mainly the background layer is provides the elevetion effect


 \list 1
      \li \inlineimage fab1.png
   \caption FAB 1
      \li \inlineimage fab2.png
    \caption FAB 2
      \li \inlineimage fab3.png
    \caption FAB 3


\endlist

\section1 Example usage

   \qml

            Fab {
                width: dp(56)
                height: width
                radius: width / 2
                color: Constants.fabColor
                y: -(height / 2)
                anchors.horizontalCenter: parent.horizontalCenter
                iconColor: "white"
                icon:  "\uf415"
                iconFamily: Constant.iconFont
                onClicked: {
                console.log("clicked")
                }
            }


   \endqml
\warning You may need to install the latest version of \b Felgo \b SDK because some Components may not work as expected.

*/


Item {
    id: item

    /*!
    This property holds the radius of the FAB. The default color is 0.

    */
    property real  span: dp(12)
    property real radius: 0
    /*!
    This property holds the fill color of the FAB. The default color is \c white.

    */
    property color color: "#ffffff"
    /*!
    This property holds the text of the icon to be shown on the FAB

    */
    property string icon;
    /*!
    This property holds the size of the icon on the FAB. The default size is \c 26dp.

    */
    property real iconSize:sp(26)
    /*!
    This property holds the font family icon on the FAB

    */
    property string iconFamily;
    /*!
    This property holds the color of the icon  on the FAB. The default color is \c black.

    */
    property color iconColor:"black";
    /*!
    This signal is emitted when the FAB is clicked or Tapped.

    */
    property alias  mouseMask:mask
    property alias textIcon: icon_text


    width: implicitWidth
    height: implicitHeight

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: parent.radius

        // background
        Rectangle {
            id: l
            anchors.centerIn: parent
            radius: parent.radius
            width: parent.width - span
            height: parent.height - span

            layer.enabled: true
            layer.effect: DropShadow {
                source: l
                anchors.fill: l
                radius: dp(18)
                samples: radius * 2
                color: "#e0000000"
                horizontalOffset: 0
                verticalOffset: dp(3)
                spread: 0
                cached: false
                transparentBorder: true
            }
        }

        // foreground
        Rectangle {
            width: parent.width
            height: parent.height
            radius: parent.radius
            color: item.color
            smooth: true
            antialiasing: true
            Text {
                id:icon_text
                anchors.centerIn: parent
                text:icon
                font.pixelSize: iconSize
                font.family: iconFamily
                color: iconColor
            }
            MouseMask {
                id:mask
                anchors.fill: parent

                radius: parent.radius

            }
        }
    }

}
