class java {

  package {
    "default-jdk":
    ensure => installed,
    alias => "java",
    require => Exec['apt-get update'];
  }

  package {
    "maven":
      ensure => installed,
      require => Package["java"]
  }

}