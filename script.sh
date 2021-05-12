#!/bin/sh

#Install hyperkit if not installed and set as minikube's vm-driver. Hyperkit is a MacOS hypervisor. This is required for the ingress addon
if ! command -v hyperkit &> /dev/null
then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
    && chmod +x docker-machine-driver-hyperkit \
    && sudo mv docker-machine-driver-hyperkit /usr/local/bin/ \
    && sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit \
    && sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit
    exit
fi
minikube config set vm-driver hyperkit

#start minikube and enable minikube ingress
minikube start
minikube addons enable ingress

#Use minikube kubectl config and the docker env within minikube and not that of the host machine
kubectl config use-context minikube
eval $(minikube -p minikube docker-env)

#build the docker images within minikube and apply the deployments, service and ingress
docker build -t signavio-app1 ./app1
docker build -t signavio-app2 ./app2

kubectl apply -f app1/deployment.yaml
kubectl apply -f app2/deployment.yaml 

kubectl apply -f app1/service.yaml
kubectl apply -f app2/service.yaml

kubectl apply -f ingress.yaml

minikubeIP=$(minikube ip)

HOSTNAME="temidayooyedele.signavio"
ETC_HOSTS=/etc/hosts

#if the chosen HOSTNAME is already in the /etc/hosts file, replace it
if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
    then
        echo "$HOSTNAME previously set in ETC_HOSTS, Removing now...";
        sudo sed -i".bak" "/$HOSTNAME/d" $ETC_HOSTS
    fi
sudo -- sh -c "echo ${minikubeIP} $HOSTNAME >> /etc/hosts"
