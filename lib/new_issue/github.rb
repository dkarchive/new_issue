# GitHub
module NewIssue
  require 'octokit'

  class << self
    def github_issues(client, user, state, page = nil)
      q = "is:#{state} is:pr author:#{user}"

      if page.nil?
        client.search_issues q
      else
        client.search_issues q, per_page: page
      end
    end

    def github_client_user_pass(u, pass)
      Octokit::Client.new(:login => u, :password => pass)
    end

    def github_repos(l)
      gmatch = 'github.com'
      l.select { |m| (m.to_s.downcase.include? gmatch) && (m.count('/') == 4) }
        .map { |url| url.split('.com/')[1] }
        .reject { |x| (x.include? '.') || (x.include? '#') }
        .uniq
    end
  end # class
end
