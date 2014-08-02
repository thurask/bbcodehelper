/*HelpSheet.qml
 --------------
 Help menu, including credits and notes.
 
 --Thurask*/

import bb.cascades 1.2

Sheet {
    id: helpSheet
    content: Page {
        titleBar: TitleBar {
            title: "Help"
            dismissAction: ActionItem {
                title: "Close"
                onTriggered: {
                    helpSheet.close()
                    if (helpSheet) helpSheet.destroy();
                }
            }
        }
        Container {
            Label {
                text: "BBCode Helper"
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontWeight: FontWeight.Bold
            }
            Label  {
                text: "BBCode Helper developed by Thurask."
                horizontalAlignment: HorizontalAlignment.Center
                textFit.mode: LabelTextFitMode.Default
                textStyle.textAlign: TextAlign.Center
            }
            Label {
                text: "Twitter: @thuraski"
                horizontalAlignment: HorizontalAlignment.Center
                textFit.mode: LabelTextFitMode.Default
                textStyle.textAlign: TextAlign.Center
                content.flags: TextContentFlag.ActiveText
            }
            Label {
                text: "Contribute your forum by reading the readme: \nhttps://github.com/thurask/bbcodehelper"
                horizontalAlignment: HorizontalAlignment.Center
                textFit.mode: LabelTextFitMode.Default
                textStyle.textAlign: TextAlign.Center
                content.flags: TextContentFlag.ActiveText
                multiline: true
            }
        }
    }
}