# copy docker file and application file from google cloud storage archive
gsutil cp gs://$PROJECT_ID/echo-web.tar.gz .
# unzip the archive 
tar -xvzf echo-web.tar.gz
# create cluster according to project specificatio.
gcloud container clusters create echo-cluster --num-nodes 2 --zone $ZONE --machine-type n1-standard-2
# Build a tagged Docker image
docker build -t echo-app:v1 .
# Authenticate docker
 gcloud auth configure-docker --quiet
# tag docker
docker tag echo-app:v1 "gcr.io/$PROJECT_ID/echo-app:v1"
# Push docker 
docker push "gcr.io/$PROJECT_ID/echo-app:v1"
# confirm the image is running.
gcloud container images list --repository="gcr.io/$PROJEC_ID"
gcloud container clusters get-credentials echo-cluster   --zone="$ZONE"   --project=$PROJECT_ID"
kubectl get nodes
kubectl create deployment echo-web   --image="gcr.io/$PROJECT_ID/echo-app:v1"
kubectl get deployments
 curl http://external ip
kubectl get service echo-web.
