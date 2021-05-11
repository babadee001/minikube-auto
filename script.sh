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
minikube start
minikube addons enable ingress
eval $(minikube -p minikube docker-env)
docker build -t signavio-app1 ./app1
docker build -t signavio-app2 ./app2
kubectl config use-context minikube
kubectl apply -f app1/deployment.yaml
kubectl apply -f app2/deployment.yaml 
kubectl apply -f app1/service.yaml
kubectl apply -f app2/service.yaml
kubectl apply -f ingress.yaml

ingressIP=$(minikube ip)

sudo -- sh -c "echo ${ingressIP} temidayooyedele.signavio >> /etc/hosts"
# sudo echo "${ingressIP} temidayooyedele.signavio" >> /etc/hosts
