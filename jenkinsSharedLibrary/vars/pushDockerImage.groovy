def getCommitHash() {
    return sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
}
def pushDockerImage(String DOCKER_REGISTRY, String DOCKER_IMAGE, String imageTagApp) {
    def COMMITHASH = getCommitHash() 
    withCredentials([usernamePassword(credentialsId: params.credentialsId, usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD')]) {
        sh "echo \${DOCKER_REGISTRY_PASSWORD} | docker login -u \${DOCKER_REGISTRY_USERNAME} --password-stdin"
        sh "docker push docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${COMMITHASH}"
    }
    return COMMITHASH
}
