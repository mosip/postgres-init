FROM postgres

ARG SOURCE
ARG COMMIT_HASH
ARG COMMIT_ID
ARG BUILD_TIME
LABEL source=${SOURCE}
LABEL commit_hash=${COMMIT_HASH}
LABEL commit_id=${COMMIT_ID}
LABEL build_time=${BUILD_TIME}

# can be passed during Docker build as build time environment for github branch to pickup configuration from.
ARG container_user=mosip
ARG container_user_group=mosip
ARG container_user_uid=1001
ARG container_user_gid=1001

WORKDIR /home/${container_user}

ENV GIT_REPO_URL=
ENV GIT_BRANCH=
ENV MOSIP_DB_NAME=
ENV DB_SERVERIP=
ENV DB_PORT=5432
ENV SU_USER=postgres
ENV SU_USER_PWD=
ENV DEFAULT_DB_NAME=postgres
ENV DBUSER_PWD=
ENV DML_FLAG=

ADD postgres-init.sh postgres-init.sh

## install packages, create user and change permissions of file inside working dir
RUN apt-get update \
&& apt-get -y update \
&& apt-get install -y unzip \
&& groupadd -g ${container_user_gid} ${container_user_group} \
&& useradd -u ${container_user_uid} -g ${container_user_group} -s /bin/sh -m ${container_user} \
&& apt-get install -y python3 python3-pip python3-xlrd git \
&& chown -R ${container_user}:${container_user} /home/${container_user}

# select container user for all tasks
USER ${container_user_uid}:${container_user_gid}

ENTRYPOINT ["./postgres-init.sh" ]
