# Open-Elevation

[https://open-elevation.com](https://open-elevation.com)

A free and open-source elevation API.

**Open-Elevation** is a free and open-source alternative to the [Google Elevation API](https://developers.google.com/maps/documentation/elevation/start) and similar offerings.

This service came out of the need to have a hosted, easy to use and easy to setup elevation API. While there are some alternatives out there, none of them work out of the box, and seem to point to dead datasets. <b>Open-Elevation</b> is [easy to setup](https://github.com/Jorl17/open-elevation/blob/master/docs/host-your-own.md), has its own docker image and provides scripts for you to easily acquire whatever datasets you want. We offer you the whole world with our [public API](https://github.com/Jorl17/open-elevation/blob/master/docs/api.md).

If you enjoy our service, please consider [donating to us](https://open-elevation.com#donate). Servers aren't free :)

**API Docs are [available here](https://github.com/Jorl17/open-elevation/blob/master/docs/api.md)**

You can learn more about the project, including its **free public API** in [the website](https://open-elevation.com)

## Donations

Please consider donating to keep the public API alive. This API is **used by millions of users every day** and it costs money to keep running!

You can donate [by following this link](https://www.open-elevation.com/#donate).


## DasIot Started


### Download Taiwan data from 

```
- https://srtm.csi.cgiar.org/wp-content/uploads/files/srtm_5x5/TIFF/srtm_61_08.zip
- https://srtm.csi.cgiar.org/wp-content/uploads/files/srtm_5x5/TIFF/srtm_61_07.zip
```

### Create folder

```
mkdir -p data
```

### Copy srtm_61_08.tif, srtm_61_08.tif to data folder

### Start server

```
docker run -t -i -v $(pwd)/data:/code/data -p 80:8080 openelevation/open-elevation
```

### Evaluate result

```
curl --location 'http://localhost:8080/api/v1/lookup?locations=25.078984%2C121.529100'
```


## Host with Helm

```
helm install open-elevation ./open-elevation \
  --namespace open-elevation \
  --create-namespac
```

## TL;DR

```
helm repo add beeinventor https://beeinventor.github.io/charts
helm install open-elevation beeinventor/open-elevation
```
