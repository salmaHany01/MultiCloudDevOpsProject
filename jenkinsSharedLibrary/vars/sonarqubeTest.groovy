def sonarqubeTest() {
   withSonarQubeEnv() {
      sh "./gradlew sonar"
    }
}