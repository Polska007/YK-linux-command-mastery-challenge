# Commands - Day 27

## ssh
Connects to a remote machine's shell over an encrypted connection.

## ssh -p
Specifies a custom port when SSH isn't running on the default port 22.

## ssh -i
Specifies which private key file to use for authentication.

## ssh-keygen
Generates a new SSH keypair — a public key (shareable) and a private key (kept secret).

## ssh-copy-id
Automates copying a public key to a remote server's authorized_keys file — requires an existing way to log in first.

## scp
Securely copies files between machines over SSH, in either direction.

## sftp
An interactive, FTP-like file transfer session running over SSH.

## rsync
An efficient file sync tool that only transfers differences between source and destination, with detailed transfer statistics.

## ~/.ssh/config
A per-user client-side config file defining shortcuts (host, user, key) for specific remote servers.

## sshd_config hardening
The server-side SSH configuration file (/etc/ssh/sshd_config) controlling authentication methods, root login policy, and other security settings.
