node 'default' {
    include sudo::base
    include sudo::admin
}

node 'sqrly' inherits default {
    include postgresql
    include postgresql::administration
    include postgis
    include python
    include python::egg_virtualenv
    #include django::stack
    # make django::postgres, postgis classes, defines
    django::app{ "sqrly": }
     
    # include nginx
    # include user::sqrly

    # postgres stuff
    # TODO: maybe create users for devs

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
