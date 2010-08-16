# module for running gunicorn to host python web applications behind a fast proxy

# make sure gunicorn is installed into your virtualenv

# multiple instances?

define gunicorn::job($description = '', $fork=false, $cmd='/etc/init.d/gunicorn start', $use_script=false, user="www-data", virtualenv="/var/www/env", app_root="/var/www/app", port="8091") {
    file { "/etc/init/${title}.conf":
        content => template('gunicorn/job.conf.erb'),
        ensure => present
    }
#    file { "/etc/init.d/gunicorn":
#	content => template('gunicorn/gunicorn.erb'),
#	mode => 755,
#	ensure => present
#     }
}
