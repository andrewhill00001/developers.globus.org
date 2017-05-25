#!groovy

node ('master') {
    def gitcommit = ""

    stage ('clone from GitHub') {
        sshagent(['github-ssh-key']) {
            checkout scm
        }
        gitcommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
    }

    stage ('upload') {
        // only actually upload if `origin/master` was just updated
        sshagent(['github-ssh-key']) {
            sh """
            git fetch
            if [ "\$(git show-ref "origin/master" | cut -d' ' -f1)" = "$gitcommit" ];
            then
                make upload
            fi
            """
        }
    }
}
