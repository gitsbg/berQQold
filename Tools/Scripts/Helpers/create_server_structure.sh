#!/bin/bash
base_path=${PWD}
server_dir="../../../Server"
share_dir="${server_dir}/Share"
channels_dir="${server_dir}/Channels"
logs_dir="${server_dir}/Logs"
# Fonksiyonlar
create_folder()
{
    if [[ -d ${1}/${2} ]]
    then
        printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
        echo -e "\e[33mDirectory exist !!!\e[0m\t\t\e[1m${1}/${2}\e[0m"
    else
        printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
        echo -e "\e[32mDirectory created...\e[0m\t\t\e[1m${1}/${2}\e[0m"
        mkdir "${1}/${2}"
    fi
    wait
}
create_link()
{
    if [[ -L ${1}/${2} ]]
    then
        printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
        echo -e "\e[32mSymlink exist!!!\e[0m\t\e[1m$1\e[0m"
        echo -e "\e[0m\e[1m${3} -> \t\e[35m${2}\e[0m"
    else
        printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
        echo -e "\e[32mSymlink created for\e[0m\t\e[1m$1\e[0m"
        echo -e "\e[0m\e[1m${3} -> \t\e[35m${2}\e[0m"
        ln -s "${2}" "${1}/${3}"
    fi
    wait
}
clear
rm -rf ${channels_dir}
rm -rf ${logs_dir}
create_folder "${server_dir}" "Channels"
create_folder "${server_dir}" "Logs"
create_folder ${channels_dir} "Ch_dev"
create_folder ${channels_dir} "Ch_db"
create_folder ${channels_dir} "Ch_99"
create_folder ${channels_dir} "Ch_auth"
for q in 1 2 3 4; do
    create_folder ${channels_dir} "Ch_${q}"
done
for w in 1 2 3 4; do
    for e in 1 2 3 4; do
        create_folder "${channels_dir}/Ch_${w}" "C_${e}"
    done
done
for r in 1 2 3 4; do
    for t in 1 2 3 4; do
        create_folder "${logs_dir}" "Ch_${r}_C_${t}"
    done
done
for t in "dev" "99" "auth" "db"; do
    create_folder "${logs_dir}" "Ch_${t}"
done
# Linking for cores
for q in 1 2 3 4; do
    for w in 1 2 3 4; do
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Share/package" "package"
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Share/data" "data"
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Share/mark" "mark"
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Share/locale" "locale"
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Share/Bin/GAME" "game_Ch_${q}_C_${w}"
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Share/Configs/Ch_${q}_C_${w}_CONFIG" "CONFIG"
        create_link "${channels_dir}/Ch_${q}/C_${w}" "../../../Logs/Ch_${q}_C_${w}" "log"
    done
done
# Linking for unique channels
for q in "dev" "99" "auth" "db"; do
    create_link "${channels_dir}/Ch_${q}" "../../Share/package" "package"
    create_link "${channels_dir}/Ch_${q}" "../../Share/data" "data"
    create_link "${channels_dir}/Ch_${q}" "../../Share/mark" "mark"
    create_link "${channels_dir}/Ch_${q}" "../../Share/locale" "locale"
    create_link "${channels_dir}/Ch_${q}" "../../Logs/Ch_${q}" "log"
    if [[ $q == "db" ]]; then
        create_link "${channels_dir}/Ch_${q}" "../../Share/Bin/DB" "db"
        create_link "${channels_dir}/Ch_${q}" "../../Share/Configs/Ch_${q}_CONFIG" "conf.txt"
        create_link "${channels_dir}/Ch_${q}" "../../Share/Protos/item_proto.txt" "item_proto.txt"
        create_link "${channels_dir}/Ch_${q}" "../../Share/Protos/item_names.txt" "item_names.txt"
        create_link "${channels_dir}/Ch_${q}" "../../Share/Protos/mob_proto.txt" "mob_proto.txt"
        create_link "${channels_dir}/Ch_${q}" "../../Share/Protos/mob_names.txt" "mob_names.txt"

    else
        create_link "${channels_dir}/Ch_${q}" "../../Share/Bin/GAME" "game_Ch_${q}"
        create_link "${channels_dir}/Ch_${q}" "../../Share/Configs/Ch_${q}_CONFIG" "CONFIG"
    fi
done
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo -e "\e[32mSERVER STRUCTURE DONE...\e[0m"