#!/bin/bash

sudo rm -rf /opt/eclipse
sudo rm -f ~/Desktop/eclipse.desktop

curl -LOk http://eclipse.bluemix.net/packages/2019-03/data/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz --output ~/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz

sudo tar xfz ~/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz -C /opt/

rm -f ~/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz

sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

cat > ~/Desktop/eclipse.desktop <<EOF
[Desktop Entry]
Comment[en_US]=Eclipse IDE
Comment=Eclipse IDE
Exec=/usr/local/bin/eclipse
GenericName[en_US]=Eclipse
GenericName=Eclipse
Icon=/opt/eclipse/icon.xpm
MimeType=
Name[en_US]=Eclipse
Name=Eclipse
Path=/tmp/
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
EOF

chmod +x ~/Desktop/eclipse.desktop

echo "Eclipse installed."
