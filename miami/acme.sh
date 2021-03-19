```sh
apt install socat
```
ok, vultr has rolled out a new api v2 so no more dns challenge for certs...
but I can use acme.sh with alias mode and a supported domain registrar.
I have registered a domain with namesilo and have succesfuly used their api with acme.sh to manipulate the dns records.
So looking for someone with python skills to redo the acme.sh or lexicon to work with vultr v2 api.
I put in a pull request for lexicon and looks like I was elected! Unfortunately I can barely write bash scripts...
