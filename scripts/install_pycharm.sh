INSTALL_DIR=/opt/
VERSION=2019.1.3
cd $INSTALL_DIR

VERSION_NAME=pycharm-community-$VERSION
if [ ! -f "$VERSION_NAME".tar.gz ]; then
  wget https://download-cf.jetbrains.com/python/$VERSION_NAME.tar.gz
fi

if [ ! -d "$VERSION_NAME" ]; then
  tar -xvf $VERSION_NAME.tar.gz
fi

if [ -f /usr/bin/pycharm ]; then
 rm /usr/bin/pycharm;
fi

ln -s /$INSTALL_DIR/$VERSION_NAME/bin/pycharm.sh /usr/bin/pycharm

