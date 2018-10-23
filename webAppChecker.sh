#/bin/bash

yellow=`tput setaf 3`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


banner(){
	figlet -t Domain to WebApp
}

subfinder(){
	echo "${green}[+] Started subfinder for ${1} ${reset}"
	echo "${yellow}[!] Please be patient this might take while depending on the domain: ${1} ${reset}"
	docker run -v $HOME/.config/subfinder:/root/.config/subfinder -it subfinder -d $1 >> $1_subfinderdomains.txt
	if [ $?==0 ]
        then
                echo "${green}[+] Successfully completed subfinder for ${1}${reset}"
        else
                echo "${red}[!] Oops! problem where encountered by subfinder for ${1}  ${reset}"
                return 1
        fi
	grep -E "^(([a-zA-Z0-9](-?[a-zA-Z0-9])*)\.)*[a-zA-Z0-9](-?[a-zA-Z0-9])+\.[a-zA-Z0-9]{2,}" $1_subfinderdomains.txt | sort | uniq | sed 's/^\.//' | tee ${1}_filtereddomains.txt
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
	        curl -L -I -s --connect-timeout 3 "http://"${line}"/" | grep "Location" | cut -d " " -f 2 | tee ${1}_online.txt
	done
	echo "${green}Online Domains Are:${reset}"
	cat ${1}_online.txt | sort | uniq | tee ${1}_webapps.txt
}

cleanup(){
	cat ${1}*.txt > ${1}_results.lst
	cat ${1}_webapps.txt > ${2}_webapps.lst
	rm ${1}*.txt
	echo "${green}[+] Output saved to ${1}_webapps.lst ${reset}"
}

sub_status=0
banner
sub_status= subfinder $1
if [ sub_status==0 ]
then
	lookup $1
	onlinedomains $1
fi
cleanup $1

