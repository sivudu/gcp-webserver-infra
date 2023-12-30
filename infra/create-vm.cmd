set SERVER_NAME=sivashankar-dev-web-server
set ZONE=us-west1-b
set STARTUP_SCRIPT_URL=https://raw.githubusercontent.com/sivudu/gcp-webserver-infra/main/infra/000-startup-n-git.sh

gcloud compute instances create %SERVER_NAME% \
    --project=website-376021 \
    --zone=us-west1-b \
    --machine-type=e2-small \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --no-restart-on-failure \
    --maintenance-policy=TERMINATE \
    --provisioning-model=SPOT \
    --instance-termination-action=STOP \
    --service-account=316452042845-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/debian-cloud/global/images/debian-11-bullseye-v20231212,mode=rw,size=40,type=projects/website-376021/zones/us-west1-b/diskTypes/pd-standard \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any
    --metadata-from-file=startup-script=%STARTUP_SCRIPT_URL%

