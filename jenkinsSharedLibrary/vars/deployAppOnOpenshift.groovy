def deployAppOnOpenshift(String OPENSHIFT_SERVER, String OPENSHIFT_PROJECT, String DOCKER_IMAGE, String imageTagApp, String APP_SERVICE_NAME) {
    withCredentials([string(credentialsId: 'openshift-login-token', variable: 'OPENSHIFT_SECRET')]) {
        sh "oc login --token=\${OPENSHIFT_SECRET} --server=${OPENSHIFT_SERVER} --insecure-skip-tls-verify"
        sh "oc project ${OPENSHIFT_PROJECT}"
        sh "oc delete dc,svc,deploy,ingress,route ${DOCKER_IMAGE} || true"
        sh "oc new-app ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp} --token=\${OPENSHIFT_SECRET}"
        sh "oc expose service/${APP_SERVICE_NAME}"
    }
}
