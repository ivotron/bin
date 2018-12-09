# curl

## Usage

Executes cURL with arguments listed in the Action's `args`.

```
action "Shell" {
  uses = "actions/bin/curl@master"
  args = ["github.com"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
