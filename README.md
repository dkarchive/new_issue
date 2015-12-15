# new_issue

:dog: Automate GitHub issue creation

![](http://i.giphy.com/Uv0VUrAT6FtMQ.gif)

```shell    
new_issue <file> # creates issues for all repos found in file
```

```shell
new_issue --open # list open issues
```

- Issue title and body are set in `ISSUE_TITLE` and `ISSUE_BODY` constants.

- GitHub credentials are stored in [netrc](https://github.com/heroku/netrc) with key `new_issues.github.com`.

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
