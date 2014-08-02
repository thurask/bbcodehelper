/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.data 1.0
import bb.system 1.2

Page {
    titleBar: TitleBar {
        title: "BBCode Helper"
    }
    Container {
        DropDown {
            id: sourceDropDown
            title: "Forum"
            selectedOption: generic
            options: [
                Option {
                    id: generic
                    text: "Generic"
                    value: "/xml/generic.xml"
                },
                Option {
                    id: crackberry
                    text: "CrackBerry"
                    value: "/xml/crackberry.xml"
                },
                Option {
                    id: nationstates
                    text: "NationStates"
                    value: "/xml/nationstates.xml"
                }
            ]
            onSelectedIndexChanged: {
                dataSource.source = sourceDropDown.selectedValue
                dataSource.load();
            }           
        }
        ListView {
            dataModel: dataModel
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    StandardListItem {
                        title: ListItemData.name
                        description: ListItemData.tags
                    }
                }
            ]
            onTriggered: {
                var indexi = dataModel.data(indexPath);
                Clipboard.copyToClipboard(indexi.tags);
                xmlToast.show();
            }
        }
    }
    attachedObjects: [
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.ByFirstChar
            sortedAscending: true
            sortingKeys: ["name"]
        },
        DataSource {
            id: dataSource
            source: "/xml/generic.xml"
            query: "bbcode/element"
            onDataLoaded: {
            dataModel.clear()
            dataModel.insertList(data)
            }
        },
        SystemToast {
            id: xmlToast
            body: "Copied"
        },
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {
                }
        }
    ]
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                var help = helpSheetDefinition.createObject()
                help.open();
            }
        }
    }
    onCreationCompleted: {
        dataSource.load();
    }
}