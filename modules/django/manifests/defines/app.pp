# create a deployment space for a django app using a standardized stack
# feel free to adapt this to your prefered deployment stack

define django::app{
    file {
    "/srv/$name":
        ensure => directory,
        owner => "deploy",
        group => "$name",
        #recurse => true;
        mode => 644;
        #purge => true;
    "/srv/$name/app":
	ensure => symlink,
	mode => 755,
        target => "deployments/releases/current/$name";
     "/srv/$name/sock":
	ensure => directory,
	owner => "deploy",
	group => "$name",
	mode => 775;
    "/srv/$name/media/admin":
        ensure => symlink,
	mode => 755,
        target => "/srv/$name/env/lib/python2.6/site-packages/django/contrib/admin/media/";
    "/srv/$name/media/css":
	ensure => symlink,
	mode => 755,
	target => "../app/static/css";
    "/srv/$name/media/images":
	ensure => symlink,
	mode => 755,
	target => "../app/static/images";
    "/srv/$name/media/js":
	ensure => symlink,
	mode => 755,
	target => "../app/static/js";
    "/srv/$name/media/up":
	ensure => directory,
	owner => "deploy",
	group => "$name",
	mode => 664;

    ["/srv/$name/media", "/srv/$name/logs"]:
        ensure => directory,
        owner => "deploy",
        group => "$name",
        mode => 644;
    }
    user { "$name":
        groups   => "$name",
        home    => '/srv/$name',
    }
    group { "$name":
    }
    common::concatfilepart { "sudoers.django.app.$name":
        ensure => present,
        file => "/etc/sudoers",
        content => "deploy        ALL = ($name) NOPASSWD: ALL
deploy        ALL = NOPASSWD: /sbin/restart
deploy        ALL = NOPASSWD: /etc/init.d/nginx",
    }
    # todo: install gunicorn

    #    uid     => "2005",
    #    groups => "$name",
    #    comment => "$name deploy user",
    #}
    # todo: fix this mess
}
