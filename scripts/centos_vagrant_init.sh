CENTOS_VAGRANT_DIR="centos7.vagrant"

if test -d ${CENTOS_VAGRANT_DIR}; then
    rm -Rf $CENTOS_VAGRANT_DIR;
    echo "dir removed -> $CENTOS_VAGRANT_DIR";
fi

mkdir $CENTOS_VAGRANT_DIR;
echo "dir created -> $CENTOS_VAGRANT_DIR";



cp ./scripts/Vagrantfile.sbeliakou_centos_config $CENTOS_VAGRANT_DIR/Vagrantfile
cd $CENTOS_VAGRANT_DIR
vagrant up


