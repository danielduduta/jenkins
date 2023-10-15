FROM jenkins/jenkins:lts-jdk11

VOLUME [ "/var/jenkins_home" ]

USER jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/jenkins.yaml

COPY files/jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

COPY files/InitialConfig.groovy /usr/share/jenkins/ref/init.groovy.d/InitialConfig.groovy

COPY files/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

