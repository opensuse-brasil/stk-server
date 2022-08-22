FROM registry.opensuse.org/opensuse/leap:latest AS build

WORKDIR /stk

RUN zypper in -y cmake gcc-c++ git libcurl-devel enet-devel libopenssl-devel sqlite3-devel subversion

RUN git clone https://github.com/supertuxkart/stk-code stk-code

RUN svn checkout https://svn.code.sf.net/p/supertuxkart/code/stk-assets stk-assets

RUN mkdir stk-code/cmake_build && cd stk-code/cmake_build && cmake .. -DSERVER_ONLY=ON && make -j$(nproc) && make install

FROM registry.opensuse.org/opensuse/leap:latest

ENV STK_CONFIG="/stk/config.xml"
ENV STK_SERVER_NAME=""
ENV STK_MOTD=""
ENV STK_USER=""
ENV STK_PASSWORD=""

RUN mkdir -p /stk/data

WORKDIR /stk

COPY --from=build /usr/local/bin/supertuxkart /usr/bin
COPY --from=build /usr/local/share/supertuxkart /usr/local/share/supertuxkart

COPY config.xml /stk/config.xml
RUN touch /stk/motd.txt

COPY stk-server.sh /usr/bin/stk-server
RUN chmod +x /usr/bin/stk-server

EXPOSE 2757
EXPOSE 2759

VOLUME ["/stk"]

STOPSIGNAL SIGTERM

CMD stk-server
