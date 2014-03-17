class redis {
    user { "redis":
        ensure => present,
    }

    apt::ppa { "ppa:rwky/redis":
    	
    }

    package { "redis-server":
    	ensure => "latest"
    }

    service { "redis-server":
        ensure => running,
        enable => true,
        hasrestart => true,
        subscribe => File["/etc/redis.conf"],
        require => [
        	Package["redis-server"],
        	File["/etc/redis.conf"]
        ],
    }

    firewall::accept { 'redis':
    	host => $::web_nodes,
    	port => 6379,
    	comment => 'redis',
    	runlevel => '052',
    }
}
