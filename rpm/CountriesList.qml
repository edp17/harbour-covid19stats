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
    id: root
    property string searchString

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height

        PullDownMenu {
            id: pullDownMenu

            MenuItem {
                text: "About"
                onClicked: pageStack.animatorPush(Qt.resolvedUrl("About.qml"))

            }
            MenuItem {
                text: "Refresh"
                //visible: listView.count
                onClicked: {
                    listModel.addItems()
                }
            }
        }

        SearchField {
            id: searchField
            width: parent.width

            Binding {
                target: root
                property: "searchString"
                value: searchField.text.toLowerCase().trim()
            }
        }

        Component {
            id: listDelegate

                Item {
                    x: Theme.horizontalPageMargin + 80
                    width: parent.width - 2 * x
                    visible: RegExp(searchField.text,"i").test(country)
                    height: visible ? 120 : 0
                    anchors.left: parent.left
                    
                    Image {
                        id: flagIcon
                        width: Theme.iconSizeMedium
                        height: Theme.iconSizeMedium
                        fillMode: Image.PreserveAspectFit
                        source: "/usr/share/harbour-covid19stats/qml/resources/flags/"+country+".gif"
                    }
                    
                    Item {
                        id: spaceHolder
                        width: flagIcon.width + 10
                        height: flagIcon.height
                    }

                    Text {
                        id: countryField;
                        anchors.left: spaceHolder.right;
                        y: (flagIcon.height - countryField.height);
                        font.capitalization: Font.Capitalize;
                        font.pixelSize: Theme.fontSizeLarge;
                        color: "white";
                        text: "<b>"+country+"</b>";
                    }
                    Text {
                        id: extraInfo;
                        anchors.left: countryField.right;
                        y: (flagIcon.height - extraInfo.height);
                        color: "yellow";
                        font.pixelSize: Theme.fontSizeSmall;
                        text: "<i>[New "+newcases+", Deaths "+newdeaths+"]</i>";
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pageStack.animatorPush(Qt.resolvedUrl("OneCountry.qml"),
                                    {cName: country,
                                     cHash: hash, 
                                     cTotalCases: totalcases,
                                     cNewCases: newcases,
                                     cTotalDeaths: totaldeaths,
                                     cNewDeaths: newdeaths,
                                     cTotalRecovered: totalrecovered,
                                     cNewRecovered: newrecovered,
                                     cActiveCases: activecases,
                                     cTotCasesPerMil: totalcasespermill,
                                     cDeathsPerMil: deathspermill,
                                     cTotalTests: totaltests,
                                     cTestsPerMil: testspermill,
                                     cPopulation: population,
                                     cContinent: continent
                            });
                        }
                    }
                }
            }

        SilicaListView {
            id: listView
            anchors.top: searchField.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            model: listModel

            header: PageHeader {
                title: "Covid19 Statistics"
            }

            ViewPlaceholder {
                enabled: (listModel.populated && listModel.count === 0)
                text: "Downloading DATA..."
                hintText: "It can take for a while"
            }

            delegate: listDelegate
        }

        ListModel {
            id: listModel
            property bool populated

            Component.onCompleted: {
                addItems()
            }

             ListElement {
                 country: "Dummy"
                 newcases: ""
                 newdeaths: ""
                 hash: ""
                 continent: ""
                 population: ""
                 newrecovered: ""
                 activecases: ""
                 deathspermill: ""
                 testspermill: ""
                 totalcases: ""
                 totalcasespermill: ""
                 totaldeaths: ""
                 totalrecovered: ""
                 totaltests: ""
             }

            function addItems() {
                listModel.clear();
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                    print('HEADERS_RECEIVED')
                    } else if(xhr.readyState === XMLHttpRequest.DONE) {
                        print('DONE')
                        var cases = JSON.parse(xhr.responseText.toString())
                        var countryCount  = Object.keys(cases).length;
                        var hash = "#";
                        var newCases = "New Cases";
                        var newDeaths = "New Deaths";
                        var totalCases = "Total Cases";
                        var totalDeaths = "Total Deaths";
                        var totalRecovered = "Total Recovered";
                        var newRecovered = "New Recovered";
                        var activeCases = "Active Cases";
                        var totalCasesPerMill = "Tot Cases\/ 1M pop";
                        var deathsPerMill = "Deaths\/ 1M pop";
                        var totalTests = "Total Tests";
                        var testsPerMill = "Tests\/  1M pop ";
                        var countryName = "unknown";
                        var na = "-";

                        for (var index = 0; index < countryCount; index++) {

                            countryName = Object.keys(cases)[index];
                            var country = cases[countryName];

                            listModel.append({
                                "country": countryName,
                                "newcases": country[newCases] ? country[newCases] : na,
                                "newdeaths": country[newDeaths] ? country[newDeaths] : na,
                                "hash": country[hash],
                                "continent": country.Continent,
                                "population": country.Population,
                                "newrecovered": country[newRecovered] ? country[newRecovered] : na,
                                "activecases": country[activeCases] ? country[activeCases] : na,
                                "deathspermill": country[deathsPerMill] ? country[deathsPerMill] : na,
                                "testspermill": country[testsPerMill] ? country[testsPerMill] : na,
                                "totalcases": country[totalCases] ? country[totalCases] : na,
                                "totalcasespermill": country[totalCasesPerMill] ? country[totalCasesPerMill] : na,
                                "totaldeaths": country[totalDeaths] ? country[totalDeaths] : na,
                                "totalrecovered": country[totalRecovered] ? country[totalRecovered] : na,
                                "totaltests": country[totalTests] ? country[totalTests] : na
                            })
                        }
                    }
                }
                xhr.open("GET", "https://raw.githubusercontent.com/chrislopez24/corona-parser/master/cases.json");
                xhr.send();
                populated = true
            }
        }
    }
}
