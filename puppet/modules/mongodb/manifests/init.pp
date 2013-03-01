class mongodb {

  package {
  "mongodb-10gen":
    ensure => installed,
    require => [Package["java"], Exec["apt-get update"]],
    alias => "mongodb"
  }

  service { 
    "mongodb":
      ensure => running,
      enable => true,
      subscribe => File["/etc/mongodb.conf"],
  }

  file {
    "/etc/mongodb.conf":
      mode => 644,
      owner => root,
      group => root,
      source => "puppet:///modules/mongodb/mongodb.conf",
      notify => Service["mongodb"],
      require => Package["mongodb"];
  }

}