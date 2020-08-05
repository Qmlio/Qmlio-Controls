/* Copyright (c) 2020 Qmlio
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
*/

import QtQuick 2.9
import QtQuick.Controls 2.2
import Qmlio.Controls 1.0 as Qmlio
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.2

Qmlio.BottomBar {
    id: bottonBar
    property Item leftItem
    property Item rightRowItem

    width: parent.width
    y: parent.height - height
    height: dp(56)
    padding: dp(30)
    z: 5
    Container {
        width: dp(48)
        z: 5
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        padding: 0
        contentItem: leftItem
    }

    Qmlio.BottomBar {
        id: l
        padding: parent.padding
        color: parent.color
        anchors.fill: parent
        layer.enabled: true
        layer.effect: DropShadow {
            source: l
            anchors.fill: l
            radius: dp(6)
            samples: radius * 2
            color: "#30000000"
            horizontalOffset: 0
            verticalOffset: 0
            spread: 0
            cached: false
            transparentBorder: true
        }
    }
    Rectangle {
        width: parent.width / 3
        anchors.right: parent.right
        anchors.rightMargin: dp(4)
        anchors.verticalCenter: parent.verticalCenter
        height: dp(48)
        color: bottonBar.color
        Container {
            width: implicitWidth
            height: parent.height
            anchors.right: parent.right
            padding: 0
            contentItem: rightRowItem
        }
    }
}
