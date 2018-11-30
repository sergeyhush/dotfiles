source "keybase decrypt -i ~/.mutt/sudakovich.passwords.keybase |"

set realname = "Sergey Sudakovich"

set imap_user = "sergey@sudakovich.com"
set imap_keepalive=60
set imap_passive=no
set imap_check_subscribed=yes
set imap_idle=yes
set mail_check=60

set from = "sergey@sudakovich.com"
set use_from = yes
set envelope_from = yes

# SSL hardening
set ssl_force_tls = yes
set ssl_starttls=yes
set ssl_use_sslv2=no
set ssl_use_sslv3=no
set ssl_use_tlsv1=no
set ssl_use_tlsv1_1=no
set ssl_use_tlsv1_2=yes
set ssl_verify_dates=yes
set ssl_verify_host=yes
set pgp_sign_as=0xDEADBEEF
set pgp_replyencrypt=yes
set pgp_timeout=1800


set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"

set header_cache = "~/.mutt/cache/sudakovich.com/headers"
set message_cachedir = "~/.mutt/cache/sudakovich.com/bodies"

set mail_check = 30
set move = no
set imap_keepalive = 900
set sort = threads
set editor = "vim"
