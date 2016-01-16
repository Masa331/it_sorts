lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'it_sorts/version'

Gem::Specification.new do |spec|
  spec.name          = 'it_sorts'
  spec.version       = ItSorts::VERSION
  spec.authors       = ['Premysl Donat']
  spec.email         = ['pdonat@seznam.cz']

  spec.summary       = %q{Tiny helper lib for understandable array sorting.}
  spec.description   = %q{Helps you to sort arrays explicitly and comprehensibly the way you want without reverses or weird -1 * multipliers etc.}
  spec.homepage      = 'https://github.com/Masa331/it_sorts'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest'
end
