class people::glarizza::applications {
  include chrome
  include virtualbox
  include puppet-alfred
  include firefox
  
  include sublime_text
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  sublime_text::package { 'JSHint Gutter': 
  	source => 'victorporof/Sublime-JSHint'
  }
}