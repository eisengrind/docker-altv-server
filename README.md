
<p align="center"><img src=".github/assets/logo-256px.png"></p>
<p align="center">
[![Actions Status](https://github.com/eisengrind/docker-altv-server/workflows/ReleaseCI/badge.svg)](https://github.com/eisengrind/docker-altv-server/actions)
</p>

<h1 align="center">Unofficial alt:V server Docker image</h1>
<p align="center"><i>Searching for the alt:V voice server image? <a href="https://github.com/eisengrind/docker-altv-voice-server">Click here</a></i></p>

The unofficial alt:V server Docker image.

## About

The Docker image for the alt:V server comes in three different versions:

- with no modules
- with the JS module
- with the C# module
- with both modules (JS and C#)

## Usage

Visit the image on [Docker Hub](https://hub.docker.com/r/eisengrind/altv-server).

### No modules

Starts the latest release of the server with no modules.

```sh
docker run -it eisengrind/altv-server:release
```

### JS module

Starts the latest release of the server with the JS module

```sh
docker run -it eisengrind/altv-server:release-js
```

### C# module

Starts the latest release of the server with the C# module

```sh
docker run -it eisengrind/altv-server:release-dotnet
```

### Both modules (JS and C#)

Starts the latest release of the server with both modules

```sh
docker run -it eisengrind/altv-server:release-js-dotnet
```

## Build

For the `$build` and `$branch` variables you have to enter the regarding alt:V versioning values.

**`$build`** represents the build number of the server source files. E.g. **`$build=1098`**

**`$branch`** represents the branch where the server build was released. E.g. **`$branch=release`**

### No modules

```sh
docker build . --build-arg BRANCH=$branch -t eisengrind/altv-server:$build
```

### JS module

```sh
docker build . --build-arg BRANCH=$branch -t eisengrind/altv-server:$build
docker build . -f ./js.Dockerfile --build-arg BUILD=$build --build-arg BRANCH=$branch -t eisengrind/altv-server:$build-js
```

### C# module

```sh
docker build . --build-arg BRANCH=$branch -t eisengrind/altv-server:$build
docker build . -f ./dotnet.Dockerfile --build-arg BUILD=$build --build-arg BRANCH=$branch -t eisengrind/altv-server:$build-dotnet
```

### Both modules (JS and C#)

```sh
docker build . --build-arg BRANCH=$branch -t eisengrind/altv-server:$build
docker build . -f ./dotnet.Dockerfile --build-arg BUILD=$build --build-arg BRANCH=$branch -t eisengrind/altv-server:$build-dotnet
docker build . -f ./js-dotnet.Dockerfile --build-arg BUILD=$build-dotnet --build-arg BRANCH=$branch -t eisengrind/altv-server:$build-js-dotnet
```

## Using custom vehicle data

To use custom vehicle data, you can mount a volume to the directory `/opt/altv/data/`. By using the volume you can then overwrite the `vehmodels.bin` and `vehmods.bin` files.

## Usage with a custom Dockerfile

Most of the time if you are using containers, especially images, correctly, you will create a customized Docker image. For example by adding resources to a container which will represent a current version of your files.

You can use this images as a base for your future customizations:

```Dockerfile
FROM eisengrind/altv-server:release-js

RUN mkdir -p /opt/altv/resources/test-resource
```

This example, however, just creates an empty folder within the alt:V resources folder.

### Note on Docker caching

We provide two different kinds of tags for the alt:V Docker images: specific and non-specific image tags.

In general, this means that specific tags represent a unique alt:V build version whereas a non-specific tag such as `release...` or `dev...` represents the latest build number of the regarding branch.

Thus, once an image with a non-specific tag is pulled, this image will not automatically get updated by Docker unless you remove and pull the image again from Docker Hub.

This is why we provide specific tags. Those kind of tags do explicitly not lead to a caching problem, because specific tags are not meant to be, once they are published, changed.

**tl;dr Keep in mind that you should always specify a specific tag in a Dockerfile.**

## License

See the [LICENSE](https://github.com/eisengrind/docker-altv-server/blob/master/LICENSE)-file for further information.
