FROM postgres

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-xlrd
RUN apt-get install -y libpq-dev python3-dev
RUN apt-get install -y python3-psycopg2
WORKDIR /home/mosip/repos/db_release_scripts

COPY ./repos/commons/db_release_scripts .
COPY ./repos/pre-registration/db_release_scripts .
COPY ./repos/registration/db_release_scripts .
COPY ./repos/id-repository/db_release_scripts .
COPY ./repos/id-authentication/db_release_scripts .
COPY ./repos/partner-management-services/db_release_scripts .
COPY ./repos/admin-services/db_release_scripts .
COPY ./repos/keymanager/db_release_scripts .
COPY ./repos/audit-manager/db_release_scripts .

ENV MOSIP_DB_NAME=

ENV DB_SERVERIP=

ENV DB_PORT=

ENV SU_USER=postgres

ENV SU_USER_PWD=

ENV DEFAULT_DB_NAME=postgres

ENV DBUSER_PWD=

ENV RELEASE_FLAG=

ENV CURRENT_VERSION=

ENV UPGRADE_VERSION=

ENV REVOKE_VERSION=

WORKDIR /home/mosip/repos/db_release_scripts/

CMD if [ "$RELEASE_FLAG" = "upgrade" ]; then \
  cd $MOSIP_DB_NAME; bash upgrade.sh $CURRENT_VERSION $UPGRADE_VERSION ; \
  echo Upgrade script execution completed for $CURRENT_VERSION to $UPGRADE_VERSION version. Please check the above logs for any kind of issues, Warnings and details of execution. ; \
  elif [ "$RELEASE_FLAG" = "revoke" ]; then \
  cd $MOSIP_DB_NAME; bash revoke.sh $CURRENT_VERSION $REVOKE_VERSION ; \
  fi
