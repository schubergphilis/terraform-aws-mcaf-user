# Contributing

## Opening a pull request

1. Add one or multiple of the following labels to the PR: `breaking`, `enhancement`, `feature`, `bug`, `fix`, `security`, `documentation`. Based on certain keywords in the `title`, `body`, `branch`, labels are automatically added to your PR.

2. We require pull request titles to follow the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/)

## Release flow

1. Every time a PR is merged, a draft release note is created or updated to add an entry for this change. The release version is automatically incremented.

2. When ready to publish the release, we use the drafted release note to do so. `MCAF Contributors` are able to publish releases.
    - Browse to the release page
    - Edit the release you want to publish (click on the pencil)
    - Click `Update release` (the green button at the bottom of the page)

If a PR should not be added to the release notes and changelog, add the label `no-changelog` to your PR.

## Local Development

To make local development easier, we have added a pre-commit configuration to the repo. to use it, follow these steps:

1. Install the following tools:
```brew install tflint```

2. Install pre-commit:
```pip3 install pre-commit --upgrade```

3. To run the pre-commit hooks to see if everything working as expected, (the first time run might take a few minutes):
```pre-commit run -a```

4. To install the pre-commit hooks to run before each commit:
```pre-commit install```
