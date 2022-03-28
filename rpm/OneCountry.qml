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
    id: oneCountry

    allowedOrientations: Orientation.All
    
    property string cName: "Unknown"
    property string cHash: "#"
    property string cTotalCases: "Total Cases"
    property string cNewCases: "New Cases"
    property string cTotalDeaths: "Total Deaths"
    property string cNewDeaths: "New Deaths"
    property string cTotalRecovered: "Total Recovered"
    property string cNewRecovered: "New Recovered"
    property string cActiveCases: "Active Cases"
    property string cTotCasesPerMil: "Total Cases Per Million"
    property string cDeathsPerMil: "Deaths Per Million"
    property string cTotalTests: "Total Tests"
    property string cTestsPerMil: "Tests Per Million"
    property string cPopulation: "Population"
    property string cContinent: "Continent"

    SilicaFlickable {
        anchors.fill: parent

        contentHeight: column.height + header.height + Theme.paddingLarge

        PageHeader {
            id: header
            title: qsTr(cName+" ("+cHash+")")
        }
        
        Item {
            id: demographyItem
            anchors.top: parent.top
            anchors.topMargin: header.height
            width: parent.width
            height: flagColumn.height

            Row {
                id: demographyRow
                width: (parent.width - flagColumn.width)
                Column {
                    id: demographyColumn

                    Label {
                        x: Theme.horizontalPageMargin;
                        width: parent.width - x;
                        text: "Continent: <b>"+cContinent+"</b>";
                        font.pixelSize: Theme.fontSizeMedium;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        wrapMode: Text.WordWrap;
                    }
                    Label {
                        x: Theme.horizontalPageMargin;
                        width: parent.width - x;
                        text: "Population: <b>"+cPopulation+"</b>";
                        font.pixelSize: Theme.fontSizeMedium;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        wrapMode: Text.WordWrap;
                    }
                    Label {
                        x: Theme.horizontalPageMargin;
                        width: parent.width - x;
                        text: "Active Cases: <b>"+cActiveCases+"</b>";
                        font.pixelSize: Theme.fontSizeMedium;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        wrapMode: Text.WordWrap;
                    }
                }
                Column {
                    id: flagColumn
                    Image {
                        id: flagIcon;
                        width: sourceSize.width * 4;
                        height: sourceSize.height * 4;
                        fillMode: Image.PreserveAspectFit;
                        source: "/usr/share/harbour-covid19stats/qml/resources/flags/"+cName+".gif";
                        horizontalAlignment: Image.AlignRight;
                        x: header.width-flagColumn.width;
                    }
                }
            }
        }

        Row {
            id: newItem
            anchors.top: demographyItem.bottom
            anchors.left: demographyItem.left
            width: parent.width
            height: 300

            SectionHeader {
                text: qsTr("New")
                font.pixelSize: Theme.fontSizeMedium
            }
            Column {
                id: newColumn
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "New Cases: <b>"+cNewCases+"</b>";
                    font.pixelSize: Theme.fontSizeLarge;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "New Deaths: <b>"+cNewDeaths+"</b>";
                    font.pixelSize: Theme.fontSizeLarge;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "New Recovered: <b>"+cNewRecovered+"</b>";
                    font.pixelSize: Theme.fontSizeLarge;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
            }
        }

        Row {
            id: separator1
            anchors.top: newItem.bottom
            anchors.left: newItem.left
            width: parent.width
            height: 50
        }

        Row {
            id: totalItem
            anchors.top: separator1.bottom
            width: parent.width
            height: 350

            SectionHeader {
                text: qsTr("Total")
                font.pixelSize: Theme.fontSizeMedium
            }
            Column {
                id: totalColumn
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Total Cases: <b>"+cTotalCases+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Total Deaths: <b>"+cTotalDeaths+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Total Recovered: <b>"+cTotalRecovered+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Total tests: <b>"+cTotalTests+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
            }
        }
        Row {
            id: separator2
            anchors.top: totalItem.bottom
            anchors.left: totalItem.left
            width: parent.width
            height: 50
        }
        Row {
            id: permillionItem
            anchors.top: separator2.bottom
            width: parent.width
            height: 300

            SectionHeader {
                text: qsTr("Per Million")
                font.pixelSize: Theme.fontSizeMedium
            }

            Column {
                id: permillionColumn
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Total cases/Million: <b>"+cTotCasesPerMil+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Deaths/Million: <b>"+cDeathsPerMil+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
                Label {
                    x: Theme.horizontalPageMargin;
                    width: parent.width - x;
                    text: "Tests/Million: <b>"+cTestsPerMil+"</b>";
                    font.pixelSize: Theme.fontSizeMedium;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    wrapMode: Text.WordWrap;
                }
            }
        }
    }
}
