FROM alpine
COPY . /src
CMD ["/src/ansible-playbook","/src/startup.sh"]
