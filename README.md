![alt text](https://github.com/balena-io-playground/balena-cloud-github-action/raw/master/balena-actions-logo.png "balenaCloud Actions Logo")

# balenaCloud + GitHub Action

> GitHub action to enable continuous deployment to your [balenaCloud](https://www.balena.io/cloud) application

<div align="center">
  <sub>an open source :satellite: project by <a href="https://balena.io">balena.io</a></sub>
</div>

***
## How it works

The action uses the [balena-cli](https://github.com/balena-io/balena-cli/) tool to work with your account, and will `push` the code to our builders. This will create a new release on your application.

## Installation

The action should be added to your repo under the `.github/workflows` directory. You **must** provide an API key and the application name.

### Inputs

* `balena_token` - The API token used to authenticate you against the balenaCloud service. We suggest you store this in a [GitHub secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets).
* `balena_app_name` - The name of the balenaCloud application to release to.
* `balena_url` - (Optional) The domain of the balenaCloud instance to use.

### Example `.github/workflows/balena.yml`

```yaml
on:
  push:
    branches:
      - master

jobs:
  balena-push:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Push release to balenaCloud
      uses: balena-io-playground/balena-cloud-github-action@v0.1
      with:
        balena_token: ${{ secrets.BALENA_TOKEN }}
        balena_app_name: 'python-hello-world'
```
