
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

## Create Apprun
