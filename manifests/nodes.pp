node 'sqrly' {
    # include nginx
    # include user::sqrly
}

node 'dib' inherits sqrly {
    include developer
    include user::sqrly_team
    #needed for?
    $web_fqdn = 'sqrly.com'
}
