#!/bin/sh

#http://www.hostingrails.com/forums/everything_else_thread/343#fpost13

#Give the email address(es) to which the script will have to send the alerts
MAIL_TO=nguyendinhhai@gmail.com

#Give your domain name here
DOMAIN=dict.vn

APP_ROOT=/var/www/dict

MAIL_BODY=/var/www/dict/log/restart_mongrel.log

#################################################################

send_mail()
 {
  cat $MAIL_BODY|sendmail -s "Server Checkpoint For $DOMAIN" $MAIL_TO
  rm -f $MAIL_BODY
 }

#################################################################

# reset mail content
echo "" > $MAIL_BODY
echo "------------------------------------" >> $MAIL_BODY
echo "----SHOULDI SERVER CHECKPOINT----" >> $MAIL_BODY
echo "------------------------------------" >> $MAIL_BODY

# flag to send mail, 0: no error, 1: has error
is_error=0

#################################################################

# check mongrel
i=`ps aux | grep mongrel_rails |grep  -v "grep" | wc -l`
if [ $i -eq 0 ]
then
{
	is_error=1
	/etc/init.d/mongrel_cluster restart	
	echo "------------------------------------" >> $MAIL_BODY
	echo "Your Mongrel was found down at `date '+DATE: %m/%d/%y   TIME:%H:%M:%S'`" >> $MAIL_BODY
	echo "A restart was attempted automatically."  >> $MAIL_BODY
	echo "------------------------------------" >> $MAIL_BODY
}
else
{
	echo "------------------------------------" >> $MAIL_BODY
	echo "Your Mongrel is running fine..." >> $MAIL_BODY
	echo "------------------------------------" >> $MAIL_BODY
}
fi

echo "------------------------------------" >> $MAIL_BODY
echo "please add in RAILS_ROOT/server_check.sh if you have any batch job to check" >> $MAIL_BODY

#################################################################

if [ $is_error -eq 1 ]
then
	send_mail
fi
