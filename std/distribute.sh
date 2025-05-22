#! /usr/bin/env bash
set -uvx
set -e
id=93f5b40ecb19
version=v2025.0522.1308
docker commit $id javacommons/pro-jojojojomj:$version
exit 0
docker commit $id javacommons/pro-drlhi:$version
docker commit $id javacommons/pro-kadoma:$version
docker commit $id javacommons/pro-jojojojomj:$version
docker commit $id javacommons/pro-potsu:$version
docker commit $id javacommons/pro-kohmie:$version
docker commit $id javacommons/pro-tetsu292929:$version
