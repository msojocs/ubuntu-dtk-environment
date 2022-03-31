FROM mamaship/qt5.15:v2

WORKDIR /workspace

RUN sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt update && \
    apt install -y libgsettings-qt-dev libgsettings-qt1 \
    librsvg2-dev \
    libxi-dev libxcb-util-dev libstartup-notification0-dev libcups2-dev \
    # for theme
    libmtdev-dev && \
    apt install -y --reinstall ca-certificates wget && \
    mkdir /usr/local/share/ca-certificates/cacert.org && \
    wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt && \
    update-ca-certificates && \
    git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt &&\
    # 修正安装路径 /home/qt/work/install -----> /opt/Qt/5.15.2/gcc_64
    mkdir -p /home/qt/work && ln -s /opt/Qt/5.15.2/gcc_64 /home/qt/work/install
# dtk
RUN qmake -set prefix /usr && \
    # dtkcommon
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkcommon.git && \
    cd dtkcommon && qmake && make && make install &&\
    # dtkcore
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkcore.git && \
    cd dtkcore && qmake && make -nomake tests && make install &&\
    # dtkgui
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkgui.git && \
    cd dtkgui && qmake && make -nomake tests && make install &&\
    # dtkwidget
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkwidget.git &&\
    cd dtkwidget && qmake QMAKE_INCDIR=/usr/include/x86_64-linux-gnu/qt5 && make -nomake tests && make install && \
    # gosu
    apt install -y gosu && \
    gosu nobody true
# theme
RUN mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/lxqt/lxqt-build-tools.git &&\
    cd lxqt-build-tools && git checkout tags/0.10.0 && \
    mkdir build && cd build && cmake .. && make && make install &&\
    # libqtxdg
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/lxqt/libqtxdg.git &&\
    cd /workplace/dtk/libqtxdg && git checkout tags/3.8.0 && \
    mkdir build && cd build && cmake .. && make && make install &&\
    # googletest
    mkdir -p /workplace/other && cd /workplace/other &&\
    git clone --single-branch --branch release-1.11.0 https://hub.fastgit.xyz/google/googletest.git &&\
    cd /workplace/other/googletest && \
    mkdir build && cd build && cmake .. && make && make install &&\
    # qt5integration
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/qt5integration.git && \
    export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig:/opt/Qt/5.15.2/gcc_64/lib/pkgconfig:$PKG_CONFIG_PATH" && \
    cd /workplace/dtk/qt5integration && \
    mkdir build && cd build && qmake .. && make && make install
