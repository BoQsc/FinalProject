Unsolved: It seems that `uniq` does not do its work, duplicated Source Packages are still shown for unknown reason.  


### List Source packages of the operating system (Using dpkg)
`cat /var/lib/dpkg/status | grep Source: | uniq -d`  
`cat /var/lib/dpkg/status | grep Description: | uniq -d`  
`dpkg-query -f '${Source:package;30}\n' -W | uniq -c -u`

𝐀𝐬 𝐚 𝐩𝐫𝐨𝐨𝐟, 𝐚 𝐭𝐞𝐫𝐦𝐢𝐧𝐚𝐥 𝐜𝐨𝐦𝐦𝐚𝐧𝐝: `apt-cache show binutils-common | grep Source` 𝐰𝐢𝐥𝐥 𝐬𝐡𝐨𝐰 𝐭𝐡𝐚𝐭 package 𝐛𝐞𝐥𝐨𝐧𝐠𝐬 𝐭𝐨 _binutils_ Source Package




```
dpkg-query(1)                     dpkg suite                     dpkg-query(1)

NAME
       dpkg-query - a tool to query the dpkg database

SYNOPSIS
       dpkg-query [option...] command

DESCRIPTION
       dpkg-query  is  a tool to show information about packages listed in the
       dpkg database.

COMMANDS
       -l, --list [package-name-pattern...]
              List  all  known  packages  matching  one  or   more   patterns,
              regardless  of  their status, which includes any real or virtual
              package referenced in any dependency relationship field (such as
              Breaks,  Enhances,  etc.).  If no package-name-pattern is given,
              list all packages in /var/lib/dpkg/status,  excluding  the  ones
              marked  as not-installed (i.e.  those which have been previously
              purged). 
```
