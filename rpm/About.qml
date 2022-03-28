/*
    Copyright (C) edp17 (Miklos Csekk) <edp17@pm.me>
    All rights reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: aboutPage

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        contentHeight: column.height + header.height + Theme.paddingLarge

        PageHeader {
            id: header
            title: qsTr("About")
        }

        Column {
            id: column
            spacing: Theme.paddingLarge
            anchors.top: parent.top
            anchors.topMargin: header.height
            width: parent.width

            Image {
                source: "/usr/share/icons/hicolor/172x172/apps/harbour-covid19stats.png"
                width: sourceSize.width * 2
                height: sourceSize.height * 2
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: "Covid19 Stats v1.0"
                font.pixelSize: Theme.fontSizeExtraLarge
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }

            Label {
                text: qsTr("Made by edp17")
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                width: parent.width - Theme.paddingLarge*2
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                text: qsTr("Licensed under GPLv3")
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Separator {
                width: parent.width
                color: Theme.primaryColor
                horizontalAlignment: Qt.AlignHCenter
            }

            Label {
                text: qsTr("Links")
                font.pixelSize: Theme.fontSizeLarge
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: "Github: <a href=\"https://github.com/edp17\">github.com/edp17</a>"
                color: "white"
                textFormat: Text.StyledText
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - Theme.paddingLarge*2
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                onLinkActivated: Qt.openUrlExternally(link)
                linkColor: Theme.highlightColor
            }

            Separator {
                width: parent.width
                color: Theme.primaryColor
                horizontalAlignment: Qt.AlignHCenter
            }

            Label {
                text: qsTr("Thanks to")
                font.pixelSize: Theme.fontSizeLarge
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: qsTr("chrislopez24 for his github page with the covid19 statistics")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: Theme.fontSizeSmall
                width: parent.width - Theme.horizontalPageMargin*2
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.horizontalCenter: parent.horizontalCenter
            }

//            Text {
//                text: qsTr("Everyone who published an app and made the source available on \n<a href=\"https://openrepos.net\">Openrepos</a>!")
//                horizontalAlignment: Text.AlignHCenter
//                font.pixelSize: Theme.fontSizeSmall
//                linkColor: Theme.highlightColor
//                anchors.horizontalCenter: parent.horizontalCenter
//                onLinkActivated: Qt.openUrlExternally(link)
//                color: "white"
//                textFormat: Text.StyledText
//            }

            Separator {
                width: parent.width
                color: Theme.primaryColor
                horizontalAlignment: Qt.AlignHCenter
            }

            Label {
                text: qsTr("Donate")
                font.pixelSize: Theme.fontSizeLarge
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }

            Text {
                text: "<a href=\"https://www.paypal.me/edp17\">paypal.me/edp17</a>"
                color: "white"
                textFormat: Text.StyledText
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - Theme.paddingLarge*2
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                linkColor: Theme.highlightColor
                onLinkActivated: Qt.openUrlExternally(link)
            }

       }
       VerticalScrollDecorator {}
    }
}
