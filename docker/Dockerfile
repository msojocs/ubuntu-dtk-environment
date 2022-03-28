FROM mamaship/qt5.15:v2

WORKDIR /workspace

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt update && \
    apt install -y libgsettings-qt-dev libgsettings-qt1 \
    librsvg2-dev \
    libxi-dev libxcb-util-dev libstartup-notification0-dev libcups2-dev && \
    apt install -y --reinstall ca-certificates wget && \
    mkdir /usr/local/share/ca-certificates/cacert.org && \
    wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt && \
    update-ca-certificates && \
    git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt &&\
    # 修正安装路径 /home/qt/work/install -----> /opt/Qt/5.15.2/gcc_64
    for pc in /opt/Qt/5.15.2/gcc_64/lib/pkgconfig/*; \
    do \
        sed -i 's#/home/qt/work/install#/opt/Qt/5.15.2/gcc_64#' $pc;\
    done; \
    cat /opt/Qt/5.15.2/gcc_64/lib/pkgconfig/Qt5DBus.pc &&\
    cp -r /opt/Qt/5.15.2/gcc_64/lib/pkgconfig/* /usr/lib/x86_64-linux-gnu/pkgconfig
# dtk
RUN qmake -set prefix /usr && \
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkcommon.git && \
    cd dtkcommon && qmake && make && make install &&\
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkcore.git && \
    cd dtkcore && qmake && make -nomake tests && make install &&\
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkgui.git && \
    cd dtkgui && qmake && make -nomake tests && make install &&\
    mkdir -p /workplace/dtk && cd /workplace/dtk &&\
    git clone https://hub.fastgit.xyz/linuxdeepin/dtkwidget.git &&\
    cd dtkwidget && qmake QMAKE_INCDIR=/usr/include/x86_64-linux-gnu/qt5 && make -nomake tests && make install && \
    apt install -y gosu && \
    gosu nobody true