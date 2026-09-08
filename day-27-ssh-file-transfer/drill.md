# Day 27 Practice Drill

## Task
Generate an SSH key pair, copy the public key to a remote host, connect
without a password, then securely copy a file to and from that server.

## Environment
Real remote target: an AWS EC2 Ubuntu 24.04 instance (from Day 14),
connected from the Ubuntu VM used throughout this challenge.

## Commands run (in order)
1. ssh ubuntu@18.202.133.35 → FAILED: Permission denied (publickey) —
   this VM had never been authorized on the remote server
2. ssh-keygen -t ed25519 → generated a real new keypair (id_ed25519)
3. ssh-copy-id ubuntu@18.202.133.35 → FAILED: no existing way to log in
   yet, so ssh-copy-id had nothing to authenticate with
4. Transferred the original ZEETAFIN-KEYPAIR.pem to the VM via shared
   folder, chmod 400 applied
5. ssh -i ~/.ssh/ZEETAFIN-KEYPAIR.pem ubuntu@18.202.133.35 → SUCCESS,
   established a genuine working credential (after fixing a syntax error
   where the key path and hostname were incorrectly glued together)
6. ssh-copy-id -i ~/.ssh/id_ed25519.pub -o "IdentityFile ..." ubuntu@...
   → reported "all keys already exist" — genuinely misleading; verified
   directly and confirmed the new key was NOT actually present
7. cat ~/.ssh/id_ed25519.pub | ssh -i ZEETAFIN-KEYPAIR.pem ... "cat >>
   ~/.ssh/authorized_keys" → manually appended the new key, bypassing
   ssh-copy-id's incorrect assessment
8. Verified via cat ~/.ssh/authorized_keys → confirmed both keys now present
9. ssh -i ~/.ssh/id_ed25519 ubuntu@18.202.133.35 → SUCCESS, connected
   instantly with no password or passphrase prompt
10. scp -i id_ed25519 ~/README ubuntu@...:~/kernel-readme.txt → real file
    copied TO the server
11. scp -i id_ed25519 ubuntu@...:~/kernel-readme.txt ~/from-ec2.txt →
    same file copied back FROM the server, confirmed identical size
12. ssh -i id_ed25519 -p 22 ubuntu@... "hostname" → confirmed explicit
    port specification works
13. sftp -i id_ed25519 ubuntu@18.202.133.35 → interactive session, ls
    confirmed the earlier uploaded file, exited with bye
14. rsync -avz -e "ssh -i id_ed25519" ~/README ubuntu@...:~/rsync-test.txt
    → real sync with compression stats and speedup ratio
15. Added a Host entry to ~/.ssh/config → confirmed ssh ec2test "hostname"
    works as a shortcut, no need to specify IP/user/key manually anymore
16. ssh ec2test "sudo grep -E '...' /etc/ssh/sshd_config" → real finding:
    PasswordAuthentication and PermitRootLogin lines are commented out,
    meaning the server relies on Ubuntu's defaults rather than explicit,
    intentional hardening

## Result
Full drill completed genuinely end-to-end, including real obstacles: a
new key generated, correctly installed on a real remote server (after
working around a misleading ssh-copy-id result), passwordless login
proven, and a complete bidirectional file transfer confirmed with scp,
further demonstrated with sftp and rsync. Closed with a real security
observation about the server's SSH hardening posture.

## Problem encountered and fix
- ssh-copy-id could not run at all until an existing valid credential
  (the original .pem key) was made available — a foundational lesson:
  the tool automates an existing login, it doesn't create one from nothing.
- ssh-copy-id then reported the new key already existed when it did not —
  worked around by manually appending the public key via a piped ssh
  command, and verifying the actual remote file state directly rather
  than trusting the tool's summary message.
- A syntax slip glued a key path and hostname into one argument
  (-i keyfile@host instead of -i keyfile user@host) — corrected on retry.
</parameter>
