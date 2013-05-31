import QtQuick 1.1
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0

Page {
    property Item tools: null;
    property int orientationLock: PageOrientation.Automatic
    property alias menuitems: menuModel.children

    //MENU HANDLING
    //Basic idea for abstracted menu handling inspired by THP
    //@ http://thpmaemo.blogspot.ch/2013/03/porting-harmattan-apps-to-sailfish.html
    //With the following differences:
    //1) simplified and condensed
    //2) we also provide the ListView as a child of the Page, rather than expecting it to be passed from
    //the declaration of the AUIPage component

    //As this means every page would have a menu, even if not used or displayed
    //I have created two components
    //a) AUIPageWithMenu, which has this handling
    //b) AUIPage, which has no menu
    //The two are otherwise identical

    ListView { id: menuListView
        anchors.fill: parent
        Item { id: menuModel }

        //Harmattan has Menu, Silica has PullDownMenu
        PullDownMenu {
            id: pullDownMenu
            //Harmattan has MenuLayout here as child of Menu, parent of Repeater, Silica does not.
            Repeater {
                model: menuModel.children
                MenuItem {
                    text: modelData.text
                    onClicked: modelData.clicked()
                }
            }
        }
    }
}
