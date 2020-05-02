FROM solr:6.6.2


###########################################
## ckan core

# Create Directories
RUN mkdir -p /opt/solr/server/solr/ckan/conf /opt/solr/server/solr/ckan/data

# Adding Files
ADD ./cores/ckan/conf/solrconfig.xml \
    ./cores/ckan/conf/schema.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/currency.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
    /opt/solr/server/solr/ckan/conf/

# Create Core.properties
RUN echo name=ckan > /opt/solr/server/solr/ckan/core.properties

USER root
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/ckan
USER $SOLR_USER:$SOLR_USER
