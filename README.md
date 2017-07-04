node-info: Basic OpenShift build and deployment
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

Now, Start Minishift. WARNING: this will download a VM image, so takes a while the first time. 
It will start a VM with OpenShift, and you'll be logged in automatically.
You will need to make the CLI available on the cmd line.

Finally install all the build config stuff...

    >minishift start
    >eval $(minishift oc-env)
    >oc new-app openshift/oc_pipeline_build_config.yaml

NB: if you want an autotriggered webhook from GitHub, you will need to add the secrets to the yaml file.
Otherwise, I would suggest you log into Jenkins and add polling to the job.
 
### Login
  You can login to OpenShift and Jenkins using: developer/developer or admin/admin
  
  You will see the Openshift URL displayed when you start minishift, 
  the Jenkins URL can be found from the Openshift UI (look under Applications/Routes) 
  
  Login at the cli, so you can use the cli tooling ...

  >oc login -u system:admin

### In another terminal

   if you are unable to access the OC cli in another terminal...
   
   >eval $(minishift oc-env)
   

# Thoughts

## Pro's
It works straight out the box, great for a beginner.

Each team (Project) can have their own jenkins box

## Con's
Openshift is designed for CD, and needs modification to work with a distributed monolith and release management.

Privilege escalation is required to allow docker to run in a jenkins slave, and it is hard (this may be a good thing)

BuildConfig is unable to provision Multibranch-Pipeline

BuildConfig is unable to create a polling job

ImageStreams are observing implicit versions (ie: latest), which means that the deployed versions are implicit. 
This means it may be non-repeatable, ie: non-deterministic.



## Example output

    $ curl -s http://localhost:8080/node-info/
    Hostname: 375008c3de0d
    Java Runtime: OpenJDK Runtime Environment 1.7.0_45-mockbuild_2013_10_22_03_37-b00
    OS: Linux amd64 3.13.6-200.fc20.x86_64

## License

All files listed in this repository are licensed under [MIT license](http://opensource.org/licenses/MIT).
