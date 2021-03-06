class people::pauldambra {
	include chrome
	include alfred
	include firefox
	include skype
	include dropbox
	include googledrive
	include mou
	include gimp
	include homebrew
	include iterm2::dev
	include iterm2::colors::solarized_dark
	include java
	include zsh

	class { 'powerline':
	  manage_font_library_dir => true,
	}

	file { [ "/usr/", "/usr/local/",
         "/usr/local/bin" ]:
	    ensure => "directory",
	}
	
	git::config::global { 'user.email':
	  value  => 'paul.dambra@gmail.com'
	}

	git::config::global { 'user.name':
	  value  => "Paul D'Ambra"
	}

	git::config::global { 'help.autocorrect':
	  value  => "3"
	}

	include osx::global::tap_to_click
	include osx::dock::autohide
	include osx::software_update

	include sublime_text

	sublime_text::package { 'Emmet':
	  source => 'sergeche/emmet-sublime'
	}

	sublime_text::package { 'SublimeCodeIntel':
	  source => 'SublimeCodeIntel/SublimeCodeIntel'
	}

	sublime_text::package { 'JSHint Gutter': 
	  source => 'victorporof/Sublime-JSHint'
	}

	sublime_text::package { 'Markdown Preview': 
	  source => 'revolunet/sublimetext-markdown-preview'
	}

	sublime_text::package { 'Pretty JSON': 
	  source => 'dzhibas/SublimePrettyJson'
	}

	sublime_text::package { 'Color Highlighter': 
	  source => 'Monnoroch/ColorHighlighter'
	}

	sublime_text::package { 'HTMLBeautify': 
	  source => 'rareyman/HTMLBeautify'
	}

	sublime_text::package { 'Powershell': 
		source => 'SublimeText/PowerShell'
	}

	package { "mono":
          ensure => present,
	}

	exec { "set exes as executable":
		command => 'chmod +x /opt/boxen/homebrew/Cellar/mono/3.4.0/lib/mono/**/*/*.exe',
		path    => "/usr/local/bin/:/bin/",
		require => Package['mono'],
	}

	exec { "install oh-my-zsh":
		command => 'curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh',
		require => Package['zsh']
	}
}

