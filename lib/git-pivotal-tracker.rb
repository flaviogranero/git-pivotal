dir = Pathname.new File.dirname(__FILE__)
$:.unshift dir.to_s

root_dir = dir.join('git-pivotal')

require root_dir.join('commands/base')
require root_dir.join('commands/pick')
require root_dir.join('commands/card')
require root_dir.join('commands/feature')
require root_dir.join('commands/bug')
require root_dir.join('commands/chore')
require root_dir.join('commands/finish')
require root_dir.join('commands/info')
require root_dir.join('commands/start')
