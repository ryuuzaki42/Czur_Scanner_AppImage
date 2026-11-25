
## Download deb
wget https://resource.czur-files.com/software/linux/differ/scanner_1.0.20250413_amd64_en_2512021.deb

## Extract deb
ar x scanner_1.0.20250413_amd64_en_2512021.deb

## Delete files not needed
rm scanner_1.0.20250413_amd64_en_2512021.deb control.tar.xz debian-binary

## Create folder
mkdir Czur_Scanner_et24_25pro_AppImage/

## Extract data
tar -xJf data.tar.xz -C Czur_Scanner_et24_25pro_AppImage/

## Enter extracted folder
cd Czur_Scanner_et24_25pro_AppImage/

## Move files from up from /tmp/
mv tmp/opt/ ./
rmdir tmp/

## Copy icon e shortcut
cp usr/share/icons/czurscanner.ico Czur_Scanner_et24_25pro.ico
cp usr/share/applications/scanner.desktop .

## Edit shortcut
Name=CzurScanner
Name=Czur_Scanner_et24_25pro_AppImage

Icon=/opt/apps/scanner/ico/CzurScanner.ico
Icon=Czur_Scanner_et24_25pro.ico

## Create AppRun
> AppRun

#!/bin/bash
HERE="$(dirname "$(readlink -f "${0}")")"
cd "$HERE"/

cd opt/apps/scanner/

bash -c 'xrdb -query | grep -q "Xft.dpi"  || echo "Xft.dpi:  96" | xrdb -merge; env LD_PRELOAD=./libczurusb-1.0.so GDK_BACKEND=x11 ./CzurScanner %F'

## Added permission
chmod +x AppRun
#cat AppRun

## Download appimagetool
cd ../

version_go_appimage=$(wget -q -O - https://api.github.com/repos/probonopd/go-appimage/releases | grep "\"name.*appimagetool-.*-x86_64.AppImage\"" | head -n 1 | cut -d '-' -f2)
echo "version_go_appimage: $version_go_appimage"
wget -q "https://github.com/probonopd/go-appimage/releases/download/continuous/appimagetool-$version_go_appimage-x86_64.AppImage" -O appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage

## Make AppImage
version="1.0.20250413"

ARCH=x86_64 VERSION="${version}-1_JB" ./appimagetool-x86_64.AppImage Czur_Scanner_et24_25pro_AppImage/
