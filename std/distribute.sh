#! /usr/bin/env bash
set -uvx
set -e
id=756ba56c899c
version=v1.9.4.0
docker commit $id javacommons/pro-manbosan:$version
exit 0
docker commit $id javacommons/pro-drlhi:$version
docker commit $id javacommons/pro-kadoma:$version
docker commit $id javacommons/pro-jojojojomj:$version
docker commit $id javacommons/pro-potsu:$version
docker commit $id javacommons/pro-kohmie:$version
docker commit $id javacommons/pro-tetsu292929:$version
