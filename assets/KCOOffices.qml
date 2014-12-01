import bb.cascades 1.2
import bb.data 1.0
Page {
    titleBar: TitleBar {
        title: "Oficinas"
        scrollBehavior: TitleBarScrollBehavior.Sticky
        appearance: TitleBarAppearance.Default
    }
    Container {
        background: Color.create("#ff00c3ba")
        layout: DockLayout {}
        
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            //! [0]
            // A control to switch between the two news sources
            DropDown {
                id: newsSources
                title: "Selecciona la Ciudad"
                
                Option {
                    value: "googlerssfeeds.json"
                    text: "Cancún"
                    selected: true
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "CD Juárez"
                    
                }
                Option {
                    value: "googlessfeeds.json"
                    text: "Chihuahua"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "D.F."
                }
                Option {
                    value: "googlerssfeeds.json"
                    text: "Guadalajara"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "Hermosillo"
                    
                }
                Option {
                    value: "googlessfeeds.json"
                    text: "León"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "Mexicali"
                }
                Option {
                    value: "googlerssfeeds.json"
                    text: "Mérida"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "Monterrey"
                    
                }
                Option {
                    value: "googlessfeeds.json"
                    text: "Nogales"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "Puebla"
                }
                Option {
                    value: "googlerssfeeds.json"
                    text: "Querétaro"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "Reynosa"
                    
                }
                Option {
                    value: "googlessfeeds.json"
                    text: "Tijuana"
                }
                Option {
                    value: "yahoorssfeeds.json"
                    text: "Torreón"
                }
                
                
                
                onSelectedValueChanged: {
                    // Illustrating usage of DropDown signal handler
                    console.debug("Number of pints 
                    changed to " + selectedValue)
                }
                onSelectedOptionChanged: {
                    if (selectedOption != 0) {
                        feedsDataSource.source = selectedOption.value;
                        feedsDataSource.load();
                    }
                }
                
                onCreationCompleted: {
                    if (selectedOption != 0) {
                        feedsDataSource.source = selectedOption.value;
                        feedsDataSource.load();
                    }
                }
            
            }
            //! [0]
            
            //! [1]
            // A list view that shows all the categories of a news source
            ListView {
                dataModel: feedsDataModel
                
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        Container {
                            layout: DockLayout {}
                            
                            Label {
                                verticalAlignment: VerticalAlignment.Center
                                
                                text: ListItemData.name
                                
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                                textStyle.color: Color.Black
                            }
                            
                            Divider {
                                verticalAlignment: VerticalAlignment.Fill
                            }
                        }
                    }
                ]
                
                onTriggered: {
                    var feedItem = feedsDataModel.data(indexPath);
                    articlesDataSource.source = "http://" + feedItem.feed;
                    articlesDataSource.load();
                    
                    var page = newsListings.createObject();
                    page.title = newsSources.selectedOption.text + ": " + feedItem.name
                    mainNP.push(page);
                }
            }
            //! [1]
        }
    }
    
    attachedObjects: [
        //! [2]
        // The data model that contains the content of a JSON file
        GroupDataModel {
            id: feedsDataModel
            sortingKeys: ["order"]
            grouping: ItemGrouping.None
        },
        
        // The data source that fills the above model with the content of a JSON file
        DataSource {
            id: feedsDataSource
            source: ""
            onDataLoaded: {
                feedsDataModel.clear();
                feedsDataModel.insertList(data);
            }
            onError: {
                console.log("JSON Load Error: [" + errorType + "]: " + errorMessage);
            }
        },
        //! [2]
        
        //! [3]
        // The data model that contains the articles from a RSS feed
        GroupDataModel {
            id: articlesDataModel
            sortingKeys: ["pubDate"]
            sortedAscending: false
            grouping: ItemGrouping.None
        },
        
        // The data source that fills the above model with the articles
        DataSource {
            id: articlesDataSource
            source: ""
            query: "/rss/channel/item"
            type: DataSource.Xml
            onDataLoaded: {
                articlesDataModel.clear();
                articlesDataModel.insertList(data);
            }
            onError: {
                console.log("RSS Load Error[" + errorType + "]: " + errorMessage);
            }
        },
        //! [3]
        
        //! [4]
        // The dynamically loaded page to show the list of articles from a RSS feed
        ComponentDefinition {
            id: newsListings
            Page {
                property alias title : titleLabel.text
                
                Container {
                    layout: DockLayout {}
                    background: Color.create("#ff00c3ba")
                    //                        ImageView {
                    //                            horizontalAlignment: HorizontalAlignment.Fill
                    //                            verticalAlignment: VerticalAlignment.Fill
                    //                            
                    //                            imageSource: "asset:///images/background.png"
                    //                        }
                    
                    Container {
                        Container {
                            horizontalAlignment: HorizontalAlignment.Center
                            layout: DockLayout {}
                            
                            //                                ImageView {
                            //                                    horizontalAlignment: HorizontalAlignment.Fill
                            //                                    verticalAlignment: VerticalAlignment.Fill
                            //                                    
                            //                                    imageSource: "asset:///images/header_background.png"
                            //                                }
                            
                            Label {
                                
                                id: titleLabel
                                horizontalAlignment: HorizontalAlignment.Center
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                            }
                        }
                        
                        ListView {
                            dataModel: articlesDataModel
                            listItemComponents: [
                                ListItemComponent {
                                    type: "item"
                                    ArticleItem {
                                        title: ListItemData.title
                                        pubDate: ListItemData.pubDate
                                    }
                                }
                            ]
                            onTriggered: {
                                var feedItem = articlesDataModel.data(indexPath);
                                
                                var page4 = detailPage.createObject();
                                page4.htmlContent = feedItem.description;
                                mainNP.push(page4);
                            }
                        }
                    }
                }
            }
        },
        //! [4]
        
        //! [5]
        // The dynamically loaded page to show an article in a webview
        ComponentDefinition {
            id: detailPage
            Page {
                property alias htmlContent: detailView.html
                
                Container {
                    ScrollView {
                        scrollViewProperties.scrollMode: ScrollMode.Vertical
                        WebView {
                            id: detailView
                            settings.defaultFontSize: 26
                            settings.zoomToFitEnabled: true
                        }
                    }
                }
            }
        }
        //! [5]
    ]

}
