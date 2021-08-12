#!/bin/bash

# `ifconfig + grep` get all IP addr (exclude loop)
# count ip = 1, return ip_str
# count ip > 1, echo ip list for selecting.
# return selected_ip_address

function select_ip()
{
        local ip_str=$(LC_ALL=C ifconfig|grep "netmask"|grep -v 127.0.0.1|cut -d: -f2 | awk '{ print $2}')
        local ip_array=(${ip_str})
        local ip_count=${#ip_array[@]}

        if [ ${ip_count} -le 1 ]
        then
            local ip=${ip_str}
        else
            let local n=1;
            for item in ${ip_array[*]}
            do
                    echo " ${n}) - $item"
                    let n=$n+1
            done
            while true
            echo -n "Choose ip address to use, please input number [1-$ip_count]: "
            read num
            do
                if [[ "$num" =~ ^[1-9]+$ ]]; then
                    # if [[ "$num" =~ ^[1-2]+$ ]]
                    if [ $num -le $ip_count -a $num -ge 1 ]
                    then
                        local ip=${ip_array[$num-1]}
                        break;
                    else
                        echo "Invalid input '$num'."
                    fi
                else
                    echo "Invalid input '$num'."
                fi
            done
        fi
        selected_ip_address=${ip}
}

select_ip
echo $selected_ip_address