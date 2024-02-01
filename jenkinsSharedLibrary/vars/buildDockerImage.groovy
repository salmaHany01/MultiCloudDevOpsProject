def getCommitHash() {
    return sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
}
def buildDockerImage(String imageNameApp, String DOCKER_REGISTRY, String DOCKER_IMAGE) {
    def COMMITHASH = getCommitHash()
    sh "chmod +x gradlew"
    sh "docker build -t ${imageNameApp} ."
    sh "docker tag ${imageNameApp} docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${COMMITHASH}"
    return COMMITHASH 
}
