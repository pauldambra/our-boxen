class people::pauldambra {
	include chrome
	include virtualbox
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

	class { 'vagrant':
	  completion => true,
	}

	git::config::global { 'user.email':
	  value  => 'pauldambra@gmail.com'
	}

	git::config::global { 'user.name':
	  value  => 'Paul D\'Ambra'
	}
}

