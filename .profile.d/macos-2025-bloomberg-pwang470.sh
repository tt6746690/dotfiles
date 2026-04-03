# Bloomberg MacBook (user: pwang470)
source ~/.lcldevrc

export OPENAI_API_KEY=$(cat ~/.openai_api_key)
export PATH="/Library/TeX/texbin:$PATH"

init_conda "$HOME/miniconda3" "bash"

set_space_credentials() {
    printf "Enter SSH command (e.g. ssh pwang470-701c66.spaces -p 49719): "
    IFS= read -r ssh_cmd
    SPACE_REMOTE=$(awk '{print $2}' <<<"$ssh_cmd")

    printf "Enter AWS Secret Access Key: "
    IFS= read -r aws_secret
    ssh "$SPACE_REMOTE" \
        "umask 077; cat > ~/.aws_secret_access_key; chmod 600 ~/.aws_secret_access_key" \
        <<<"$aws_secret" \
        && echo "✅ AWS secret deployed."

    printf "Enter llm-client password: "
    IFS= read -r llm_client_password
    ssh "$SPACE_REMOTE" \
        "umask 077; cat > ~/.llm_role_pwd; chmod 600 ~/.llm_role_pwd" \
        <<<"$llm_client_password" \
        && echo "✅ llm-client password deployed."
}

push_space_creds() {
    printf "Enter SSH command (e.g. ssh user@host -p 2222): "
    read -r ssh_cmd
    remote=$(awk '{print $2}' <<<"$ssh_cmd")
    rsync -av ~/.space_credentials/ "$remote":~/.space_credentials/
    echo "✅ Deployed ~/.space_credentials to $remote:~/.space_credentials"
}
