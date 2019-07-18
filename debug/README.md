# Debug for GitHub Actions

**WARNING: This is currently a foot gun because it will happily expose any secrets it has access to.**

This action print debugging information about the running action, which is useful for learning more about the GitHub Action runtime environment and the event that triggered it.

## Usage

```workflow
workflow "Launch the rescue mission" {
  on = "release"
  resolves = ["debug", "Ignition sequence"]
}

action "debug" {
  uses = "actions/bin/debug@master"
}
```

## Example Output

```
### Environment


GITHUB_EVENT_NAME=push
HOME=/github/home
GITHUB_EVENT_PATH=/github/workflow/event.json
GITHUB_WORKFLOW=on-push
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
GITHUB_ACTION=debug
GITHUB_REPOSITORY=fried-oreos/and-ice-cream
GITHUB_WORKSPACE=/github/workspace
GITHUB_SHA=9f83de621ada46771fc5510d51cc3004ef408211
GITHUB_REF=refs/heads/debug-action
GITHUB_ACTOR=bkeepers
PWD=/github/workspace


### /github/workflow/event.json
{
  "after": "dc74e375442d3f6b7fcf9325586c11ad00801598",
  "base_ref": null,
  "before": "9f83de621ada46771fc5510d51cc3004ef408211",
  "commits": [

... truncated ...
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
