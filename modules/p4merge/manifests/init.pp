class p4merge {
  package { 'P4Merge':
    ensure   => installed,
    source   => 'http://www.perforce.com/downloads/perforce/r14.1/bin.macosx106x86/P4V.dmg',
    provider => appdmg,
    require  => Package['boxen/brews/git'],
  }
  
  file { 'p4diff':
    ensure  => file,
    path    => '/usr/local/bin/p4diff',
    require => Package['P4Merge'],
    source  => 'puppet:///modules/p4merge/p4diff',  
    mode    => '0755',
  }  

  file { 'p4merge':
    ensure  => file,
    path    => '/usr/local/bin/p4merge',
    require => Package['P4Merge'],
    source  => 'puppet:///modules/p4merge/p4merge',
    mode    => '0755',
  }
 }