#/bin/bash

green=`tput setaf 2`
reset=`tput sgr0`

subfinder(){
	echo "${green}[+] Started subfinder for ${1} ${reset}"
	docker run -v $HOME/.config/subfinder:/root/.config/subfinder -it subfinder -d $1 | grep $1 | sed -n '3,$p' >> ${1}_subfinder.txt
	sed 's/^\.//' ${1}_subfinder.txt > ${1}_subfinderdomains.txt 
}

lookup(){
	echo "${green}[+] Lookup Started ${reset}"
	cat ${1}_subfinderdomains.txt | while read line
	do
	        nslookup ${line%?} >/dev/null
	        if [ $?==0 ]
	        then
	                nslookup ${line%?} | grep -e "Name" -e "Address" | awk 'NR==2,NR==3 {printf "%-40s",$2}'
	                printf "\n"
	        fi
	done | grep -E "[a-zA-Z0-9]" | tee ${1}_lookup.txt
}


onlinedomains(){
	echo "${green}[+] Curl started ${reset}"
	cat ${1}_lookup.txt | cut -d " " -f 1 | while read line
	do
	        curl -L -I -s --connect-timeout 3 "http://"${line}"/" | grep "Location" | cut -d " " -f 2 >> ${1}_online.txt
	done
	echo "${green}Online Domains Are:${reset}"
	cat ${1}_online.txt | sort | uniq
}


subfinder $1
lookup $1
onlinedomains $1

