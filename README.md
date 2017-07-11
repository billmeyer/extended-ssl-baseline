# Extended SSL Baseline Profile

This InSpec profile extends the [dev-sec/ssl-baseline](https://github.com/dev-sec/ssl-baseline) profile to properly harden an Apache HTTPd SSL configuration.  Specifically, it skips the __enc-cbc__ control as Apache won't load properly if the following cipher suites aren't minimally specified:

```
SSLProtocol -all +TLSv1.2
SSLCipherSuite ALL:+HIGH:!RSA:!DH:!ADH:!EXP:!SSLv2:!SSLv3:!MEDIUM:!LOW:!NULL:!aNULL
```

resulting in the following runtime state:

```
Starting Nmap 6.40 ( http://nmap.org ) at 2017-07-11 15:45 CDT
PORT    STATE SERVICE
443/tcp open  https
| ssl-enum-ciphers:
|   SSLv3: No supported ciphers found
|   TLSv1.2:
|     ciphers:
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 - strong
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 - strong
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 - strong
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 - strong
|     compressors:
|       NULL
|_  least strength: strong

Nmap done: 1 IP address (1 host up) scanned in 0.19 seconds
```