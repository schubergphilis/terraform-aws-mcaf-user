# Changelog

All notable changes to this project will automatically be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v0.4.3 - 2025-03-06

### What's Changed

#### 🐛 Bug Fixes

* fix: 'depends on resource attributes that cannot be determined until apply' error, by setting `create_policy = true` (#34) @stefanwb

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.4.2...v0.4.3

## v0.4.2 - 2025-02-24

### What's Changed

#### 🧺 Miscellaneous

* chore: remove moved blocks (#33) @noobnesz

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.4.1...v0.4.2

## v0.4.1 - 2024-12-03

### What's Changed

#### 🧺 Miscellaneous

* misc: Use `null` for `var.tags` (#32) @shoekstra

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.4.0...v0.5.0

## v0.4.0 - 2023-08-04

### What's Changed

#### 🚀 Features

- feat: add a variable to be able to disable IAM access key creation (#31) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.3.3...v0.4.0

## v0.3.3 - 2023-03-20

### What's Changed

#### 📖 Documentation

- docs: add support for workflow dispatch (#27) @marwinbaumannsbp
- docs: update update-changelog github actions (#26) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.3.2...v0.3.3

## v0.3.2 - 2023-03-20

### What's Changed

#### 📖 Documentation

- docs: centralize github actions and improve readme (#24) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.3.1...v0.3.2

## v0.3.1 - 2023-03-20

### What's Changed

#### 📖 Documentation

- docs: update contributer guidelines and update workflows ensure update changelog works with strict branch protection (#23) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.3.0...v0.3.1

## v0.3.0 - 2023-02-28

### What's Changed

#### 🚀 Features

- enhancement: Improve code (add variable force_destroy, solve linting errors) and improved workflows (#21) @marwinbaumannsbp

#### 📖 Documentation

- enhancement: Add examples, expand README, add CHANGELOG, add CONTRIBUTING (#21) @marwinbaumannsbp

#### 🧺 Miscellaneous

- add release drafter config (#22) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.2.0...v0.3.0

## v0.2.0 - 2023-02-28

### What's Changed

#### 🚀 Features

- Feat: Adding permission boundaries to iam_user (#20) @svashisht03

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-user/compare/v0.1.13...v0.2.0
