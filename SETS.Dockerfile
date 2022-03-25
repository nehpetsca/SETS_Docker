FROM ubuntu:latest

RUN \
    apt update && \
    apt install -y pcmanfm featherpad lxtask xterm 

RUN apt install -y python3 python3-tk git
RUN apt install -y python3-pip

WORKDIR /root
RUN git clone https://github.com/STOCD/SETS.git
COPY .config .config/SETS/
COPY .config/.debug SETS/.debug
COPY STOCD_SETS/images SETS/images/
WORKDIR /root/SETS
RUN python3 -m pip install -r requirements.txt

WORKDIR /root/LIVE_SETS

ENV DISPLAY=host.docker.internal:0.0
CMD xterm -geometry 120x48 -fg white -bg black
# -e "python3 main.py"
# CMD python3 main.py