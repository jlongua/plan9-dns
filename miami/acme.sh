```sh
apt install socat
```
ok vultr has rolled out a new api v2 so no more dns challenge for certs...
but acme,sh saves the day again with alias mode!
Using a provider with a supported api I can issue certs for my vultr hosts.
Looks like I can register a domain with namesilo and user their api with acme.sh to manipulate the dns records.
Hopefully they don't have any limits using their api like namecheap.

