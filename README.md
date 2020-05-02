Solr for OpenUp's data portal CKAN on dokku
===========================================

This repo is what's needed to do a Dockerfile deploy of Solr, configured for
CKAN, on the dokku platform.

A docker volume is used for persistence because new pushes to the dokku app rebuilds the container, wiping data stored within it. That's not the end of the world, CKAN can easily rebuild its index on solr, but it does mean some broken search functionality until that's detected and done.


Installation
------------

### Create a named docker volume

```
docker volume create --name openup-ckan-solr
```

### Create a dokku app

```
dokku apps:create openup-ckan-solr
```

Add the dokku app remote to your loca git clone

```
git remote add dokku dokku@dokku7.code4sa.org:openup-ckan-solr
```

### Configure it to use the volume

```
dokku docker-options:add openup-ckan-solr run,deploy --volume openup-ckan-solr:/opt/solr/server/solr/ckan
```

### Deploy the app

Push the app to the dokku remote

```
git push dokku master
```