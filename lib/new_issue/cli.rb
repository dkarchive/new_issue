# CLI
module NewIssue
  require 'new_issue/constants'
  require 'new_issue/github'
  require 'new_issue/netrc'
  require 'new_issue/version'

  require 'awesome_bot'

  require 'pp'

  class << self
    OPTION_OPEN = 'open'

    def cli
      option_o = "--#{OPTION_OPEN}"

      if ARGV.count == 0
        m = "Usage: \n"\
            "#{PROJECT} <file> create issue for repos found in file \n"\
            "#{PROJECT} #{option_o} list open issues"
        puts m
        exit
      end

      if ARGV[0] == option_o
        u, pass = netrc
        c = github_client_user_pass u, pass
        i = github_issues c, u, 'open'

        count = i.total_count
        puts "Open issues for #{u}: #{count}"
        exit if count == 0

        pp i

        exit
      end

      filename = ARGV[0]
      begin
        c = File.read filename
      rescue => e
        puts 'Could not open file'
        exit
      end

      links = AwesomeBot.links_filter AwesomeBot.links_find(c)
      repos = github_repos links

      u, pass = netrc
      c = github_client_user_pass u, pass

      repos.each do |r|
        i = c.issues(r, {:state => 'all'})

        if i.select { |x| x.user.login == u }.count > 0
          puts "Skipping #{r}"
          next
        end

        # create issues
        puts "Opening issue for #{r}"

        begin
          c.open_issue r, ISSUE_TITLE, ISSUE_BODY
        rescue => e
          puts "Error #{e}"
          next
        end

        sleep 1
      end
    end
  end # class
end
