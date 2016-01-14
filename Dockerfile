FROM centos:7
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install httpd wget && yum clean all -y

# web content
#ADD html /var/www/html

#RUN chmod -R ugo+r /var/www

ADD httpd.conf /

ADD run_apache.sh /

RUN rm -fr /run/httpd; ln -sf /tmp/run/httpd /run/httpd

RUN wget https://wordpress.org/latest.zip

VOLUME /var/www/html

USER 997
EXPOSE 8080
CMD ["/bin/sh", "/run_apache.sh"]
#CMD ["/bin/sh", "-x", "/test.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Wordpress" \
      io.k8s.display-name="wordpress apache centos7 epel" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,wordpress,apache" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
