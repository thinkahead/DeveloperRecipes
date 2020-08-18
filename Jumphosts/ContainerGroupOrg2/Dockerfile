FROM quay.io/ansible-tower/ansible-runner:latest
#FROM quay.io/ansible-tower/ansible-runner:1.4.4

RUN yum -y update

# Add Centos repo for doing yum install
RUN printf '[base]\nname=CentOS-\$releasever - Base\nbaseurl=http://mirror.centos.org/centos/7.8.2003/os/\$basearch/\nenabled=1\ngpgcheck=0\npriority=1\n' > /etc/yum.repos.d/centos.repo

# Run yum install commands
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install expect connect-proxy nc autossh net-tools curl iputils socat hostname
RUN yum -y install gcc python36 python36-devel git python-pip

RUN rm -rf /var/lib/awx/venv/ansible;mkdir -p /var/lib/awx/venv/ansible
RUN virtualenv -p python3 /var/lib/awx/venv/ansible

# Configure the ansible_test venv
RUN umask 0022
RUN . /var/lib/awx/venv/ansible/bin/activate; pip install --upgrade pip;pip install --upgrade setuptools;pip install python-memcached psutil ansible pypsrp pywinrm pywinrm[credssp] requests-credssp;pip install git+https://github.com/nitzmahone/PySocks.git@hack_unix_domain_socket_file_support git+https://github.com/nitzmahone/urllib3.git@hack_unix_domain_socket_file_support requests==2.22.0 idna==2.8; deactivate
COPY keys /root/keys/
