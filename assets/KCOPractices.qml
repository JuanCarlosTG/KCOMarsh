import bb.cascades 1.2

Page {
    Container {
        layout: DockLayout {}
        ImageView {
            imageSource: "asset:///images/KCOMarshPractice.png"
        }
        Container {
            layout: AbsoluteLayout {}
            ImageButton {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 48.5
                    positionY: 188.6
                }
                preferredHeight: 169
                preferredWidth: 680
                //defaultImageSource: "asset:///buttons/Practices.png"
                pressedImageSource: "asset:///buttons/PracticesPressed.png"
                onClicked: {
                    var newPage5 = prueba2.createObject();
                    mainNP.push(newPage5);
                }
            }
        }
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: prueba2
            source: "asset:///KCONewsExample.qml"
        }
    ]
}
