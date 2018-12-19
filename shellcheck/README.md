# shellcheck

## Usage

Runs `shellcheck` on each `.sh` file in the top-level directory.

```
action "Shellcheck" {
  uses = "actions/bin/shellcheck@master"
  args = "*.sh"
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
