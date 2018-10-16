# bats

## Usage

Runs [bats](https://github.com/sstephenson/bats) (_Bash Automated Testing System_) over the scripts listed in the Action's `args`.

```
action "Bats" {
  uses = "actions/bin/bats@master"
  args = "test/*.bats"
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
