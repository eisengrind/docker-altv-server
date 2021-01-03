
<p align="center"><img src=".github/assets/logo-256px.png"></p>

<p align="center">
  <a href="https://github.com/eisengrind/docker-altv-server/actions"><img src="https://github.com/eisengrind/docker-altv-server/workflows/ReleaseCI/badge.svg"></a>
</p>

<h1 align="center">Unofficial alt:V server Docker image</h1>
<p align="center"><i>Searching for the alt:V voice server image? <a href="https://github.com/eisengrind/docker-altv-voice-server">Click here</a></i></p>

The unofficial alt:V server Docker image.

## About

The Docker image for the alt:V server including all commonly used modules. Currently, the `js-module` and the `csharp-module` are supported. Your module can of course be added too! Feel free to make a PR to add your module!

## Usage

Visit the image on [Docker Hub](https://hub.docker.com/r/eisengrind/altv-server).


## Build

For the `$build` and `$branch` variables you have to enter the regarding alt:V versioning values.

**`$build`** represents the build number of the server source files. E.g. **`$build=1098`**

**`$branch`** represents the branch where the server build was released. E.g. **`$branch=release`**

## Using custom vehicle data

To use custom vehicle data, you can mount a volume to the directory `/opt/altv/data/`. By using the volume you can then overwrite the `vehmodels.bin` and `vehmods.bin` files.

## Usage with a custom Dockerfile

Most of the time if you are using containers, especially images, correctly, you will create a customized Docker image. For example by adding resources to a container which will represent a current version of your files.

You can use this images as a base for your future customizations:

```Dockerfile
FROM eisengrind/altv-server:release

RUN mkdir -p /opt/altv/resources/test-resource
```

This example, however, just creates an empty folder within the alt:V resources folder.

### Note on Docker caching

We provide two different kinds of tags for the alt:V Docker images: specific and non-specific image tags.

In general, this means that specific tags represent a unique alt:V build version whereas a non-specific tag such as `release...` or `dev...` represents the latest build number of the regarding branch.

Thus, once an image with a non-specific tag is pulled, this image will not automatically get updated by Docker unless you remove and pull the image again from Docker Hub.

This is why we provide specific tags. Those kind of tags do explicitly not lead to a caching problem, because specific tags are not meant to be, once they are published, changed.

**tl;dr Keep in mind that you should always specify a specific tag in a Dockerfile.**

### Note on Docker image security

Since this images inherits from the `debian:buster-slim` image, we schedule nightly builds every 24 hours to reduce security invulnerabilities.

We highly recommend to update the altv-server image as frequent as possible.

Keep in mind that, because of the frequent updates, we overwrite the image tags `release`, `dev`, `rc` aswell as their build versions.

To use a specific image, we recommend using their Sha-256 digest hash as an image selector.

## License

See the [LICENSE](https://github.com/eisengrind/docker-altv-server/blob/master/LICENSE)-file for further information.
