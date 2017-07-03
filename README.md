node-info: Basic OpenShift build & deployment
===============================================

## What's this?

This simple application shows basic information about the wildfly node that is handling the request.
More importantly, my version demonstrates how easy it is to build and deploy a continer using OpenShift.

## Requirements
~~It should be running on WildFly/JBoss EAP applciation servers.~~

Nope, we are building a container that includes all the requirements.


## How to use it

Before you do anything, you should fork this repo to your own account.
As you can then add all the webhook stuff to auto-trigger the builds.

Now, download the forked repo you created, and modify the oc pipeline specification file.
Edit openshift/oc_pipeline_build_config.yaml.
Replace ***https://github.com/rossillingworth/node-info.git*** with the url of your new repo.
Then commit and push it.

Next install Minishift onto your computer. [Instructions are here.](https://docs.openshift.org/latest/minishift/getting-started/index.html).

Warning, you may need to install KVM or similar first.

Now, Start Minishift. It will start a VM with OpenShift, and you'll be logged in automatically.
You will need to make the CLI available on the cmd line.
Finally install all the build config stuff...

:>minishift start
:>eval $(minishift oc-env)
:>oc new-app openshift/oc_pipeline_build_config.yaml

NB: if you want an autotriggered webhook from GitHub, you will need to add the secrets to the yaml file.


## Example output

    $ curl -s http://localhost:8080/node-info/
    Hostname: 375008c3de0d
    Java Runtime: OpenJDK Runtime Environment 1.7.0_45-mockbuild_2013_10_22_03_37-b00
    OS: Linux amd64 3.13.6-200.fc20.x86_64

## License

All files listed in this repository are licensed under [MIT license](http://opensource.org/licenses/MIT).
