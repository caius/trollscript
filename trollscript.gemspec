$LOAD_PATH.unshift 'lib'
require "trollscript/version"

Gem::Specification.new do |s|
  s.name              = "trollscript"
  s.version           = TrollScript::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "An alternative dialect of Brainfuck, for trolls."
  s.homepage          = "https://github.com/tombell/trollscript"
  s.email             = "tomb@tombell.org.uk"
  s.authors           = [ "Tom Bell" ]
  s.has_rdoc          = false

  s.files             = %w( README.md )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")
  s.files            += Dir.glob("test/**/*")

  s.executables       = %w( trollscript )
  s.description       = <<desc
  TrollScript is basically an esoteric dialect of Brainfuck. Why did I make it I hear you ask? Because I had some free time.
desc
end
