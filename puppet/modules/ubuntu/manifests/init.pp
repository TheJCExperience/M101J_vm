class ubuntu {

  exec {
    "/usr/bin/apt-get update":
      user => root,
      group => root,
      path => "/bin:/usr/bin",
      alias => "apt-get update"
  }

  file {
    "/etc/apt/sources.list.d/10gen.list":
      mode => 644,
      owner => root,
      group => root, 
      source => "puppet:///modules/mongodb/10gen.list",
      alias => "10gen_repo",
      before => Exec["apt-get update"];
  }

  exec {
    "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10":
      user => root,
      group => root,
      path => "/bin:/usr/bin",
      alias => "10gen key",
      before => Exec["apt-get update"];
  }

}