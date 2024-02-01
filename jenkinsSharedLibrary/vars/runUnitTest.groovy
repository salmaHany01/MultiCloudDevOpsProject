def runUnitTest() {
    sh "chmod +x ./gradlew"
    sh "./gradlew test --stacktrace"
}
