pragma Singleton
import QtQuick 2.0

Item {
    id: p
    property string iconsFont: d.name
    property string roboto: r.name
    property string robotoMedium: r_Medium.name


    FontLoader {
        id: d
        source: "fonts/materialdesignicons-webfont.ttf"
    }
    FontLoader {
        id: r
        source: "fonts/Roboto-Regular.ttf"
    }
    FontLoader {
        id: r_Medium
        source: "fonts/Roboto-Medium.ttf"
    }


}
