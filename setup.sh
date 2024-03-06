# setup script

oc new-project lobster

oc new-project orange
oc new-app --name orange --docker-image quay.io/redhattraining/hello-world-nginx:v1.0
oc expose svc orange

oc new-project scaling
oc new-app --name scaling --docker-image quay.io/redhattraining/hello-world-nginx:v1.0
oc expose svc scaling

oc new-project secure
oc new-app --name secure --docker-image quay.io/redhattraining/hello-world-nginx:v1.0
oc expose svc secure

oc new-project project1
oc new-app --name=gitlab --image=quay.io/redhattraining/gitlab-ce:8.4.3-ce.0
oc expose gitlab

oc new-project czech
oc new-app --name=ernie --image=quay.io/redhattraining/hello-openshift
oc expose ernie

oc new-project sydney
oc new-project atlas
oc new-project marathan

oc new-project apples
oc new-app --name oranges --docker-image quay.io/redhattraining/gitlab-ce:8.4.3-ce.0
oc patch svc oranges -p '{"spec":{"selector":{"deployment":"orange"}}}'
oc expose svc oranges

oc new-project ronic
oc create deployment cherry --image quay.io/redhattraining/hello-world-nginx:v1.0
oc expose svc cherry
oc set resources --requests memory=80Gi deployment cherry
oc scale --replicas=0 deployment cherry
oc scale --replicas=1 deployment cherry
echo "completed"
