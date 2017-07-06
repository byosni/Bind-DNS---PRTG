#!/bin/bash
#script para caputar dos dados de Stats do Bind e criar o arquivo para o PRTG.
#criado por Osni Silva.

#faz download do arquivo named.log do meu servidor bind. lembrando que a porta ssh do meu servidor é 2222 por isto -p 2222
lftp -e "mirror /var/log/named /var/www/html;quit" -p 2222 -u login,senha sftp://ipdoservidordedns-bind

#limpa o arquivo /var/www/html/prtg.txt
rm -rf /var/www/html/prtg.txt

#pega as váriaveis e gera os canais
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "A" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "NS" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "CNAME" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "SOA" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "PTR" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "HINFO" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "MX" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "TXT" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "AAAA" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
echo ; grep "Cache DB" /var/www/html/named.log -A 16 | grep "SRV" | awk '{print "[" $1 "]" }' | sed -n '1p' >> /var/www/html/prtg.txt
