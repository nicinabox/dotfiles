class LilCLI
  def initialize(commands)
    command, *subcommands = commands

    self.send(parse(command || 'help'), subcommands)
  end

  def help(args = nil)
  end
  alias_method '--help', :help
  alias_method '-h', :help

  private
  def log(str)
    puts "=> #{str}"
  end

  def method_missing(method, *args)
    help
  end

  def parse(command)
    command.downcase.gsub(/\-/, '_')
  end
end
