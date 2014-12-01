/* Copyright (c) 2012, 2013  BlackBerry Limited.
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

Container {
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    background: Color.create("#ff00c3ba")
    property alias title : titleLabel.text
    property alias pubDate : pubDateLabel.text

    layout: DockLayout {}

    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill

        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        Container {
            //topPadding: ui.du(1.1)
            //leftPadding: ui.du(5.6)

            Label {
                id: titleLabel
                //textStyle.base: SystemDefaults.TextStyles.PrimaryText
                textStyle.color: Color.Black
                //textStyle.fontSize: 24
            }

            Label {
                id: pubDateLabel

                textStyle.base: SystemDefaults.TextStyles.SmallText
                textStyle.color: Color.Black
            }
        }

//        ImageView {
//            verticalAlignment: VerticalAlignment.Center
//            minWidth: ui.du(0.2)
//
//            imageSource: "asset:///images/arrow.png"
//        }
    }
}