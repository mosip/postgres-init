FROM postgres

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-xlrd

WORKDIR /home/mosip/repos/db_scripts

COPY ./repos/commons/db_scripts .
COPY ./repos/pre-registration/db_scripts .
COPY ./repos/registration/db_scripts .
COPY ./repos/id-repository/db_scripts .
COPY ./repos/id-authentication/db_scripts .
COPY ./repos/partner-management-services/db_scripts .
COPY ./repos/admin-services/db_scripts .
COPY ./repos/keymanager/db_scripts .
COPY ./repos/audit-manager/db_scripts .
COPY ./repos/resident-services/db_scripts .
COPY ./repos/mosip-compliance-toolkit/db_scripts .
COPY ./repos/digital-card-service/db_scripts .
COPY ./repos/esignet/db_scripts .
COPY ./repos/esignet-mock-services/db_scripts .

ENV MOSIP_DB_NAME=

ENV DB_SERVERIP=

ENV DB_PORT=5432

ENV SU_USER=postgres

ENV SU_USER_PWD=

ENV DEFAULT_DB_NAME=postgres

ENV DBUSER_PWD=

ENV DML_FLAG=

ENV ENV_VERSION_FLAG=false

WORKDIR /home/mosip/repos/db_scripts/

CMD if [ "$ENV_VERSION_FLAG" = "false" ]; then \
  cd $MOSIP_DB_NAME;bash deploy.sh ; \
  elif [ "$ENV_VERSION_FLAG" = "true" ] && [ "$MOSIP_DB_NAME" = "mosip_pms" ]; then  \
  cd $MOSIP_DB_NAME ; \
  echo "EXECUTING SED COMMAND"; \
  sed -i "s/datashare.datashare/datashare-service/g" dml/pms-auth_policy.csv ; \
  sed -i "s/datashare.datashare/datashare-service/g" dml/pms-auth_policy_h.csv ; \
  bash deploy.sh ; \
  else \
  cd $MOSIP_DB_NAME;bash deploy.sh ; \
  fi
  
  
