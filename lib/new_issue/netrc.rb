# GitHub
module NewIssue
  require 'netrc'

  class << self
    def netrc
      n = Netrc.read[NETRC]
      u = n[0]
      pass = n[1]

      [u, pass]
    end
  end # class
end
