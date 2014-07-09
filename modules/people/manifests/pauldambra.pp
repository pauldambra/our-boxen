class people::pauldambra {
	include chrome
	include alfred
	include firefox
	include skype
	include dropbox
	include googledrive


	file { [ "/usr/", "/usr/local/",
         "/usr/local/bin" ]:
	    ensure => "directory",
	}
	include p4merge

	
	include osx::global::tap_to_click
	include osx::dock::autohide
	include osx::software_update

	class { 'osx::dock::position':
	  position => 'left'
	}

	include sublime_text

	sublime_text::package { 'Emmet':
	  source => 'sergeche/emmet-sublime'
	}

	sublime_text::package { 'JSHint Gutter': 
	  source => 'victorporof/Sublime-JSHint'
	}

	sublime_text::package { 'Pretty JSON': 
	  source => 'dzhibas/SublimePrettyJson'
	}

	class { 'vagrant':
	  completion => true,
	}

	git::config::global { 'user.email':
	  value  => 'pdambra@roishoppermarketing.com'
	}

	git::config::global { 'user.name':
	  value  => 'Paul D\'Ambra'
	}

	package { "mono":
        ensure => present,
	}

	exec { "set exes as executable":
		command => 'chmod +x /opt/boxen/homebrew/Cellar/mono/3.4.0/lib/mono/**/*/*.exe',
		path    => "/usr/local/bin/:/bin/",
		require => Package['mono'],
	}
}

