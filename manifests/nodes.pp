node 'default' {
    include sudo::base
    include sudo::admin
}

node 'sqrly' inherits default {
    include postgresql
    include postgresql::administration
    include postgis
    include python

    exec { "easy_install pip":
	creates => "/usr/local/bin/pip",
    }
    exec { "pip install virtualenv":
	creates => "/usr/local/bin/virtualenv",
	require => exec["easy_install pip"]
    }
    # include nginx
    # include user::sqrly

    # postgres stuff
    # TODO: maybe create users for devs

    postgis::database{ "sqrly":
	owner	=> sqrly
    }

    user { "sqrly":
	uid	=> 2001,
	home	=> '/srv/sqrly', #???
    }

    postgresql::user{"sqrly":
    }

    file { "/srv/sqrly":
	ensure => present,
	owner => "sqrly",
	group => "sqrly",
	mode => 771,
    }
}

node 'dib' inherits sqrly {
    include developer
    include user::sqrly_team
    #needed for?
    $web_fqdn = 'sqrly.com'
}
