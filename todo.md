add "abuse" pool to dnsdist, addAction(MaxQPSIPRule(15), PoolAction("abuse"))
instead of ouright blocking abusive ips... send them to google

use local variable saved to disk for dnscrypt cert serial number

make script to push certs on renewal from cert manager vps to resolver servers and restart services

remove prometheus from resolver servers and create prometheus server on cert manager vps
