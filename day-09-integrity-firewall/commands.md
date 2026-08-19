# Commands - Day 9

## md5sum
Generates a 32-character MD5 checksum of a file's contents — a fingerprint for detecting accidental corruption, no longer considered secure for tamper-detection.

## sha256sum
Generates a 64-character SHA-256 checksum — the modern standard for verifying file integrity, especially for downloads.

## gpg --gen-key
Generates a new GPG keypair (public + private key) for encryption and digital signing.

## gpg --encrypt
Encrypts a file using a recipient's public key, producing a .gpg file only their matching private key can decrypt.

## gpg --decrypt
Decrypts a .gpg file back to its original content, using the holder's private key and passphrase.

## chattr +i
Sets the immutable attribute on a file — blocks modification, deletion, or renaming, even by root, until removed.

## lsattr
Shows special filesystem attributes (like the immutable flag) that ls -l cannot reveal.

## ufw enable
Turns on the Uncomplicated Firewall, blocking all traffic not explicitly allowed by default.

## ufw allow
Adds a rule permitting traffic through a specific port or service.

## ufw status
Shows the current firewall state and every active allow/deny rule.
