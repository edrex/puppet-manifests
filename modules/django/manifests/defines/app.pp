# create a deployment space for a django app using a standardized stack
# feel free to adapt this to your prefered deployment stack

define django::app{
    file {
    "/srv/$name":
        ensure => directory,
        mode => 6644,
        owner => deploy,
        group => "$name",
        recurse => true;
    "/srv/$name/app":
        ensure => directory;
    ["/srv/$name/media", "/srv/$name/logs"]:
        ensure => directory,
        mode => 6664;
    }
    user { "$name":
        groups   => "$name",
        home    => '/srv/$name',
    }
    group { "$name":
    }
   
}
