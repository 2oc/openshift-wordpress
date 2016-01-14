FROM centos:7
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install httpd wget unzip php php-mysql php-gd pwgen supervisor bash-completion psmisc tar && yum clean all -y

ADD httpd.conf /

ADD run_apache.sh /

RUN rm -fr /run/httpd; ln -sf /tmp/run/httpd /run/httpd

ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz

RUN tar xvzf /wordpress.tar.gz

VOLUME /var/www/html

USER 997
EXPOSE 8080
CMD ["/bin/sh", "/run_apache.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Wordpress" \
      io.k8s.display-name="wordpress apache centos7 epel" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,wordpress,apache" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
