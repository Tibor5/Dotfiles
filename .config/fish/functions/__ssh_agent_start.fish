function __ssh_agent_start --description "Start a new ssh agent"
    ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
    chmod 600 $SSH_ENV
    source $SSH_ENV >/dev/null
end
