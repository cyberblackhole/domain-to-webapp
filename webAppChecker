#/bin/bash

yellow=`tput setaf 3`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
substatus=0

banner(){
	figlet -t Domain to WebApp
}

create_files(){
	touch ${1}_subfinderdomains.txt ${1}_filtereddomains.txt ${1}_lookup.txt ${1}_online.txt ${1}_webapps.txt ${1}_results.lst ${1}_online.lst
	chmod 666 ${1}_subfinderdomains.txt ${1}_filtereddomains.txt ${1}_lookup.txt ${1}_online.txt ${1}_webapps.txt ${1}_results.lst ${1}_online.lst
}

subfinder(){
	echo "${green}[+] Started subfinder for ${1} ${reset}"
	echo "${yellow}[!] Please be patient this might take a while depending on the domain: ${1} ${reset}"
	docker run -v $HOME/.config/subfinder:/root/.config/subfinder -it subfinder -d $1 | grep -E "^(([a-zA-Z0-9](-?[a-zA-Z0-9])*)\.)*[a-zA-Z0-9](-?[a-zA-Z0-9])+\.[a-zA-Z0-9]{2,}" | tee -a $1_subfinderdomains.txt
	if [ $?==0 ]
        then
                echo "${green}[+] Successfully completed subfinder for ${1}${reset}"
		substatus=0
		sort $1_subfinderdomains.txt | uniq | sed 's/^\.//' > ${1}_filtereddomains.txt
        else
                echo "${red}[!] Oops! problem where encountered by subfinder for ${1}  ${reset}"
                substatus=1
        fi
}

lookup(){
	echo "${green}[+] IP Address Lookup Started for above sub-domains ${reset}"
	cat ${1}_filtereddomains.txt | while read line
	do
	        nslookup ${line%?} >/dev/null
	        if [ $?==0 ]
	        then
	                nslookup ${line%?} | grep -e "Name" -e "Address" | awk 'NR==2,NR==3 {printf "%s|",$2}'
	                printf "\n"
	        fi
	done | grep -E "[a-zA-Z0-9]" | tee ${1}_lookup.txt
}


onlinedomains(){
	echo "${green}[+] Checking WebApplication for above sub-domains ${reset}"
	cat ${1}_lookup.txt | cut -d "|" -f 1 | while read line
	do
	        curl -L -I -s --connect-timeout 3 "http://"${line}"/" | grep "Location" | cut -d " " -f 2 | tee -a ${1}_online.txt
	done
	echo "${green}Successfully completed Web-App Enumeration${reset}"
	cat ${1}_online.txt | sort | uniq >> ${1}_webapps.txt
}

cleanup(){

	cat ${1}*.txt > ${1}_results.lst
	cat ${1}_webapps.txt > ${1}_online.lst
	rm ${1}*.txt
	echo "${green}[+] Output saved to ${1}_results.lst and ${1}_webapps.lst ${reset}"
}

banner
create_files $1
subfinder $1
if [ sub_status==0 ]
then
	lookup $1
	onlinedomains $1
fi
cleanup $1

