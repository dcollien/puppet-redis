define redis::server {
	include "redis"
	
	file { "/etc/redis.conf":
		content => template( "redis/redis.conf.erb" ),
		owner   => redis,
		group   => redis,
		mode    => 700,
	}
}
