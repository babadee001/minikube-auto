# signaviocmicro


This repo setup a microservice on minikube using hyperkit as vm driver and automated with a simple script. 
The first service(app1) implemnents a piece of software exposing a JSON document when visited. The second service(app2)
utilizes the first and displayes a fully reversed message text rendered dynamically.

# Requirements

* [Minikube on macOS](https://github.com/kubernetes/minikube)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)
* 

# Set up/Installation

* Make sure you have everything as listed in the requirements section.
* Run/execute the `script.sh` file. Like `./script.sh` for example
* The last past of the script requires admin permission and will ask for your mac's password. This is so the `/etc/hosts` file can be modified.
* When done, visit `http://temidayooyedele.signavio` to access the deployed application. Routes/URL are listed in the API Routes/URLS sections.


# API Routes

`/` 
`/reversed`

# URLs

```
    http://temidayooyedele.signavio/
    http://temidayooyedele.signavio/reversed
```

# Built with

* [Minikube](https://github.com/kubernetes/minikube)
* [Nodejs](https://nodejs.org/en)
* [Kubernetes](https://kubernetes.io/)




# Improvements

Due to minikube underlying unique compatibility for different platform/OS, this setup is for macOS and can be improved by making it support more platforms.


