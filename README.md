# Bind-DNS-PRTG
Captura variáveis do arquivo de stats do bind e gerar arquivo de configuração para ser capturado e gerado gráfico para o PRTG.

1. Edtar o arquivo no servidor de DNS:
    "root@dns:/# nano /etc/bind/named.conf.options"

incluir: 

        zone-statistics yes;
        statistics-file "/var/log/named/named.log";

2. ir até /var/log/named, executar o comando:
    "root@dns:/var/log/named# rndc stats"

verificar se o arquivo ficou assim: 

    +++ Statistics Dump +++ (1499366581)
    ++ Incoming Requests ++
                40386068 QUERY
                       1 STATUS
                      98 UPDATE
    ++ Incoming Queries ++
                33939822 A
                   50216 NS
                    2649 CNAME
                    8960 SOA
                 1182413 PTR
                  524090 MX
                  136993 TXT
                 4455733 AAAA
                   67314 SRV
                      30 NAPTR
                       6 A6
                      45 DS
                       9 DNSKEY
                   12111 SPF
                    4964 ANY
    ++ Outgoing Queries ++
    [View: default]
             7152922 A
               96248 NS
                 472 CNAME
                1162 SOA
               62979 PTR
              727373 MX
               67316 TXT
             1581883 AAAA
                3417 SRV
                  19 NAPTR
             1019773 DS
               36176 DNSKEY
                 341 ANY
