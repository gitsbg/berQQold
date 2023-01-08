#!/bin/bash
server_dir="../../../Server"
channels_dir="${server_dir}/Channels"
# Kendisine yollanan argüman ile bir kanalı veya kanal core'larını başlatır.
clear
hline()
{
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}
start_pid()
{
	if [[ $1 == 1 ]] || [[ $1 == 2 ]] || [[ $1 == 3 ]] || [[ $1 == 4 ]]
	then
		hline
		for q in 1 2 3 4
		do
			pid_dir=${channels_dir}/Ch_${1}/C_${q}
			pid=${pid_dir}/pid
			if [[ -e ${pid} ]]
			then
				pid_value=`cat ${pid}`
				if ps -p ${pid_value} > /dev/null
				then
					echo -e "\e[1mChannel ${1} Core ${q}\e[0m\t\t\e[33mALREADY RUNNING...\e[0m"
				else
					cd ${pid_dir} && ./game_Ch_${1}_C_${q} &
					sleep 3
					echo -e "\e[1mChannel ${1} Core ${q}\e[0m\t\t\e[32mSTARTED\e[0m"
				fi
			else
				cd ${pid_dir} && ./game_Ch_${1}_C_${q} &
				sleep 3
				echo -e "\e[1mChannel ${1} Core ${q}\e[0m\t\t\e[32mSTARTED\e[0m"
			fi
		done
	elif [[ $1 = "db" ]]
	then
		pid_dir=${channels_dir}/Ch_${1}
		pid=${pid_dir}/pid
		if [[ -e ${pid} ]]
		then
			pid_value=`cat ${pid}`
			if ps -p ${pid_value} > /dev/null
			then
				hline
				echo -e "\e[1mDB\e[0m\t\t\e[33mALREADY RUNNING...\e[0m"
			else
				hline
				cd ${pid_dir} && ./db &
				sleep 10
				echo -e "\e[1mDB\e[0m\t\t\e[32mSTARTED\e[0m"
			fi
		else
			hline
			cd ${pid_dir} && ./db &
			sleep 10
			echo -e "\e[1mDB\e[0m\t\t\e[32mSTARTED\e[0m"
		fi
	elif [[ "$1" = "dev" ]] || [[ "$1" = "auth" ]] || [[ "$1" == 99 ]]; then
		pid_dir=${channels_dir}/Ch_${1}
		pid=${pid_dir}/pid
		if [[ -e ${pid} ]]
		then
			pid_value=`cat ${pid}`
			if ps -p ${pid_value} > /dev/null
			then
				hline
				echo -e "\e[1mChannel ${1}\e[0m\t\t\e[33mALREADY RUNNING...\e[0m"
			else
				hline
				cd ${pid_dir} && ./game_Ch_${1} &
				sleep 3
				echo -e "\e[1mChannel ${1}\e[0m\t\t\e[32mSTARTED\e[0m"
			fi
		else
			hline
			cd ${pid_dir} && ./game_Ch_${1} &
			sleep 3
			echo -e "\e[1mChannel ${1}\e[0m\t\t\e[32mSTARTED\e[0m"
		fi
	else
		clear
		echo -e "\e[1m${1}\e[0m\t\t\e[31mERROR\e[0m"
		hline
	fi
}
# workers
start_pid "db"
start_pid "${1}"