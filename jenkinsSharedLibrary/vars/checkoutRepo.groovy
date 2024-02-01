def checkoutRepo(String repoUrl, String branch) {
    echo "Checking out repository ${repoUrl} at branch ${branch}"
    git url: repoUrl, branch: branch
}
