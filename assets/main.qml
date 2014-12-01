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

//Import bb.cascades 1.2 for Universal devices
import bb.cascades 1.2

//Main NavigationPane
NavigationPane {
    id: mainNP
    //hide back Buttons
    backButtonsVisible: false
    
    //Main Page
    Page {
        
        //Main Container
        Container {
            layout: DockLayout {
            }
            //Backgroun for main container
            ImageView {
                
                imageSource: "asset:///images/KCOMarshLogIn.png"
            
            }//End imageView
            Container {
                layout: AbsoluteLayout {}
                TextField {
                    id: usuario
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 106.3
                        positionY: 493.0
                    }
                    preferredWidth: 560
                    hintText: "Usuario final"

                }
                
                TextField {
                    id: pass
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 106.3
                        positionY: 583.1
                    }
                    preferredWidth: 560
                    hintText: "Contraseña"
                    inputMode: TextFieldInputMode.Password
                    textStyle.textAlign: TextAlign.Default

                }
                
                ImageButton {
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 106.5
                        positionY: 673.0
                    }
                    preferredWidth: 558
                    preferredHeight: 78
                    defaultImageSource: "asset:///buttons/ENTRAR.png"
                    pressedImageSource: "asset:///buttons/ENTRAR.png"
                    onClicked: {
                        var newPage = menuPageID.createObject();
                        mainNP.push(newPage);
                    } 
                }
            }

            onCreationCompleted: {
                // When the container has been created, push three
                // Page objects onto the NavigationPane stack
                mainNP.push(menuPageID);
                mainNP.push(prueba);
                //mainNP.push(fourthPage);
            }
            background: Color.create("#ff00005a")
            implicitLayoutAnimationsEnabled: true

        } //EndContainer
        attachedObjects: [
            ComponentDefinition {
                id: menuPageID
                source: "asset:///KCOmenuPage.qml"
            },

             ComponentDefinition {
                id: prueba
                source: "asset:///KCOPractices.qml"
            }
        ]
    } //End Page

    onPopTransitionEnded: {
        page.destroy();
    }

} //End Main NavigationPane
