

#
# docker tests
#

dockerBuild:
    cd docker; /
    docker build --tag=wildfly-app .

dockerRun:
    docker run -it --rm wildfly-app .

dockerRunAdmin:
    docker run -it wildfly-app /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement=0.0.0.0


#
# oc tests
#

ocInstallPipelineBuildConfig:
    oc create -f openshift/oc_build_config.yaml