# openshift-wordpress

Template for running a wordpress container.

# Installation

You need oc (li tool) locally installed

####Create a new project
```sh
oc new-project openshift-wordpress \
    --description="Wordpress on openshift" \
    --display-name="Wordpress"
```
####Clone the repository
```sh
git clone https://github.com/ure/openshift-wordpress.git
```

####Create a PersistentVolumeClaim
```sh
oc create -f GlusterFS-Cluster.yaml
oc create -f PersistentVolumeClaim.yaml
```

####Build Wordpress app

```sh
oc create -f BuildConfig.yaml
oc create -f DeploymentConfig.yaml
oc new-app https://github.com/ure/openshift-wordpress.git
oc start-build openshift-wordpress
```

####Build a dynamic Route
```sh
oc create -f Route.yaml
```

####Build a static Route
(for production and optionally delete the development route)
```sh
oc delete -f Route.yaml
oc create -f ProductionRoute.yaml
```

####Optionally for deployments from a private repository
###Create a new repository
###Modify sources to your repository name
```sh
perl -i -pe 's/openshift-wordpress/yourreponame/g' *
```

###Generate BuildConfig
```sh
rm -f BuildConfig.yaml
./genwebhooksecret.
```

###Create an ssh deploy key without passphrase
```sh
ssh-keygen -f ~/.ssh/openshift-wordpress
cat ~/.ssh/openshift-wordpress.pub
```
add output to the deployment keys on your private repository

###Add your secrets to your project
```sh
oc secrets new-sshauth openshift-wordpress --ssh-privatekey=/home/joeri/.ssh/openshift-wordpress
oc secrets add serviceaccount/builder secrets/openshift-wordpress
```
###Deploy from private git repository
```sh
oc new-app .
```
