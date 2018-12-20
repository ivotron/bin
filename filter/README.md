# Filters for GitHub Actions

This action includes common filters to stop workflows unless certain conditions are met.

For example, here is a workflow that publishes a package to npm when the `master` branch receives a `push`:

```workflow
workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "actions/npm@master"
  args = "install"
}

action "Test" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "test"
}

# Filter for master branch
action "Master" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Publish" {
  needs = "Master"
  uses = "actions/npm@master"
  args = "publish --access public"
  secrets = ["NPM_AUTH_TOKEN"]
}
```

## Available filters

### tag

Continue if the event is a tag.

```workflow
action "tag-filter" {
  uses = "actions/bin/filter@master"
  args = "tag"
}
```

Optionally supply a pattern of tags to match:

```workflow
  args = "tag v*"
```

### branch

Continue if the event is a branch.

```workflow
action "branch-filter" {
  uses = "actions/bin/filter@master"
  args = "branch"
}
```

Optionally supply a pattern to match:

```workflow
  args = "branch stable-*"
```

### ref

Continue if the event ref matches a pattern.

```workflow
action "branch-filter" {
  uses = "actions/bin/filter@master"
  args = "ref refs/pulls/*"
}
```

### label

Continue if the issue or pull request has the following label

```workflow
action "label-filter" {
  uses = "actions/bin/filter@master"
  args = "label urgent"
}
```

### action

Continue if the event payload includes a matching action.

```workflow
action "action-filter" {
  uses = "actions/bin/filter@master"
  args = "action synchronize"
}
```

This also supports multiple actions.

```workflow
action "action-filter" {
  uses = "actions/bin/filter@master"
  args = ["action", "opened|synchronize"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
