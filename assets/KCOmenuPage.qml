import bb.cascades 1.2
import Network.PostHttp 1.0
import "controls"
import my.library 1.0
Page {
    Container {
        layout: DockLayout {}
        ImageView {
            imageSource: "asset:///images/KCOMarshMenu.png"
        }
        
        Container {
            layout: AbsoluteLayout {}
            ImageButton {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 75.7
                    positionY: 79.8
                }
                defaultImageSource: "asset:///buttons/Practices.png"
                pressedImageSource: "asset:///buttons/PracticesPressed.png"
                onClicked: {
                    var newPage = prueba.createObject();
                    mainNP.push(newPage);
                }
            }
            
            ImageButton {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 75.7
                    positionY: 285.8
                }
                defaultImageSource: "asset:///buttons/Oficinas.png"
                pressedImageSource: "asset:///buttons/OficinasPressed.png"
                onClicked: {
                    var newPage = prueba2.createObject();
                    mainNP.push(newPage);
                }
            }
            
            ImageButton {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 75.7
                    positionY: 487.7
                }
                defaultImageSource: "asset:///buttons/Negocio.png"
                pressedImageSource: "asset:///buttons/NegocioPressed.png"
            }
            
            ImageButton {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 75.7
                    positionY: 689.0
                }
                defaultImageSource: "asset:///buttons/Segmentos.png"
                pressedImageSource: "asset:///buttons/SegmentosPressed.png"
            }
            
            ImageButton {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 75.7
                    positionY: 895.0
                }
                defaultImageSource: "asset:///buttons/SecAsegurador.png"
                pressedImageSource: "asset:///buttons/SecAseguradorPressed.png"
            }
            
            TextArea {
                id: postResponseBody
                visible: false
                editable: false
                backgroundVisible: false
                
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText;
                    color: Color.White
                }
            }
        }
        
        NetworkActivity {
            id: progressIndicator
            
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            title: qsTr("Posting...")
        }
        
        attachedObjects: [
            QTimer {
                id: timer
                interval: 1000
                onTimeout: {
                    // One second after page loads make the http post request
                    netpost.post(_httpsample.postBody, _httpsample.postBodyPass);
                }
            },
            PostHttp {
                id : netpost
                onComplete :{
                    progressIndicator.active = false;
                    progressIndicator.visible = false;
                    
                    postResponseBody.text = info;
                    postResponseBody.visible = true;
                    //postResponseLabel.visible = true;
                    
                    timer.stop();
                }
            }
        ]
        
        onCreationCompleted: {
            progressIndicator.active = true;
            timer.start();
        }
    }
    
    attachedObjects: [
        
        ComponentDefinition {
            id: prueba
            source: "asset:///KCOPractices.qml"
        },
        
        ComponentDefinition {
            id: prueba2
            source: "asset:///KCOOffices.qml"
        }
    ]
}