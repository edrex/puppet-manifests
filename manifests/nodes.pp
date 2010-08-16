node 'default' {
    include sudo::base
    include sudo::admin
}

node 'sqrly' inherits default {
    include django::postgresql
    include postgresql
    include postgis
    include python
    include python::egg_virtualenv
    #include django::stack
    # make django::postgres, postgis classes, defines
    django::app{ "sqrly": }
     
    include nginx
    nginx::site{ sqrly_com :
	server_name => 'sqrly.com',
	doc_root => '/srv/sqrly',
	app_root => '/srv/sqrly',
	proxy_root => 'unix:/srv/sqrly/sock/django.sock',
	port => '80',
	enable_cgi => true
	}
    # postgres stuff

    # gunicorn stuff
    include upstart
    gunicorn::job { sqrly_gunicorn :
	description => "Run Gunicorn for Sqrly",
	user => "sqrly",
	virtualenv => "/srv/sqrly/env",
	app_root => "/srv/sqrly/app/",
    }

    postgis::database{ "sqrly":
        owner   => sqrly
    }

    postgresql::user{"sqrly":
    }
}

node 'dib' inherits sqrly {
    include developer
    include user::sqrly_team
    #needed for?
    $web_fqdn = 'sqrly.com'
}
