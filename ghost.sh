#!/bin/bash
clear
if [ -z "$1" ]; then
    echo "Usage: bash ghost.sh domainname.com."
    exit 1
fi

admin_paths="/admin /admin.asp /admin/admin.asp /admin.aspx /admin/admin.aspx /admin.php /administrator /login.php /user /usuarios /usuario /cpanel /phpmyadmin /dashboard /cms /users /wp-login.php /admin/login /auth/login /moderator /webadmin /webmaster /adminarea /bb-admin /wp-admin /wp-login /wp-admin.php /userlogin /logins /login.html /adminLogin /admin_area /panel-administracion /instadmin /memberadmin /administratorlogin /panel /forum/admin /adm /cp /vue-element-admin /vue-admin-template /admin/cp.php /cp.php /admincontrol /admincp /admin/account.php /admin/index.php /admin/login.php /admin/admin.php /admin_area/admin.php /admin_area/login.php /siteadmin/login.php /siteadmin/index.php /siteadmin/login.html /admin/account.html /admin/index.html /admin/login.html /admin/admin.html /admin_area/index.php /dashboard.html /dashboard.php /bb-admin/index.php /bb-admin/login.php /bb-admin/admin.php /admin/home.php /admin_area/login.html /admin_area/index.html /admin/controlpanel.php /admincp/index.asp /admincp/login.asp /admincp/index.html /adminpanel.html /webadmin.html /webadmin/index.html /webadmin/admin.html /webadmin/login.html /admin/admin_login.html /admin_login.html /panel-administracion/login.html /administrator/index.php /administrator/login.php /nsw/admin/login.php /webadmin/login.php /admin/admin_login.php /admin_login.php /administrator/account.php /administrator.php /admin_area/admin.html /pages/admin /pages/admin/admin-login.php /admin/admin-login.php /admin-login.php"

IFS=' ' read -ra admin_paths <<< "$admin_paths"

echo "

░██████╗░██╗░░██╗░█████╗░░██████╗████████╗
██╔════╝░██║░░██║██╔══██╗██╔════╝╚══██╔══╝
██║░░██╗░███████║██║░░██║╚█████╗░░░░██║░░░
██║░░╚██╗██╔══██║██║░░██║░╚═══██╗░░░██║░░░
╚██████╔╝██║░░██║╚█████╔╝██████╔╝░░░██║░░░
░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═════╝░░░░╚═╝░░░ Admin Finder
=> Version: 1.0 Beta
=> Author Telegram: @Shinsegiru | @ShinsegiruProject

Simple shell script for found a admin login panel
"
sleep 3

for admin_path in "${admin_paths[@]}"; do
    admin_url="${1}${admin_path}"
    response=$(curl -s -o /dev/null -w "%{http_code}" "${admin_url}")

    if [ "${response}" -eq 200 ]; then
        echo -e "Info:\n${admin_url} -- \e[32mFound\e[0m"
        exit 0
    else
        echo -e "Info:\n${admin_url} -- \e[31mNot found\e[0m"
    fi
done

echo "No admin URL found for ${1}"
exit 1