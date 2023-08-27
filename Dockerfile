FROM centos
RUN rm /usr/bin/python
FROM miigotu/python3.11
RUN ln -s `which python` /usr/bin/python
RUN /usr/bin/python -m pip install ansible
RUN export PATH=$PATH:/root/.local/bin
WORKDIR /src
COPY . /src
COPY ./lib /lib
COPY ./tools /usr/bin
ENTRYPOINT ["nohup","/src/tools/daemon","&"]
